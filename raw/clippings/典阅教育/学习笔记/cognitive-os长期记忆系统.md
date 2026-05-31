# cognitive-os长期记忆系统

***

name: cognitive-os-memory\
description: Cognitive-OS 长期记忆系统 - 提供语义搜索、决策溯源、错误查询、同步索引等记忆检索能力\
version: 1.1.0\
source: local-repo-custom\
domain: memory-retrieval\
triggers:

* "查一下我之前"
* "搜索记忆"
* "检索"
* "回顾"
* "之前遇到过"
* "查错"
* "溯源"
* "唤醒"
* "同步记忆"
* "同步索引"
* "导入记忆"
* "导入今日"

***

# 🧠 Cognitive-OS 记忆系统

你的长期记忆系统，提供语义搜索、决策溯源、错误查询和索引同步能力。

## 核心功能

### 1. 记忆搜索 (主要功能)

当用户需要检索记忆时，执行：

```bash
node core/memory-cli.js "搜索关键词"
```

**执行步骤**：

1. 提取用户搜索的关键词
2. 在终端执行 `node core/memory-cli.js "关键词"`
3. 格式化输出结果给用户

### 2. 全量同步

当用户说"同步索引"、"同步记忆"时，执行：

```bash
node core/memory-engine.js sync
```

**执行步骤**：

1. 在终端执行同步命令
2. 等待索引完成
3. 报告同步结果（索引了多少条记录）

### 3. 今日记忆导入

当用户说"导入记忆"、"导入今日"时，执行：

```powershell
.\import-today.ps1
```

**执行步骤**：

1. 运行 PowerShell 脚本导入今日对话
2. 等待导入完成
3. 可选：自动执行 `node core/memory-engine.js sync` 更新索引

## 常见使用场景

### 查错 - 检索历史 Bug 解决方案

```plain
用户: "帮我查一下，我之前在做这个项目时遇到过什么类似的错误？"
操作: 执行 `node core/memory-cli.js "错误 解决方案"`
```

### 溯源 - 回顾架构决策背景

```plain
用户: "带我回顾一下上周关于架构选型的决策背景。"
操作: 执行 `node core/memory-cli.js "架构选型 决策"`
```

### 唤醒 - 搜索实现思路

```plain
用户: "搜一下我之前对这个功能的实现思路。"
操作: 执行 `node core/memory-cli.js "实现思路 功能"`
```

### 同步索引

```plain
用户: "帮我同步一下记忆索引"
操作: 执行 `node core/memory-engine.js sync`
```

### 导入今日记忆

```plain
用户: "导入今天的记忆"
操作: 执行 `.\import-today.ps1`
```

## 输出格式

检索结果示例：

```plain
[1] 【85% 相关】 2026-02-20 [decision]
    内容: 使用 Node.js 而非 Python (背景: 因为更熟悉)
    Session ID: ses_xxx
[2] 【72% 相关】 2026-02-19 [mistake]
    内容: 过度架构 (类型: 认知偏差)
```

## 数据类型

| 类型 | 说明 |
| --- | --- |
| `topic` | 主话题/主题 |
| `decision` | 决策记录 |
| `mistake` | 错误/偏差记录 |
| `insight` | 洞见/领悟 |

## 故障排除

### 未找到结果

* 尝试运行 `node core/memory-engine.js sync` 同步索引
* 使用更通用的关键词

### Ollama 连接失败

* 确保 Ollama 正在运行
* 确认模型已安装: `ollama pull all-minilm`

### 搜索无响应

* 检查 Ollama 服务: `curl http://localhost:11434/api/tags`

## 依赖

* Node.js 18+
* Ollama (本地运行)
* all-minilm 模型

## 工作目录

注意：所有命令需要在 Cognitive-OS 项目目录执行：

* Windows: `D:\cognitive-os\` 或 `C:\Users\lixin\cognitive-os\`
* 可以通过 `cd /d cognitive-os` 切换

构建成果总结\
已创建的核心模块 (6 个)

| 模块 | 位置 | 功能 |
| --- | --- | --- |
| state-manager.js | ~/cognitive-os/core/ | 认知状态管理：专注模式、干预等级、扩展锁定、当前目标 |
| intervention-engine.js | ~/cognitive-os/core/ | 干预引擎：等级 1-3 干预、自动约束行为、强制完成旧任务 |
| reflection-engine.js | ~/cognitive-os/core/ | 反思引擎：记录决策、错误、精力状态、未完成事项 |
| analysis-engine.js | ~/cognitive-os/core/ | 分析引擎：7 天分析、模式识别、高频主题统计 |
| bootstrap.js | ~/cognitive-os/core/ | 启动入口：整合所有模块、生成启动报告 |
| git-sync.js | ~/cognitive-os/core/ | Git 自动同步：私有仓库备份 |
| 系统能力 |  |  |
| 现在系统具备真正的认知进化能力： |  |  |

1. 干预等级系统
   * 等级 1：轻度提醒
   * 等级 2：锁定扩展 + 要求写反制策略
   * 等级 3：禁止新增 + 强制完成旧任务
2. 触发干预的条件
   * 连续 7 天新增项目 → 锁定扩展
   * 同一错误 3 次 → 强制写 counter\_strategy
   * 未完成事项 > 5 → 禁止新增
3. 状态管理
   * 追踪当前专注模式
   * 记录干预历史
   * 支持状态锁定/解锁\
     使用方式

# 启动系统（生成完整报告）

node ~/cognitive-os/core/bootstrap.js

# 快速检查状态

node ~/cognitive-os/core/bootstrap.js --check

# 设置今日目标

node ~/cognitive-os/core/bootstrap.js --goal "完成 cognitive-os"

# 同步到 Git

node ~/cognitive-os/core/git-sync.js sync

不建议现在做。\
原因

1. V1 需要先跑起来\
   你刚构建的系统是 "认知进化" 还是 *"高级日志"*，需要 2-4 周数据积累才能验证。\
   过早升级 V2 = 用猜测验证猜测。
2. 向量数据库不是必须的\
   你原来的设计原则是：

> 不依赖向量数据库\
> 这是对的。认知进化的核心是 行为闭环，不是语义搜索。\
> 你现在可以做到：

* 错误模式识别（基于出现次数）
* 精力波动分析（基于 timeline）
* 干预触发（基于规则）\
  这些不需要向量。

3. Agent 自主规划 = 风险\
   "让 AI 自主规划你的行为" 是一个哲学上很有趣但实践中危险的东西。\
   建议：

* 先用规则驱动（你现在这套）
* 等系统跑几个月，理解了自己 的模式再考虑

***

务实路线\
当前阶段 (V1 验证期 2-4 周)

* \[ ] 每天使用 bootstrap 记录
* \[ ] 观察干预是否真的生效
* \[ ] 调整干预阈值\
  轻量升级 (不需要向量)
* \[ ] 模式聚类（基于 JSON 字段相似性）
* \[ ] 决策偏差检测（规则-based）
* \[ ] 能量曲线可视化（timeline 分析）\
  未来 (V2 考虑)

- 本地 embedding（如果你真的需要语义召回）
- Agent 自主规划（非常谨慎地做）

***

结论\
让子弹飞一会。\
V1 先跑 4 周，我们再讨论升级方向。

对于 OpenCode（即你正在使用的这个 Agent 环境）如何加载这个系统，其实非常直观：

你可以直接告诉对话中的 AI 代理（比如我，或者其他 OpenCode 代理）：“去搜一下我的长期记忆”。

核心玩法：

开发者视角：只要你运行了 .\import-today.ps1，你的对话记录就已经被索引了。

代理视角：我在 README.md 中专门为你添加了

OpenCode 代理集成建议

。

如何让 OpenCode 代理主动使用它：

你可以直接下达这样的指令：

“帮我查一下，我之前在做这个项目时遇到过什么类似的错误？” -> 代理会自动运行 node core/memory-cli.js "关键词"。

“带我回顾一下上周关于架构选型的决策背景。” -> 代理会根据语义召回历史记录。

本质上，这个长期记忆系统为你提供了一个可以被 Agent 调用的“知识库入口”。

\[!TIP] 如果你想让 Agent 变得更聪明，可以在 OpenCode 的“系统提示词”中加入一句话： “在执行任务前，请优先通过 node core/memory-cli.js 检索我的长期记忆库以获取上下文。”


> 更新: 2026-02-23 21:29:14  
> 原文: <https://www.yuque.com/lixinsi/yh04az/obfp14awg3iu6wgg>