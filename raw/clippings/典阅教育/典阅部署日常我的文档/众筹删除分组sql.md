# 众筹删除分组sql

```sql

declare @p1 int
set @p1=5
exec P_DataPager @recordTotal=@p1 output,@tableName=N' ZC_PlatMsg',@fieldName=N' PMID,PM_PlatName,PM_PlatSupportNo,PM_PlatLevel,PM_PlatTheFirst,PM_PlatHandFee,PM_Extra1,(select CI_ClassGrade+''-''+CI_ClassName from ZC_ClassInfo where CIID=CAST(PM_Extra1 as int)) as TheName ',@pageSize=5,@pageNo=1,@orderString=N'PMID',@sortInt=1,@whereString=N' PM_Extra1 in(select CIID from ZC_ClassInfo left join  ZC_ClassAssign on(CIID=CA_CLassID) where CA_TeacherID=36109  and CI_ClassGrade=''2025''  GROUP BY CIID ) and PM_Type=1  and PM_Extra1=650'
select @p1


SELECT * FROM ZC_PlatMsg
WHERE PM_Extra1 IN (
    SELECT CIID 
    FROM ZC_ClassInfo 
    LEFT JOIN ZC_ClassAssign ON CIID = CA_CLassID 
    WHERE CA_TeacherID = 36109 
      AND CI_ClassGrade = '2025' 
    GROUP BY CIID
) 
AND PM_Type = 1 
AND PM_Extra1 = 650;


DELETE FROM ZC_PlatMsg
WHERE PM_Extra1 IN (
    SELECT CIID 
    FROM ZC_ClassInfo 
    LEFT JOIN ZC_ClassAssign ON CIID = CA_CLassID 
    WHERE CA_TeacherID = 36109 
      AND CI_ClassGrade = '2025' 
    GROUP BY CIID
) 
AND PM_Type = 1 
```

### <font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">先查询确认目标分组（推荐先执行）</font>
<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">sql</font>

```plain
-- 查询确认：只获取目标分组"2026阳光学院02平台9"的数据
SELECT * 
FROM ZC_PlatMsg
WHERE PM_PlatName = '2026阳光学院02平台9' 
  AND PM_Type = 1; -- 奖励众筹类型，和你截图场景匹配
```

<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">执行后核对结果，确认是你要删除的那一行，再执行删除。</font>

---

### <font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">2. 单条语句删除（只删目标分组，不影响其他数据）</font>
<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">sql</font>

```plain
-- 删除目标分组：仅删除"2026阳光学院02平台9"这一条记录
DELETE FROM ZC_PlatMsg
WHERE PM_PlatName = '2026阳光学院02平台9' 
  AND PM_Type = 1;
```



> 更新: 2026-04-29 12:03:18  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/tbcfqk3612b90b4b>