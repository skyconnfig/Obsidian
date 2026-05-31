# 易考通和农信银SQL批量插入数据

# 1.用于获取 tb_UserInfo 表中所有列的名称和数据类型
```plsql
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    NUMERIC_PRECISION, 
    NUMERIC_SCALE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'tb_UserInfo';
```



```plsql
  SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    NUMERIC_PRECISION, 
    NUMERIC_SCALE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'bi_BankTeller'
    AND TABLE_SCHEMA = 'dbo';
```

# 2.YKT插入账号
	

```plsql
SET IDENTITY_INSERT [dbo].[tb_UserInfo] ON;

DECLARE @i INT = 161;
DECLARE @max INT = 190;

WHILE @i <= @max
BEGIN
    INSERT INTO [dbo].[tb_UserInfo]
    (
        [UserNo], -- UserNo (varchar)
        [UserPwd], -- UserPwd (varchar)
        [UserName], -- UserName (nvarchar)
        [UserType], -- UserType (int)
        [UserSchoolId], -- UserSchoolId (int)
        [UserClassId], -- UserClassId (int)
        [StudentNo], -- StudentNo (varchar)
        [UserSex], -- UserSex (nvarchar)
        [UserYear], -- UserYear (varchar)
        [UserIdentity], -- UserIdentity (varchar)
        [UserPhone], -- UserPhone (varchar)
        [UserEmail], -- UserEmail (varchar)
        [UserQQ], -- UserQQ (varchar)
        [UserWX], -- UserWX (varchar)
        [UserPic], -- UserPic (text)
        [State], -- State (int)
        [Operator], -- Operator (varchar)
        [AddOperator], -- AddOperator (varchar)
        [AddTime], -- AddTime (datetime)
        [Custom1], -- Custom1 (int)
        [Custom2], -- Custom2 (nvarchar)
        [Custom3] -- Custom3 (varchar)
    )
    VALUES
    (
        's' + RIGHT('0000' + CAST(@i AS VARCHAR), 4), -- UserNo (varchar)
        '888888', -- UserPwd (varchar)
        '姓名待修改', -- UserName (nvarchar)
        3, -- UserType (int)
        2, -- UserSchoolId (int)
        5, -- UserClassId (int)
        CAST(@i AS VARCHAR), -- StudentNo (varchar)
        NULL, -- UserSex (nvarchar)
        NULL, -- UserYear (varchar)
        NULL, -- UserIdentity (varchar)
        NULL, -- UserPhone (varchar)
        NULL, -- UserEmail (varchar)
        NULL, -- UserQQ (varchar)
        NULL, -- UserWX (varchar)
        NULL, -- UserPic (text)
        1, -- State (int)
        '2', -- Operator (varchar)
        '3', -- AddOperator (varchar)
        GETDATE(), -- AddTime (datetime)
        NULL, -- Custom1 (int)
        NULL, -- Custom2 (nvarchar)
        NULL -- Custom3 (varchar)
    );

    SET @i = @i + 1;
END

SET IDENTITY_INSERT [dbo].[tb_UserInfo] OFF;
```

# 3.ykt 批量更新账号
```plsql
DECLARE @i INT = 61;
DECLARE @max INT = 90;

WHILE @i <= @max
BEGIN
    UPDATE [dbo].[tb_UserInfo]
    SET 
        [UserNo] = 's' + RIGHT('0000' + CAST(@i AS VARCHAR), 4), -- UserNo (varchar)
        [UserPwd] = '888888', -- UserPwd (varchar)
        [UserName] = '姓名待修改', -- UserName (nvarchar)
        [UserType] = '3', -- UserType (int)
        [UserSchoolId] = '2', -- UserSchoolId (int)
        [UserClassId] = '5', -- UserClassId (int)
        [StudentNo] = CAST(@i AS VARCHAR), -- StudentNo (varchar)
        [UserSex] = NULL, -- UserSex (nvarchar)
        [UserYear] = NULL, -- UserYear (varchar)
        [UserIdentity] = NULL, -- UserIdentity (varchar)
        [UserPhone] = NULL, -- UserPhone (varchar)
        [UserEmail] = NULL, -- UserEmail (varchar)
        [UserQQ] = NULL, -- UserQQ (varchar)
        [UserWX] = NULL, -- UserWX (varchar)
        [UserPic] = NULL, -- UserPic (text)
        [State] = '1', -- State (int)
        [Operator] = '2', -- Operator (varchar)
        [AddOperator] = '3', -- AddOperator (varchar)
        [AddTime] = GETDATE(), -- AddTime (datetime)
        [Custom1] = NULL, -- Custom1 (int)
        [Custom2] = NULL, -- Custom2 (nvarchar)
        [Custom3] = NULL -- Custom3 (varchar)
    WHERE [UId] = @i;

    SET @i = @i + 1;
END
```



# 农信银批量插入账号
```plsql
SET IDENTITY_INSERT [dbo].[bi_BankTeller] ON;

DECLARE @i INT = 1;
DECLARE @max INT = 10; -- 假设你要插入10条记录

-- 获取当前表中最大的Id值
DECLARE @currentMaxId INT;
SELECT @currentMaxId = ISNULL(MAX(Id), 0) FROM [dbo].[bi_BankTeller];

-- 设置起始Id值为当前最大Id值加1
SET @i = @currentMaxId + 1;

WHILE @i <= @currentMaxId + @max
BEGIN
    INSERT INTO [dbo].[bi_BankTeller]
    (
        [Id], -- int
        [BankSite_Id], -- int
        [Teller_No], -- varchar(50)
        [Student_No], -- varchar(50)
        [Teller_Name], -- nvarchar(50)
        [Password], -- nvarchar(50)
        [Telephone], -- varchar(50)
        [QQ], -- varchar(50)
        [Team_Id], -- int
        [Teller_Status], -- varchar(50)
        [AddTime], -- datetime
        [LastLoginTime], -- datetime
        [SingleRoles] -- nvarchar(50)
    )
    VALUES
    (
        @i, -- Id (int)
        30, -- BankSite_Id (int)
        's' + RIGHT('0000' + CAST(@i AS VARCHAR), 4), -- Teller_No (varchar(50))
        '888888', -- Student_No (varchar(50))
        N'姓名待修改', -- Teller_Name (nvarchar(50))
        N'密码' + CAST(@i AS NVARCHAR), -- Password (nvarchar(50))
        '123-456-789' + CAST(@i AS VARCHAR), -- Telephone (varchar(50))
        '123456789' + CAST(@i AS VARCHAR), -- QQ (varchar(50))
        129, -- Team_Id (int)
        '3', -- Teller_Status (varchar(50))
        GETDATE(), -- AddTime (datetime)
        GETDATE(), -- LastLoginTime (datetime)
        N'1,2,3,4,5' -- SingleRoles (nvarchar(50))
    );

    SET @i = @i + 1;
END

SET IDENTITY_INSERT [dbo].[bi_BankTeller] OFF;
```



> 更新: 2024-08-15 18:08:32  
> 原文: <https://www.yuque.com/lixinsi/mxdptw/ro923b622hb6yz5w>