# sql server2008数据库可疑解决

<font style="color:rgb(77, 77, 77);">今天在客户服务器的数据库里面的一个数据库突然出现了点问题，数据库状态变为可疑了，这个问题之前有见过，虽然解决了，但并没有把过程和解决方法记录下来，决定这次记录在博客园里，方便自己也方便他人在遇到这个问题的时候，能快速解决！废话不多说，先说说数据库变可疑的原因：</font>

<font style="color:rgb(77, 77, 77);">在进行些不正常操作如数据库在读写时而无故停止数据库，从而导致Sql Server 数据库不正常</font>[中断](https://so.csdn.net/so/search?q=%E4%B8%AD%E6%96%AD&spm=1001.2101.3001.7020)<font style="color:rgb(77, 77, 77);">，当再次打开数据库时会发现某些数据库会被标记为“可疑”（suspect)，即在数据库名旁加上了黄色的惊叹号，这时数据库就不能再被打开了，但数据库的结构及数据内容都还是存在的。</font>

## <font style="color:rgb(79, 79, 79);">解决方法：</font>
<font style="color:rgb(77, 77, 77);">当数据库发生这种操作故障时，可以按如下操作步骤可解决此方法，打开数据库里的Sql 查询编辑器窗口，运行以下的命令(</font>**<font style="color:rgb(77, 77, 77);">注意：jd13dafa为对应可疑的数据库名称，执行时，请改为你的可疑的数据库名称</font>**<font style="color:rgb(77, 77, 77);">)。</font>

<font style="color:rgb(77, 77, 77);">1、修改数据库为紧急模式</font>

<font style="color:rgb(77, 77, 77);">ALTER DATABASE jd13dafa SET EMERGENCY</font>

<font style="color:rgb(77, 77, 77);">2、使数据库变为单用户模式</font>

<font style="color:rgb(77, 77, 77);">ALTER DATABASE jd13dafa SET SINGLE_USER</font>

<font style="color:rgb(77, 77, 77);">3、修复数据库日志重新生成，此命令检查的分配，结构，逻辑完整性和所有数据库中的对象错误。当您指定“REPAIR_ALLOW_DATA_LOSS”作为DBCC CHECKDB命令参数，该程序将检查和修复报告的错误。但是，这些修复可能会导致一些数据丢失。</font>

<font style="color:rgb(77, 77, 77);">DBCC CheckDB (jd13dafa , REPAIR_ALLOW_DATA_LOSS)</font>

<font style="color:rgb(77, 77, 77);">4、使数据库变回为多用户模式</font>

<font style="color:rgb(77, 77, 77);">ALTER DATABASE jd13dafa SET MULTI_USER</font>

<font style="color:rgb(77, 77, 77);">5、开始－>运行－>输入cmd－>打开DOS命令窗口，输入以下命令重启数据库服务（此处可以直接到服务列表里，重新启动数据库服务，为了方便我直接用DOS命令了）</font>

<font style="color:rgb(77, 77, 77);">Net stop mssqlserver --停止服务</font>

<font style="color:rgb(77, 77, 77);">Net start mssqlserver --启动服务</font>

<font style="color:rgb(77, 77, 77);">重新打开Sql Server，查看被标记为“可疑”的数据库已恢复正常状态。</font>

<font style="color:rgb(77, 77, 77);"></font>

<font style="color:rgb(77, 77, 77);">sql server死锁问题</font>

```yaml
select* from master.sys.sysprocesses where dbid=DB_ID('hnyyYhsx')
select spid, blocked, loginame, last_batch, status, cmd, hostname, program_name
from master.sys.sysprocesses
where spid in
( select blocked from master.sys.sysprocesses where blocked <> 0 ) or (blocked <>0)
kill spid
```





sp_lock

<font style="color:rgb(77, 77, 77);"></font>



> 更新: 2022-06-30 14:17:20  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/aam7oq>