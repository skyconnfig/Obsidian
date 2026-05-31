# 南京城市nginx反向代理

✅ HTTP入口（8001–8011）\
✅ 内部全部走 HTTPS\
✅ SNI / Host 头正确\
✅ SPA / 静态资源不乱码\
✅ Jupyter WebSocket 支持\
✅ 避免 404 / 登录问题

***

# 🚀 一、最终完整版 nginx.conf（直接用）

```nginx
user nginx;
worker_processes auto;

error_log /var/log/nginx/error.log warn;
pid /run/nginx.pid;

events {
    worker_connections 10240;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    keepalive_timeout  65;

    # DNS解析（必须）
    resolver 8.8.8.8 1.1.1.1 valid=300s;
    resolver_timeout 5s;

    # 通用代理设置
    proxy_http_version 1.1;
    proxy_set_header Connection "";
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header Accept-Encoding "";

    # =========================
    # 大数据
    # =========================

    server {
        listen 8001;
        location / {
            proxy_pass https://njcity-bigdata-adm.dianyueyun.com/;
            proxy_ssl_server_name on;
            proxy_set_header Host njcity-bigdata-adm.dianyueyun.com;
            proxy_redirect off;
        }
    }

    server {
        listen 8002;
        location / {
            proxy_pass https://njcity-bigdata-api.dianyueyun.com/;
            proxy_ssl_server_name on;
            proxy_set_header Host njcity-bigdata-api.dianyueyun.com;
        }
    }

    server {
        listen 8003;
        location / {
            proxy_pass https://njcity-bigdata-stu.dianyueyun.com/;
            proxy_ssl_server_name on;
            proxy_set_header Host njcity-bigdata-stu.dianyueyun.com;
        }
    }

    # =========================
    # 建模终端
    # =========================

    server {
        listen 8004;
        location / {
            proxy_pass https://njcity-datamodel-stu.dianyueyun.com/;
            proxy_ssl_server_name on;
            proxy_set_header Host njcity-datamodel-stu.dianyueyun.com;
        }
    }

    server {
        listen 8005;
        location / {
            proxy_pass https://njcity-datamodel-api.dianyueyun.com/;
            proxy_ssl_server_name on;
            proxy_set_header Host njcity-datamodel-api.dianyueyun.com;
        }
    }

    # =========================
    # 商务数据分析
    # =========================

    server {
        listen 8006;
        location / {
            proxy_pass https://njcity-bussdata-adm.dianyueyun.com/;
            proxy_ssl_server_name on;
            proxy_set_header Host njcity-bussdata-adm.dianyueyun.com;
        }
    }

    server {
        listen 8007;
        location / {
            proxy_pass https://njcity-bussdata-api.dianyueyun.com/;
            proxy_ssl_server_name on;
            proxy_set_header Host njcity-bussdata-api.dianyueyun.com;
        }
    }

    server {
        listen 8008;
        location / {
            proxy_pass https://njcity-bussdata-data.dianyueyun.com/;
            proxy_ssl_server_name on;
            proxy_set_header Host njcity-bussdata-data.dianyueyun.com;
        }
    }

    server {
        listen 8009;
        location / {
            proxy_pass https://njcity-bussdata-stu.dianyueyun.com/;
            proxy_ssl_server_name on;
            proxy_set_header Host njcity-bussdata-stu.dianyueyun.com;
        }
    }

    # ===== Jupyter（必须支持 WebSocket）=====
    server {
        listen 8010;
        location / {
            proxy_pass https://njcity-bussdata-jupyter.dianyueyun.com/;
            proxy_ssl_server_name on;
            proxy_set_header Host njcity-bussdata-jupyter.dianyueyun.com;

            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
        }
    }

    server {
        listen 8011;
        location / {
            proxy_pass https://njcity-bussdata-python.dianyueyun.com/;
            proxy_ssl_server_name on;
            proxy_set_header Host njcity-bussdata-python.dianyueyun.com;
        }
    }

}
```

***

# ⚡ 二、部署步骤（简洁版）

## 1️⃣ 覆盖配置

```bash
vim /etc/nginx/nginx.conf
```

***

## 2️⃣ 检查

```bash
nginx -t
```

***

## 3️⃣ 重启

```bash
systemctl restart nginx
```

***

## 4️⃣ 开端口

```bash
firewall-cmd --permanent --add-port=8001-8026/tcp
firewall-cmd --reload
```

***

# ✅ 三、测试

访问：

```plain
http://223.2.242.30:8001
```

👉 实际效果：

```plain
= https://njcity-bigdata-adm.dianyueyun.com
```

***

# 🔥 四、这版已经帮你解决的坑

| 问题 | 已解决 |
| --- | --- |
| HTTP访问404 | ✅ 强制走HTTPS |
| proxy\_pass路径问题 | ✅ 已加 `/` |
| HTTPS握手失败 | ✅ SNI开启 |
| 静态资源乱码 | ✅ 关闭压缩 |
| 登录失败 | ✅ Host头正确 |
| Jupyter打不开 | ✅ WebSocket支持 |

***

# 🚀 如果你要再升级（建议）

你现在是：

👉 多端口访问（8001~8011）

我可以帮你升级成：

```plain
一个域名 → 多路径
```

例如：

```plain
http://ip/bigdata
http://ip/datamodel
http://ip/bussdata
```

👉 更专业、比赛系统更常用

***

如果你要这个：

👉 直接说 **「改成统一网关版」**\
我给你一版**企业级架构（比现在高级一整套）** 💥

好，这里帮你整理成一份**清晰可用的映射表（端口 → 实际系统）**，可以直接用于运维文档或交付 👍

***

# 📊 一、端口映射总表（最终版本）

| 分类 | 功能 | 访问地址（内网） | 实际代理地址（外网） |
| --- | --- | --- | --- |
| 大数据 | 管理端 | [http://223.2.242.30:8001](http://223.2.242.30:8001/) | [https://njcity-bigdata-adm.dianyueyun.com](https://njcity-bigdata-adm.dianyueyun.com/) |
| 大数据 | API | [http://223.2.242.30:8002](http://223.2.242.30:8002/) | [https://njcity-bigdata-api.dianyueyun.com](https://njcity-bigdata-api.dianyueyun.com/) |
| 大数据 | 学生端 | [http://223.2.242.30:8003](http://223.2.242.30:8003/) | [https://njcity-bigdata-stu.dianyueyun.com](https://njcity-bigdata-stu.dianyueyun.com/) |
| 建模终端 | 学生端 | [http://223.2.242.30:8004](http://223.2.242.30:8004/) | [https://njcity-datamodel-stu.dianyueyun.com](https://njcity-datamodel-stu.dianyueyun.com/) |
| 建模终端 | API | [http://223.2.242.30:8005](http://223.2.242.30:8005/) | [https://njcity-datamodel-api.dianyueyun.com](https://njcity-datamodel-api.dianyueyun.com/) |
| 商务数据分析 | 管理端 | [http://223.2.242.30:8006](http://223.2.242.30:8006/) | [https://njcity-bussdata-adm.dianyueyun.com](https://njcity-bussdata-adm.dianyueyun.com/) |
| 商务数据分析 | API | [http://223.2.242.30:8007](http://223.2.242.30:8007/) | [https://njcity-bussdata-api.dianyueyun.com](https://njcity-bussdata-api.dianyueyun.com/) |
| 商务数据分析 | DataAPI | [http://223.2.242.30:8008](http://223.2.242.30:8008/) | [https://njcity-bussdata-data.dianyueyun.com](https://njcity-bussdata-data.dianyueyun.com/) |
| 商务数据分析 | 学生端 | [http://223.2.242.30:8009](http://223.2.242.30:8009/) | [https://njcity-bussdata-stu.dianyueyun.com](https://njcity-bussdata-stu.dianyueyun.com/) |
| 商务数据分析 | Jupyter | [http://223.2.242.30:8010](http://223.2.242.30:8010/) | [https://njcity-bussdata-jupyter.dianyueyun.com](https://njcity-bussdata-jupyter.dianyueyun.com/) |
| 商务数据分析 | Python | [http://223.2.242.30:8011](http://223.2.242.30:8011/) | [https://njcity-bussdata-python.dianyueyun.com](https://njcity-bussdata-python.dianyueyun.com/) |

***

# 🧠 二、你这套架构本质（方便写方案）

```plain
内网访问（HTTP）
↓
Nginx网关（223.2.242.30）
↓
外网系统（HTTPS）
```

👉 标准名称：

👉 **HTTP → HTTPS 反向代理网关**

***

# 📌 三、使用说明（给运维/老师用）

### ✅ 访问方式（统一格式）

```plain
http://223.2.242.30:端口
```

***

### ✅ 示例

```plain
大数据管理端：
http://223.2.242.30:8001

建模学生端：
http://223.2.242.30:8004

商务数据分析Jupyter：
http://223.2.242.30:8010
```

***

# ⚠️ 四、注意事项（建议写进文档）

### 1️⃣ 必须联网

👉 因为实际访问外网系统

***

### 2️⃣ 不支持离线

👉 所有服务都来自外部域名

***

### 3️⃣ 端口不可占用

👉 8001–8011 必须空闲

***

### 4️⃣ Jupyter 需要 WebSocket

👉 已在 nginx 配置中支持

***

# 🚀 五、如果你要升级（强烈推荐）

现在是：

```plain
IP + 端口访问
```

可以升级成：

```plain
统一入口（更专业）
```

例如：

```plain
http://223.2.242.30/bigdata
http://223.2.242.30/datamodel
http://223.2.242.30/bussdata
```

👉 优点：

* 更像真实生产环境
* 更方便比赛/教学
* 不用记端口

***

# 💥 如果你下一步要做

👉 做比赛系统 / 教学平台 / 展示系统

我可以帮你直接升级成：

✅ API网关（统一入口）\
✅ 用户鉴权\
✅ 并发控制\
✅ 日志监控

***

直接说一句：

👉 **「给我网关版架构」**

我给你一套可以直接用于**比赛现场/学校部署的完整方案** 🚀


> 更新: 2026-04-14 13:17:58  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/fdlxeiemagv7pu4t>