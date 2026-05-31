# 20260329claudecode

```bash
/compact remember we're building a unique musicalinterpretation of DNA andcompleted 1st version of the app with night mode
```

### 开启记忆
```bash
/memory
```

### claudecode 汉化
```bash
https://github.com/skyconnfig/cute-claude-hooks
```

### 无需权限执行，跳过认证直接一路执行
```bash
claude --dangerously-skip-permissions
```

```bash
我是想在claudecode里面全局安装https://github.com/Panniantong/Agent-Reach.git
```

### 继续上次对话
```bash
claude --continue
```

### 插件地址
```bash
https://github.com/yeachan-heo/oh-my-claudecode
https://github.com/obra/superpowers
https://github.com/affaan-m/everything-claude-code.git
https://github.com/gsd-build/get-shit-done.git
https://github.com/ruvnet/ruflo.git
https://github.com/vercel-labs/agent-browser
https://github.com/garrytan/gstack
https://github.com/shanraisshan/claude-code-best-practice
帮我安装 Agent Reach：https://raw.githubusercontent.com/Panniantong/agent-reach/main/docs/install.md
```

### mcp
```bash
https://github.com/ChromeDevTools/chrome-devtools-mcp
https://github.com/upstash/context7.git

```

### skill
```bash
https://github.com/remotion-dev/skills
https://github.com/VoltAgent/awesome-design-md
```

### 插件市场
```bash
/plugin marketplace add Piebald-AI/claude-code-lsps
```

```bash
i键安装插件
```

```bash
据 CC-Panes 项目的架构和可用的 64 个技能，以下是如何高效利用这些技能进行开发的完整指南。
                                                                                                                 
  技能分类与用途
                                                                                                                   1. ccbook 项目专用技能（CC-Panes 工作流）                                                                      
                                                                                                                 
  - ccbook:spec - Spec 驱动开发，用于需求分析、功能规划                                                          
  - ccbook:parallel - 多 Agent 并行编排，适合大型重构或模块开发                                                  
  - ccbook:check-backend/ccbook:check-frontend - 检查代码是否符合 Rust/TS 开发规范                               
  - ccbook:check-tauri-bridge - Tauri IPC 桥接一致性检查（Rust↔TS）                                              
  - ccbook:check-cross-layer - 跨层架构一致性检查                                                                
  - ccbook:finish-work - 提交前检查清单（测试、lint、构建验证）                                                  
  - ccbook:workspace - 工作空间管理（多项目切换）                                                                
  - ccbook:launch-task - 在指定项目中启动 Claude Code 任务
  - ccbook:cleanup-processes - 清理僵尸进程（终端残留）
  - ccbook:onboard - 新成员引导（项目架构介绍）
  - ccbook:start - 启动 CC-Panes 开发会话

  2. 通用开发技能（适用于任何项目）

  - autoplan - 自动规划流水线（CEO/设计/工程评审）
  - review - PR 预审（SQL 安全、依赖、性能）
  - qa/qa-only - 系统化 QA 测试与修复
  - investigate - 系统化调试（根因分析）
  - land-and-deploy/ship - 部署工作流
  - retro - 周度工程回顾
  - learn - 项目管理学习
  - design-* 系列 - 设计咨询、评审、HTML 实现

  3. Agent Teams 插件技能

  - agent-teams:team-* - 并行团队协作（调试、审查、功能开发）
  - multi-reviewer-patterns - 多维度并行代码审查
  - parallel-feature-development - 并行功能开发（文件所有权策略）
  - parallel-debugging - 竞争假设并行调试
  - team-composition-patterns - 团队组成模式

  4. JavaScript/TypeScript 插件技能

  - modern-javascript-patterns - ES6+ 模式（React Hooks、异步）
  - typescript-advanced-types - TS 高级类型系统
  - nodejs-backend-patterns - Node.js 后端服务
  - javascript-testing-patterns - Jest/Vitest 测试策略

  5. Plugin Eval 技能

  - evaluation-methodology - 插件质量评估方法论

  CC-Panes 开发工作流示例

  阶段 1：需求分析与规划

  # 1. Spec 驱动开发
  /ccbook:spec "实现焦点模式（Focus Mode）功能"

  # 2. 自动规划流水线（CEO+设计+工程评审）
  /autoplan

  阶段 2：并行实现

  # 1. 启动并行开发团队（后端 + 前端 + 桥接）
  /agent-teams:team-feature "实现 Focus Mode"

  # 2. 或者使用 ccbook 并行编排
  /ccbook:parallel "后端焦点服务、前端焦点组件、IPC命令"

  # 3. 开发过程中随时检查规范
  /ccbook:check-backend   # 检查 Rust 代码
  /ccbook:check-frontend  # 检查 React/TS 代码
  /ccbook:check-tauri-bridge  # 检查命令-服务类型同步

  阶段 3：代码审查与测试

  # 1. 多维度并行代码审查
  /agent-teams:team-review

  # 2. 或者使用通用 review 技能
  /review

  # 3. 系统化 QA 测试
  /qa

  阶段 4：集成与部署

  # 1. 跨层一致性检查
  /ccbook:check-cross-layer

  # 2. 提交前检查清单
  /ccbook:finish-work

  # 3. 部署工作流
  /land-and-deploy

  关键技能组合策略

  1. Tauri 全栈开发

  - 后端（Rust）：ccbook:check-backend + implement agent
  - 前端（React）：ccbook:check-frontend + javascript-typescript:modern-javascript-patterns
  - 桥接（IPC）：ccbook:check-tauri-bridge + tauri-reviewer agent

  2. 大规模重构

  - ccbook:parallel + agent-teams:team-feature + review

  3. 复杂调试

  - investigate + agent-teams:parallel-debugging + ccbook:cleanup-processes

  4. 设计迭代

  - design-shotgun → design-review → design-html

  实际场景示例

  场景：添加「焦点模式」功能

  1. 启动开发会话
  /ccbook:start
  2. Spec 分析与规划
  /ccbook:spec "焦点模式：25分钟专注计时器，支持暂停/继续，完成后休息5分钟"
  3. 并行实现
  # 方案A：使用 agent teams
  /agent-teams:team-spawn feature focus-mode

  # 方案B：使用 ccbook 编排
  /ccbook:parallel "focus_service.rs, FocusTimer.tsx, focus_commands.rs"
  4. 实时规范检查
  # 每完成一个文件就检查
  /ccbook:check-backend src-tauri/src/services/focus_service.rs
  /ccbook:check-frontend web/components/focus/FocusTimer.tsx
  /ccbook:check-tauri-bridge
  5. 集成测试
  /qa
  /ccbook:check-cross-layer
  6. 提交前验证
  /ccbook:finish-work

  技能调用方式

  直接调用

  /技能名称 [参数]

  通过 OMC 委托

  # 复杂任务委托给专业 agent
  /oh-my-claudecode:autopilot "实现焦点模式"

  关键词触发

  - "autopilot" → 自动触发 autopilot 工作流
  - "ralph" → 触发 Ralph 工作流（深度重构）
  - "ulw" → 触发 Ultrawork 模式（高强度专注）
  - "team" → 触发团队协作模式

  最佳实践

  1. 小步快跑：每完成一个组件就运行 ccbook:check-* 验证
  2. 并行优化：UI 交互、后端逻辑、类型定义可并行开发
  3. 桥接优先：先定义 Tauri IPC 接口，确保 Rust↔TS 类型同步
  4. 测试驱动：/qa 早期介入，避免后期大规模返工
  5. 文档同步：使用 document-release 技能更新文档

  故障排除

  - 技能未生效：检查 .claude/settings.json 插件启用状态
  - 代理冲突：使用 ccbook:cleanup-processes 清理残留
  - 类型不一致：立即运行 ccbook:check-tauri-bridge
  - 性能问题：使用 benchmark 技能检测性能回归

  ---
  下一步建议：根据你当前修改的文件（git status 显示有 focus 相关文件），可以尝试运行 /ccbook:check-cross-layer   
  验证焦点模式实现的一致性。
```

```plain
{
  "env": {
    "ANTHROPIC_AUTH_TOKEN": "sk-sp-c7c87750e3764563988c02747cda3155",
    "ANTHROPIC_BASE_URL": "https://coding.dashscope.aliyuncs.com/apps/anthropic",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "qwen3-coder-plus",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "qwen3-coder-plus",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "qwen3-coder-plus",
    "ANTHROPIC_MODEL": "qwen3-coder-plus"
  },
  "includeCoAuthoredBy": false
}
```



> 更新: 2026-04-20 09:50:11  
> 原文: <https://www.yuque.com/lixinsi/yh04az/zfdr2gd0442qhstf>