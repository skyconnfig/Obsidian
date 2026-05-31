# 清理指定账号做题记录以及成绩和查看python服务使用情况

```sql
select * from P2P_Users where U_UserNo in ('S01959','S01960','S01961','S01962','S01963')

--清理做题记录和成绩
--商业汇票
delete from CB_ExamResultItem where eri_resultID in (select er_id from CB_ExamResult where er_userid in (6304,6305,6306,6307,6308,6309));
delete from CB_ExamResult where er_userid in (6304,6305,6306,6307,6308,6309);
--区块链数字货币
delete from DC_ExamResultItem where ERI_ResultID in (select er_id from DC_ExamResult where er_userid in (6304,6305,6306,6307,6308,6309));
delete from  DC_ExamResult where er_userid in (6304,6305,6306,6307,6308,6309);
delete from DC_Exam_Wallet where W_UserID in (6304,6305,6306,6307,6308,6309);
delete from DC_Exam_TransactionFlow where TF_UserID in (6304,6305,6306,6307,6308,6309);

--区块链保险
delete from IN_ExamResultItem where ERI_ResultID in (select er_id from IN_ExamResult where er_userid in (6304,6305,6306,6307,6308,6309));
delete from  IN_ExamResult where er_userid in (6304,6305,6306,6307,6308,6309);

--区块链债券
delete from LB_ExamResultItem where ERI_ResultID in (select er_id from LB_ExamResult where er_userid in (6304,6305,6306,6307,6308,6309));
delete from  LB_ExamResult where er_userid in (6304,6305,6306,6307,6308,6309);
delete from LB_Exam_IssueBonds where I_UserID in (6304,6305,6306,6307,6308,6309);
delete from LB_Exam_TransactionFlow where TF_UserID in (6304,6305,6306,6307,6308,6309);
delete from LB_Exam_Wallet where W_UserID in (6304,6305,6306,6307,6308,6309);
--跨境支付
delete from KJPay_ExamResultItem where ERI_ResultID in (select er_id from KJPay_ExamResult where er_userid in (6304,6305,6306,6307,6308,6309));
delete from  KJPay_ExamResult where er_userid in (6304,6305,6306,6307,6308,6309);
delete from KJPay_Exam_TransactionFlow where TF_UserID in (6304,6305,6306,6307,6308,6309);
delete from KJPay_Exam_Wallet where W_UserID in (6304,6305,6306,6307,6308,6309);

--供应链金融
delete SC_ExamineResults where C_menuid ='1187' and C_userid in (6697,6698,6699,6700,6701,6702,6703)
```

```sql
在命令窗口输入 tasklist | find /c /i "python.exe" 来统计python进程的数量
正在使用的学生数量 = 进程数 / 2 - 3
```



> 更新: 2025-06-19 15:41:07  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/ovzswqp15aoqv4l6>