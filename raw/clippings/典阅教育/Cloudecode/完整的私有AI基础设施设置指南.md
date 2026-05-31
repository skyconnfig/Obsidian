# 完整的私有 AI 基础设施设置指南

好的，这是您提供的《Complete Private AI Infrastructure Setup Guide》文档的中文翻译：

***

**完整的私有AI基础设施搭建指南**

以每月10美元的成本构建企业级AI基础设施，替代每月500美元以上的商业方案。

本指南将帮助您搭建自己的私有AI基础设施，包括：

* **私有ChatGPT界面 (Open WebUI)** - 与AI对话，无需将数据发送给外部公司。
* **AI自动化平台 (N8N)** - 构建能将AI与您的应用和服务集成的工作流。
* **本地AI模型 (Ollama)** - 在您自己的硬件上运行强大的语言模型。
* **专业SSL证书和域名** - 通过自动证书实现安全的HTTPS访问。
* **完整的数据库系统 (Supabase)** - 存储和管理您所有的AI数据和对话记录。

**先决条件**

**您需要准备：**

* Hostinger VPS服务器（推荐KVM4套餐 - 10美元/月）
* 一个域名（本文将以 repriseaistudio.com 为例）
* 基本的终端操作能力（复制/粘贴命令即可）
* **预计耗时：** 45-60分钟

***

**第一步：获取您的Hostinger VPS**

**为什么：** 我们需要一台功能强大的服务器来同时运行AI模型和多项服务。

1. 前往：hostinger.com/vps-hosting
2. 选择：**KVM4套餐** (10美元/月)
   * 4个vCPU核心（AI模型处理所需）
   * 16GB内存（AI模型非常消耗内存）
   * 200GB存储空间（AI模型是大型文件）
3. 选择：**Ubuntu 22.04 或 24.04**（对Docker最稳定）
4. 设置一个**强密码**作为root密码（请务必记下来！）
5. 完成购买。

**作用：** 为您提供专用的计算资源，能够同时运行多个AI服务。

***

**第二步：连接到您的服务器**

**为什么：** 我们需要通过终端在VPS上安装和配置软件。

**选项A：使用Hostinger浏览器终端**

1. 进入Hostinger VPS控制面板。
2. 点击“Browser Terminal”。
3. 使用您的密码以root用户身份登录。

**选项B：使用SSH（如果您更喜欢）**

在您的本地电脑终端中输入：

```bash
ssh root@your-vps-ip
```

**作用：** 为您提供命令行访问权限，以配置和管理您的服务器。

***

**第三步：更新系统并安装必备工具**

**为什么：** 在安装AI基础设施之前，我们需要最新的安全更新和必备工具。

```bash
# 首先，我们需要更新服务器
# 这确保我们拥有最新的安全补丁和软件版本
sudo apt update && sudo apt upgrade -y

# 安装整个设置过程中需要的必备工具
# git: 用于下载AI软件包代码
# python3: 部署脚本所需
# nano: 用于编辑配置文件的文本编辑器
# curl: 用于下载Docker和其他组件
sudo apt install -y git python3 nano curl

# 验证安装是否成功
git --version
python3 --version
curl --version
```

**作用：** 确保您的服务器拥有最新的安全更新，并安装了AI基础设施设置所需的基本工具。

***

**第四步：配置服务器安全（防火墙）**

**为什么：** 防火墙就像您服务器的保安。默认情况下，您的服务器会接受数千个不同端口的连接。黑客会不断扫描互联网，寻找开放的端口进行攻击。我们需要关闭所有不必要的端口，只允许我们AI服务所需的特定端口。

```bash
# 设置防火墙以保护我们的服务器
# 可以将其想象为锁上所有不需要的门，只留下我们需要的
# 启用防火墙（这将激活保护）
sudo ufw enable

# 允许SSH（端口22）- 这是我们连接和管理服务器的方式
# 没有这个，我们会把自己锁在外面，失去访问权限
sudo ufw allow 22/tcp

# 允许HTTP（端口80）- 用于初始域名验证和自动重定向到HTTPS
# 这让Let's Encrypt可以验证我们的域名所有权以获取SSL证书
sudo ufw allow 80/tcp

# 允许HTTPS（端口443）- 我们的安全AI服务将通过此端口访问
# 我们所有的 chat.domain.com, n8n.domain.com 流量都通过这里
sudo ufw allow 443/tcp

# 检查防火墙状态，确认我们的安全规则已激活
sudo ufw status
```

**作用：**

* 阻止除我们明确允许的3个端口外的所有传入连接。
* 防止黑客访问服务器上未使用的服務或端口。
* 仅允许Web流量（HTTP/HTTPS）和您的SSH管理连接。
* 创建一个安全屏障，显著减少攻击面。

***

**第五步：安装Docker**

**为什么：** Docker就像一个虚拟容器系统，它将每个AI服务及其运行所需的一切打包在一起。与其直接在我们的服务器上安装AI软件（这可能会产生冲突和安全问题），不如让Docker在自己的隔离“容器”中运行每个服务。这意味着：

* 每个AI服务都不能干扰其他服务。
* 服务的启动、停止和更新都很简单。
* 在不同服务器上具有一致的性能。
* 通过隔离增强了安全性。

```bash
# 使用官方安装脚本下载并安装Docker
# 此脚本会自动检测您的操作系统并安装正确的版本
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# 安装Docker Compose，用于一起管理多个容器
# 此工具让我们可以用单个命令启动/停止整个相关服务组
# 无需单独管理5个以上的容器，我们可以将它们作为一个系统来控制
sudo apt install -y docker-compose

# 验证Docker是否正常工作
docker --version
docker ps

# 清理安装脚本（良好的习惯）
rm get-docker.sh
```

**作用：**

* 安装 **Docker Engine**：运行容器化应用的核心技术。
* 安装 **Docker Compose**：用于管理多容器应用的工具（我们的AI堆栈包含多个服务）。
* **验证安装**：确认Docker正在运行并准备好部署容器。
* **准备基础设施**：为在隔离、安全的容器中运行Ollama、N8N、Open WebUI和Supabase奠定基础。

***

**第六步：下载Cole Medin的本地AI软件包**

**为什么：** 该软件包包含了我们所需的所有AI服务的预配置Docker设置。

```bash
# 克隆包含所有AI服务配置的仓库
# 这为我们提供了经过测试、可用的Ollama、N8N、Open WebUI等配置
git clone https://github.com/coleam00/local-ai-packaged.git

# 进入项目目录
cd local-ai-packaged

# 列出文件，确认我们已正确下载所有内容
ls -la
```

您应该会看到：

* `start_services.py` - 自动化部署脚本
* `.env.example` - 配置模板
* `docker-compose.yml` - 服务定义文件
* `README.md` - 文档

**作用：** 下载一个完整的、经过测试的软件包，其中包含了我们所需的所有AI服务的配置，省去了从头开始配置的麻烦。

***

**第七步：配置环境变量**

**为什么：** 这是最关键的一步——我们本质上是在为每个AI服务创建账户、密码和安全设置。可以将其想象为为您的私有AI基础设施设置“用户账户和密码”。每个服务都需要特定的凭证才能安全地相互通信。

**我们将配置：**

* **N8N凭证**：您的自动化平台的用户名/密码和加密密钥。
* **Supabase数据库**：数据库密码和管理面板登录凭证。
* **域名路由**：告诉系统哪个URL连接到哪个AI服务。
* **SSL证书**：用于安全证书通知的电子邮件地址。
* **API密钥**：允许服务相互通信的安全令牌。

```bash
# 复制示例配置文件以创建我们的实际配置文件
cp .env.example .env

# 编辑配置文件
nano .env
```

**清空文件中的所有内容，并粘贴以下完整配置：**

> **注意：** 我们将为每个AI服务设置安全的密码和配置。可以将其想象为为您的私有AI基础设施创建账户和安全设置。

```bash
# 将此文件名更改为 .env 后再更新它！
############
# [必需] 
# N8N 凭证 - 这些用于保护您的自动化平台
# N8N_ENCRYPTION_KEY: 加密您的自动化工作流和数据
# N8N_USER_MANAGEMENT_JWT_SECRET: 保护用户会话和登录
############
N8N_ENCRYPTION_KEY=6e2b9c8d4a1f7e5c3b8a2d6f1c4e7b9a2f5d8c1e3a7b4f9d6e2c5a8b1f4e7c3d
N8N_USER_MANAGEMENT_JWT_SECRET=3d8e7b1f2a4c6e9d5a1b7c3e5f6a8d2c4f7e1b9c5a2d8f6e3b7a4c1d9e5f2a6b
############
# [必需] 
# Supabase 数据库密钥 - 这些用于保护您的数据库和所有AI数据
# POSTGRES_PASSWORD: 您的数据库密码（请将其更改为更安全的密码！）
# JWT_SECRET: 加密用于数据库访问的身份验证令牌
# DASHBOARD_USERNAME/PASSWORD: 数据库管理面板的登录凭证
############
POSTGRES_PASSWORD=SecurePassword123
POSTGRES_HOST=db
POSTGRES_DB=postgres
POSTGRES_PORT=5432
POSTGRES_USER=postgres
JWT_SECRET=2f7a9b3d5e1c8a6f4b2d7c1e9a3f8b5d7c2e6a1f4b9d3e8c5a7f2b6d1e4a9c3f
ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlzcyI6InN1cGFiYXNlLWRlbW8iLCJpYXQiOjE2NDE3NjkyMDAsImV4cCI6MTc5OTUzNTYwMH0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE
SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoic2VydmljZV9yb2xlIiwiaXNzIjoic3VwYWJhc2UtZGVtbyIsImlhdCI6MTY0MTc2OTIwMCwiZXhwIjoxNzk5NTM1NjAwfQ.DaYlNEoUrrEn2Ig7tqibS-PHK5vgusbcbo7X36XVt4Q
DASHBOARD_USERNAME=supabase
DASHBOARD_PASSWORD=SecurePass789
POOLER_TENANT_ID=1000
POOLER_DB_POOL_SIZE=5
############
# [必需] 其他 Supabase 变量
############
SECRET_KEY_BASE=SecretKeyBase123456789012345678901234567890123456789012345678901234567890
VAULT_ENC_KEY=VaultEncKey12345678901234567890123
POOLER_PROXY_PORT_TRANSACTION=6543
POOLER_DEFAULT_POOL_SIZE=20
POOLER_MAX_CLIENT_CONN=100
SUPABASE_PUBLIC_URL=https://db.repriseaistudio.com
############
# [必需，用于 Langfuse 凭证] 
############
CLICKHOUSE_PASSWORD=ClickHousePass456
MINIO_ROOT_PASSWORD=MinIOPass123
LANGFUSE_SALT=LangfuseSalt999
NEXTAUTH_SECRET=NextAuthSecret888
ENCRYPTION_KEY=EncryptionKey777
############
# [关键 - 请将这些更改为您的域名] 
# Caddy 配置 - 域名路由配置
# 这些告诉系统哪些URL应指向哪些服务：
# - chat.repriseaistudio.com: 您的私有ChatGPT界面 (Open WebUI)
# - n8n.repriseaistudio.com: 您的自动化平台 (N8N)
# - db.repriseaistudio.com: 您的数据库仪表板 (Supabase)
# LETSENCRYPT_EMAIL: 用于SSL证书通知的邮箱
############
N8N_HOSTNAME=n8n.repriseaistudio.com
WEBUI_HOSTNAME=chat.repriseaistudio.com
FLOWISE_HOSTNAME=flowise.repriseaistudio.com
SUPABASE_HOSTNAME=db.repriseaistudio.com
OLLAMA_HOSTNAME=ollama.repriseaistudio.com
SEARXNG_HOSTNAME=searxng.repriseaistudio.com
LETSENCRYPT_EMAIL=nick@repriseai.com
############
# 其他必需变量
############
DOCKER_SOCKET_LOCATION=/var/run/docker.sock
LOGFLARE_PUBLIC_ACCESS_TOKEN=PublicToken123
LOGFLARE_PRIVATE_ACCESS_TOKEN=PrivateToken456
STUDIO_DEFAULT_PROJECT=default
STUDIO_DEFAULT_ORGANIZATION=default
IMGPROXY_ENABLE_WEBP_DETECTION=true
FUNCTIONS_VERIFY_JWT=false
FLOWISE_USERNAME=admin
FLOWISE_PASSWORD=FlowisePass123
############
# API 代理
############
KONG_HTTP_PORT=8000
KONG_HTTPS_PORT=8443
############
# API - PostgREST 配置
############
PGRST_DB_SCHEMAS=public,storage,graphql_public
############
# 认证
############
SITE_URL=http://localhost:3000
ADDITIONAL_REDIRECT_URLS=
JWT_EXPIRY=3600
DISABLE_SIGNUP=false
API_EXTERNAL_URL=http://localhost:8000
MAILER_URLPATHS_CONFIRMATION="/auth/v1/verify"
MAILER_URLPATHS_INVITE="/auth/v1/verify"
MAILER_URLPATHS_RECOVERY="/auth/v1/verify"
MAILER_URLPATHS_EMAIL_CHANGE="/auth/v1/verify"
ENABLE_EMAIL_SIGNUP=true
ENABLE_EMAIL_AUTOCONFIRM=false
SMTP_ADMIN_EMAIL=admin@example.com
SMTP_HOST=supabase-mail
SMTP_PORT=2500
SMTP_USER=fake_mail_user
SMTP_PASS=fake_mail_password
SMTP_SENDER_NAME=fake_sender
ENABLE_ANONYMOUS_USERS=false
ENABLE_PHONE_SIGNUP=true
ENABLE_PHONE_AUTOCONFIRM=true
```

**重要提示：** 上述配置已包含：\
✅ 您的域名：repriseaistudio.com\
✅ 您的邮箱：nick@repriseai.com\
✅ 所有服务的安全密码\
✅ 用于数据保护的加密密钥

**每个密码/密钥的作用：**

* `POSTGRES_PASSWORD`: 保护您的数据库（如果需要，可以将 "SecurePassword123" 改为更安全的密码）。
* `DASHBOARD_PASSWORD`: Supabase管理面板的登录密码（当前为 "SecurePass789"）。
* `N8N_ENCRYPTION_KEY`: 加密您的自动化工作流。
* `JWT_SECRET`: 保护身份验证令牌。

**保存并退出：**

* `Ctrl + O` (保存)
* `Enter` (确认)
* `Ctrl + X` (退出)

**作用：** 创建一个安全的配置文件，其中包含您的AI基础设施所需的所有密码、API密钥和域名设置。此文件告诉每个服务：

* 如何安全地连接到其他服务。
* 应响应哪些域名（chat.repriseaistudio.com, n8n.repriseaistudio.com 等）。
* 用于数据库访问的密码。
* 如何加密敏感数据。
* 将SSL证书通知发送到哪里。

您本质上是在这个单一文件中为整个AI基础设施创建了“身份和安全配置文件”。

***

**第八步：设置域名DNS记录**

**为什么：** 现在我们已经配置好了服务并了解了每个子域名的作用，我们需要将这些域名指向我们的服务器。

在您的域名注册商（Hostinger, Namecheap等）中：

**创建A记录：**

* `chat.repriseaistudio.com` → 您的VPS IP地址 （用于Open WebUI - 您的私有ChatGPT界面）
* `n8n.repriseaistudio.com` → 您的VPS IP地址 （用于N8N - 您的自动化平台）
* `db.repriseaistudio.com` → 您的VPS IP地址 （用于Supabase - 您的数据库仪表板）

**等待5-10分钟**，让DNS记录生效。

**测试DNS：**

```bash
nslookup chat.repriseaistudio.com
# 应返回您的VPS IP地址
```

**作用：** 将您的自定义域名路由到您的服务器，以便您可以通过简洁的URL访问每个AI服务。现在，当有人访问 `chat.repriseaistudio.com` 时，他们将到达您的私有AI聊天界面，而无需记住IP地址和端口号。

***

**第九步：部署基础设施 - 自动化方法**

**为什么：** 我们将首先尝试自动化脚本，但需准备好应对Supabase分析组件可能出现的问题。

```bash
# 运行自动化部署脚本
# 这将尝试使用Docker Compose一次性启动所有服务
python3 start_services.py --profile=cpu --environment=public
```

**如果您遇到错误（尤其是与 **`supabase-analytics`** 相关的）：** 这是一个已知问题。分析组件有时会失败，但它对AI核心功能并非至关重要。如果发生这种情况，我们将使用下面的手动方法。

**作用：** 尝试使用预配置的Docker容器自动部署所有AI服务。

***

**第十步：部署基础设施 - 手动方法（如果自动化失败）**

**为什么：** 如果自动化部署失败，我们将逐个部署服务，以确保每个服务都能正常工作。

```bash
# 首先，清理任何失败的容器
docker compose -p localai down
docker system prune -f

# 逐个启动每个服务，以便在需要时进行故障排除

# 1. 启动 Ollama (AI模型服务器)
# 它运行实际的AI模型并为其他服务提供API
docker run -d \
  --name ollama \
  --network host \
  -p 11434:11434 \
  --restart unless-stopped \
  ollama/ollama

# 等待片刻，让Ollama启动
sleep 10

# 2. 启动 N8N (自动化平台)
# 它提供工作流自动化和集成
docker run -d \
  --name n8n \
  --network host \
  -p 5678:5678 \
  -e N8N_ENCRYPTION_KEY=6e2b9c8d4a1f7e5c3b8a2d6f1c4e7b9a2f5d8c1e3a7b4f9d6e2c5a8b1f4e7c3d \
  --restart unless-stopped \
  n8nio/n8n

# 等待N8N启动
sleep 10

# 3. 启动 Open WebUI (类似ChatGPT的界面)
# 它提供与AI模型聊天的Web界面
docker run -d \
  --name open-webui \
  --network host \
  -p 3000:8080 \
  -e OLLAMA_BASE_URL=http://localhost:11434 \
  -v open-webui:/app/backend/data \
  --restart unless-stopped \
  ghcr.io/open-webui/open-webui:main

# 等待Open WebUI启动
sleep 10

# 4. 设置Caddy以处理SSL证书和域名路由
# 它处理HTTPS证书并将域名路由到正确的服务
cat > Caddyfile << 'EOF'
{
    email nick@repriseai.com
}
chat.repriseaistudio.com {
    reverse_proxy localhost:3000
}
n8n.repriseaistudio.com {
    reverse_proxy localhost:5678
}
EOF

# 启动带有自动SSL证书的Caddy
docker run -d \
  --name caddy \
  --network host \
  -p 80:80 \
  -p 443:443 \
  -v $(pwd)/Caddyfile:/etc/caddy/Caddyfile \
  -v caddy_data:/data \
  --restart unless-stopped \
  caddy:alpine

# 检查所有服务是否都在运行
docker ps
```

**作用：** 逐个启动每个AI服务，这比一次性启动所有服务更可靠。每个服务在您的AI基础设施中都有特定的角色。

***

**第十一步：下载AI模型**

**为什么：** AI模型是“大脑”——我们需要下载它们，以便我们的服务能够真正提供AI能力。

```bash
# 下载一个快速、较小的模型（2GB）- 适合快速响应
docker exec -it ollama ollama pull llama3.2

# 下载一个更大、更高质量的模型（4.7GB）- 适合复杂任务
docker exec -it ollama ollama pull qwen2.5:7b

# 列出所有可用模型以确认下载
docker exec -it ollama ollama list
```

**作用：** 将AI语言模型下载到您的服务器，以便您可以与它们进行对话。不同的模型具有不同的能力和响应速度。

***

**第十二步：访问您的服务**

等待2-3分钟，让SSL证书生成，然后访问：

* **Open WebUI (私有ChatGPT):** `https://chat.repriseaistudio.com`
  * 创建您的管理员账户。
  * 从下拉菜单中选择一个模型（llama3.2 或 qwen2.5:7b）。
  * 开始与您的私有AI聊天吧！
* **N8N (自动化平台):** `https://n8n.repriseaistudio.com`
  * 创建您的所有者账户。
  * 构建AI工作流和自动化。
  * 使用Ollama基础URL: `http://localhost:11434`
* **Supabase (数据库):** `https://db.repriseaistudio.com` (如果已部署)
  * 登录名：`supabase` / 密码：`SecurePass789`
  * 管理您的数据库和数据。

**您将获得：** 三个强大的AI服务，可通过专业的HTTPS域名访问，并配备自动SSL证书以确保安全。

***

**常见问题排查**

**问题：Open WebUI中未显示模型**

* **问题描述：** WebUI显示“无可用模型”。
* **解决方案：**

```bash
# 使用正确的Ollama连接重启Open WebUI
docker stop open-webui
docker rm open-webui
docker run -d \
  --name open-webui \
  --network host \
  -p 3000:8080 \
  -e OLLAMA_BASE_URL=http://localhost:11434 \
  -v open-webui:/app/backend/data \
  --restart unless-stopped \
  ghcr.io/open-webui/open-webui:main
```

**问题：N8N无法连接到Ollama**

* **问题描述：** “无法使用这些设置连接”。
* **解决方案：** 在N8N中尝试以下Ollama URL：
  * `http://localhost:11434`
  * `http://ollama:11434`
  * `http://host.docker.internal:11434`

**问题：SSL证书无法工作**

* **问题描述：** 域名显示“不安全”或连接错误。
* **解决方案：**

```bash
# 检查Caddy日志以排查证书问题
docker logs caddy
# 重启Caddy以重试证书生成
docker restart caddy
# 等待2-3分钟让证书生成
```

**问题：Supabase分析组件失败**

* **问题描述：** `supabase-analytics` 状态不健康。
* **解决方案：** 这是一个已知问题。分析组件是可选的——即使没有它，您的AI服务也能正常工作。请使用上面的手动部署方法。

***

**您已构建完成**

您现在拥有了：

* **私有ChatGPT界面** - 与AI模型对话，无需将数据发送给外部公司。
* **AI自动化平台** - 使用N8N构建复杂的工作流。
* **本地AI模型** - 在您自己的硬件上运行强大的语言模型。
* **专业SSL设置** - 带有自动证书的HTTPS域名。
* **完整的数据库系统** - 存储和管理您所有的AI数据。
* **成本节约** - 每月10美元 vs. 商业等效方案的每月500美元以上。

***

**下一步**

* **探索N8N：** 构建您的第一个AI自动化工作流。
* **测试不同模型：** 为不同任务尝试各种AI模型。
* **设置集成：** 连接到您喜爱的应用和服务。
* **扩展升级：** 根据需要添加更多模型或升级您的服务器。
* **备份：** 考虑备份您的配置和数据。

***

**支持**

如果您遇到问题：

* 查看上面的故障排除部分。
* 使用 `docker logs [容器名]` 查看Docker日志。
* Cole Medin的GitHub: `github.com/coleam00/local-ai-packaged`
* N8N文档: `docs.n8n.io`

***


> 更新: 2025-09-16 15:42:10  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/gufvwgvzdsfnrgc2>