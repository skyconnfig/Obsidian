# sql脚本库还原

<font style="color:rgb(51, 51, 51);">restore database </font>[数据库](http://lib.csdn.net/base/mysql)<font style="color:rgb(51, 51, 51);">名</font>  
<font style="color:rgb(51, 51, 51);">from disk='备份文件路径'</font>  
<font style="color:rgb(51, 51, 51);">with move '数据库文件名'</font>  
<font style="color:rgb(51, 51, 51);">to '数据库文件放置路径',</font>  
<font style="color:rgb(51, 51, 51);">move '日志文件名'</font>  
<font style="color:rgb(51, 51, 51);">to '日志文件存放置路径'</font>  
[Go](http://lib.csdn.net/base/go)  
  
<font style="color:rgb(51, 51, 51);">如：</font>  
  


```plain
restore database EaseWe
from disk='H:\EaseWe.bak'
with move 'EaseWe'
to 'c:\Program Files\Microsoft SQL Server\MSSQL\data\EaseWe.mdf',
move 'EaseWe_log'
to 'c:\Program Files\Microsoft SQL Server\MSSQL\data\EaseWe_LOG.LDF'
go
```

  
  
  
  
<font style="color:rgb(51, 51, 51);">附1:如何修改逻辑文件名:</font>  
  
<font style="color:rgb(51, 51, 51);">用 ALTER DATABASE 的 MODIFY FILE 语句更改数据文件或日志文件的逻辑名称。  </font>  
  


```plain
alter database 数据库名
modify file (
name=逻辑名
,newname=新逻辑名
)
```

  
  
<font style="color:rgb(51, 51, 51);">事实上，上面的语句是更改了sysfiles和sysfiles1系统表中的name字段。</font>  
  
<font style="color:rgb(51, 51, 51);">附2:如何得到备份文件的逻辑文件名称:</font>  
  
<font style="color:rgb(51, 51, 51);">用如下语句可以得到备份文件的信息记录，其中LogicalName字段库逻辑文件名称；</font>  


```plain
RESTORE FILELISTONLY from disk='H:\EaseWe.bak'
sqlcmd -S WIN-NFKTO231E8F,1433 -U sa -P saSA123 -d DTJL -Q"BACKUP DATABASE DTJL to disk='d:/backup/DTJL.bak'"
sqlcmd -S +数据库服务器名称,1433 -U sa -P 密码 -d 备份数据库名字 -Q“路径”
sqlcmd -S WIN-NFKTO231E8F,1433 -U sa -P saSA123 -d DTJL -Q"BACKUP DATABASE DTJL from disk='d:/backup/DTJL.bak'"
```



> 更新: 2025-07-15 08:51:42  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/auli2w>