# sql DBA1

```sql
/****** SSMS 的 SelectTopNRows 命令的脚本  ******/
/*as用于标识*/
SELECT TOP (1000) 
      [LoginNo] as 账号
      ,[Password] as 密码
      ,[Type] as 权限
      ,[State] as 状态
      ,[AddTime] as 时间
    FROM [DTJL].[dbo].[tb_User]

/*范围查询*/
SELECT TOP (1000) 
      [LoginNo] as 账号
      ,[Password] as 密码
      ,[Type] as 权限
      ,[State] as 状态
      ,[AddTime] as 时间
  FROM [DTJL].[dbo].[tb_User] where Type>1 and Type<3

/*null判断*/
/****** SSMS 的 SelectTopNRows 命令的脚本  ******/
SELECT TOP (1000) 
      [LoginNo] as 账号
      ,[Password] as 密码
      ,[Type] as 权限
      ,[State] as 状态
      ,[AddTime] as 时间
  FROM [DTJL].[dbo].[tb_User] where AddTime is null

/*case when判断*/
/****** SSMS 的 SelectTopNRows 命令的脚本  ******/
SELECT TOP (1000) [U_ID]
      ,[LoginNo]
      ,[Password]
      ,case  when type=1 then '管理员'
	  when Type=2 then '老师'
	  else '学生'
	  end
    
  FROM [DTJL].[dbo].[tb_User] order by U_ID asc and desc
/*升序asc降序desc*/

/*in包含*/
/****** SSMS 的 SelectTopNRows 命令的脚本  ******/
SELECT TOP (1000) [U_ID]
      ,[LoginNo]
      ,[Password]
   
    
  FROM [DTJL].[dbo].[tb_User] where Type in(3)
```

[附件: SqlServer从入门到精通.pdf](./attachments/CzSyjblwr7Zd5IJ2/SqlServer从入门到精通.pdf)

[附件: Company循环200次添加200条数据.sql](./attachments/CzSyjblwr7Zd5IJ2/Company循环200次添加200条数据.sql)

[附件: T-Sql编程.sql](./attachments/CzSyjblwr7Zd5IJ2/T-Sql编程.sql)[附件: 创建用户自定义表类型脚本.sql](./attachments/CzSyjblwr7Zd5IJ2/创建用户自定义表类型脚本.sql)[附件: 分页存储过程.sql](./attachments/CzSyjblwr7Zd5IJ2/分页存储过程.sql)[附件: 使用用户自定义表类型存储过程.sql](./attachments/CzSyjblwr7Zd5IJ2/使用用户自定义表类型存储过程.sql)

[附件: SQL2019-SSEI-Dev.7z](./attachments/CzSyjblwr7Zd5IJ2/SQL2019-SSEI-Dev.7z)



> 更新: 2022-11-27 19:52:13  
> 原文: <https://www.yuque.com/lixinsi/mxdptw/do61govu50mtf6nz>