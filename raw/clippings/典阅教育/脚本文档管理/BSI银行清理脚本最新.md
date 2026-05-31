# BSI银行清理脚本最新

```sql

declare @tablename nvarchar(100)

DECLARE test_Cursor CURSOR LOCAL FOR
select name from dbo.sysobjects where xtype='u' and (not name LIKE 'dtproperties') and name like'yw_%' order by name
open test_Cursor

FETCH NEXT FROM test_Cursor into @tablename
WHILE  (@@fetch_status=0)

begin
exec('truncate table '+ @tablename)
fetch next from test_Cursor into @tablename
end
close test_Cursor
deallocate test_Cursor



truncate table cps_ExamResult
truncate table cps_ExamResult_Detail
truncate table dcs_ExamResult
truncate table dcs_ExamResult_Detail
truncate table dzs_ExamResult  /**--考核业务成绩管理表--**/
truncate table dzs_ExamResult_Detail
truncate table dbo.zhyw_ExamLog
truncate table dbo.zhyw_ExamCurrentTask
truncate table dbo.zhyw_ExamResult
truncate table dbo.zhyw_ExamResultTask
truncate table dbo.zhyw_ExamResultTaskDetail
delete dbo.digital_ExamResult
delete dbo.digital_ExamResult_Detail



/**--理论知识--*/
truncate table tb_ExaminationDetails
truncate table tb_ExaminationResult



/**--用户表--*/

truncate table [sys_Structure] /**--组织架构表--**/

truncate table sys_person     /**--用户表--**/



INSERT [dbo].[sys_person] ( [Name], [BirthDate], [PictureUrl], [Sex], 
[Age], [JoinBankDate], [JoinCenterDate], [SubBankId], [DepartmentId],
 [PositionId], [UCode], [Education], [Phone], [TelPhone], [Email], 
 [CreateDate], [Creator], [AccountNo], [AccountPwd], [UType]) 
VALUES ( N'超级管理员', CAST(0x0000A7A900000000 AS DateTime), NULL, 1,
 0, CAST(0x0000A7A900000000 AS DateTime), CAST(0x0000A7A900000000 AS DateTime),
 1, 3, NULL, N'admin', NULL, NULL, NULL, NULL, NULL, 0, N'admin     ', N'ce800f068eb060a87d4f089de204819e', 3)


INSERT [dbo].[sys_Structure] ([Name], [ParentId], [NodeLevel], [ClassLevel]) VALUES ( N'安徽工业大学工商学院', 0, 1, 1)
INSERT [dbo].[sys_Structure] ([Name], [ParentId], [NodeLevel], [ClassLevel]) VALUES ( N'工商学院', 1, 2, 1)

```

```shell
bsi银行清理
truncate table [BSI-20171221].[dbo].[sys_person]
delete FROM [BSI-20171221].[dbo].[sys_Structure] where ID>1
重置bi_SerialNo
```



> 更新: 2022-09-20 17:42:38  
> 原文: <https://www.yuque.com/lixinsi/kmvnv0/eotxhq>