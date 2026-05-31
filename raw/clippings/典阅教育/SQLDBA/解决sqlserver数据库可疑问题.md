# 解决sql server数据库可疑问题

--1、修改数据库为紧急模式

ALTER DATABASE [HNDTJL] SET EMERGENCY

 

 

--2、使数据库变为单用户模式

 

ALTER DATABASE [HNDTJL] SET SINGLE_USER

 

--3、修复数据库日志重新生成，此命令检查的分配，结构，逻辑完整性和所有数据库中的对象错误。当您指定“REPAIR_ALLOW_DATA_LOSS”作为DBCC CHECKDB命令参数，该程序将检查和修复报告的错误。但是，这些修复可能会导致一些数据丢失。

 

DBCC CheckDB ( [HNDTJL] , REPAIR_ALLOW_DATA_LOSS)

 

--4、使数据库变回为多用户模式

 

ALTER DATABASE [HNDTJL] SET MULTI_USER

 

--5、开始－>运行－>输入cmd－>打开DOS命令窗口，输入以下命令重启数据库服务(此处可以直接到服务列表里，重新启动数据库服务，为了方便我直接用DOS命令了)

 

--Net stop mssqlserver --停止服务

 

--Net start mssqlserver --启动服务

 

--重新打开Sql Server，查看被标记为“可疑”的数据库已恢复正常状态。







> 更新: 2022-11-14 14:54:57  
> 原文: <https://www.yuque.com/lixinsi/mxdptw/egs9w23t8gg4w0nn>