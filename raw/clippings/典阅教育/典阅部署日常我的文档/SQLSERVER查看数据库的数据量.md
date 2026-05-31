# SQL SERVER查看数据库的数据量

## <font style="color:rgb(44, 44, 54);">✅</font><font style="color:rgb(44, 44, 54);"> 修正后的完整脚本（已修复关键字 + 数据库名）</font>
```markdown
-- 创建临时表存储结果
CREATE TABLE #TableRows (
    DatabaseName NVARCHAR(128),
    TableName NVARCHAR(128),
    [RowCount] BIGINT  -- 用方括号避免关键字冲突
);

-- 插入 DTJL2023 数据
USE DTJL2023;
INSERT INTO #TableRows (DatabaseName, TableName, [RowCount])
SELECT 
    'DTJL2023',
    t.name,
    p.rows
FROM sys.partitions p
INNER JOIN sys.tables t ON p.object_id = t.object_id
WHERE p.index_id IN (0, 1);

-- 插入 KHJL2023 数据
USE KHJL2023;
INSERT INTO #TableRows (DatabaseName, TableName, [RowCount])
SELECT 
    'KHJL2023',
    t.name,
    p.rows
FROM sys.partitions p
INNER JOIN sys.tables t ON p.object_id = t.object_id
WHERE p.index_id IN (0, 1);

-- 插入 LCJL2023 数据（修正：原脚本误写为 LCHJ2023）
USE LCJL2023;
INSERT INTO #TableRows (DatabaseName, TableName, [RowCount])
SELECT 
    'LCJL2023',
    t.name,
    p.rows
FROM sys.partitions p
INNER JOIN sys.tables t ON p.object_id = t.object_id
WHERE p.index_id IN (0, 1);

-- 插入 ZHGY2023 数据
USE ZHGY2023;
INSERT INTO #TableRows (DatabaseName, TableName, [RowCount])
SELECT 
    'ZHGY2023',
    t.name,
    p.rows
FROM sys.partitions p
INNER JOIN sys.tables t ON p.object_id = t.object_id
WHERE p.index_id IN (0, 1);

-- 查看总数据量（上报用）
SELECT 
    SUM([RowCount]) AS TotalRows
FROM #TableRows;

-- （可选）查看各表明细
-- SELECT * FROM #TableRows ORDER BY [RowCount] DESC;

-- 清理临时表
DROP TABLE #TableRows;
```



## <font style="color:rgb(44, 44, 54);">额外建议：先确认四个数据库是否存在</font>
<font style="color:rgb(44, 44, 54);">在运行前，建议先检查数据库名是否正确：</font>

```markdown
SELECT name 
FROM sys.databases 
WHERE name IN ('DTJL2023', 'KHJL2023', 'LCJL2023', 'ZHGY2023');
```



> 更新: 2025-10-20 14:55:30  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/wzxcfskzqr9vdbgo>