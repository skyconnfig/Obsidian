# Mars Java开发提示词

```bash
你是一名资深全栈架构师，请帮我从0到1设计并生成一个企业级后台管理系统（前后端分离架构），要求代码可直接运行、结构清晰、符合生产环境规范，并包含数据可视化能力。

========================
一、项目名称
======

XXX管理系统（例如：用户 / 订单 / 设备 / 教务 / 数据分析系统）

========================
二、技术架构
======

【后端】

* Spring Boot 3（JDK17+）
* MyBatis-Plus
* MySQL 8
* Sa-Token（认证 + 权限）
* Knife4j（接口文档）
* Redis（缓存，可选但建议）
* Lombok + Jackson
* 所有的文档需要在，对应的后端接口文档以md形式在docs文件夹，方便二次开发以及维护

【前端】

* Vue 3 + Vite
* Naive UI
* Pinia
* Vue Router（history）
* Axios（二次封装）
* SCSS / CSS Modules
* 图标：ionicons5
* 开发环境以及正式环境局域网访问0.0.0.0
* 所有的文档需要在，对应的前端接口文档以md形式在docs文件夹，方便二次开发以及维护

【数据可视化】

* ECharts（必须集成或者AntV G2）
* 支持折线图 / 柱状图 / 饼图 / 仪表盘 / 数据大屏

========================
三、UI设计规范
========

布局：左右结构后台系统

* 左侧菜单（支持折叠）
* 右侧内容（Header + Tabs + 主体）

登录页：

* 左右布局（左展示 + 右登录）

主题：

```
const themeOverrides = {
  common: {
    primaryColor: '#111827',
    primaryColorHover: '#000000',
    textColorBase: '#1F2937',
    textColor2: '#6B7280',
    borderColor: '#E5E7EB'
  }
}
```

系统主色：

* #18A058（统一绿色主题）

========================
四、核心功能模块
========

1. 用户管理

* 登录（Sa-Token）
* CRUD
* 分页查询
* 状态控制

2. 权限管理（RBAC）

* 角色
* 菜单
* 按钮权限
* 权限校验

3. 系统管理

* 操作日志
* 登录日志
* 在线用户
* 接口文档

4. XXX业务模块

* 标准CRUD + 分页 + 搜索

========================
五、数据可视化模块（重点新增）
===============

必须实现一个【数据分析 / 仪表盘页面】：

1. 统计卡片：

* 总用户数
* 今日新增
* 活跃用户
* 业务数据统计

2. 图表展示（使用 ECharts）：

* 折线图（趋势分析）
* 柱状图（数据对比）
* 饼图（占比分析）
* 仪表盘（关键指标）

3. 数据来源：

* 后端接口动态返回
* 支持模拟数据 + 真实数据库

4. 要求：

* 图表组件封装（可复用）
* 自适应布局（响应式）
* 支持暗黑模式（可选）

========================
六、数据库设计
=======

必须输出SQL：

核心表：

* sys_user
* sys_role
* sys_permission
* sys_user_role
* sys_role_permission
* sys_log
* xxx业务表

字段规范：

* id（主键）
* create_time
* update_time
* create_by
* is_deleted（逻辑删除）

========================
七、后端实现要求
========

必须包含：

* 分层架构（controller/service/mapper）
* 统一返回 Result<T>
* 全局异常处理
* Sa-Token登录 + 权限注解
* MyBatis-Plus分页
* 逻辑删除
* Knife4j接口文档

新增：

* 统计接口（给 ECharts 使用）

  * /api/dashboard/statistics
  * /api/dashboard/trend
  * /api/dashboard/category

========================
八、前端实现要求
========

必须生成：

1. Layout布局（左右结构）
2. 登录页（左右布局）
3. 用户管理页面（表格CRUD）
4. Dashboard页面（重点）

Dashboard页面必须包含：

* 顶部统计卡片
* 多个 ECharts 图表
* 响应式布局

5. ECharts封装：

* 通用图表组件（LineChart / BarChart / PieChart）
* props驱动数据更新

6. Axios封装：

* Token自动携带
* 统一错误处理

7. Pinia：

* 用户信息
* Token管理

8. 路由权限控制

========================
九、加分项
=====

* 图表自动刷新
* 大屏模式（全屏）
* 导出Excel
* 深色模式
* 动画效果

========================
十、输出顺序
======

1. 架构说明
2. 数据库SQL
3. 后端代码
4. 前端代码（含ECharts）
5. 启动步骤
6. 接口测试（Knife4j）

========================
十一、代码要求
=======

* 必须可运行
* 不写伪代码
* 结构清晰
* 注释完整
* 符合企业级开发规范

```



> 更新: 2026-05-07 20:58:49  
> 原文: <https://www.yuque.com/lixinsi/up90z7/myf2l8vzq8d0nozh>