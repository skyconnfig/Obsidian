# bsi保险清理数据保留内置资源

```sql

----------------------bsi保险 清表-------------------------------

-----清除实体表  bsi_010101  
declare @tablename nvarchar(100)
DECLARE test_Cursor CURSOR LOCAL FOR
select name from dbo.sysobjects where xtype='u' and (not name LIKE 'dtproperties') 
and name like'bsi_0%'  order by name
open test_Cursor
FETCH NEXT FROM test_Cursor into @tablename
WHILE  (@@fetch_status=0)

begin
exec('truncate table '+ @tablename)
fetch next from test_Cursor into @tablename
end
close test_Cursor
deallocate test_Cursor
go

truncate table bsi_RSMJieAn--人身险理赔结案处理三种状态
truncate table bsi_FlowNumber --单据流水号
truncate table bsi_TotalResult--成s绩主表
truncate table bsi_TotalResultDetailed--成绩明细表

truncate table bsi_File --存档公司表
truncate table bsi_FilePostRelationship --存档岗位关系表 

truncate table bsi_ExaminationUser --考试用户做题记录表
truncate table bsi_NoticeUser --公告对象关系表 已读未读

truncate table bsi_Groupmanagement --分组管理表
truncate table bsi_Groupingrelation --分组关系表
truncate table tb_School --学校表
truncate table tb_College --学院
truncate table tb_Major --专业
truncate table tb_User--登录表 
insert into tb_User(LoginNo,Password,Type,State,AddUserId,AddTime)
values('admin','Dysoft2018','1','1','1',GETDATE())


truncate table tb_Teacher --教师
truncate table tb_Class --班级
truncate table tb_Student --学生
truncate table bsi_ClassHourM  --课时
truncate table bsi_Notice --公告
truncate table bsi_NoticeClass --公告对象关系表
truncate table bsi_NoticeUser --公告对象关系表 已读未读

--理论知识
truncate table bsi_ResourceRecord --资源用户记录表

---理论考核成绩

truncate table tb_CountDown
truncate table tb_ExaminationDetails
truncate table tb_ExaminationResult

---我的成就
truncate table tb_loginJL  --登陆记录 一天一次
truncate table tb_MedalInfo --奖牌激活得到表






```



> 更新: 2024-12-18 14:45:47  
> 原文: <https://www.yuque.com/lixinsi/kmvnv0/zgv37p>