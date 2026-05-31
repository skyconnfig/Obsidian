# 真正用于 AI 自动开发 Web 应用的“工业级模板工程”

我给你设计一个 **真正用于 AI 自动开发 Web 应用的“工业级模板工程”**。\
这个模板的目标不是简单 CRUD，而是：

**让 AI（OpenCode / Cursor / Claude Code / GSD）可以自动生成整个系统。**

它是一种 **AI First Project Structure**。

你只需要描述需求，AI 就能在这个模板上 **自动扩展系统**。

***

# 一、AI 自动开发 Web 应用模板（工业级）

项目名称示例：

```plain
ai-app-starter
```

结构：

```plain
ai-app-starter
│
├─ .ai
│   ├─ rules.md
│   ├─ coding-style.md
│   ├─ architecture.md
│   ├─ prompts.md
│
├─ docs
│   ├─ PROJECT.md
│   ├─ REQUIREMENTS.md
│   ├─ ROADMAP.md
│   ├─ API.md
│
├─ database
│   ├─ schema
│   ├─ seed
│   ├─ migrations
│
├─ backend
│   ├─ controllers
│   ├─ services
│   ├─ repositories
│   ├─ entities
│   ├─ dto
│   ├─ middleware
│   ├─ auth
│
├─ frontend
│   ├─ pages
│   ├─ components
│   ├─ api
│   ├─ layouts
│
├─ modules
│   ├─ user
│   ├─ role
│   ├─ permission
│
├─ scripts
│   ├─ generate-module.js
│   ├─ generate-crud.js
│
├─ tests
│
└─ README.md
```

核心思想：

```plain
模块化 + AI规则 + 自动生成
```

***

# 二、AI 规则文件（核心）

AI开发最关键的是：

```plain
.ai/rules.md
```

例如：

```plain
You are a senior full-stack engineer.

Architecture rules:

1 Controller -> Service -> Repository

2 Database:
SQL Server

3 API style:
RESTful

4 Naming rules:

Entity: User
Service: UserService
Controller: UserController

5 Every module must include:

Entity
Repository
Service
Controller
API
View
```

这样 AI 不会乱写代码。

***

# 三、模块结构模板

每个模块统一结构：

```plain
modules/user
│
├─ entity
│   └─ User.cs
│
├─ repository
│   └─ UserRepository.cs
│
├─ service
│   └─ UserService.cs
│
├─ controller
│   └─ UserController.cs
│
├─ dto
│   └─ UserDTO.cs
│
└─ views
    ├─ index
    ├─ edit
    ├─ create
```

AI生成模块时只需要：

```plain
Create Product Module
```

AI自动生成：

```plain
modules/product
```

***

# 四、数据库模板

```plain
database/schema
```

示例：

```plain
users.sql
roles.sql
permissions.sql
```

例如：

```plain
CREATE TABLE users (
 id INT IDENTITY PRIMARY KEY,
 username NVARCHAR(50),
 password_hash NVARCHAR(255),
 created_at DATETIME
)
```

AI自动扩展数据库。

***

# 五、自动生成脚本（非常重要）

`scripts/generate-module.js`

自动生成模块：

```plain
node scripts/generate-module product
```

生成：

```plain
modules/product
```

自动创建：

```plain
ProductController
ProductService
ProductRepository
ProductEntity
Views
```

***

# 六、自动 CRUD 生成

脚本：

```plain
generate-crud.js
```

执行：

```plain
node generate-crud user
```

自动生成：

```plain
GET /users
POST /users
PUT /users
DELETE /users
```

和：

```plain
index page
create page
edit page
```

***

# 七、AI Prompt 模板

README 中写：

```plain
When creating new features:

1 create database table
2 create entity
3 create repository
4 create service
5 create controller
6 create API
7 create frontend page
```

AI就会按流程生成。

***

# 八、AI 自动开发流程

例如你说：

```plain
Create Order Management Module
```

AI会自动生成：

```plain
modules/order
```

内容：

```plain
OrderEntity
OrderRepository
OrderService
OrderController
OrderAPI
OrderViews
```

***

# 九、自动后台系统

AI会生成：

```plain
Admin Dashboard
```

结构：

```plain
Dashboard
Users
Roles
Products
Orders
Reports
Settings
```

***

# 十、AI 自动 SaaS 系统

最终可以扩展成：

```plain
SaaS platform
```

模块：

```plain
Auth
Tenant
User
Billing
Subscription
Notification
Analytics
```

***

# 十一、最强 AI 工作流

如果结合：

* OpenCode
* GSD
* Cursor

开发流程：

```plain
描述需求
↓
AI分析
↓
AI设计数据库
↓
AI生成模块
↓
AI生成API
↓
AI生成页面
↓
AI测试
```

***

# 十二、真正厉害的玩法

现在很多 AI 团队用这种模式：

```plain
AI Starter Template
```

一个模板可以生成：

```plain
CRM
CMS
ERP
SaaS
管理后台
```

只需要：

```plain
改变模块
```

***

# 十三、如果你愿意

我可以给你 **一套真正顶级的 AI Web 开发模板**：

包含：

### 1️⃣ 自动模块生成器

```plain
create-module
```

### 2️⃣ 自动 CRUD 生成器

```plain
generate-crud
```

### 3️⃣ 自动 Admin 后台

类似：

```plain
Django Admin
```

### 4️⃣ AI 自动建表

```plain
generate-schema
```

### 5️⃣ AI 自动 API

```plain
generate-api
```

最终效果：

```plain
一句话生成一个系统
```

例如：

```plain
创建一个课程管理系统
```

10分钟生成：

```plain
Course
Student
Teacher
Enrollment
Grade
```

完整系统。

***

如果你需要，我可以 **直接给你一套完整 GitHub 级别的模板工程结构（非常强的那种）**：

包含：

* AI自动生成模块
* AI自动CRUD
* AI自动后台
* AI自动数据库
* AI自动API

很多 **AI创业团队都在用这种架构**。


> 更新: 2026-03-15 22:22:23  
> 原文: <https://www.yuque.com/lixinsi/yh04az/dhs3ts33ayv2y40w>