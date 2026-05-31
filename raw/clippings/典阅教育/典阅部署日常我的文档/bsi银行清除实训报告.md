# bsi银行清除实训报告

```plain
BEGIN TRANSACTION;

DECLARE @TargetExamIds TABLE (ExamId INT PRIMARY KEY);

-- 步骤1: 获取需要删除的 ExamId 列表 (来自 view_PraticeItems)
INSERT INTO @TargetExamIds (ExamId)
SELECT DISTINCT b.KHID 
FROM view_PraticeItems b
WHERE b.userID = 18730; -- 关键条件

-- 步骤2: 从4个成绩表中删除关联记录
DELETE FROM zhyw_ExamResult 
WHERE ExamId IN (SELECT ExamId FROM @TargetExamIds);

DELETE FROM dcs_ExamResult 
WHERE ExamId IN (SELECT ExamId FROM @TargetExamIds);

DELETE FROM dzs_ExamResult 
WHERE ExamId IN (SELECT ExamId FROM @TargetExamIds);

DELETE FROM cps_ExamResult 
WHERE ExamId IN (SELECT ExamId FROM @TargetExamIds);

-- 提交事务
COMMIT TRANSACTION;

-- 验证结果
SELECT 
    '✅ 成功清除记录' AS 状态,
    (SELECT COUNT(*) FROM @TargetExamIds) AS 关联试卷数,
    @@ROWCOUNT AS 总删除行数;
```



> 更新: 2025-12-20 22:10:27  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/wzki6dg7chdmhrhx>