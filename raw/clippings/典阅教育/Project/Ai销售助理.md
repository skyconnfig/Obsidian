# Ai销售助理

### 1.智能体创建

````plain
# React B端系统基础框架 - 一步到位创建

请在当前工作目录下创建一个完整的React B端系统基础框架，严格按照以下规范一次性创建所有文件。

## 🎯 核心目标
- 页面风格全部必须统一赛博朋克风格
- 在当前文件夹内直接创建完整的项目文件结构
- 不使用create-react-app，手动配置所有文件
- 创建后能够立即运行：`npm install` → `npm start` → 访问 http://localhost:3010
- 所有功能完整可用，包括登录、导航、页面切换等

## 📦 技术栈规范（严格版本要求）

- **React**: 18.2.0+ (函数组件 + Hooks)
- **Ant Design**: 5.26.6 (精确版本)
- **React Router**: 6.8.0+ (路由管理)
- **图表插件**：Echarts
- **样式方案**: CSS Modules (不使用styled-components)
- **构建工具**: Webpack 5.75.0+ + Babel
- **开发服务器**: webpack-dev-server 4.7.4+
- **响应式**: 桌面端(>=1024px) + 平板端(768-1023px)
- **端口**: 3010 (避免常见冲突)

## ⚙️ 关键配置要求（避免常见错误）

### package.json 必须配置
```json
{
  "scripts": {
    "start": "webpack serve --mode development",
    "build": "webpack --mode production",
    "dev": "webpack serve --mode development"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.8.0",
    "antd": "5.26.6",
    "@ant-design/icons": "^5.0.1"
  }
}
````

### webpack.config.js 关键配置

```javascript
module.exports = {
  module: {
    rules: [
      // CSS模块规则必须在前面
      {
        test: /\.module\.css$/,
        use: ['style-loader', { loader: 'css-loader', options: { modules: true } }]
      },
      // 普通CSS规则在后面，排除模块文件
      {
        test: /\.css$/,
        exclude: /\.module\.css$/,
        use: ['style-loader', 'css-loader']
      }
    ]
  },
  devServer: {
    port: 3010,
    hot: true,
    historyApiFallback: true,
    open: false  // 布尔值，不是字符串
  }
};
```

## 📁 必须创建的完整文件结构

```
/
├── package.json                    # 项目依赖配置
├── webpack.config.js               # Webpack构建配置
├── README.md                       # 项目说明文档
├── public/
│   └── index.html                  # HTML模板
└── src/
    ├── index.js                    # 应用入口文件
    ├── index.css                   # 全局样式
    ├── App.js                      # 路由配置和守卫
    ├── components/                 # 公共组件
    │   ├── HeaderBar/              # 顶部标题栏
    │   │   ├── index.js
    │   │   └── index.module.css
    │   ├── NavigationBar/          # 侧边导航栏（核心组件）
    │   │   ├── index.js
    │   │   └── index.module.css
    │   └── Breadcrumb/             # 面包屑导航
    │       ├── index.js
    │       └── index.module.css
    └── pages/                      # 页面组件
        ├── Login/                  # 登录页面
        │   ├── index.js
        │   └── index.module.css
        └── Dashboard/              # 仪表板页面
            ├── index.js
            └── index.module.css
```

**重要：必须一次性创建所有上述文件，确保项目完整性！**

## 🎨 核心功能设计

### 登录系统

* **表单验证**: 用户名(>=3字符)、密码(>=6字符)、验证码(4位)
* **验证码组件**: 可点击刷新的随机4位字母数字组合
* **演示账号**: admin / 123456 (必须硬编码)
* **登录状态**: localStorage持久化存储
* **路由跳转**: 登录成功后跳转到/dashboard

### 仪表板系统

* **布局架构**: HeaderBar(顶部) + NavigationBar(左侧) + 主内容区
* **页面切换**: 根据路由显示不同内容(仪表板/用户管理页面/角色管理页面/权限管理页面)
* **数据展示**: 统计卡片 + 表格列表 + 图表占位区域
* **响应式**: 内容区自适应，最大化利用屏幕空间

## 🔥 核心组件实现要求

### NavigationBar 组件（最重要，必须严格实现）

**⚠️ 关键要求：完全自定义实现，绝对不能使用Ant Design Menu组件！**

#### 基础配置

* **位置**: 固定在标题栏下方左侧，`position: fixed; left: 0; top: 64px`
* **尺寸**: 展开宽度256px，收缩宽度80px，高度`calc(100vh - 64px)`
* **背景**: 白色主题，边框`border-right: 1px solid #f0f0f0`
* **收缩按钮**: 位于导航栏底部，不在标题栏中

#### 菜单结构（固定配置）

```javascript
const menuItems = [
  {
    key: 'dashboard',
    icon: <DashboardOutlined />,
    label: '仪表板',
    path: '/dashboard'
  },
  {
    key: 'system',
    icon: <SettingOutlined />,
    label: '系统管理',
    children: [
      { key: 'user-list', icon: <UserOutlined />, label: '用户管理', path: '/system/users' },
      { key: 'role-management', icon: <TeamOutlined />, label: '角色管理', path: '/system/roles' },
      { key: 'permission-management', icon: <SafetyOutlined />, label: '权限管理', path: '/system/permissions' }
    ]
  }
];
```

#### 手风琴模式（核心逻辑）

```javascript
const handleMenuClick = (item) => {
  if (item.path) {
    setActiveKey(item.key);
    navigate(item.path);
    // 点击一级菜单时关闭所有展开菜单
    const isTopLevelMenu = menuItems.some(menuItem => menuItem.key === item.key);
    if (isTopLevelMenu) setExpandedKeys([]);
  } else if (item.children) {
    // 展开当前菜单，关闭其他菜单
    setExpandedKeys(expandedKeys.includes(item.key) ? [] : [item.key]);
  }
};
```

#### Portal弹出菜单（收缩状态）

```javascript
// 使用createPortal渲染到document.body
const renderPortalSubmenu = () => {
  if (!collapsed || !hoveredSubmenu) return null;
  return createPortal(
    <div style={{ position: 'fixed', top: submenuPosition.top, left: submenuPosition.left }}>
      {/* 弹出菜单内容 */}
    </div>,
    document.body
  );
};
```

### HeaderBar 组件

```css
.header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  width: 100%;
  height: 64px;
  z-index: 1001;
  background: #fff;
  border-bottom: 1px solid #f0f0f0;
}
```

* **内容**: 左侧系统标题，右侧用户下拉菜单(头像+姓名+退出)
* **功能**: 退出登录清除localStorage并跳转到/login

### Breadcrumb 组件

* **路由映射**: 根据当前路径显示面包屑
* **点击跳转**: 支持点击面包屑项进行路由跳转
* **层级显示**: 首页 > 系统管理 > 具体页面

## 🛣️ 路由配置和守卫

### App.js 路由结构

```javascript
// 路由守卫组件
const ProtectedRoute = ({ children }) => {
  const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
  return isLoggedIn ? children : <Navigate to="/login" replace />;
};

// 路由配置
<Routes>
  <Route path="/" element={<Navigate to="/dashboard" replace />} />
  <Route path="/login" element={<Login />} />
  <Route path="/dashboard" element={<ProtectedRoute><Dashboard /></ProtectedRoute>} />
  <Route path="/system/users" element={<ProtectedRoute><Dashboard /></ProtectedRoute>} />
  <Route path="/system/roles" element={<ProtectedRoute><Dashboard /></ProtectedRoute>} />
  <Route path="/system/permissions" element={<ProtectedRoute><Dashboard /></ProtectedRoute>} />
  <Route path="*" element={<Navigate to="/dashboard" replace />} />
</Routes>
```

### 路由说明

* **根路径**: 自动重定向到/dashboard
* **登录页**: /login (已登录用户自动跳转到dashboard)
* **仪表板**: /dashboard (需要登录)
* **系统管理**: /system/\* (需要登录，都使用Dashboard组件，内部根据路由切换内容)

## 🎯 布局架构要求

### 关键CSS布局

```css
/* 标题栏：固定顶部，占满宽度 */
.header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 1001;
}

/* 导航栏：标题栏下方，固定左侧 */
.sidebar {
  position: fixed;
  left: 0;
  top: 64px;
  height: calc(100vh - 64px);
  width: 256px; /* 展开状态 */
}

.sidebar.collapsed {
  width: 80px; /* 收缩状态 */
}

/* 主内容区：根据导航栏状态调整左边距 */
.mainLayout {
  margin-left: 256px;
  transition: margin-left 0.2s ease;
  min-height: calc(100vh - 64px);
}

.mainLayout.collapsed {
  margin-left: 80px;
}

/* 内容区：不设置max-width，充分利用空间 */
.contentInner {
  padding: 24px 16px;
  /* 重要：不要设置max-width和margin: 0 auto */
}
```

### 响应式断点

* **桌面端**: >= 1024px (标准布局)
* **平板端**: 768px - 1023px (调整间距和字体)

## 🎨 样式和设计规范

### 主题色彩

* **主色调**: #1890ff (Ant Design蓝)
* **背景色**: #f5f5f5 (浅灰)
* **卡片背景**: #ffffff (白色)
* **文字颜色**: #262626 (深灰)
* **边框颜色**: #d9d9d9 (浅灰)

### 关键样式

```css
/* 删除按钮统一样式 */
.deleteButton {
  color: #ff4d4f !important;
  border: none !important;
}

.deleteButton:hover:not(:disabled) {
  color: #ff7875 !important;
  background-color: rgba(255, 77, 79, 0.1) !important;
}
```

## 🚀 执行要求

### 一次性创建所有文件

请严格按照上述规范，一次性创建所有必要的文件，确保项目完整性：

1. **配置文件**: package.json, webpack.config.js
2. **入口文件**: public/index.html, src/index.js, src/App.js
3. **组件文件**: HeaderBar, NavigationBar, Breadcrumb (含CSS模块)
4. **页面文件**: Login, Dashboard (含CSS模块)
5. **样式文件**: src/index.css (全局样式)
6. **文档文件**: README.md

### 验证标准

创建完成后必须能够：

1. `npm install` - 成功安装所有依赖
2. `npm start` - 启动开发服务器到 http://localhost:3010
3. 登录页面正常显示，使用 admin/123456 能够成功登录
4. 导航栏手风琴模式正常工作（点击一级菜单关闭其他展开菜单）
5. 收缩状态下Portal弹出菜单正常显示和交互
6. 所有路由页面切换正常，面包屑导航正确显示
7. 响应式布局在桌面端和平板端都正常工作

### 关键注意事项

* **NavigationBar必须完全自定义**，绝对不能使用Ant Design Menu组件
* **手风琴模式**：点击任意一级菜单时，其他展开的菜单必须自动关闭
* **Portal弹出菜单**：收缩状态下的二级菜单必须使用createPortal渲染到body
* **CSS模块规则**：webpack配置中CSS模块规则必须在普通CSS规则之前
* **Ant Design locale**：必须使用 <code>antd/es/locale/zh_CN</code> 路径导入

## ⚠️ 常见问题预防

1. **端口冲突**: 使用3010端口，避免3000/3001占用
2. **CSS模块错误**: webpack配置中CSS模块规则必须在普通CSS规则之前
3. **Ant Design locale**: 使用 <code>antd/es/locale/zh_CN</code> 路径导入
4. **NavigationBar**: 绝对不能使用Ant Design Menu，必须完全自定义
5. **Portal弹出菜单**: 收缩状态下必须使用createPortal渲染到body
6. **手风琴模式**: 点击一级菜单时必须关闭其他展开菜单

***

## 🎯 最终要求

**请严格按照上述所有规范，一次性创建完整的React B端系统框架！**

创建完成后项目必须能够：

* `npm install` 成功安装依赖
* `npm start` 启动到 http://localhost:3010
* 使用 admin/123456 成功登录
* 导航栏手风琴模式完美工作
* Portal弹出菜单正常显示和交互
* 所有页面路由切换正常

**重点强调：NavigationBar组件必须完全自定义实现，绝对不能使用Ant Design Menu组件！**

````

### 2.产品原型设计
```plain
我想做一个一个ai实时指导销售谈单，3端都可以使用的技术栈以及本地部署效果最好整体风格参照这个文件
````

```plain
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>赛博朋克登录</title>
    <!-- 引入tsParticles库 -->
    <script src="https://cdn.jsdelivr.net/npm/tsparticles@2.12.0/tsparticles.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #000;
            font-family: 'Arial', sans-serif;
            height: 100vh;
            overflow: hidden;
            position: relative;
        }

        /* 动态粒子背景由tsParticles处理 */
        #tsparticles {
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        /* 扫描线动画 */
        .scanline {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
            background: linear-gradient(
                to bottom,
                transparent 0%,
                rgba(0, 255, 255, 0.1) 50%,
                transparent 100%
            );
            animation: scan 3s linear infinite;
        }

        @keyframes scan {
            0% {
                transform: translateY(-100%);
            }
            100% {
                transform: translateY(100vh);
            }
        }

        /* 磨砂玻璃登录卡片 */
        .login-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            max-width: 400px;
            z-index: 2;
            backdrop-filter: blur(10px); /* 磨砂玻璃效果 [[20]] */
            -webkit-backdrop-filter: blur(10px);
            background-color: rgba(0, 0, 0, 0.5);
            border: 1px solid rgba(0, 255, 255, 0.3);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.3),
                        0 0 60px rgba(0, 255, 255, 0.1);
        }

        /* 标题渐变文字 */
        .login-title {
            font-size: 2.5em;
            text-align: center;
            margin-bottom: 10px;
            background: linear-gradient(45deg, #00ffff, #0066ff, #cc00ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
        }

        .login-subtitle {
            font-size: 1em;
            text-align: center;
            margin-bottom: 30px;
            color: #00ffff;
            opacity: 0.8;
            text-shadow: 0 0 5px rgba(0, 255, 255, 0.5);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #00ffff;
            font-size: 0.9em;
            text-shadow: 0 0 5px rgba(0, 255, 255, 0.5);
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            background-color: rgba(0, 20, 30, 0.8);
            border: 1px solid #0066ff;
            border-radius: 8px;
            color: #00ffff;
            font-size: 1em;
            transition: all 0.3s ease;
            box-shadow: 0 0 5px rgba(0, 102, 255, 0.3);
        }

        .form-control:focus {
            outline: none;
            border-color: #00ffff;
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.5),
                        0 0 30px rgba(0, 255, 255, 0.2);
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(45deg, #0066ff, #00ffff);
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 1.1em;
            cursor: pointer;
            transition: all 0.3s ease;
            text-shadow: 0 0 5px rgba(0, 255, 255, 0.8);
            box-shadow: 0 0 10px rgba(0, 255, 255, 0.3);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.6),
                        0 0 40px rgba(0, 255, 255, 0.3);
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links a {
            color: #00ffff;
            text-decoration: none;
            font-size: 0.9em;
            transition: all 0.3s ease;
            text-shadow: 0 0 5px rgba(0, 255, 255, 0.5);
        }

        .links a:hover {
            text-shadow: 0 0 10px rgba(0, 255, 255, 0.8);
        }

        /* 响应式设计 */
        @media (max-width: 480px) {
            .login-container {
                width: 90%;
                padding: 30px 20px;
            }
            
            .login-title {
                font-size: 2em;
            }
            
            .form-control {
                padding: 10px 12px;
            }
            
            .btn {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- 粒子背景容器 -->
    <div id="tsparticles"></div>
    
    <!-- 扫描线效果 -->
    <div class="scanline"></div>
    
    <!-- 登录表单容器 -->
    <div class="login-container">
        <h1 class="login-title">NEON ACCESS</h1>
        <p class="login-subtitle">未来之门 · 身份验证</p>
        
        <form id="loginForm">
            <div class="form-group">
                <label for="username">用户ID</label>
                <input type="text" class="form-control" id="username" placeholder="输入您的身份ID" required>
            </div>
            <div class="form-group">
                <label for="password">访问码</label>
                <input type="password" class="form-control" id="password" placeholder="输入您的加密密钥" required>
            </div>
            <button type="submit" class="btn">登入系统</button>
        </form>
        
        <div class="links">
            <a href="#">忘记访问码？</a>
        </div>
    </div>

    <script>
        // 配置tsParticles
        document.addEventListener("DOMContentLoaded", function() {
            tsParticles.load('tsparticles', {
                particles: {
                    number: {
                        value: 80,
                        density: {
                            enable: true,
                            area: 800
                        }
                    },
                    color: {
                        value: "#00ffff"
                    },
                    shape: {
                        type: "circle"
                    },
                    opacity: {
                        value: 0.5,
                        random: true,
                        anim: {
                            enable: true,
                            speed: 1,
                            opacity_min: 0.1,
                            sync: false
                        }
                    },
                    size: {
                        value: 3,
                        random: true,
                        anim: {
                            enable: true,
                            speed: 2,
                            size_min: 0.1,
                            sync: false
                        }
                    },
                    move: {
                        enable: true,
                        speed: 1,
                        direction: "none",
                        random: true,
                        straight: false,
                        out_mode: "out",
                        bounce: false,
                        attract: {
                            enable: true,
                            rotateX: 600,
                            rotateY: 1200
                        }
                    }
                },
                interactivity: {
                    detectsOn: "canvas",
                    events: {
                        onhover: {
                            enable: true,
                            mode: "repulse" // 鼠标悬停时产生排斥效果 [[26]]
                        },
                        onclick: {
                            enable: true,
                            mode: "push" // 点击添加新粒子 [[26]]
                        },
                        resize: true
                    },
                    modes: {
                        repulse: {
                            distance: 100,
                            duration: 0.4
                        },
                        push: {
                            particles_nb: 4
                        }
                    }
                },
                retina_detect: true,
                background: {
                    color: "#000000"
                }
            });
        });

        // 阻止表单默认提交行为
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            alert('身份验证中... 系统接入成功');
        });
    </script>
</body>
</html>
```


> 更新: 2025-08-16 21:57:15  
> 原文: <https://www.yuque.com/lixinsi/dtxgrg/gsfo6gy62e5ete00>