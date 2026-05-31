# dbForge Studio for MySQL监控数据库实际操作指南

# 推荐组合（Windows 场景）

* **开发/调试**：\
  👉 **dbForge Studio for MySQL**（有 Profiler 界面，最接近 SQL Server Profiler）\
  👉 或者 **Navicat Premium**（商业付费，但功能完整）
* **免费方案**：\
  👉 **MySQL Workbench + Performance Schema**（官方自带，能看执行语句汇总）\
  👉 **P6Spy**（如果是 Java 项目）
* **生产运维**：\
  👉 **Navicat Monitor**（实时 + 告警）\
  👉 或 **Elastic APM / SkyWalking**（端到端全链路）

明白 ✅\
下面给你写一个 **dbForge Studio for MySQL 使用 SQL Profiler 抓取实时 SQL 的详细实操指南**（Windows 环境）。

***

# 🛠️ dbForge Studio for MySQL Profiler 实操指南

## 1. 安装 dbForge Studio

1. 前往官网下载：\
   👉 [dbForge Studio for MySQL](https://www.devart.com/dbforge/mysql/studio/)
2. 安装完成后，启动程序。
3. 试用版默认有 30 天免费功能（包含 Profiler）。

***

## 2. 连接 MySQL 数据库

1. 打开 dbForge Studio → **Database → New Connection**。
2. 填写连接信息：
   * **Server**：MySQL 服务器地址（如 `localhost` 或 IP）
   * **Port**：3306（默认）
   * **User**：数据库用户名
   * **Password**：密码
3. 点击 **Test Connection**，确认能连上。

***

## 3. 打开 Profiler 工具

1. 在菜单栏选择：\
   **Database → SQL Profiler → New Profiler Session**。
2. 选择刚才配置的数据库连接，点击 **Next**。
3. 配置要监控的事件：
   * 默认会勾选常用的 SQL 执行事件（如 `Query Start`、`Query End`、`Errors`）。
   * 你也可以选择更详细的事件（锁、事务、登录等）。
4. 点击 **Finish**，开始抓取。

***

## 4. 使用 Profiler 抓取 SQL

* 进入 Profiler 界面后，所有被执行的 SQL 会实时显示：
  * **TextData**：SQL 语句
  * **Duration**：执行耗时
  * **LoginName / HostName**：执行用户与来源
  * **ApplicationName**：发起请求的应用
  * **CPU / Reads / Writes**：资源消耗
* 支持 **实时刷新**，类似 SQL Server Profiler。

***

## 5. 过滤与分析

* 点击 **Filter** 可按条件筛选（如某用户、某数据库、特定 SQL 关键字）。
* 可以保存 Profiler Session 日志，导出为文件，方便后续分析。

***

## 6. 停止 Profiler

* 点击 **Stop** 按钮，即可停止捕捉。
* 建议在排查问题时短时开启，避免日志过多影响性能。

***

# ⚠️ 注意事项

* Profiler 本质上是拦截 MySQL 事件流，**开启时会有一定性能开销**，不建议长期开启。
* 建议仅在 **测试 / 开发环境** 或 **生产排错时临时开启**。
* 如果追踪高并发系统，建议结合 **慢查询日志 + Performance Schema**，Profiler 主要用于 **实时调试**。

***

✅ 总结：\
在 **dbForge Studio for MySQL** 中使用 Profiler非常接近 SQL Server Profiler：

1. 连接数据库 →
2. 打开 Profiler →
3. 开启 Session →
4. 实时查看 SQL、耗时、来源。

***


> 更新: 2025-09-28 14:50:39  
> 原文: <https://www.yuque.com/lixinsi/akt91g/ixb66n67abl3n9aw>