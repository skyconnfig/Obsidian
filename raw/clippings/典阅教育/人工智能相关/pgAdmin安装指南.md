# pgAdmin 安装指南

## pgAdmin 安装指南
pgAdmin 是 PostgreSQL 的图形化管理工具，可以帮助您更方便地管理数据库。以下是详细的安装步骤：

### 📥 方法一：独立安装 pgAdmin 步骤1：下载 pgAdmin
1. 
    1. 访问 pgAdmin 官网
2. 
    1. 选择 "pgAdmin 4 v8.x" 最新版本
3. 
    1. 下载 Windows 安装程序（.exe 文件） 步骤2：安装 pgAdmin
4. 
    1. 运行下载的安装程序
5. 
    1. 按照安装向导进行安装
6. 
    1. 选择安装路径（默认即可）
7. 
    1. 完成安装 步骤3：启动 pgAdmin
8. 
    1. 从开始菜单启动 pgAdmin 4
9. 
    1. 首次启动会要求设置主密码（用于保护保存的服务器密码）
10. 
    1. 设置一个安全的主密码并记住

### 🔧 方法二：检查是否已安装
如果您之前安装了 PostgreSQL，pgAdmin 可能已经包含在内：

1. 
    1. 检查开始菜单
    - 搜索 "pgAdmin"
    - 如果找到，直接启动即可
2. 
    1. 检查 PostgreSQL 安装目录
    - 路径： C:\Program Files\PostgreSQL\15\pgAdmin 4\
    - 如果存在，运行 pgAdmin4.exe

### 🌐 方法三：使用 Web 版本
pgAdmin 4 是基于 Web 的应用：

1. 
    1. 启动后会自动打开浏览器
2. 
    1. 默认地址： [http://127.0.0.1:xxxx/browser/](http://127.0.0.1:xxxx/browser/)
3. 
    1. 使用设置的主密码登录

### ⚙️ 配置 pgAdmin 连接到 PostgreSQL 步骤1：添加服务器
1. 
    1. 右键 "Servers" → "Register" → "Server"
2. 
    1. 在 "General" 标签页：
    - Name: Local PostgreSQL
    - Server group: Servers 步骤2：配置连接  
在 "Connection" 标签页填写：

```plain
Host name/address: localhost
Port: 5432
Maintenance database: postgres
Username: postgres
Password: newpassword123  # 您之前设
置的密码
``` 步骤3：保存连接
- 勾选 "Save password" （可选）
- 点击 "Save" 保存配置
### 🗄️ 使用 pgAdmin 创建数据库
连接成功后：

1. 1.
   创建数据库
   
   - 展开服务器连接
   - 右键 "Databases" → "Create" → "Database"
   - Database name: online_netdisk
   - Owner: postgres
   - 点击 "Save"
2. 2.
   执行 SQL 脚本
   
   - 选择 online_netdisk 数据库
   - 点击 "Query Tool" 图标
   - 复制 database/migrations/001_initial_schema.sql 的内容
   - 粘贴到查询编辑器
   - 点击 "Execute" 执行脚本
### ✅ 验证安装
成功后您应该能看到：

- 数据库 online_netdisk 已创建
- 包含所有表：users, files, folders, shares, expiry_tasks 等
- 可以浏览表结构和数据
### 🎯 优势
使用 pgAdmin 的好处：

- 图形化界面 ：直观的数据库管理
- SQL 编辑器 ：语法高亮和自动完成
- 数据浏览 ：方便查看和编辑数据
- 备份恢复 ：图形化的备份和恢复工具
- 监控功能 ：实时监控数据库性能
```



> 更新: 2025-08-14 13:16:25  
> 原文: <https://www.yuque.com/lixinsi/ynhoz5/mohrbsx4sq1s0cb7>