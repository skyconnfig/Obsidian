---
title: "skyconnfig/codegraph: Pre-indexed code knowledge graph for Claude Code, Codex, Gemini, Cursor, OpenCode, AntiGravity, Kiro, and Hermes Agent — fewer tokens, fewer tool calls, 100% local"
source: "https://github.com/skyconnfig/codegraph"
author:
published:
created: 2026-05-30
description: "Pre-indexed code knowledge graph for Claude Code, Codex, Gemini, Cursor, OpenCode, AntiGravity, Kiro, and Hermes Agent — fewer tokens, fewer tool calls, 100% local - skyconnfig/codegraph"
tags:
  - "clippings"
---
## 代码图

### 通过语义代码智能增强 Claude Code、Cursor、Codex、OpenCode、Hermes Agent、Gemini、Antigravity 和 Kiro

**便宜约 25% · 工具调用减少约 62% · 100% 本地**

### 文档和网站 →

## 开始使用

**不需要 Node.js** — 一个命令可为您的操作系统获取正确的版本：

```
#macOS/Linux卷曲-fsSL https://raw.githubusercontent.com/colbymchenry/codegraph/main/install.sh|嘘#Windows（PowerShell）
irm https://raw.githubusercontent.com/colbymchenry/codegraph/main/install.ps1 |埃克斯
```

已经有节点了吗？使用 npm 代替（适用于任何版本）：

```
npx @colbymchenry/codegraph        #零安装，或者：
npm i -g @colbymchenry/codegraph
```

<sub>CodeGraph 捆绑了自己的运行时——无需编译，无需本地构建，在任何地方都一样工作。交互式安装程序会自动配置您的代理 - Claude Code、Cursor、Codex CLI、opencode、Hermes Agent、Gemini CLI、Antigravity IDE、Kiro。</sub>

### 初始化项目

```
光盘你的项目
代码图初始化 -i
```

<sub><code>代码图初始化</code> 只是创建本地的<code>.代码图/</code> 索引目录；添加 <code>-我</code> (<code> - 指数</code> ）也在同一步骤中构建初始图。没有 <code>-i</code> ， 跑步 <code>代码图索引</code> 之后填充它。</sub>

[![1_C_VYnhpys0UHrOuOgpgoyw](https://private-user-images.githubusercontent.com/18431132/578288862-f168182f-4d9a-44e0-94d7-08d018cc8a3a.gif?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3ODAxMTc3ODcsIm5iZiI6MTc4MDExNzQ4NywicGF0aCI6Ii8xODQzMTEzMi81NzgyODg4NjItZjE2ODE4MmYtNGQ5YS00NGUwLTk0ZDctMDhkMDE4Y2M4YTNhLmdpZj9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MzAlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTMwVDA1MDQ0N1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWU0Nzg5MDEzODU2NjMyZDUwNjllZjhkNzFhMGMzN2RhNTk4N2EyN2RiNGY3N2YyMGYwNDY5MGQ0OWM3YTcyMGMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRmdpZiJ9.lWCME1ArxjLUVygWoGwM3A5-yx-HqkSqXgdttYo_MvY)](https://private-user-images.githubusercontent.com/18431132/578288862-f168182f-4d9a-44e0-94d7-08d018cc8a3a.gif?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3ODAxMTc3ODcsIm5iZiI6MTc4MDExNzQ4NywicGF0aCI6Ii8xODQzMTEzMi81NzgyODg4NjItZjE2ODE4MmYtNGQ5YS00NGUwLTk0ZDctMDhkMDE4Y2M4YTNhLmdpZj9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MzAlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTMwVDA1MDQ0N1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWU0Nzg5MDEzODU2NjMyZDUwNjllZjhkNzFhMGMzN2RhNTk4N2EyN2RiNGY3N2YyMGYwNDY5MGQ0OWM3YTcyMGMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRmdpZiJ9.lWCME1ArxjLUVygWoGwM3A5-yx-HqkSqXgdttYo_MvY)

### 卸载

改变主意了吗？一个命令可从其配置的每个代理中删除 CodeGraph：

```
代码图卸载
```

<sub>反转安装程序 — 从每个配置的代理中删除 CodeGraph 的 MCP 服务器配置、说明和权限。您的项目索引（<code>.codegraph/</code> ）保持不变；删除每个项目的那些 <code>代码图 uninit</code> 。使用 <code> - 目标</code> 从特定代理中删除，或 <code> - 是的</code> 以非交互方式运行。</sub>

---

## 为什么选择 CodeGraph？

当 Claude Code 探索代码库时，它会产生 **探索代理商** 使用 grep、glob 和 Read 扫描文件 - 每次工具调用都会消耗令牌。

**CodeGraph 为这些代理提供了预先索引的知识图** — 符号关系、调用图和代码结构。代理立即查询图表，而不是扫描文件。

### 基准测试结果

经过测试 **7 个真实世界的开源代码库** 跨越 7 种语言，比较代理（Claude Code，无头）回答一个架构问题 **和** and **没有** 代码图。每个单元格都是储蓄 **每组运行 4 次的中位数**. *在 Opus 4.8 (2026-05-29) 上重新验证，基于每个符号自适应构建 `代码图探索` 浆纱。*

> **平均：便宜 25% · 代币减少 57% · 速度加快 23% · 工具调用减少 62%**

| 代码库 | 语言 | 成本 | 代币 | 时间 | 工具调用 |
| --- | --- | --- | --- | --- | --- |
| **VS代码** | TypeScript · 约 10k 个文件 | 便宜 33% | 减少 70% | 速度提高 27% | 减少 80% |
| **Excalidraw** | 打字稿 · ~640 | 便宜 27% | 减少 61% | 速度提高 26% | 70% fewer |
| **姜戈** | Python · ~3k | 便宜 23% | 70% fewer | 速度提高 28% | 减少 77% |
| **东京** | 铁锈 · ~790 | 便宜 35% | 70% fewer | 速度提高 37% | 减少 79% |
| **好的http** | 爪哇 · ~645 | 便宜 11% | 减少 48% | 26% faster | 70% fewer |
| **杜松子酒** | 去·〜110 | 便宜 15% | 减少 35% | 速度提高 9% | 减少 47% |
| **阿拉莫菲尔** | 斯威夫特 · ~110 | 便宜 28% | 减少 46% | 速度提高 7% | 减少 13% |

CodeGraph 剪切 **每个存储库的成本、代币、工具调用和时间** - 跨越小型、中型和大型代码库 - 并回答其中的大多数问题 **零文件读取** ，而无 CodeGraph 代理则将其预算花在 grep/find/Read 发现上。 `codegraph_explore` 完整地显示了答案 - 该机制加上您询问的确切方法，即使它们被埋在数千行文件中 - 同时将冗余的可互换实现折叠为签名，因此响应的大小取决于 *回答* 而不是文件数。在最小的存储库上，成本边际最窄，其中现代模型的本机搜索已经很便宜，但总体上仍然保持积极的态度。

**每个存储库的细分 — 有与无（中位数为 4）**

**VS Code** · 约 10k 个文件

| 公制 | 与CG | 无CG | Δ |
| --- | --- | --- | --- |
| Time | 1米37秒 | 2米13秒 | 27% faster |
| 文件读取 | 0 | 9 | −9 |
| 格雷普/重击 | 0 | 11 | −11 |
| Tool calls | 4 | 21 | 80% fewer |
| 代币总数 | 545k | 1.79M | 70% fewer |
| Cost | $0.55 | $0.83 | 33% cheaper |

**Excalidraw** · ~640 个文件

| Metric | WITH cg | WITHOUT cg | Δ |
| --- | --- | --- | --- |
| Time | 1米34秒 | 2米6秒 | 26% faster |
| File Reads | 0 | 7 | −7 |
| Grep/Bash | 0 | 8 | −8 |
| Tool calls | 5 | 15 | 70% fewer |
| Total tokens | 651k | 1.69M | 61% fewer |
| Cost | $0.57 | $0.78 | 27% cheaper |

**Django** · ~3k 文件

| Metric | WITH cg | WITHOUT cg | Δ |
| --- | --- | --- | --- |
| Time | 1米25秒 | 1m 58s | 28% faster |
| File Reads | 0 | 9 | −9 |
| Grep/Bash | 0 | 5 | −5 |
| Tool calls | 3 | 13 | 77% fewer |
| Total tokens | 419k | 1.41M | 70% fewer |
| Cost | $0.48 | $0.62 | 23% cheaper |

**Tokio** · ~790 个文件

| Metric | WITH cg | WITHOUT cg | Δ |
| --- | --- | --- | --- |
| Time | 1米28秒 | 2米20秒 | 37% faster |
| File Reads | 0 | 8 | −8 |
| Grep/Bash | 0 | 6 | −6 |
| Tool calls | 3 | 14 | 79% fewer |
| Total tokens | 522k | 1.73M | 70% fewer |
| Cost | $0.53 | $0.82 | 35% cheaper |

**OkHttp** · ~645 个文件

| Metric | WITH cg | WITHOUT cg | Δ |
| --- | --- | --- | --- |
| Time | 1米6秒 | 1米29秒 | 26% faster |
| File Reads | 1 | 4 | −3 |
| Grep/Bash | 0 | 6 | −6 |
| Tool calls | 3 | 10 | 70% fewer |
| Total tokens | 572k | 1.10M | 48% fewer |
| Cost | $0.48 | $0.55 | 11% cheaper |

**Gin** · ~110 个文件

| Metric | WITH cg | WITHOUT cg | Δ |
| --- | --- | --- | --- |
| Time | 1m 28s | 1m 37s | 9% faster |
| File Reads | 0 | 6 | −6 |
| Grep/Bash | 0 | 2 | −2 |
| Tool calls | 5 | 9 | 47% fewer |
| Total tokens | 552k | 847k | 35% fewer |
| Cost | $0.48 | $0.57 | 15% cheaper |

**Alamofire** · ~110 files

| Metric | WITH cg | WITHOUT cg | Δ |
| --- | --- | --- | --- |
| Time | 2米11秒 | 2分21秒 | 7% faster |
| File Reads | 3 | 9 | −6 |
| Grep/Bash | 2 | 4 | −2 |
| Tool calls | 11 | 12 | 13% fewer |
| Total tokens | 1.13M | 2.10M | 46% fewer |
| Cost | $0.69 | $0.95 | 28% cheaper |

**完整的基准测试详细信息**

**方法论。** 每个手臂都是 `克劳德-p` （Claude Opus 4.8）无头地针对回购协议运行 `--严格 mcp 配置`: **和** = CodeGraph 的 MCP 服务器已启用， **没有** = 空的 MCP 配置。内置的 Read/Grep/Bash 可供两者使用。每个仓库都有同样的问题， **每组运行 4 次，报告中位数** 。成本=运行成本 `总成本美元`;令牌 = 处理的令牌总数（输入，包括缓存 + 输出）；时间=挂钟；工具调用 = 每个工具调用，包括模型生成的任何子代理内的工具调用。存储库克隆于 `--深度1` 并由为他们服务的相同 CodeGraph 构建进行索引。 2026 年 5 月 29 日在构建上重新验证了每个符号自适应 `codegraph_explore` 浆纱。这些数字低于之前的 Opus 4.7 验证 — 不是 CodeGraph 回归，而是更强的本机基线：Opus 4.8 在主线程上高效地 grep/读取，而不是分散到大型 Explore-subagent 扫描中，因此 no-CodeGraph 臂比以前更精简。每个回购协议的数字随着无臂鞭打的强度而变化（4 的中位数使其平滑，但尾巴仍然存在 - 例如 Django 的无臂击中了 2.71 美元/1400 万美元一批）。

**查询：**

| Codebase | Query |
| --- | --- |
| VS Code | “扩展主机如何与主进程通信？” |
| Excalidraw | “Excalidraw 如何渲染和更新画布元素？” |
| Django | “Django 的 ORM 如何从 QuerySet 构建和执行查询？” |
| Tokio | “tokio 如何在其运行时安排和运行异步任务？” |
| OkHttp | “OkHttp 如何通过其拦截器链处理请求？” |
| Gin | “gin 如何通过中间件链路由请求？” |
| Alamofire | “Alamofire 如何构建、发送和验证请求？” |

**为什么 CodeGraph 获胜：** 有了可用的索引，代理就直接回答—— `代码图上下文` 绘制该区域的地图，然后一 `codegraph_explore` 查找相关源 - 然后停止，通常文件读取为零。如果没有它，代理在读取正确的代码之前会将大部分预算花在发现（find/ls/grep）上。 CodeGraph 仅在查询时有帮助 *直接地* ，因此它的指令引导代理直接回答，而不是将探索委托给文件读取子代理 - 否则子代理无论如何都会读取文件，并且 CodeGraph 会成为开销。

---

## 主要特点

|  |  |
| --- | --- |
| **智能情境构建** | 一次工具调用即可返回入口点、相关符号和代码片段 - 无需昂贵的探索代理 |
| **全文搜索** | 在 FTS5 的支持下，在整个代码库中立即按名称查找代码 |
| **影响分析** | 在进行更改之前跟踪调用者、被调用者以及任何符号的完整影响半径 |
| **永远新鲜** | 文件观察器使用本机操作系统事件 (FSEvents/inotify/ReadDirectoryChangesW) 和去抖动自动同步 — 图表在您编码时保持最新状态，零配置 |
| **20+ 语言** | TypeScript、JavaScript、Python、Go、Rust、Java、C#、PHP、Ruby、C、C++、Objective-C、Swift、Kotlin、Dart、Lua、Luau、Svelte、Liquid、Pascal/Delphi |
| **框架感知路由** | 识别 Web 框架路由文件并将 URL 模式链接到 14 个框架的处理程序 |
| **混合 iOS / React Native / Expo** | 关闭静态解析错过的跨语言流程：Swift ↔ ObjC 桥接、React Native 遗留桥接 + TurboModules + Fabric 视图组件、本机 → JS 事件发射器、Expo 模块 |
| **100%本地化** | 没有数据离开您的机器。没有 API 密钥。没有外部服务。仅 SQLite 数据库 |

**自动同步的工作原理 - 以及为什么您不需要运行 `代码图同步` 手动**

当您的代理（Claude Code、Cursor、Codex、opencode）启动时 `代码图服务--mcp` ，三层使索引与您的代码保持同步 - 并确保代理永远不会在编辑和下一次同步之间的简短窗口中得到无声的错误答案：

1. **具有去抖自动同步功能的文件观察器。** 本机 FSEvents / inotify / ReadDirectoryChangesW 观察程序捕获每个源文件创建/修改/删除，并在反跳窗口（默认）后触发重新索引 `2000毫秒`, 可调通过 `CODEGRAPH_WATCH_DEBOUNCE_MS` ，夹紧到 `[100 毫秒，60 秒]` ）。批量编辑会合并为一次同步。
2. **每个文件的过时横幅。** 在短暂的反跳窗口期间，MCP 工具响应将引用仍待处理的文件，并在前面添加一个 `⚠️` 横幅命名并告诉代理 `读` 直接它。响应面未将待处理文件引用为小页脚。无论哪种方式，代理都会收到一个明确的信号——通过 Claude Code 进行验证，代理在打开文件之前字面意思是“直接读取文件以获取实时内容”。
3. **连接时间赶上。** 当 MCP 服务器（重新）连接时，代码图会快速运行 `（大小、时间）` + 在回答第一个查询之前根据工作树进行内容哈希协调 - 因此在没有 MCP 服务器运行时进行编辑（a `git拉` 从终端进行的编辑、来自另一个编辑器的编辑、退出的上一个代理会话）都会被下一个会话的第一个工具调用所吸收。

```
代理写入 src/Widget.ts
  → 观察者开火 (<100ms)
  → 去抖（默认2s）
  → 同步； Widget.ts 在索引中
  → 下一个代理查询会看到它
```

**随时验证** with `代码图状态` （通过 MCP）或 `代码图状态` （命令行界面）。如果有任何事情待处理，您会看到 `### 待同步：` 命名文件及其编辑年龄的部分。

少数需要手动操作的情况 `codegraph sync` 有道理：观察者被禁用（沙盒环境，或 `CODEGRAPH_NO_DAEMON=1`)，或者您正在代理会话外部针对索引编写脚本，并希望在脚本开始时进行飞行前同步。

→ 全面深入研究 [指南 → 索引项目](https://colbymchenry.github.io/codegraph/guides/indexing/#stay-fresh-automatically).

---

## Framework-aware Routes

CodeGraph 检测 Web 框架路由文件并发出 `路线` 链接的节点 `参考` 其处理程序类或函数的边缘。现在，查询视图/控制器的调用者会显示绑定它的 URL 模式。

| 框架 | 识别的形状 |
| --- | --- |
| **Django** | `小路（）`, `重新路径（）`, `网址（）`, `包括（）` 在 `urls.py` （CBV`.as_view()` ，虚线路径） |
| **烧瓶** | `@app.route('/path', 方法=[...])`, 蓝图路线 |
| **快速API** | `@app.get(...)`, `@路由器.post(...)`, 所有标准方法 |
| **表达** | `应用程序.get(...)`, `路由器.post(...)` 带有中间件链 |
| **NestJS** | `@控制器` + `@获取/@发布/...`, GraphQL `@解析器` + `@查询/@突变`, `@消息模式` / `@EventPattern`, `@订阅消息` |
| **拉维尔** | `路线::get()`, `路线::资源()`, `控制器@动作`, 元组语法 |
| **德鲁帕尔** | `*.路由.yml` 路线（ `_控制器`, `_形式` ，实体处理程序）； `钩_*` 实施于 `。模块` / `。主题` / `。安装` /`.inc` |
| **导轨** | `获取“/x”，至：“users#index”`, 哈希火箭 `=>` 句法 |
| **春天** | `@GetMapping`, `@PostMapping`, `@RequestMapping` 论方法 |
| **杜松子酒 / chi / 大猩猩 / mux** | `r.GET(...)`, `路由器.HandleFunc(...)` |
| **阿克苏姆 / actix / 火箭** | `.route("/x", get(处理程序))` |
| **网络平台** | `[HttpGet("/x")]` 动作方法的属性 |
| **汽** | `app.get(“x”，使用：处理程序)` |
| **反应路由器** / **苗条套件** | 路由组件节点 |

---

## 混合 iOS / React Native / Expo 桥接

真正的 iOS 和 React Native 代码库跨多种语言存在 - Swift 调用者调用自动桥接的 Objective-C 选择器，JS 文件通过 React Native 桥调用本机模块，JSX 组件委托给本机视图管理器。静态树保姆提取在每个语言边界处停止。 CodeGraph 将它们连接起来 `痕迹`, `来电者`, `被调用者` ， 和 `影响` 跨过间隙端到端连接。

| 边界 | JS/Swift 端 | 本机端 | 如何 |
| --- | --- | --- | --- |
| **Swift→ObjC** | 迅速 `obj.foo(酒吧:)` | 对象选择器 `-fooWithBar：` | `@objc` 自动桥接规则（包括 init/property/protocol 形式）+ Cocoa 介词前缀 (`和` / `为了` / `经过` / `在` / `在` / `在` /…) |
| **ObjC → Swift** | 对象C `[obj fooWithBar:]` | Swift `@objc func foo(bar:)` | 反向桥接名字候选人；验证 `@objc` 源头暴露 |
| **React Native 遗留桥** | JS `NativeModules.X.fn(...)` | ObjC `RCT_EXPORT_METHOD` / `RCT_REMAP_METHOD` · Java/Kotlin `@ReactMethod` | 解析宏/注释声明以构建 JS 名称 → 原生方法映射 |
| **React Native TurboModules** | JS `从 './NativeM' 导入 M； M.fn(...)` | 符合 Codegen 规范的本机 impl | 治疗 `本机<X>.ts` 规范接口作为基本事实 |
| **RN 原生 → JS 事件** | JS `new NativeEventEmitter(...).addListener('e', cb)` | ObjC `[self sendEventWithName:@"e" body:...]` · 斯威夫特 `sendEvent(withName: "e", ...)` · Java/Kotlin `.emit("e", ...)` | 由文字事件名称键入的合成跨语言事件通道 |
| **世博模块** | JS `requireNativeModule('X').fn(...)` | 斯威夫特 / 科特林 `模块 { 名称（“X”）; AsyncFunction("fn") { ... } }` | 解析 Expo DSL 文字；合成方法节点通过现有名称匹配进行解析 |
| **结构视图组件** | JSX `<MyView prop={v}/>` | TS Codegen 规范 + 本机 impl 类 | 规格 → `成分` 节点;基于约定的名称+后缀查找（ `看法` / `组件视图` / `经理` / `视图管理器`) 到本地的桥梁 |
| **旧版纸张视图管理器** | JSX `<MyView prop={v}/>` | ObjC `RCT_EXPORT_VIEW_PROPERTY` · Java/Kotlin `@ReactProp` | 与 Fabric 相同 — 纸质时代的声明也产生 `component` + `财产` 节点 |

**在真实代码库上验证** （每座桥小+中+大）：

| 桥 | 小的 | 中等的 | 大的 |
| --- | --- | --- | --- |
| 斯威夫特 ↔ ObjC | [图表](https://github.com/danielgindi/Charts) | [领域快速](https://github.com/realm/realm-swift) | [维基百科-iOS](https://github.com/wikimedia/wikipedia-ios) |
| RN 旧桥 | [异步存储](https://github.com/react-native-async-storage/async-storage) | [反应本机 svg](https://github.com/software-mansion/react-native-svg) | [反应本机 Firebase](https://github.com/invertase/react-native-firebase) |
| RN native → JS events | [RNG定位](https://github.com/Agontuk/react-native-geolocation-service) | — | react-native-firebase |
| Expo Modules | 展览触觉 | 世博相机 | expo SDK扫一扫（7包） |
| 织物/纸张视图 | [反应本机分段控制](https://github.com/react-native-segmented-control/segmented-control) | [反应本机屏幕](https://github.com/software-mansion/react-native-screens) | [反应本机skia](https://github.com/Shopify/react-native-skia) |

每个桥都会发出标记的边缘 `出处：“启发式”` with `元数据.合成者：` 设置为稳定的频道名称（例如 `swift-objc-桥`, `rn 事件通道`, `织物本机实现`, `展览模块提取` ），因此智能体一眼就能看出一跳是如何进入图中的。

---

## 快速入门

### 1.运行安装程序

```
npx @colbymchenry/codegraph
```

安装程序将：

- 询问要配置哪些代理 - 自动检测已安装的代理： **克劳德·科德**, **光标**, **法典 CLI**, **开放代码**, **爱马仕代理**, **双子座命令行界面**, **反重力IDE**, **基罗**
- 提示安装 `codegraph` 在您的 PATH 上（以便代理可以启动 MCP 服务器）
- 询问配置是否适用于您的所有项目还是仅适用于这个项目
- 编写每个选定代理的 MCP 服务器配置（代码图使用指南由 MCP 服务器本身提供，因此不会添加任何说明文件 `CLAUDE.md` / `代理.md` / ETC。）
- 当 Claude Code 是目标之一时设置自动允许权限
- 初始化当前项目（仅限本地安装）

**非交互式（脚本/CI）：**

```
代码图安装--是#自动检测代理，安装全局
codegraph install --target=cursor,claude --yes       #明确的目标清单代码图安装 --target=auto --location=local#检测到的代理，项目本地代码图安装 --print-config codex#打印片段，没有文件写入
```

| 旗帜 | 价值观 | 默认 |
| --- | --- | --- |
| `--target` | `汽车`, `全部`, `没有任何` ，或 csv (`克劳德，光标，...`) | 迅速的 |
| ` - 地点` | `全球的`, `当地的` | prompt |
| `--yes` | （布尔值） | 提示每一步 |
| `--无权限` | （布尔值）跳过 Claude 自动允许列表 | 的权限 |
| `--print-config <id>` | 转储一个代理的片段并退出 | — |

### 2\. 重新启动代理

重新启动代理（Claude Code / Cursor / Codex CLI / opencode / Hermes Agent / Gemini CLI / Antigravity IDE / Kiro）以加载 MCP 服务器。

### 3\. 初始化项目

```
cd your-project
codegraph init -i
```

构建每个项目的知识图谱索引。单一全球 `代码图安装` 适用于您打开的每个项目 - 无需为每个项目重新运行安装程序。

就是这样 - 当出现以下情况时，您的代理将自动使用 CodeGraph 工具：`.codegraph/` 目录存在。

**手动设置（替代）**

**全局安装：**

```
npm install -g @colbymchenry/codegraph
```

**添加 `〜/.claude.json`:**

```
{
  “mcp服务器”: {
    “代码图”: {
      “类型”: "标准输入输出",
      “命令”: "codegraph",
      “参数”: ["服务", "--mcp"]
    }
  }
}
```

**Add to `〜/.claude/settings.json` （可选，用于自动允许）：**

```
{
  “权限”: {
    “允许”: [
      "mcp__codegraph__codegraph_search",
      "mcp__codegraph__codegraph_context",
      "mcp__codegraph__codegraph_callers",
      "mcp__codegraph__codegraph_callees",
      "mcp__codegraph__codegraph_impact",
      "mcp__codegraph__codegraph_node",
      "mcp__codegraph__codegraph_status",
      "mcp__codegraph__codegraph_files"
    ]
  }
}
```
**代理工具指导**

CodeGraph 的 MCP 服务器向您的代理提供使用指南 **自动地** ，在MCP中 `初始化` 响应 - 没有要管理的说明文件，并且没有任何内容添加到您的 `CLAUDE.md` / `AGENTS.md` / `GEMINI.md` 。简而言之，它告诉代理：

- **使用 CodeGraph 直接回答结构问题** - 它 *是* 预构建的索引，因此 grep/read 循环只是重复它已经完成的工作。将返回的源视为已读。
- **按意图选择工具：** `codegraph_context` 绘制一个区域的地图， `代码图跟踪` 对于“X如何到达Y”， `codegraph_explore` 调查几个符号， `代码图搜索` 寻找一个符号， `代码图调用者` / `代码图_被调用者` 走呼叫流程， `代码图影响` 在编辑之前， `代码图节点` 对于一个符号的来源。
- **相信结果——不要用 grep 重新验证** ，并在编辑后检查过时横幅。
- 如果`.codegraph/` 尚不存在，建议运行 `代码图初始化 -i`.

确切的文字是 `src/mcp/服务器指令.ts` ——唯一的事实来源。

---

## 它是如何运作的

```
┌──────────────────────────────────────────────────────────────────┐
│ 克劳德·代码 │
│ │
│ “请求如何到达数据库？”                        │
│ 直接调用 CodeGraph 工具 — 无 Explore 子代理 │
│ │ │
└──────────────────────────────────┬──────────────────────────────────┘
                                  │
                                  ▼
┌──────────────────────────────────────────────────────────────────┐
│ CodeGraph MCP 服务器 │
│ │
│ 上下文 · 追踪 · 探索 · 调用者 · 被调用者 · 影响 │
│ │ │
│ ▼ │
│ SQLite知识图谱 │
│ 符号·边·文件·FTS5全文检索│
└──────────────────────────────────────────────────────────────────┘
```

1. **萃取** — [树保姆](https://tree-sitter.github.io/) 将源代码解析为 AST。特定于语言的查询提取节点（函数、类、方法）和边（调用、导入、扩展、实现）。
2. **贮存** — 一切都进入本地 SQLite 数据库（`.codegraph/codegraph.db` ）使用 FTS5 全文搜索。
3. **解决** — 提取后，引用被解析：函数调用→定义、导入→源文件、类继承和特定于框架的模式。
4. **自动同步** — MCP 服务器使用本机操作系统文件事件监视您的项目。更改将被反跳（2 秒安静窗口）、仅过滤到源文件并增量同步。当您编码时，图表保持新鲜——无需配置。

---

## CLI 参考

```
codegraph                         #运行交互式安装程序
codegraph install                 #运行安装程序（显式）
codegraph uninstall               #从代理中删除 CodeGraph（与安装相反）代码图初始化 [路径]#在项目中初始化（--index 也索引）代码图 uninit [路径]#从项目中删除 CodeGraph（--强制跳过提示）代码图索引 [路径]#完整索引（--强制重新索引，--quiet 减少输出）代码图同步[路径]#增量更新代码图状态[路径]#显示统计数据代码图查询<搜索>          #搜索符号（--kind、--limit、--json）代码图文件 [路径]#显示文件结构（--format、--filter、--max-深度、--json）代码图上下文<任务>          #为 AI 构建上下文（--format、--max-nodes）代码图调用者<象征>        #查找调用函数/方法的内容（--limit、--json）代码图被调用者<symbol>        #查找函数/方法调用的内容（--limit、--json）代码图影响<symbol>         #分析更改符号会影响哪些代码（--深度，--json）代码图受影响[文件...]#查找受更改影响的测试文件（见下文）
codegraph serve --mcp             #启动MCP服务器
```

### 受影响的代码图

间接跟踪导入依赖项以查找哪些测试文件受到更改的源文件的影响。

```
代码图影响 src/utils.ts src/api.ts#将文件作为参数传递git diff --仅名称|受影响的代码图--stdin#来自 git diff 的管道代码图影响 src/auth.ts --filter"电子到电子/*"     #自定义测试文件模式
```

| 选项 | 描述 | Default |
| --- | --- | --- |
| `--标准输入` | 从 stdin 读取文件列表 | `错误的` |
| `-d, --深度 <n>` | 最大依赖遍历深度 | `5` |
| `-f, --filter <全局>` | 自定义 glob 来识别测试文件 | 自动检测 |
| `-j，--json` | 输出为 JSON | `false` |
| `-q，--安静` | 仅输出文件路径 | `false` |

**CI/钩子示例：**

```
#!/usr/bin/env bash受影响=$(git diff --仅名称 HEAD|受影响的代码图 --stdin --quiet)
如果 [ -n "$受影响" ]; thennpx vitest 运行$AFFECTED
菲
```

---

## MCP 工具

当作为 MCP 服务器运行时，CodeGraph 向 Claude Code 公开这些工具：

| 工具 | 目的 |
| --- | --- |
| `codegraph_search` | 在代码库中按名称查找符号 |
| `codegraph_context` | 为任务构建相关代码上下文 |
| `codegraph_trace` | 在一次调用中跟踪两个符号之间的调用路径（“X 如何到达 Y”）——每个跳跃的主体内联，遵循 grep 无法做到的动态调度跳跃（回调、React 重新渲染、接口→impl） |
| `codegraph_callers` | 查找调用函数的内容 |
| `codegraph_callees` | 查找函数调用的内容 |
| `codegraph_impact` | 分析更改符号会影响哪些代码 |
| `codegraph_node` | 获取有关特定符号的详细信息（可以选择源代码） |
| `codegraph_explore` | 在一次调用中返回按文件分组的多个相关符号的源以及关系图 |
| `代码图文件` | 获取索引文件结构（比文件系统扫描更快） |
| `codegraph_status` | 检查索引健康状况和统计信息 |

---

## 库的使用

```
进口 CodeGraph 从 '@colbymchenry/代码图';

常量 CG = 等待 CodeGraph.初始化('/路径/到/项目');
// 或者： const cg = wait CodeGraph.open('/path/to/project');

await cg.全部索引({
  进度: (p) => 安慰.日志(\`${p.阶段}: ${p.当前的}/${p.全部的}\`)
});

const 结果 = cg.搜索节点(“用户服务”);
const callers = cg.获取来电者(results[0].节点.ID);
const 语境 = await cg.构建上下文(“修复登录错误”, { 最大节点数: 20, 包含代码: 真的, 格式: “降价” });
const impact = cg.获取影响半径(results[0].node.id, 2);

cg.手表();   // 文件更改时自动同步
cg.取消观看(); // 停止观看
cg.关闭();
```

---

## 配置

没有任何 — CodeGraph 是零配置的， **没有配置文件** 写或 保持同步。语言支持是从文件扩展名自动获得的；有 每种语言无需连接。

它直接跳过的内容：

- **依赖项、构建和缓存目录** — `节点模块`, `小贩`, `距离`, `建造`, `目标`, `.venv`, `豆荚`, `。下一个` ，以及类似的每一个 [支持的堆栈](#supported-languages) ——所以图表是你的代码，而不是 第三方噪音。即使没有`.gitignore`.
- **你的任何东西`.gitignore`** — 通过 git 在 git repos 中获得荣誉，并在 非 git 项目通过阅读`.gitignore` 直接（根和嵌套）。
- **大于 1 MB 的文件** — 生成的包、缩小的 JS、供应的 blob。

要保留其他内容，请将其添加到`.gitignore` 。拉取默认排除的 目录返回 **in** （假设您确实希望对供应商的依赖项进行索引）， 添加一个否定—— `！小贩/` 。默认值统一应用，因此提交 依赖项或构建目录不会强制将其放入图表中；这`.gitignore` 否定是明确的选择加入。

## 支持的平台

每个版本都会提供一个独立的构建（捆绑 Node 运行时 — 无需 编译）适用于所有三种桌面操作系统，在 Intel/AMD (x64) 和 ARM (arm64) 上：

| 平台 | 架构 | 安装 |
| --- | --- | --- |
| 视窗 | x64、arm64 | PowerShell 安装程序或 npm |
| macOS | x64, arm64 | shell 安装程序或 npm |
| Linux | x64, arm64 | shell installer or npm |

看 [Get Started](#get-started) 对于单行安装命令。

## 支持的代理

交互式安装程序会自动检测并配置其中每一个 - 连接 MCP 服务器（它提供自己的使用指南，因此没有说明文件 被写）：

- **Claude Code**
- **Cursor**
- **Codex CLI**
- **opencode**
- **Hermes Agent**
- **Gemini CLI**
- **Antigravity IDE**
- **Kiro**

## 支持的语言

| Language | 扩大 | 地位 |
| --- | --- | --- |
| 打字稿 | `.ts`, `.tsx` | 全力支持 |
| JavaScript | `.js`, `.jsx`, `.mjs` | Full support |
| Python | `.py` | Full support |
| 去 | `。去` | Full support |
| 锈 | `.rs` | Full support |
| 爪哇 | `.java` | Full support |
| C# | `。CS` | Full support |
| PHP | `.php` | Full support |
| 红宝石 | `.rb` | Full support |
| C | `.c`, `.h` | Full support |
| C++ | `.cpp`, `.hpp`, `.cc` | Full support |
| Objective-C | `.米`, `。毫米`, `.h` | 部分支持（类、协议、方法、 `@财产`, `＃进口` ，消息发送；`.mm` ObjC++ 可能解析不完整） |
| Swift | `。迅速` | Full support |
| 科特林 | `.kt`, `.kts` | Full support |
| 斯卡拉 | `.scala`, `.sc` | 完全支持（类、特征、方法、类型别名、Scala 3 枚举） |
| 镖 | `。镖` | Full support |
| 斯韦尔特 | `.svelte` | 全面支持（脚本提取、Svelte 5 符文、SvelteKit 路线） |
| 维埃 | `.vue` | 全面支持（脚本+脚本设置提取、Nuxt页面/API/中间件路由） |
| 液体 | `。液体` | Full support |
| 帕斯卡/德尔福 | `.pas`, `.dpr`, `.dpk`, `.lpr` | 全面支持（类、记录、接口、枚举、DFM/FMX 表单文件） |
| 卢阿 | `.lua` | 完全支持（函数、带有接收器的方法、局部变量、 `要求` 导入、调用边） |
| 卢奥宴会 | `.luau` | 完全支持（Lua 中的一切，加上 `类型` / `出口类型` 别名、键入的签名和 Roblox 实例路径 `require`) |

## 故障排除

**“CodeGraph 未初始化”** - 跑步 `codegraph init` 首先在您的项目目录中。

**索引速度慢** — 检查一下 `node_modules` 和其他大目录被排除。使用 ` - 安静的` 以减少输出开销。

**MCP 热门歌曲 `数据库被锁定`** — 当前版本不应该：CodeGraph 捆绑自己的 Node 运行时并使用 Node 的内置 `节点：sqlite` 在 WAL 模式下，并发读取永远不会阻塞写入器。如果您仍然看到它：

- **您使用的是旧版（0.9 之前的版本）安装。** 重新安装以获取捆绑的运行时 — `卷曲-fsSL https://raw.githubusercontent.com/colbymchenry/codegraph/main/install.sh |嘘` （macOS/Linux）， `irm https://raw.githubusercontent.com/colbymchenry/codegraph/main/install.ps1 |埃克斯` （Windows），或 `npm i -g @colbymchenry/codegraph@latest`.
- **`codegraph status` 节目 `杂志：` 以外 `沃尔`** — 无法在此文件系统上启用 WAL（常见于网络共享和 WSL2 `/mnt` ），因此读取可能会阻塞写入。移动项目（及其`.codegraph/` 文件夹）到本地磁盘。

**MCP 服务器未连接** — 确保项目已初始化/索引，验证 MCP 配置中的路径，并检查 `codegraph serve --mcp` 从命令行工作。

**缺少符号** — MCP 服务器在保存时自动同步（等待几秒钟）。跑步 `codegraph sync` 如果需要手动。检查文件的语言是否受支持并且不在文件内`.gitignore` d 或默认排除的目录（例如 `node_modules`, `dist`).

## 明星历史

[

![Star History Chart](https://camo.githubusercontent.com/7bc71305736540352a8bc493d1cac5516dae48cf8f2346075757bfeaefe0e708/68747470733a2f2f6170692e737461722d686973746f72792e636f6d2f63686172743f7265706f733d636f6c62796d6368656e72792f636f6465677261706826747970653d64617465266c6567656e643d746f702d6c656674)

](https://www.star-history.com/?repos=colbymchenry%2Fcodegraph&type=date&legend=top-left)

## License

麻省理工学院

---

**专为 AI 编码代理而设计 — Claude Code、Cursor、Codex CLI、opencode、Hermes Agent、Gemini CLI、Antigravity IDE 和 Kiro**

[报告错误](https://github.com/colbymchenry/codegraph/issues) · [请求功能](https://github.com/colbymchenry/codegraph/issues)