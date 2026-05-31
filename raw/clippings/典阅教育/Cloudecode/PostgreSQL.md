# PostgreSQL

### 安装PostgreSQL

```plain
sudo apt install postgresql postgresql-contrib
```

### 切换用户

```plain
sudo -i -u postgres
```

### 进入 postgres

```plain
pssql
```

### 设置密码

```plain
postgres=# \password pstgres
```

### 远程连接

```plain
postgres=# SHOW config file;SHOW hba file;
```

![1757903502522-1a06ef9d-7cd5-49c9-a59d-615854f212c3.png](./img/3CaO0lxeid7ilPbj/1757903502522-1a06ef9d-7cd5-49c9-a59d-615854f212c3-647857.png)

#### 第一个配置文件更改

![1757903722441-7b31b652-3b9e-4407-bc9b-b039bd4ccb0c.png](./img/3CaO0lxeid7ilPbj/1757903722441-7b31b652-3b9e-4407-bc9b-b039bd4ccb0c-190634.png)

```plain
listen addresses ='*'
```

#### 第二个配置文件更改

![1757903791761-6196e15f-9383-4f61-9428-65708930d855.png](./img/3CaO0lxeid7ilPbj/1757903791761-6196e15f-9383-4f61-9428-65708930d855-814630.png)

```plain
# IPv4 local connections:
host all all 0.0.0.0/0 scram-sha-256
```

### 重启

```plain
restart postgresql
```

```plain
数据库->schema-->表 这么3级
```

### 查询网段 ip 地址，inet，mac 地址，存储

#### cidr 字段可以存储网段

![1757904082941-525772ac-e572-4d0a-9388-70b72f7bfec3.png](./img/3CaO0lxeid7ilPbj/1757904082941-525772ac-e572-4d0a-9388-70b72f7bfec3-332237.png)

```plain
-- 1. 创建表：network_segments
CREATE TABLE network_segments (
    id SERIAL PRIMARY KEY,           -- 自增主键
    segment CIDR NOT NULL,           -- 网络段，如 192.168.1.0/24
    description TEXT                 -- 描述信息，可为空
);

-- 2. 插入数据：本地局域网
INSERT INTO network_segments (segment, description)
VALUES ('192.168.1.0/24', '本地局域网');
```

![1757904657308-9e942a8b-b12a-4355-99df-28e3c835da8c.png](./img/3CaO0lxeid7ilPbj/1757904657308-9e942a8b-b12a-4355-99df-28e3c835da8c-366847.png)

### 几何运行的数据类型可以存储数组

![1757904726725-598971cb-e934-4035-b928-0cb00a175d10.png](./img/3CaO0lxeid7ilPbj/1757904726725-598971cb-e934-4035-b928-0cb00a175d10-794859.png)

### jsonB 类型

![1757905171706-6ed2b0f6-4c4d-430f-bd7f-aa703297ad59.png](./img/3CaO0lxeid7ilPbj/1757905171706-6ed2b0f6-4c4d-430f-bd7f-aa703297ad59-021222.png)

![1757905202439-07930a00-3f94-4945-a775-306b4cf282a8.png](./img/3CaO0lxeid7ilPbj/1757905202439-07930a00-3f94-4945-a775-306b4cf282a8-342080.png)

```plain
-- ✅ 查询语句
SELECT *
FROM message_log
WHERE data ->> 'remote_addr' = '192.168.1.10';

-- ✅ 推荐：创建 GIN 索引（加速所有 JSONB 路径查询）
CREATE INDEX idx_message_log_data_gin ON message_log USING GIN (data);

-- ✅ 或者：创建专用表达式索引（更快、更省空间）
CREATE INDEX idx_message_log_remote_addr ON message_log ((data ->> 'remote_addr'));
```

### 文本转向量

![1757905284913-aad0a286-d61a-4338-977a-86edfca5eed9.png](./img/3CaO0lxeid7ilPbj/1757905284913-aad0a286-d61a-4338-977a-86edfca5eed9-156941.png)

```plain
-- 1. 确保表存在且有 content 字段
ALTER TABLE documents ADD COLUMN IF NOT EXISTS content TEXT;

-- 2. 添加自动生成的 TSVECTOR 列（PostgreSQL 12+）
ALTER TABLE documents 
ADD COLUMN IF NOT EXISTS tsv TSVECTOR 
GENERATED ALWAYS AS (to_tsvector('english', content)) STORED;

-- 3. 创建 GIN 索引以加速搜索
CREATE INDEX IF NOT EXISTS idx_documents_tsv ON documents USING GIN (tsv);
```

#### 中文插件

<https://github.com/dhamaniasad/awesome-postgres?tab=readme-ov-file#extensions>

![1757905431624-2f314fde-707f-46a0-9da3-a6eeb430d5c2.png](./img/3CaO0lxeid7ilPbj/1757905431624-2f314fde-707f-46a0-9da3-a6eeb430d5c2-582732.png)

#### 支持中文

**<font style="color:rgb(17, 24, 39);">如果你想支持中文全文检索</font>**<font style="color:rgb(44, 44, 54);">，请安装 </font><code><font style="color:rgb(97, 92, 237);background-color:rgb(239, 238, 255);">zhparser</font></code><font style="color:rgb(44, 44, 54);"> 扩展，并改为：</font>

```plain
ALTER TABLE documents 
ADD COLUMN tsv TSVECTOR 
GENERATED ALWAYS AS (to_tsvector('zhparser', content)) STORED;
```

![1757905561040-25b001d8-e6bd-4a8d-9804-73fae70c92a0.png](./img/3CaO0lxeid7ilPbj/1757905561040-25b001d8-e6bd-4a8d-9804-73fae70c92a0-371787.png)

### 知识库

### 安装插件

![1757905756797-9171b7f2-62c3-41fe-8124-b1597fbf30a1.png](./img/3CaO0lxeid7ilPbj/1757905756797-9171b7f2-62c3-41fe-8124-b1597fbf30a1-909384.png)

```plain
root@classic-kitten-2:~# sudo apt install postgresql-16-pgvector
```

### 启用插件

```plain
CREATE EXTENSION vector;
```

### 如何使用 postgresql 的向量数据库打造一个 rag 系统

```plain
https://python.langchain.com/docs/integrations/vectorstores/pgvector/
```

```plain
import os
from langchain_openai import OpenAIEmbeddings
from langchain_postgres.vectorstores import PGVector
from langchain_core.documents import Document

# ==============================
# ✅ 1. 设置环境变量（注意：键名必须完全正确！）
# ==============================
os.environ["OPENAI_API_KEY"] = "sk-your-openai-key-here"  # 替换为真实密钥
os.environ["OPENAI_BASE_URL"] = "https://api.siliconflow.cn/v1"

# ==============================
# ✅ 2. 初始化嵌入模型（使用硅基流动的 BGE-M3 模型）
# ==============================
embeddings = OpenAIEmbeddings(
    model="Pro/BAAI/bge-m3",      # ✅ 硅基流动支持的模型路径
    base_url=os.getenv("OPENAI_BASE_URL"),
    api_key=os.getenv("OPENAI_API_KEY")
)

# ==============================
# ✅ 3. 配置 PostgreSQL + pgvector 连接
# ==============================
connection = "postgresql+psycopg://postgres:techshrimp@97.64.25.208:5432/postgres"
collection_name = "my_docs_2"  # ✅ 修正：原为 "my docs 2"，不能有空格

vector_store = PGVector(
    embeddings=embeddings,
    collection_name=collection_name,
    connection=connection,
    use_jsonb=True,  # ✅ 正确参数名
)

# ==============================
# ✅ 4. 创建文档列表（修复所有语法错误）
# ==============================
docs = [
    Document(
        page_content="there are cats in the pond",
        metadata={"id": 1, "location": "pond", "topic": "animals"}
    ),
    Document(
        page_content="ducks are also found in the pond",
        metadata={"id": 2, "location": "pond", "topic": "animals"}
    ),
    Document(
        page_content="fresh apples are available at the market",
        metadata={"id": 3, "location": "market", "topic": "food"}
    ),
    Document(
        page_content="the market also sells fresh oranges",
        metadata={"id": 4, "location": "market", "topic": "food"}
    )
]

# ==============================
# ✅ 5. 将文档添加到向量数据库
# ==============================
ids = [doc.metadata["id"] for doc in docs]
vector_store.add_documents(docs, ids=ids)  # ✅ 方法名是 add_documents，不是 add documents

# ==============================
# ✅ 6. 执行相似性搜索
# ==============================
results = vector_store.similarity_search_with_score(
    query="I see some cute animal in water",
    k=3  # 返回前3个最相似结果
)

# ==============================
# ✅ 7. 输出结果
# ==============================
for doc, score in results:
    print(f"* [SIM={score:.3f}] {doc.page_content} [{doc.metadata}]")
```

### postresql 定时人物

#### 安装插件

```plain
sudo apt-get y install postgresql-16-cron
```

![1757907294749-0d8ad6b4-4f3b-4a22-93c9-79c4ca65d52e.png](./img/3CaO0lxeid7ilPbj/1757907294749-0d8ad6b4-4f3b-4a22-93c9-79c4ca65d52e-595167.png)

#### 修改配置文件

![1757907333270-775216cb-abe0-491d-b11a-7eb05f095b7b.png](./img/3CaO0lxeid7ilPbj/1757907333270-775216cb-abe0-491d-b11a-7eb05f095b7b-380827.png)

```plain
vi /etc/postgresql/16/main/postgresql.conf
```

#### 添加配置文件内容

![1757907370215-2316c4fd-442f-4de5-97f1-c1f8ef5ac93b.png](./img/3CaO0lxeid7ilPbj/1757907370215-2316c4fd-442f-4de5-97f1-c1f8ef5ac93b-772438.png)

```plain
# Add settings for extensions here
shared preload libraries ='pg 
croncron.database name=postgres
```

#### 接着修改 pg\_hba.cnf 配置文件

![1757907462344-d9547eac-4a9e-49f6-8749-1bd50e54ca6e.png](./img/3CaO0lxeid7ilPbj/1757907462344-d9547eac-4a9e-49f6-8749-1bd50e54ca6e-208779.png)

```plain
host all all 127.0.0.1/32 trust I
本地环路地址时候不需要密码验证
```

![1757907494538-5aeabf15-1887-4afa-8618-387248755a5d.png](./img/3CaO0lxeid7ilPbj/1757907494538-5aeabf15-1887-4afa-8618-387248755a5d-953569.png)

#### 重启服务

```plain
systemctl restart postgresql
```

#### 启用插件

```plain
CREATE EXTENSION pg_cron;
```

#### 定时任务开启

![1757907864425-a3b6a753-272a-417e-8638-e7200c34f3d0.png](./img/3CaO0lxeid7ilPbj/1757907864425-a3b6a753-272a-417e-8638-e7200c34f3d0-262079.png)

```plain
SELECT cron.schedule(
    'archive-documents-job',   -- 任务名称（唯一标识）
    '0 3 * * *',               -- Cron 表达式：每天 3:00 AM
    'SELECT archive_documents();'  -- 要执行的 SQL
);
```

```plain
-- 1. 创建缓存表（如不存在）
CREATE TABLE IF NOT EXISTS cache_data (
    id SERIAL PRIMARY KEY,
    key TEXT UNIQUE NOT NULL,
    value JSONB,
    expires_time TIMESTAMP NOT NULL
);

-- 2. 创建清理函数
CREATE OR REPLACE FUNCTION clean_cache_data()
RETURNS VOID AS $$
BEGIN
    DELETE FROM cache_data
    WHERE expires_time <= NOW();

    RAISE NOTICE 'Cleaned % expired cache entries.', (SELECT COUNT(*) FROM cache_data WHERE expires_time <= NOW());
END;
$$ LANGUAGE plpgsql;

-- 3. 安装 pg_cron（仅需一次）
CREATE EXTENSION IF NOT EXISTS pg_cron;

-- 4. 设置每天凌晨2点自动清理
SELECT cron.schedule(
    'clean-cache-job',
    '0 2 * * *',
    'SELECT clean_cache_data();'
);
```

### postgrest 转 api

<https://docs.postgrestorg/en/v13/index.html>

![1757908179130-2f539740-745c-49d9-b1f8-041f1434906e.png](./img/3CaO0lxeid7ilPbj/1757908179130-2f539740-745c-49d9-b1f8-041f1434906e-746723.png)

### 图数据库

<https://github.com/supabase/pg_graphql>

![1757908210552-32b7d6b1-272d-4880-918b-2dafcc88e533.png](./img/3CaO0lxeid7ilPbj/1757908210552-32b7d6b1-272d-4880-918b-2dafcc88e533-517338.png)


> 更新: 2025-09-15 11:50:53  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/hfhulgkd3wxw9t75>