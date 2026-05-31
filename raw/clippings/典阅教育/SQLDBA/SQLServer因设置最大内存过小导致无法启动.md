# SQL Server 因设置最大内存过小导致无法启动

### <font style="color:rgb(0, 0, 0);">首先是</font>
<font style="color:rgb(0, 0, 0);"> 在服务器上发现SQLServer占用</font>[内存](https://so.csdn.net/so/search?q=%E5%86%85%E5%AD%98&spm=1001.2101.3001.7020)<font style="color:rgb(0, 0, 0);">过大，128G服务器内存它占用高达100多G。于是就去找解决方案，找了几篇文章发现都是通过修改SQLServer服务器最大内存让其释放占用内存，如图所示，我把最大内存修改为128MB</font>

![1717742696835-ddc62ebf-fc0b-4783-94c1-ed4256cb1c8e.png](./img/g9RRU44omkf2KzHZ/1717742696835-ddc62ebf-fc0b-4783-94c1-ed4256cb1c8e-260765.png)

### <font style="color:rgb(0, 0, 0);">发现问题</font>
<font style="color:rgb(0, 0, 0);">然后我就发现我的SQLServer服务无法启动了，由于连接不上数据库，无法通过上图去把128改回原来的最大值了。</font>

### <font style="color:rgb(0, 0, 0);">解决方案：</font>
<font style="color:rgb(0, 0, 0);">参考：https://www.cnblogs.com/123525-m/p/17648871.html</font><u><font style="color:rgb(0, 0, 0);">  
</font></u>

<font style="color:rgb(0, 0, 0);">找到sqlservr.exe的目录Binn（我的装在D盘）：</font>

<font style="color:rgb(0, 0, 0);">打开第一个cmd窗口（使用管理员身份运行），</font>

```sql
cd D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Binn

sqlservr.exe -sMSSQLSERVER -mSQLCMD –c -f -m
```

<font style="color:rgb(0, 0, 0);">这时第一个窗口不要关闭，打开第二个cmd窗口，开启SQL server Browser服务（重点） </font>

```sql
sqlcmd -E -sMSSQLSERVER
```

<font style="color:rgb(0, 0, 0);">把下面整段代码整理好复制到第二个cmd窗口，最好先复制到txt里面，再从txt复制到cmd</font>

```sql
EXEC sys.sp_configure N'show advanced options',N'1' RECONFIGURE WITH OVERRIDE
GO
EXEC sys.sp_configure N'max server memory (MB)', N'2147483647'
GO
RECONFIGURE WITH OVERRIDE
GO
EXEC sys.sp_configure N'show advanced options', N'0' RECONFIGURE WITH OVERRIDE
GO
```

<font style="color:rgb(0, 0, 0);"></font>



> 更新: 2024-06-07 14:46:44  
> 原文: <https://www.yuque.com/lixinsi/mxdptw/af62bglspz1gnewe>