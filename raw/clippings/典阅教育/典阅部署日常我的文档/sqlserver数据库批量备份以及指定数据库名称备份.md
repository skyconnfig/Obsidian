# sql server数据库批量备份以及指定数据库名称备份

### 全量备份


```sql
USE master;
GO
SET NOCOUNT ON;

-- =============================================
-- 全库全量备份核心配置（仅需修改此处）
-- =============================================
DECLARE 
    @BackupPath NVARCHAR(500) = N'C:\SQLBackup\',  -- 备份根路径（手动创建/赋权）
    @BackupDesc NVARCHAR(100) = N'全库全量备份-无压缩-完整备份', -- 备份描述
    @DBName NVARCHAR(128),          -- 遍历的数据库名
    @BackupFile NVARCHAR(500),      -- 最终备份文件名
    @BackupSQL NVARCHAR(MAX),       -- 备份执行语句
    @ErrorMsg NVARCHAR(4000),       -- 错误信息缓存
    @PathExists BIT,                -- 路径是否存在标识
    @TestFile NVARCHAR(500),        -- 权限测试文件
    @Cmd NVARCHAR(1000);            -- 临时命令变量（解决拼接错误）

-- =============================================
-- 步骤1：检查并自动创建备份目录
-- =============================================
CREATE TABLE #FileExists (file_exists BIT, is_directory BIT, parent_directory_exists BIT);
INSERT INTO #FileExists
EXEC master.dbo.xp_fileexist @BackupPath;

SELECT @PathExists = is_directory FROM #FileExists;
DROP TABLE #FileExists;

IF @PathExists = 0
BEGIN
    EXEC xp_create_subdir @BackupPath;
    PRINT N'📁 自动创建备份目录：' + @BackupPath;
END
ELSE
BEGIN
    PRINT N'📁 备份目录已存在：' + @BackupPath;
END

-- =============================================
-- 步骤2：校验SQL Server服务账号权限
-- =============================================
BEGIN TRY
    -- 生成无特殊字符的测试文件名
    SET @TestFile = @BackupPath + N'Permission_Test_' + REPLACE(NEWID(), '-', '') + N'.txt';
    
    -- 拆分命令拼接（解决+号语法错误）
    SET @Cmd = N'echo Test > "' + @TestFile + N'"';
    EXEC xp_cmdshell @Cmd, NO_OUTPUT; -- 生成测试文件
    
    SET @Cmd = N'del "' + @TestFile + N'"';
    EXEC xp_cmdshell @Cmd, NO_OUTPUT; -- 删除测试文件
    
    PRINT N'✅ 备份目录权限校验通过：SQL Server服务账号可写入';
END TRY
BEGIN CATCH
    SET @ErrorMsg = N'❌ 备份目录权限校验失败：' + ERROR_MESSAGE();
    PRINT @ErrorMsg;
    RAISERROR(@ErrorMsg, 16, 1);
END CATCH

-- =============================================
-- 步骤3：游标遍历所有用户数据库（排除系统库）
-- =============================================
DECLARE db_cursor CURSOR LOCAL FAST_FORWARD FOR
SELECT name 
FROM sys.databases 
WHERE 
    name NOT IN ('master', 'model', 'msdb', 'tempdb') 
    AND state_desc = 'ONLINE' 
    AND is_read_only = 0 
    AND source_database_id IS NULL;

-- =============================================
-- 步骤4：循环执行全量备份（无压缩、完整备份）
-- =============================================
OPEN db_cursor;
FETCH NEXT FROM db_cursor INTO @DBName;

WHILE @@FETCH_STATUS = 0
BEGIN
    BEGIN TRY
        -- 生成无特殊字符的时间戳
        DECLARE @TimeStamp NVARCHAR(20) = REPLACE(REPLACE(CONVERT(VARCHAR(19), GETDATE(), 120), ' ', '_'), ':', '');
        
        -- 生成备份文件名（简化拼接）
        SET @BackupFile = @BackupPath + @DBName + '_全量备份_' + @TimeStamp + '.bak';

        -- 核心备份语句（显式NO_COMPRESSION，确保无压缩）
        SET @BackupSQL = N'BACKUP DATABASE [' + @DBName + N'] ' +
                         N'TO DISK = N''' + @BackupFile + N''' ' +
                         N'WITH INIT, SKIP, NO_COMPRESSION, STATS = 10, ' +
                         N'DESCRIPTION = N''' + @BackupDesc + N'-' + @DBName + N'-' + CONVERT(VARCHAR(19), GETDATE(), 120) + N''';';

        -- 执行备份
        EXEC sp_executesql @BackupSQL;

        -- 验证备份文件完整性
        SET @Cmd = N'RESTORE VERIFYONLY FROM DISK = N''' + @BackupFile + N'''';
        EXEC sp_executesql @Cmd;

        -- 获取文件大小
        CREATE TABLE #FileSize (file_exists BIT, is_directory BIT, file_size BIGINT);
        INSERT INTO #FileSize
        EXEC master.dbo.xp_fileexist @BackupFile;

        DECLARE @FileSize BIGINT;
        SELECT @FileSize = file_size FROM #FileSize;
        DROP TABLE #FileSize;

        -- 打印成功日志（无版本兼容问题）
        PRINT N'✅ 【备份成功】数据库：' + @DBName + N' | 文件路径：' + @BackupFile + N' | 文件大小：' + LTRIM(STR(ROUND(@FileSize/1024/1024, 2), 10, 2)) + N'MB';

    END TRY
    BEGIN CATCH
        SET @ErrorMsg = N'❌ 【备份失败】数据库：' + @DBName + N' | 错误信息：' + ERROR_MESSAGE();
        PRINT @ErrorMsg;
    END CATCH

    FETCH NEXT FROM db_cursor INTO @DBName;
END

-- =============================================
-- 步骤5：清理游标+备份结果汇总（移除is_compressed，适配所有版本）
-- =============================================
CLOSE db_cursor;
DEALLOCATE db_cursor;

PRINT N'
=============================================
备份结果汇总（近1小时内的全量备份）
=============================================';

SELECT 
    database_name AS '数据库名',
    CONVERT(VARCHAR(19), backup_start_date, 120) AS '备份开始时间',
    CONVERT(VARCHAR(19), backup_finish_date, 120) AS '备份完成时间',
    CONVERT(DECIMAL(10,2), backup_size/1024/1024) AS '备份大小(MB)',
    physical_device_name AS '备份文件路径',
    N'✅ 无压缩（显式指定NO_COMPRESSION）' AS '备份状态' -- 替代is_compressed列
FROM msdb.dbo.backupset b
JOIN msdb.dbo.backupmediafamily m ON b.media_set_id = m.media_set_id
WHERE 
    b.type = 'D' -- D=完整备份
    AND b.backup_start_date >= DATEADD(HOUR, -1, GETDATE())
ORDER BY backup_start_date DESC;

SET NOCOUNT OFF;
GO

-- =============================================
-- 附：前置配置（仅需执行一次）
-- =============================================
/*
1. 手动创建目录：C:\SQLBackup\
2. 给SQL Server服务账号（NT SERVICE\MSSQLSERVER 或 SYSTEM）分配「完全控制」权限
3. 启用xp_cmdshell（权限校验需要）：
   sp_configure 'show advanced options', 1; RECONFIGURE;
   sp_configure 'xp_cmdshell', 1; RECONFIGURE;
*/
```

### 指定数据库备份
```sql
USE master;
GO
SET NOCOUNT ON;

-- 核心配置
DECLARE @BackupPath NVARCHAR(500), @BackupDesc NVARCHAR(100);
SET @BackupPath = N'C:\lxs\20260126dbbak\';
SET @BackupDesc = N'手动指定数据库-完整备份-无压缩';

-- 指定数据库列表
DECLARE @DBList TABLE (DBName SYSNAME);
INSERT INTO @DBList (DBName) VALUES 
(N'2023_ZJSS_KHJL'), (N'2023_ZJSS_LCJL'), (N'2023_ZJSS_DTJL'),
(N'2023_ZJSS_ZHGY'), (N'2023_ZJSS_VTM'), (N'2023_ZJSS_STM'),
(N'2023_ZJSS_MobileWeb');

DECLARE @DBName SYSNAME, @BackupFile NVARCHAR(500), @BackupSQL NVARCHAR(MAX), 
        @PathExists BIT, @TimeStamp NVARCHAR(20), @ErrorMsg NVARCHAR(4000);

-- 步骤1：检查并创建目录
CREATE TABLE #DirCheck (file_exists BIT, is_directory BIT, parent_directory_exists BIT);
INSERT INTO #DirCheck EXEC master.dbo.xp_fileexist @BackupPath;
SELECT @PathExists = is_directory FROM #DirCheck;
DROP TABLE #DirCheck;

IF ISNULL(@PathExists, 0) = 0
BEGIN
    EXEC xp_create_subdir @BackupPath;
    PRINT 'Directory created or verified.';
END

-- 步骤2：游标循环
DECLARE db_cursor CURSOR LOCAL FOR SELECT DBName FROM @DBList;
OPEN db_cursor;
FETCH NEXT FROM db_cursor INTO @DBName;

WHILE @@FETCH_STATUS = 0
BEGIN
    BEGIN TRY
        -- 仅备份在线且存在的库
        IF EXISTS (SELECT 1 FROM sys.databases WHERE name = @DBName AND state = 0)
        BEGIN
            -- 生成时间戳
            SET @TimeStamp = REPLACE(REPLACE(CONVERT(VARCHAR(19), GETDATE(), 120), ' ', '_'), ':', '');
            
            -- 这里的拼接最容易出错，确保没有特殊字符
            SET @BackupFile = @BackupPath + @DBName + N'_FULL_' + @TimeStamp + N'.bak';
            
            SET @BackupSQL = N'BACKUP DATABASE [' + @DBName + N'] TO DISK = N''' + @BackupFile + N''' WITH INIT, SKIP, NO_COMPRESSION, STATS = 10;';
            
            EXEC (@BackupSQL);
            PRINT 'Success: ' + @DBName;
        END
        ELSE
        BEGIN
            PRINT 'Skip: ' + @DBName + ' (Not Online)';
        END
    END TRY
    BEGIN CATCH
        PRINT 'Error on ' + @DBName + ': ' + ERROR_MESSAGE();
    END CATCH;

    FETCH NEXT FROM db_cursor INTO @DBName;
END

CLOSE db_cursor;
DEALLOCATE db_cursor;
PRINT 'All Done.';
SET NOCOUNT OFF;
GO
```

```sql
USE master;
GO
SET NOCOUNT ON;

-- 核心配置
DECLARE @BackupPath NVARCHAR(500), @BackupDesc NVARCHAR(100);
SET @BackupPath = N'E:\dyjy\2026广州省赛\20260305dbbak晚上备份\';
SET @BackupDesc = N'手动指定数据库-完整备份-无压缩';

-- 指定数据库列表（根据图片修改）
DECLARE @DBList TABLE (DBName SYSNAME);
INSERT INTO @DBList (DBName) VALUES 
(N'2024_KHJL'), 
(N'2024_LCJL'), 
(N'2024_MobileBanking'),
(N'2024_STM'), 
(N'2024_VTM'), 
(N'2024_ZHGY');

DECLARE @DBName SYSNAME, @BackupFile NVARCHAR(500), @BackupSQL NVARCHAR(MAX), 
        @PathExists BIT, @TimeStamp NVARCHAR(20), @ErrorMsg NVARCHAR(4000);

-- 步骤1：检查并创建目录
CREATE TABLE #DirCheck (file_exists BIT, is_directory BIT, parent_directory_exists BIT);
INSERT INTO #DirCheck EXEC master.dbo.xp_fileexist @BackupPath;
SELECT @PathExists = is_directory FROM #DirCheck;
DROP TABLE #DirCheck;

IF ISNULL(@PathExists, 0) = 0
BEGIN
    EXEC xp_create_subdir @BackupPath;
    PRINT 'Directory created or verified.';
END

-- 步骤2：游标循环
DECLARE db_cursor CURSOR LOCAL FOR SELECT DBName FROM @DBList;
OPEN db_cursor;
FETCH NEXT FROM db_cursor INTO @DBName;

WHILE @@FETCH_STATUS = 0
BEGIN
    BEGIN TRY
        -- 仅备份在线且存在的库
        IF EXISTS (SELECT 1 FROM sys.databases WHERE name = @DBName AND state = 0)
        BEGIN
            -- 生成时间戳
            SET @TimeStamp = REPLACE(REPLACE(CONVERT(VARCHAR(19), GETDATE(), 120), ' ', '_'), ':', '');
            
            -- 生成备份文件名
            SET @BackupFile = @BackupPath + @DBName + N'_FULL_' + @TimeStamp + N'.bak';
            
            SET @BackupSQL = N'BACKUP DATABASE [' + @DBName + N'] TO DISK = N''' + @BackupFile + N''' WITH INIT, SKIP, NO_COMPRESSION, STATS = 10;';
            
            EXEC (@BackupSQL);
            PRINT 'Success: ' + @DBName;
        END
        ELSE
        BEGIN
            PRINT 'Skip: ' + @DBName + ' (Not Online)';
        END
    END TRY
    BEGIN CATCH
        PRINT 'Error on ' + @DBName + ': ' + ERROR_MESSAGE();
    END CATCH;

    FETCH NEXT FROM db_cursor INTO @DBName;
END

CLOSE db_cursor;
DEALLOCATE db_cursor;
PRINT 'All Done.';
SET NOCOUNT OFF;
GO
```

### 默认路径备份
```sql
USE master;
GO
SET NOCOUNT ON;

-- 核心配置 - 使用默认备份路径
DECLARE @BackupPath NVARCHAR(500), @BackupDesc NVARCHAR(100);
SET @BackupPath = CAST(SERVERPROPERTY('InstanceDefaultBackupPath') AS NVARCHAR(500)) + '\';
SET @BackupDesc = N'手动指定数据库-完整备份-无压缩';

PRINT '默认备份路径: ' + @BackupPath;

-- 指定数据库列表（根据图片修改）
DECLARE @DBList TABLE (DBName SYSNAME);
INSERT INTO @DBList (DBName) VALUES 
(N'2024_DTJL'),
(N'2024_KHJL'), 
(N'2024_LCJL'), 
(N'2024_MobileBanking'),
(N'2024_STM'), 
(N'2024_VTM'), 
(N'2024_ZHGY');

DECLARE @DBName SYSNAME, @BackupFile NVARCHAR(500), @BackupSQL NVARCHAR(MAX), 
        @PathExists BIT, @TimeStamp NVARCHAR(20), @ErrorMsg NVARCHAR(4000);

-- 步骤1：检查并创建目录
CREATE TABLE #DirCheck (file_exists BIT, is_directory BIT, parent_directory_exists BIT);
INSERT INTO #DirCheck EXEC master.dbo.xp_fileexist @BackupPath;
SELECT @PathExists = is_directory FROM #DirCheck;
DROP TABLE #DirCheck;

IF ISNULL(@PathExists, 0) = 0
BEGIN
    EXEC xp_create_subdir @BackupPath;
    PRINT 'Directory created or verified.';
END

-- 步骤2：游标循环
DECLARE db_cursor CURSOR LOCAL FOR SELECT DBName FROM @DBList;
OPEN db_cursor;
FETCH NEXT FROM db_cursor INTO @DBName;

WHILE @@FETCH_STATUS = 0
BEGIN
    BEGIN TRY
        -- 仅备份在线且存在的库
        IF EXISTS (SELECT 1 FROM sys.databases WHERE name = @DBName AND state = 0)
        BEGIN
            -- 生成时间戳
            SET @TimeStamp = REPLACE(REPLACE(CONVERT(VARCHAR(19), GETDATE(), 120), ' ', '_'), ':', '');
            
            -- 生成备份文件名
            SET @BackupFile = @BackupPath + @DBName + N'_FULL_' + @TimeStamp + N'.bak';
            
            SET @BackupSQL = N'BACKUP DATABASE [' + @DBName + N'] TO DISK = N''' + @BackupFile + N''' WITH INIT, SKIP, NO_COMPRESSION, STATS = 10;';
            
            EXEC (@BackupSQL);
            PRINT 'Success: ' + @DBName;
        END
        ELSE
        BEGIN
            PRINT 'Skip: ' + @DBName + ' (Not Online)';
        END
    END TRY
    BEGIN CATCH
        PRINT 'Error on ' + @DBName + ': ' + ERROR_MESSAGE();
    END CATCH;

    FETCH NEXT FROM db_cursor INTO @DBName;
END

CLOSE db_cursor;
DEALLOCATE db_cursor;
PRINT 'All Done.';
SET NOCOUNT OFF;
GO
```

### 默认备份路径
```sql
默认实例: C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\
命名实例: C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\

```

### 指定默认路径备份
```sql
USE master;
GO
SET NOCOUNT ON;

-- =============================================
-- 数据库备份脚本 - 设置默认路径并备份
-- =============================================

-- =============================================
-- 第一部分：配置默认备份路径
-- =============================================
DECLARE @NewBackupPath NVARCHAR(500);
SET @NewBackupPath = N'F:\LXS\广东省赛\正式比赛前账号已经做好db备份';  -- ⚠️ 请根据需要修改此路径

PRINT '========================================';
PRINT '🔧 第一部分：设置默认备份路径';
PRINT '========================================';
PRINT '新备份路径：' + @NewBackupPath;

-- 检查目录是否存在，不存在则创建
DECLARE @PathExists BIT;
CREATE TABLE #DirCheck (
    file_exists BIT, 
    is_directory BIT, 
    parent_directory_exists BIT
);
INSERT INTO #DirCheck EXEC master.dbo.xp_fileexist @NewBackupPath;
SELECT @PathExists = is_directory FROM #DirCheck;
DROP TABLE #DirCheck;

IF ISNULL(@PathExists, 0) = 0
BEGIN
    EXEC xp_create_subdir @NewBackupPath;
    PRINT '✓ 备份目录已创建：' + @NewBackupPath;
END
ELSE
BEGIN
    PRINT '✓ 备份目录已存在：' + @NewBackupPath;
END

-- 修改注册表中的默认备份路径
EXEC xp_instance_regwrite 
    N'HKEY_LOCAL_MACHINE', 
    N'Software\Microsoft\MSSQLServer\MSSQLServer', 
    N'BackupDirectory', 
    REG_SZ, 
    @NewBackupPath;

PRINT '✓ 默认备份路径已更新';
PRINT '';

-- =============================================
-- 第二部分：执行数据库备份
-- =============================================
DECLARE @BackupPath NVARCHAR(500);
DECLARE @BackupDesc NVARCHAR(100);

-- 获取更新后的默认备份路径
SET @BackupPath = CAST(SERVERPROPERTY('InstanceDefaultBackupPath') AS NVARCHAR(500)) + '\';
SET @BackupDesc = N'完整备份 - 默认路径';

PRINT '========================================';
PRINT '📁 第二部分：执行数据库备份';
PRINT '========================================';
PRINT '备份路径：' + @BackupPath;
PRINT '备份描述：' + @BackupDesc;
PRINT '备份时间：' + CONVERT(VARCHAR(19), GETDATE(), 120);
PRINT '========================================';
PRINT '';

-- 指定数据库列表（根据图片中的 6 个数据库）
DECLARE @DBList TABLE (DBName SYSNAME);
INSERT INTO @DBList (DBName) VALUES 

(N'2024_DTJL'),
(N'2024_KHJL'), 
(N'2024_LCJL'), 
(N'2024_MobileBanking'),
(N'2024_STM'), 
(N'2024_VTM'), 
(N'2024_ZHGY');

DECLARE @DBName SYSNAME, 
        @BackupFile NVARCHAR(500), 
        @BackupSQL NVARCHAR(MAX), 
        @PathExists2 BIT, 
        @TimeStamp NVARCHAR(20),
        @SuccessCount INT = 0,
        @FailCount INT = 0,
        @SkipCount INT = 0;

-- 检查备份目录是否存在
CREATE TABLE #DirCheck2 (
    file_exists BIT, 
    is_directory BIT, 
    parent_directory_exists BIT
);
INSERT INTO #DirCheck2 EXEC master.dbo.xp_fileexist @BackupPath;
SELECT @PathExists2 = is_directory FROM #DirCheck2;
DROP TABLE #DirCheck2;

IF ISNULL(@PathExists2, 0) = 0
BEGIN
    EXEC xp_create_subdir @BackupPath;
    PRINT '✓ 备份目录已创建：' + @BackupPath;
END
ELSE
BEGIN
    PRINT '✓ 备份目录已存在：' + @BackupPath;
END

PRINT '';

-- 循环备份每个数据库
DECLARE db_cursor CURSOR LOCAL FOR 
    SELECT DBName FROM @DBList;

OPEN db_cursor;
FETCH NEXT FROM db_cursor INTO @DBName;

WHILE @@FETCH_STATUS = 0
BEGIN
    BEGIN TRY
        -- 检查数据库是否存在且在线
        IF EXISTS (SELECT 1 FROM sys.databases WHERE name = @DBName AND state = 0)
        BEGIN
            -- 生成时间戳（格式：2026-01-26_143025）
            SET @TimeStamp = REPLACE(REPLACE(CONVERT(VARCHAR(19), GETDATE(), 120), ' ', '_'), ':', '');
            
            -- 生成备份文件完整路径
            SET @BackupFile = @BackupPath + @DBName + N'_FULL_' + @TimeStamp + N'.bak';
            
            -- 构建备份命令
            SET @BackupSQL = N'BACKUP DATABASE [' + @DBName + N'] 
                             TO DISK = N''' + @BackupFile + N''' 
                             WITH INIT, SKIP, NO_COMPRESSION, STATS = 10;';
            
            -- 执行备份
            EXEC (@BackupSQL);
            
            PRINT '✓ 成功：' + @DBName;
            PRINT '  文件：' + @BackupFile;
            PRINT '';
            
            SET @SuccessCount = @SuccessCount + 1;
        END
        ELSE
        BEGIN
            PRINT '⊘ 跳过：' + @DBName + ' (数据库不存在或离线)';
            PRINT '';
            SET @SkipCount = @SkipCount + 1;
        END
    END TRY
    BEGIN CATCH
        PRINT '✗ 错误：' + @DBName;
        PRINT '  信息：' + ERROR_MESSAGE();
        PRINT '';
        SET @FailCount = @FailCount + 1;
    END CATCH;

    FETCH NEXT FROM db_cursor INTO @DBName;
END

CLOSE db_cursor;
DEALLOCATE db_cursor;

-- 输出备份统计
PRINT '========================================';
PRINT '📊 备份统计';
PRINT '========================================';
PRINT '✓ 成功：' + CAST(@SuccessCount AS VARCHAR(10)) + ' 个数据库';
PRINT '⊘ 跳过：' + CAST(@SkipCount AS VARCHAR(10)) + ' 个数据库';
PRINT '✗ 失败：' + CAST(@FailCount AS VARCHAR(10)) + ' 个数据库';
PRINT '========================================';
PRINT '🎉 所有操作完成！';
PRINT '========================================';

SET NOCOUNT OFF;
GO
```



> 更新: 2026-03-05 22:00:43  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/rbstdt8hwuuan1o5>