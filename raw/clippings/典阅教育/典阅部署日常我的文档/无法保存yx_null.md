# 无法保存yx_null

```sql
CREATE VIEW YW_NULL AS
SELECT 
    NULL AS AccountNo,
    30 AS BankSiteId,
    1 AS UserId,
    591 AS PlanId,
    261 AS ExamId,
    1 AS num
WHERE 1 = 0

UNION ALL

SELECT 
    NULL,
    30,
    1,
    591,
    261,
    1;
```



> 更新: 2025-09-20 11:50:38  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/mmdld7ve41xywygx>