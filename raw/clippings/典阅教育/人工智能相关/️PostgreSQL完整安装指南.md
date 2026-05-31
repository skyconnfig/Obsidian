# 🗄️ PostgreSQL 完整安装指南

为了让您的在线网盘系统正常运行，以下是 PostgreSQL 在 Windows 系统上的完整安装和配置指南：

### 📥 第一步：下载 PostgreSQL
1. 
    1. 访问官方网站
    - 打开 PostgreSQL 官网
    - 选择 "Download the installer" 选项
2. 
    1. 选择版本
    - 推荐下载 PostgreSQL 15.x 或 16.x 最新稳定版
    - 选择适合您系统的版本（x86-64 for 64位系统）
3. 
    1. 下载安装程序
    - 文件大小约 200-300MB
    - 下载完成后运行 .exe 安装程序

### 🔧 第二步：安装 PostgreSQL 安装向导步骤
1. 
    1. 启动安装程序
    - 右键以管理员身份运行安装程序
    - 点击 "Next" 开始安装
2. 
    1. 选择安装目录
    - 默认路径： C:\Program Files\PostgreSQL\15
    - 建议保持默认，点击 "Next"
3. 
    1. 选择组件
    - ✅ PostgreSQL Server （必选）
    - ✅ pgAdmin 4 （图形管理工具，强烈推荐）
    - ✅ Stack Builder （扩展包管理器）
    - ✅ Command Line Tools （命令行工具，必选）
    - 点击 "Next"
4. 
    1. 选择数据目录
    - 默认路径： C:\Program Files\PostgreSQL\15\data
    - 保持默认，点击 "Next"
5. 
    1. 设置超级用户密码
    - 用户名： postgres （默认超级用户）
    - 重要 ：设置一个强密码并记住（例如： PostgreSQL123! ）
    - 确认密码
    - 点击 "Next"
6. 
    1. 设置端口
    - 默认端口： 5432
    - 保持默认，点击 "Next"
7. 
    1. 选择区域设置
    - 选择 "Chinese (Simplified), China" 或保持默认
    - 点击 "Next"
8. 
    1. 确认安装
    - 检查安装摘要
    - 点击 "Next" 开始安装
    - 等待安装完成（约5-10分钟）

### ✅ 第三步：验证安装 方法1：使用命令行
```plain
# 打开命令提示符，测试psql命令
psql --version
# 应该显示：psql (PostgreSQL) 15.x

# 连接到PostgreSQL
psql -U postgres
# 输入之前设置的密码
``` 方法2：使用pgAdmin
1. 1.
   从开始菜单启动 "pgAdmin 4"
2. 2.
   设置主密码（用于保护保存的连接信息）
3. 3.
   连接到本地PostgreSQL服务器
### 🗄️ 第四步：创建项目数据库 使用命令行创建
```

# 连接到PostgreSQL
psql -U postgres

# 创建数据库
CREATE DATABASE online_netdisk;

# 查看数据库列表
\l

# 退出
\q

```plain
1. 1.
   在pgAdmin中连接到服务器
2. 2.
   右键 "Databases" → "Create" → "Database"
3. 3.
   数据库名： online_netdisk
4. 4.
   所有者： postgres
5. 5.
   点击 "Save"
### 📊 第五步：初始化数据库表结构
```

# 在项目根目录执行
psql -U postgres -d online_netdisk   
-f database/migrations/  
001_initial_schema.sql

```plain
或在pgAdmin中：

1. 1.
   选择 online_netdisk 数据库
2. 2.
   打开 "Query Tool"
3. 3.
   复制 database/migrations/001_initial_schema.sql 内容
4. 4.
   粘贴并执行
### ⚙️ 第六步：配置项目环境变量
编辑 server/.env 文件：

```

# 数据库配置
DB_HOST=localhost  
DB_PORT=5432  
DB_NAME=online_netdisk  
DB_USER=postgres  
DB_PASSWORD=PostgreSQL123!  # 您设置  
的密码  
DB_SSL=false

# JWT配置
JWT_SECRET=your_secure_jwt_secret_ke  
y_here_at_least_32_characters_long  
JWT_EXPIRES_IN=7d

# 服务器配置
PORT=3000  
NODE_ENV=development  
CLIENT_URL=[http://localhost:5173](http://localhost:5173)

```plain
### 🔧 常见问题解决 问题1：psql命令未找到
- 将 C:\Program Files\PostgreSQL\15\bin 添加到系统PATH环境变量
- 重启命令提示符 问题2：密码认证失败
- 确认输入的密码正确
- 检查 pg_hba.conf 配置文件
- 重启PostgreSQL服务 问题3：端口被占用
- 检查5432端口是否被其他程序占用
- 修改PostgreSQL端口或停止冲突程序 问题4：服务未启动
```

# 启动PostgreSQL服务
net start postgresql-x64-15

# 停止服务
net stop postgresql-x64-15

```plain
### 🛠️ PostgreSQL 服务管理 Windows服务管理
1. 1.
   按 Win + R ，输入 services.msc
2. 2.
   找到 "postgresql-x64-15" 服务
3. 3.
   右键可以启动、停止、重启服务
4. 4.
   设置为 "自动" 启动类型 命令行管理
```

# 查看服务状态
sc query postgresql-x64-15

# 启动服务
net start postgresql-x64-15

# 停止服务
net stop postgresql-x64-15

```plain
### 🚀 第七步：启动项目
配置完成后，启动在线网盘系统：

```

# 在项目根目录
npm install  # 安装依赖（如果还没有）  
npm run dev  # 启动前后端服务

```plain
### 📋 安装检查清单
- ✅ PostgreSQL Server 已安装
- ✅ pgAdmin 4 已安装
- ✅ 命令行工具可用（psql --version）
- ✅ PostgreSQL 服务正在运行
- ✅ 数据库 online_netdisk 已创建
- ✅ 数据库表结构已初始化
- ✅ 项目环境变量已配置
- ✅ 项目可以正常连接数据库
### 💡 最佳实践建议
1. 1.
   安全性
   
   - 使用强密码
   - 定期备份数据库
   - 限制网络访问（生产环境）
2. 2.
   性能优化
   
   - 根据需要调整内存设置
   - 定期维护和清理
   - 监控数据库性能
3. 3.
   备份策略
   
   - 设置自动备份
   - 测试恢复流程
   - 保存备份到安全位置
完成以上步骤后，您的PostgreSQL就已经完全配置好了，可以为在线网盘系统提供稳定的数据库服务！
```



> 更新: 2025-08-14 13:20:05  
> 原文: <https://www.yuque.com/lixinsi/ynhoz5/gmr8pidozhe47sqf>