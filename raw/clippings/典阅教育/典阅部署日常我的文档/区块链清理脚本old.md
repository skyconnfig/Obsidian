# 区块链清理脚本old

```python
truncate table P2P_ClassInfo;
truncate table P2P_ClassAssign;
truncate table P2P_SystemInfo;
truncate table P2P_UserInfo;
delete from P2P_Users where U_UserType<>0;
truncate table T_TestResults;
truncate table T_TradeRecord;
truncate table T_UserCase;
truncate table [T_UserTaskSituation];
truncate table T_VoteExperience;
truncate table T_TestPaper;
truncate table T_TestPaper_bak;




delete from T_TestResults where C_UserId>=4714 and C_UserId<=4763 and C_UserId>=4764 and C_UserId<=4813 and C_UserId>=4814 and C_UserId<=4863
delete from T_TradeRecord where C_UserId>=4714 and C_UserId<=4763 and C_UserId>=4764 and C_UserId<=4813 and C_UserId>=4814 and C_UserId<=4863
delete from T_UserCase where C_UserId>=4714 and C_UserId<=4763 and C_UserId>=4764 and C_UserId<=4813 and C_UserId>=4814 and C_UserId<=4863
delete from T_UserTaskSituation where C_UserId>=4714 and C_UserId<=4763 and C_UserId>=4764 and C_UserId<=4813 and C_UserId>=4814 and C_UserId<=4863
delete from T_VoteExperience where C_UserId>=4714 and C_UserId<=4763 and C_UserId>=4764 and C_UserId<=4813 and C_UserId>=4814 and C_UserId<=4863
```



> 更新: 2025-09-01 17:54:28  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/dgxo8a34p70nuau1>