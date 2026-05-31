# 保险实操和农信银sql成绩导出

```plsql
select t3.Plan_Name as '考核名称',t1.Teller_Name as '选手姓名',t1.Teller_No as '选手账号',t4.TeamName as '代表队名称',
t2.Result as '成绩' ,t2.SubmitTime as '提交时间',DATEDIFF(s,t5.BeginTime,t2.SubmitTime) as '用时(秒)',(case when t2.RepeatNum=1 then '已提交' else '未提交' end) as '状态'
from bi_BankTeller as t1
inner join zhyw_ExamResult as t2 on t1.Id=t2.TellerId
inner join dal_ComplexPlan as t3 on t2.PlanId=t3.Id
inner join bi_Team as t4 on t1.Team_Id=t4.Id
inner join dal_ComplexTimer as t5 on t2.ExamId=t5.Id
--where t2.ExamId=1103
order by t2.Result desc ,t2.SubmitTime asc

```

[附件: 农信银业务成绩脚本.7z](./attachments/W-eWw6HeTJ2vsH7F/农信银业务成绩脚本.7z)



> 更新: 2023-11-28 09:19:18  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/xtp5m4uzl4lnlouv>