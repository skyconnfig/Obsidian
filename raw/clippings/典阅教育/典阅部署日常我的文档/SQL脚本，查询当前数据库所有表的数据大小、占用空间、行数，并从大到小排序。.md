# SQL 脚本，查询当前数据库所有表的数据大小、占用空间、行数，并从大到小排序。

## <font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">一、最常用：查询所有表大小（含索引，按总空间降序）</font>

<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">直接在你的数据库 </font><code><font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">ECommerceBigData0115</font></code><font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);"> 里执行：</font>

```markdown
SELECT 
    t.NAME AS 表名,
    s.Name AS 架构名,
    p.rows AS 行数,
    -- 空间计算
    CAST(SUM(a.total_pages) * 8.0 / 1024 / 1024 AS DECIMAL(18,2)) AS 总空间GB,
    CAST(SUM(a.used_pages) * 8.0 / 1024 / 1024 AS DECIMAL(18,2)) AS 已使用GB,
    CAST((SUM(a.total_pages) - SUM(a.used_pages)) * 8.0 / 1024 / 1024 AS DECIMAL(18,2)) AS 未使用GB
FROM 
    sys.tables t
INNER JOIN      
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.is_ms_shipped = 0  -- 排除系统表
GROUP BY 
    t.Name, s.Name, p.Rows
ORDER BY 
    总空间GB DESC;
```

## 二、精简版（只看 表名、行数、总 GB）

```markdown
SELECT 
    t.NAME AS 表名,
    p.rows AS 行数,
    CAST(SUM(a.total_pages) * 8.0 / 1024 / 1024 AS DECIMAL(18,2)) AS 总空间GB
FROM 
    sys.tables t
INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id
WHERE 
    t.is_ms_shipped = 0
GROUP BY 
    t.Name, p.Rows
ORDER BY 
    总空间GB DESC;
```


> 更新: 2026-04-25 17:33:51  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/fh2055ltxgdkn4oh>