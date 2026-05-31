# 查询sql数据库所占存储大小

#### 查询所有库从大到小排列
```sql
SELECT 
    d.name AS [数据库名],
    -- 计算总大小（GB），保留足够精度
    CAST((SUM(mf.size) * 8.0) / 1048576 AS DECIMAL(18, 3)) AS [总大小(GB)],  
    -- 计算数据文件大小（GB），保留足够精度
    CAST((SUM(CASE WHEN mf.type_desc = 'ROWS' THEN mf.size ELSE 0 END) * 8.0) / 1048576 AS DECIMAL(18, 3)) AS [数据文件大小(GB)],  
    -- 计算日志文件大小（GB），保留足够精度
    CAST((SUM(CASE WHEN mf.type_desc = 'LOG' THEN mf.size ELSE 0 END) * 8.0) / 1048576 AS DECIMAL(18, 3)) AS [日志文件大小(GB)],  
    -- 标识系统库/用户库
    CASE WHEN d.name IN ('master','model','msdb','tempdb') THEN '系统库' ELSE '用户库' END AS [库类型]  
FROM sys.databases d
-- 关联数据库文件信息
INNER JOIN sys.master_files mf ON d.database_id = mf.database_id  
GROUP BY d.name
-- 按总大小(GB)降序排列，实现“从大到小”
ORDER BY [总大小(GB)] DESC;  
```

#### 1.获取数据库名称
```sql
SELECT name AS 数据库名称
FROM sys.databases
ORDER BY name;
```

#### 2.查询所有数据库大小
```sql
SELECT 
    d.name AS [数据库名],
    (SUM(mf.size) * 8) / 1048576.0 AS [总大小(GB)],
    (SUM(CASE WHEN mf.type_desc = 'ROWS' THEN mf.size ELSE 0 END) * 8) / 1048576.0 AS [数据文件大小(GB)],
    (SUM(CASE WHEN mf.type_desc = 'LOG' THEN mf.size ELSE 0 END) * 8) / 1048576.0 AS [日志文件大小(GB)]
FROM sys.databases d
INNER JOIN sys.master_files mf ON d.database_id = mf.database_id
WHERE d.name IN (
    '2021cbecys', '2021cbecys_1234', '2021-dy', '2021-hx', '2021-pr', 
    '2022_ydb', '2024CBECYS', 'anlixitong_jljjglxy', 'ANLIXITONG_NEW', 
    'BlockChain_0430', 'BlockChain_1125', 'BlockChain_1125_241227', 
    'BlockChain_20250428', 'BlockChain_WT', 'Blockchian_0901', 
    'Blockchian_0907', 'cbec_0625', 'CBEC_0730', 'CBEC_1012', 
    'CBEC_20211008', 'CBEC4_0916', 'CBECasd_CDFZ', 'CBECasd_ldrs', 
    'CBECasd_ldrs0220', 'CBECasd_ldrs02201', 'CBECasd_ldrs0305', 
    'CBECasd0402', 'CBECasd2', 'CBECasdYS', 'cbecCD_20240918', 
    'csxy', 'DB_TZLCGHGS_LLJR', 'DSXPFX', 'dszb_tbys', 'DTJL', 
    'dyjy2', 'DYJYBF5', 'DYJYBF5_alibaba', 'DYJYBF5_hengxin', 
    'dyjyds0507', 'Dyrange', 'ECommerceBigData0115', 'ExamInquiry', 
    'gpdata', 'GZPY_New_CBEC', 'HNDS_2021', 'hndspt0507', 'hndspt1120', 
    'hndspt1224', 'HY_DTJL', 'HYPB_LCLLCS', 'InternationalTrade', 
    'iplock', 'jrdsj_20240603', 'JXYY_NewCBEC', 'JXYY_XP', 'KHJL', 
    'KHJL_Bank', 'KJDSDSJ', 'LCJL', 'linlong0225', 'lzyql', 'master', 
    'model', 'msdb', 'New_CBEC', 'RSBX_JLGH_BXLL', 'SKDNew', 
    'SocialMedia_DY', 'SocialMedia_DY_YS', 'SocialMedia_HX', 
    'SocialMedia_HX_YS', 'SocialMedia_PR', 'SocialMedia_PR_YS', 
    'SocialMedia_YDB', 'SocialMedia_YDB_YS', 'swsjfx_fjsf', 
    'swsjfx_fjsf01', 'TBCEBC20210707', 'tempdb', 'ydb_CBEC0829', 
    'ZHGT', 'ZXNLKS_DYJYBF5'
)
GROUP BY d.name
ORDER BY [总大小(GB)] DESC;
```



> 更新: 2026-04-25 17:13:22  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/tlsuf5aa6qi9cgd0>