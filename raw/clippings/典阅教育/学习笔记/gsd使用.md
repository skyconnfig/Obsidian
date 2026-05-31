# gsd使用

### 更新 gsd，github 地址：<https://github.com/gsd-build/get-shit-done>

```sql
npx get-shit-done-cc@latest
```

## <font style="color:rgb(31, 35, 40);">我为什么做这个</font>

<font style="color:rgb(31, 35, 40);">我是独立开发者。我不写代码，Claude Code 写。</font>

<font style="color:rgb(31, 35, 40);">市面上已经有其他规格驱动开发工具，比如 BMAD、Speckit……但它们要么把事情搞得比必要的复杂得多了些（冲刺仪式、故事点、利益相关方同步、复盘、Jira 流程），要么根本缺少对你到底在构建什么的整体理解。我不是一家 50 人的软件公司。我不想演企业流程。我只是个想把好东西真正做出来的创作者。</font>

<font style="color:rgb(31, 35, 40);">所以我做了 GSD。复杂性在系统内部，不在你的工作流里。幕后是上下文工程、XML 提示格式、子代理编排、状态管理；你看到的是几个真能工作的命令。</font>

<font style="color:rgb(31, 35, 40);">这套系统会把 Claude 完成工作</font><font style="color:rgb(31, 35, 40);"> </font>*<font style="color:rgb(31, 35, 40);">以及</font>*<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">验证结果所需的一切上下文都准备好。我信任这个工作流，因为它确实能把事情做好。</font>

<font style="color:rgb(31, 35, 40);">这就是它。没有企业角色扮演式的废话，只有一套非常有效、能让你持续用 Claude Code 构建酷东西的系统。</font>

<font style="color:rgb(31, 35, 40);">—</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">TÂCHES</font>**

***

<font style="color:rgb(31, 35, 40);">Vibecoding 的名声不算好。你描述需求，AI 生成代码，结果往往是质量不稳定、规模一上来就散架的垃圾。</font>

<font style="color:rgb(31, 35, 40);">GSD 解决的就是这个问题。它是让 Claude Code 变得可靠的上下文工程层。你只要描述想法，系统会自动提取它需要知道的一切，然后让 Claude Code 去干活。</font>

***

## <font style="color:rgb(31, 35, 40);">适合谁用</font>

<font style="color:rgb(31, 35, 40);">适合那些想把自己的需求说明白，然后让系统正确构建出来的人，而不是假装自己在运营一个 50 人工程组织的人。</font>

***

## <font style="color:rgb(31, 35, 40);">快速开始</font>

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">npx get-shit-done-cc@latest</font>

<font style="color:rgb(31, 35, 40);">安装器会提示你选择：</font>

1. **<font style="color:rgb(31, 35, 40);">运行时</font>**<font style="color:rgb(31, 35, 40);">：Claude Code、OpenCode、Gemini、Codex，或全部</font>
2. **<font style="color:rgb(31, 35, 40);">安装位置</font>**<font style="color:rgb(31, 35, 40);">：全局（所有项目）或本地（仅当前项目）</font>

<font style="color:rgb(31, 35, 40);">安装后可这样验证：</font>

* <font style="color:rgb(31, 35, 40);">Claude Code / Gemini：</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:help</font></code>
* <font style="color:rgb(31, 35, 40);">OpenCode：</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd-help</font></code>
* <font style="color:rgb(31, 35, 40);">Codex：</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">$gsd-help</font></code>

**<font style="color:rgb(9, 105, 218);">Note</font>**

<font style="color:rgb(31, 35, 40);">Codex 安装走的是 skill 机制（</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">skills/gsd-*/SKILL.md</font></code><font style="color:rgb(31, 35, 40);">），不是自定义 prompt。</font>

### <font style="color:rgb(31, 35, 40);">保持更新</font>

<font style="color:rgb(31, 35, 40);">GSD 迭代很快，建议定期更新：</font>

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">npx get-shit-done-cc@latest</font>

**<font style="color:rgb(31, 35, 40);">非交互式安装（Docker、CI、脚本）</font>**

```plain
# Claude Code
npx get-shit-done-cc --claude --global   # 安装到 ~/.claude/
npx get-shit-done-cc --claude --local    # 安装到 ./.claude/

# OpenCode（开源，可用免费模型）
npx get-shit-done-cc --opencode --global # 安装到 ~/.config/opencode/

# Gemini CLI
npx get-shit-done-cc --gemini --global   # 安装到 ~/.gemini/

# Codex（以 skills 为主）
npx get-shit-done-cc --codex --global    # 安装到 ~/.codex/
npx get-shit-done-cc --codex --local     # 安装到 ./.codex/

# 所有运行时
npx get-shit-done-cc --all --global      # 安装到所有目录
```

<font style="color:rgb(31, 35, 40);">使用</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">--global</font></code><font style="color:rgb(31, 35, 40);">（</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">-g</font></code><font style="color:rgb(31, 35, 40);">）或</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">--local</font></code><font style="color:rgb(31, 35, 40);">（</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">-l</font></code><font style="color:rgb(31, 35, 40);">）可以跳过安装位置提示。 使用</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">--claude</font></code><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">--opencode</font></code><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">--gemini</font></code><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">--codex</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">或</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">--all</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">可以跳过运行时提示。</font>

**<font style="color:rgb(31, 35, 40);">开发安装</font>**

<font style="color:rgb(31, 35, 40);">克隆仓库并在本地运行安装器：</font>

```plain
git clone https://github.com/glittercowboy/get-shit-done.git
cd get-shit-done
node bin/install.js --claude --local
```

<font style="color:rgb(31, 35, 40);">这样会安装到</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">./.claude/</font></code><font style="color:rgb(31, 35, 40);">，方便你在贡献代码前测试自己的改动。</font>

### <font style="color:rgb(31, 35, 40);">推荐：跳过权限确认模式</font>

<font style="color:rgb(31, 35, 40);">GSD 的设计目标是无摩擦自动化。运行 Claude Code 时建议使用：</font>

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">claude --dangerously-skip-permissions</font>

**<font style="color:rgb(26, 127, 55);">Tip</font>**

<font style="color:rgb(31, 35, 40);">这才是 GSD 的预期用法。连</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">date</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">和</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">git commit</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">都要来回确认 50 次，整个体验就废了。</font>

**<font style="color:rgb(31, 35, 40);">替代方案：细粒度权限</font>**

<font style="color:rgb(31, 35, 40);">如果你不想使用这个 flag，可以在项目的</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.claude/settings.json</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">中加入：</font>

```plain
{
  "permissions": {
    "allow": [
      "Bash(date:*)",
      "Bash(echo:*)",
      "Bash(cat:*)",
      "Bash(ls:*)",
      "Bash(mkdir:*)",
      "Bash(wc:*)",
      "Bash(head:*)",
      "Bash(tail:*)",
      "Bash(sort:*)",
      "Bash(grep:*)",
      "Bash(tr:*)",
      "Bash(git add:*)",
      "Bash(git commit:*)",
      "Bash(git status:*)",
      "Bash(git log:*)",
      "Bash(git diff:*)",
      "Bash(git tag:*)"
    ]
  }
}
```

***

## <font style="color:rgb(31, 35, 40);">它是怎么工作的</font>

**<font style="color:rgb(89, 99, 110);">已经有现成代码库？</font>**<font style="color:rgb(89, 99, 110);"> </font><font style="color:rgb(89, 99, 110);">先运行</font><font style="color:rgb(89, 99, 110);"> </font><code><font style="color:rgb(89, 99, 110);background-color:rgba(129, 139, 152, 0.12);">/gsd:map-codebase</font></code><font style="color:rgb(89, 99, 110);">。它会并行拉起多个代理分析你的技术栈、架构、约定和风险点。之后</font><font style="color:rgb(89, 99, 110);"> </font><code><font style="color:rgb(89, 99, 110);background-color:rgba(129, 139, 152, 0.12);">/gsd:new-project</font></code><font style="color:rgb(89, 99, 110);"> </font><font style="color:rgb(89, 99, 110);">就会真正“理解”你的代码库，提问会聚焦在你打算新增的部分，规划时也会自动加载你的现有模式。</font>

### <font style="color:rgb(31, 35, 40);">1. 初始化项目</font>

```plain
/gsd:new-project
```

<font style="color:rgb(31, 35, 40);">一个命令，一条完整流程。系统会：</font>

1. **<font style="color:rgb(31, 35, 40);">提问</font>**<font style="color:rgb(31, 35, 40);">：一直问到它彻底理解你的想法（目标、约束、技术偏好、边界情况）</font>
2. **<font style="color:rgb(31, 35, 40);">研究</font>**<font style="color:rgb(31, 35, 40);">：并行拉起代理调研领域知识（可选，但强烈建议）</font>
3. **<font style="color:rgb(31, 35, 40);">需求梳理</font>**<font style="color:rgb(31, 35, 40);">：提取哪些属于 v1、v2，哪些不在范围内</font>
4. **<font style="color:rgb(31, 35, 40);">路线图</font>**<font style="color:rgb(31, 35, 40);">：创建与需求映射的阶段规划</font>

<font style="color:rgb(31, 35, 40);">你审核并批准路线图后，就可以开始构建。</font>

**<font style="color:rgb(31, 35, 40);">生成：</font>**<font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">PROJECT.md</font></code><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">REQUIREMENTS.md</font></code><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">ROADMAP.md</font></code><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">STATE.md</font></code><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.planning/research/</font></code>

***

### <font style="color:rgb(31, 35, 40);">2. 讨论阶段</font>

```plain
/gsd:discuss-phase 1
```

**<font style="color:rgb(31, 35, 40);">这是你塑造实现方式的地方。</font>**

<font style="color:rgb(31, 35, 40);">你的路线图里，每个阶段通常只有一两句话。这点信息不足以让系统按</font><font style="color:rgb(31, 35, 40);"> </font>*<font style="color:rgb(31, 35, 40);">你脑中的样子</font>*<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">把东西做出来。这一步的作用，就是在研究和规划之前，把你的偏好先收进去。</font>

<font style="color:rgb(31, 35, 40);">系统会分析该阶段，并根据要构建的内容识别灰区：</font>

* **<font style="color:rgb(31, 35, 40);">视觉功能</font>**<font style="color:rgb(31, 35, 40);">：布局、信息密度、交互、空状态</font>
* **<font style="color:rgb(31, 35, 40);">API / CLI</font>**<font style="color:rgb(31, 35, 40);">：返回格式、flags、错误处理、详细程度</font>
* **<font style="color:rgb(31, 35, 40);">内容系统</font>**<font style="color:rgb(31, 35, 40);">：结构、语气、深度、流转方式</font>
* **<font style="color:rgb(31, 35, 40);">组织型任务</font>**<font style="color:rgb(31, 35, 40);">：分组标准、命名、去重、例外情况</font>

<font style="color:rgb(31, 35, 40);">对每个你选择的区域，系统都会持续追问，直到你满意为止。最终产物</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">CONTEXT.md</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">会直接喂给后续两个步骤：</font>

1. **<font style="color:rgb(31, 35, 40);">研究代理会读取它</font>**<font style="color:rgb(31, 35, 40);">：知道该研究哪些模式（例如“用户想要卡片布局” → 去研究卡片组件库）</font>
2. **<font style="color:rgb(31, 35, 40);">规划代理会读取它</font>**<font style="color:rgb(31, 35, 40);">：知道哪些决策已经锁定（例如“已决定使用无限滚动” → 计划里就会包含滚动处理）</font>

<font style="color:rgb(31, 35, 40);">你在这里给出的信息越具体，系统越能构建出你真正想要的东西。跳过它，你拿到的是合理默认值；用好它，你拿到的是</font><font style="color:rgb(31, 35, 40);"> </font>*<font style="color:rgb(31, 35, 40);">你的</font>*<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">方案。</font>

**<font style="color:rgb(31, 35, 40);">生成：</font>**<font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">{phase_num}-CONTEXT.md</font></code>

***

### <font style="color:rgb(31, 35, 40);">3. 规划阶段</font>

```plain
/gsd:plan-phase 1
```

<font style="color:rgb(31, 35, 40);">系统会：</font>

1. **<font style="color:rgb(31, 35, 40);">研究</font>**<font style="color:rgb(31, 35, 40);">：结合你的</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">CONTEXT.md</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">决策，调研这一阶段该怎么实现</font>
2. **<font style="color:rgb(31, 35, 40);">制定计划</font>**<font style="color:rgb(31, 35, 40);">：创建 2-3 份原子化任务计划，使用 XML 结构</font>
3. **<font style="color:rgb(31, 35, 40);">验证</font>**<font style="color:rgb(31, 35, 40);">：将计划与需求对照检查，直到通过为止</font>

<font style="color:rgb(31, 35, 40);">每份计划都足够小，可以在一个全新的上下文窗口里执行。没有质量衰减，也不会出现“我接下来会更简洁一些”的退化状态。</font>

**<font style="color:rgb(31, 35, 40);">生成：</font>**<font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">{phase_num}-RESEARCH.md</font></code><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">{phase_num}-{N}-PLAN.md</font></code>

***

### <font style="color:rgb(31, 35, 40);">4. 执行阶段</font>

```plain
/gsd:execute-phase 1
```

<font style="color:rgb(31, 35, 40);">系统会：</font>

1. **<font style="color:rgb(31, 35, 40);">按 wave 执行计划</font>**<font style="color:rgb(31, 35, 40);">：能并行的并行，有依赖的顺序执行</font>
2. **<font style="color:rgb(31, 35, 40);">每个计划使用新上下文</font>**<font style="color:rgb(31, 35, 40);">：20 万 token 纯用于实现，零历史垃圾</font>
3. **<font style="color:rgb(31, 35, 40);">每个任务单独提交</font>**<font style="color:rgb(31, 35, 40);">：每项任务都有自己的原子提交</font>
4. **<font style="color:rgb(31, 35, 40);">对照目标验证</font>**<font style="color:rgb(31, 35, 40);">：检查代码库是否真的交付了该阶段承诺的内容</font>

<font style="color:rgb(31, 35, 40);">你可以离开，回来时看到的是已经完成的工作和干净的 git 历史。</font>

**<font style="color:rgb(31, 35, 40);">Wave 执行方式：</font>**

<font style="color:rgb(31, 35, 40);">计划会根据依赖关系被分组为不同的 “wave”。同一 wave 内并行执行，不同 wave 之间顺序推进。</font>

```plain
┌─────────────────────────────────────────────────────────────────────┐
│  PHASE EXECUTION                                                     │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  WAVE 1 (parallel)          WAVE 2 (parallel)          WAVE 3       │
│  ┌─────────┐ ┌─────────┐    ┌─────────┐ ┌─────────┐    ┌─────────┐ │
│  │ Plan 01 │ │ Plan 02 │ →  │ Plan 03 │ │ Plan 04 │ →  │ Plan 05 │ │
│  │         │ │         │    │         │ │         │    │         │ │
│  │ User    │ │ Product │    │ Orders  │ │ Cart    │    │ Checkout│ │
│  │ Model   │ │ Model   │    │ API     │ │ API     │    │ UI      │ │
│  └─────────┘ └─────────┘    └─────────┘ └─────────┘    └─────────┘ │
│       │           │              ↑           ↑              ↑       │
│       └───────────┴──────────────┴───────────┘              │       │
│              Dependencies: Plan 03 needs Plan 01            │       │
│                          Plan 04 needs Plan 02              │       │
│                          Plan 05 needs Plans 03 + 04        │       │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

**<font style="color:rgb(31, 35, 40);">为什么 wave 很重要：</font>**

* <font style="color:rgb(31, 35, 40);">独立计划 → 同一 wave → 并行执行</font>
* <font style="color:rgb(31, 35, 40);">依赖计划 → 更晚的 wave → 等依赖完成</font>
* <font style="color:rgb(31, 35, 40);">文件冲突 → 顺序执行，或合并到同一个计划里</font>

<font style="color:rgb(31, 35, 40);">这也是为什么“垂直切片”（Plan 01：端到端完成用户功能）比“水平分层”（Plan 01：所有 model，Plan 02：所有 API）更容易并行化。</font>

**<font style="color:rgb(31, 35, 40);">生成：</font>**<font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">{phase_num}-{N}-SUMMARY.md</font></code><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">{phase_num}-VERIFICATION.md</font></code>

***

### <font style="color:rgb(31, 35, 40);">5. 验证工作</font>

```plain
/gsd:verify-work 1
```

**<font style="color:rgb(31, 35, 40);">这是你确认它是否真的可用的地方。</font>**

<font style="color:rgb(31, 35, 40);">自动化验证能检查代码存在、测试通过。但这个功能是否真的按你的预期工作？这一步就是让你亲自用。</font>

<font style="color:rgb(31, 35, 40);">系统会：</font>

1. **<font style="color:rgb(31, 35, 40);">提取可测试的交付项</font>**<font style="color:rgb(31, 35, 40);">：你现在应该能做到什么</font>
2. **<font style="color:rgb(31, 35, 40);">逐项带你验证</font>**<font style="color:rgb(31, 35, 40);">：“能否用邮箱登录？” 可以 / 不可以，或者描述哪里不对</font>
3. **<font style="color:rgb(31, 35, 40);">自动诊断失败</font>**<font style="color:rgb(31, 35, 40);">：拉起 debug 代理定位根因</font>
4. **<font style="color:rgb(31, 35, 40);">创建验证过的修复计划</font>**<font style="color:rgb(31, 35, 40);">：可立刻重新执行</font>

<font style="color:rgb(31, 35, 40);">如果一切通过，就进入下一步；如果哪里坏了，你不需要手动 debug，只要重新运行</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:execute-phase</font></code><font style="color:rgb(31, 35, 40);">，执行它自动生成的修复计划即可。</font>

**<font style="color:rgb(31, 35, 40);">生成：</font>**<font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">{phase_num}-UAT.md</font></code><font style="color:rgb(31, 35, 40);">，以及发现问题时的修复计划</font>

***

### <font style="color:rgb(31, 35, 40);">6. 重复 → 完成 → 下一个里程碑</font>

```plain
/gsd:discuss-phase 2
/gsd:plan-phase 2
/gsd:execute-phase 2
/gsd:verify-work 2
...
/gsd:complete-milestone
/gsd:new-milestone
```

<font style="color:rgb(31, 35, 40);">循环执行</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">讨论 → 规划 → 执行 → 验证</font>**<font style="color:rgb(31, 35, 40);">，直到整个里程碑完成。</font>

<font style="color:rgb(31, 35, 40);">如果你希望在讨论阶段更快收集信息，可以用</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:discuss-phase <n> --batch</font></code><font style="color:rgb(31, 35, 40);">，一次回答一小组问题，而不是逐个问答。</font>

<font style="color:rgb(31, 35, 40);">每个阶段都会得到你的输入（discuss）、充分研究（plan）、干净执行（execute）和人工验证（verify）。上下文始终保持新鲜，质量也能持续稳定。</font>

<font style="color:rgb(31, 35, 40);">当所有阶段完成后，</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:complete-milestone</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">会归档当前里程碑并打 release tag。</font>

<font style="color:rgb(31, 35, 40);">接着用</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:new-milestone</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">开启下一个版本。它和</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">new-project</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">流程相同，只是面向你现有的代码库。你描述下一步想构建什么，系统研究领域、梳理需求，再产出新的路线图。每个里程碑都是一个干净周期：定义 → 构建 → 发布。</font>

***

### <font style="color:rgb(31, 35, 40);">快速模式</font>

```plain
/gsd:quick
```

**<font style="color:rgb(31, 35, 40);">适用于不需要完整规划的临时任务。</font>**

<font style="color:rgb(31, 35, 40);">快速模式保留 GSD 的核心保障（原子提交、状态跟踪），但路径更短：</font>

* **<font style="color:rgb(31, 35, 40);">相同的代理体系</font>**<font style="color:rgb(31, 35, 40);">：同样是 planner + executor，质量不降</font>
* **<font style="color:rgb(31, 35, 40);">跳过可选步骤</font>**<font style="color:rgb(31, 35, 40);">：没有 research、plan checker、verifier</font>
* **<font style="color:rgb(31, 35, 40);">独立跟踪</font>**<font style="color:rgb(31, 35, 40);">：数据存放在</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.planning/quick/</font></code><font style="color:rgb(31, 35, 40);">，不和 phase 混在一起</font>

<font style="color:rgb(31, 35, 40);">适用场景：修 bug、小功能、配置改动、一次性任务。</font>

```plain
/gsd:quick
> What do you want to do? "Add dark mode toggle to settings"
```

**<font style="color:rgb(31, 35, 40);">生成：</font>**<font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.planning/quick/001-add-dark-mode-toggle/PLAN.md</font></code><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">SUMMARY.md</font></code>

***

## <font style="color:rgb(31, 35, 40);">为什么它有效</font>

### <font style="color:rgb(31, 35, 40);">上下文工程</font>

<font style="color:rgb(31, 35, 40);">Claude Code 非常强大，前提是你把它需要的上下文给对。大多数人做不到。</font>

<font style="color:rgb(31, 35, 40);">GSD 会替你处理：</font>

| **<font style="color:rgb(31, 35, 40);">文件</font>** | **<font style="color:rgb(31, 35, 40);">作用</font>** |
| --- | --- |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">PROJECT.md</font></code> | <font style="color:rgb(31, 35, 40);">项目愿景，始终加载</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">research/</font></code> | <font style="color:rgb(31, 35, 40);">生态知识（技术栈、功能、架构、坑点）</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">REQUIREMENTS.md</font></code> | <font style="color:rgb(31, 35, 40);">带 phase 可追踪性的 v1/v2 范围定义</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">ROADMAP.md</font></code> | <font style="color:rgb(31, 35, 40);">你要去哪里、哪些已经完成</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">STATE.md</font></code> | <font style="color:rgb(31, 35, 40);">决策、阻塞、当前位置，跨会话记忆</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">PLAN.md</font></code> | <font style="color:rgb(31, 35, 40);">带 XML 结构和验证步骤的原子任务</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">SUMMARY.md</font></code> | <font style="color:rgb(31, 35, 40);">做了什么、改了什么、已写入历史</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">todos/</font></code> | <font style="color:rgb(31, 35, 40);">留待后续处理的想法和任务</font> |

<font style="color:rgb(31, 35, 40);">这些尺寸限制都是基于 Claude 在何处开始质量退化得出的。控制在阈值内，输出才能持续稳定。</font>

### <font style="color:rgb(31, 35, 40);">XML 提示格式</font>

<font style="color:rgb(31, 35, 40);">每个计划都会使用为 Claude 优化过的结构化 XML：</font>

```plain
<task type="auto">
  <name>Create login endpoint</name>
  <files>src/app/api/auth/login/route.ts</files>
  <action>
    Use jose for JWT (not jsonwebtoken - CommonJS issues).
    Validate credentials against users table.
    Return httpOnly cookie on success.
  </action>
  <verify>curl -X POST localhost:3000/api/auth/login returns 200 + Set-Cookie</verify>
  <done>Valid credentials return cookie, invalid return 401</done>
</task>
```

<font style="color:rgb(31, 35, 40);">指令足够精确，不需要猜。验证也内建在计划里。</font>

### <font style="color:rgb(31, 35, 40);">多代理编排</font>

<font style="color:rgb(31, 35, 40);">每个阶段都遵循同一种模式：一个轻量 orchestrator 拉起专用代理、汇总结果，再路由到下一步。</font>

| **<font style="color:rgb(31, 35, 40);">阶段</font>** | **<font style="color:rgb(31, 35, 40);">Orchestrator 做什么</font>** | **<font style="color:rgb(31, 35, 40);">Agents 做什么</font>** |
| --- | --- | --- |
| <font style="color:rgb(31, 35, 40);">研究</font> | <font style="color:rgb(31, 35, 40);">协调与展示研究结果</font> | <font style="color:rgb(31, 35, 40);">4 个并行研究代理分别调查技术栈、功能、架构、坑点</font> |
| <font style="color:rgb(31, 35, 40);">规划</font> | <font style="color:rgb(31, 35, 40);">校验并管理迭代</font> | <font style="color:rgb(31, 35, 40);">Planner 生成计划，checker 验证，循环直到通过</font> |
| <font style="color:rgb(31, 35, 40);">执行</font> | <font style="color:rgb(31, 35, 40);">按 wave 分组并跟踪进度</font> | <font style="color:rgb(31, 35, 40);">Executors 并行实现，每个都有全新的 20 万上下文</font> |
| <font style="color:rgb(31, 35, 40);">验证</font> | <font style="color:rgb(31, 35, 40);">呈现结果并决定下一步</font> | <font style="color:rgb(31, 35, 40);">Verifier 对照目标检查代码库，debuggers 诊断失败</font> |

<font style="color:rgb(31, 35, 40);">Orchestrator 本身不做重活，只负责拉代理、等待、整合结果。</font>

**<font style="color:rgb(31, 35, 40);">最终效果：</font>**<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">你可以在一个阶段里完成深度研究、生成并验证多个计划、让多个执行代理并行写下成千上万行代码，再自动对照目标验证，而主上下文窗口依然能维持在 30-40% 左右。真正的工作都发生在新鲜的子代理上下文里，所以你的主会话始终保持快速、响应稳定。</font>

### <font style="color:rgb(31, 35, 40);">原子 Git 提交</font>

<font style="color:rgb(31, 35, 40);">每个任务完成后都会立刻生成独立提交：</font>

```plain
abc123f docs(08-02): complete user registration plan
def456g feat(08-02): add email confirmation flow
hij789k feat(08-02): implement password hashing
lmn012o feat(08-02): create registration endpoint
```

**<font style="color:rgb(9, 105, 218);">Note</font>**

**<font style="color:rgb(31, 35, 40);">好处：</font>**<font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">git bisect</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">能精准定位是哪项任务引入故障；每个任务都可单独回滚；未来 Claude 读取历史时也更清晰；整个 AI 自动化工作流的可观测性更好。</font>

<font style="color:rgb(31, 35, 40);">每个 commit 都是外科手术式的：精确、可追踪、有意义。</font>

### <font style="color:rgb(31, 35, 40);">模块化设计</font>

* <font style="color:rgb(31, 35, 40);">给当前里程碑追加 phase</font>
* <font style="color:rgb(31, 35, 40);">在 phase 之间插入紧急工作</font>
* <font style="color:rgb(31, 35, 40);">完成当前里程碑后开启新的周期</font>
* <font style="color:rgb(31, 35, 40);">在不推倒重来的前提下调整计划</font>

<font style="color:rgb(31, 35, 40);">你不会被这套系统绑死，它会随着项目变化而调整。</font>

***

## <font style="color:rgb(31, 35, 40);">命令</font>

### <font style="color:rgb(31, 35, 40);">核心工作流</font>

| **<font style="color:rgb(31, 35, 40);">命令</font>** | **<font style="color:rgb(31, 35, 40);">作用</font>** |
| --- | --- |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:new-project [--auto]</font></code> | <font style="color:rgb(31, 35, 40);">完整初始化：提问 → 研究 → 需求 → 路线图</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:discuss-phase [N] [--auto]</font></code> | <font style="color:rgb(31, 35, 40);">在规划前收集实现决策</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:plan-phase [N] [--auto]</font></code> | <font style="color:rgb(31, 35, 40);">为某个阶段执行研究 + 规划 + 验证</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:execute-phase <N></font></code> | <font style="color:rgb(31, 35, 40);">以并行 wave 执行全部计划，完成后验证</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:verify-work [N]</font></code> | <font style="color:rgb(31, 35, 40);">人工用户验收测试 ¹</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:audit-milestone</font></code> | <font style="color:rgb(31, 35, 40);">验证里程碑是否达到完成定义</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:complete-milestone</font></code> | <font style="color:rgb(31, 35, 40);">归档里程碑并打 release tag</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:new-milestone [name]</font></code> | <font style="color:rgb(31, 35, 40);">开始下一个版本：提问 → 研究 → 需求 → 路线图</font> |

### <font style="color:rgb(31, 35, 40);">导航</font>

| **<font style="color:rgb(31, 35, 40);">命令</font>** | **<font style="color:rgb(31, 35, 40);">作用</font>** |
| --- | --- |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:progress</font></code> | <font style="color:rgb(31, 35, 40);">我现在在哪？下一步是什么？</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:help</font></code> | <font style="color:rgb(31, 35, 40);">显示全部命令和使用指南</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:update</font></code> | <font style="color:rgb(31, 35, 40);">更新 GSD，并预览变更日志</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:join-discord</font></code> | <font style="color:rgb(31, 35, 40);">加入 GSD Discord 社区</font> |

### <font style="color:rgb(31, 35, 40);">Brownfield</font>

| **<font style="color:rgb(31, 35, 40);">命令</font>** | **<font style="color:rgb(31, 35, 40);">作用</font>** |
| --- | --- |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:map-codebase</font></code> | <font style="color:rgb(31, 35, 40);">在</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">new-project</font></code><br/><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">前分析现有代码库</font> |

### <font style="color:rgb(31, 35, 40);">阶段管理</font>

| **<font style="color:rgb(31, 35, 40);">命令</font>** | **<font style="color:rgb(31, 35, 40);">作用</font>** |
| --- | --- |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:add-phase</font></code> | <font style="color:rgb(31, 35, 40);">在路线图末尾追加 phase</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:insert-phase [N]</font></code> | <font style="color:rgb(31, 35, 40);">在 phase 之间插入紧急工作</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:remove-phase [N]</font></code> | <font style="color:rgb(31, 35, 40);">删除未来 phase，并重编号</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:list-phase-assumptions [N]</font></code> | <font style="color:rgb(31, 35, 40);">在规划前查看 Claude 打算采用的方案</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:plan-milestone-gaps</font></code> | <font style="color:rgb(31, 35, 40);">为 audit 发现的缺口创建 phase</font> |

### <font style="color:rgb(31, 35, 40);">会话</font>

| **<font style="color:rgb(31, 35, 40);">命令</font>** | **<font style="color:rgb(31, 35, 40);">作用</font>** |
| --- | --- |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:pause-work</font></code> | <font style="color:rgb(31, 35, 40);">在中途暂停时创建交接上下文</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:resume-work</font></code> | <font style="color:rgb(31, 35, 40);">从上一次会话恢复</font> |

### <font style="color:rgb(31, 35, 40);">工具</font>

| **<font style="color:rgb(31, 35, 40);">命令</font>** | **<font style="color:rgb(31, 35, 40);">作用</font>** |
| --- | --- |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:settings</font></code> | <font style="color:rgb(31, 35, 40);">配置模型 profile 和工作流代理</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:set-profile <profile></font></code> | <font style="color:rgb(31, 35, 40);">切换模型 profile（quality / balanced / budget）</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:add-todo [desc]</font></code> | <font style="color:rgb(31, 35, 40);">记录一个待办想法</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:check-todos</font></code> | <font style="color:rgb(31, 35, 40);">查看待办列表</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:debug [desc]</font></code> | <font style="color:rgb(31, 35, 40);">使用持久状态进行系统化调试</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:quick [--full] [--discuss]</font></code> | <font style="color:rgb(31, 35, 40);">以 GSD 保障执行临时任务（</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">--full</font></code><br/><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">增加计划检查和验证，</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">--discuss</font></code><br/><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">先补上下文）</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:health [--repair]</font></code> | <font style="color:rgb(31, 35, 40);">校验</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.planning/</font></code><br/><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">目录完整性，带</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">--repair</font></code><br/><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">时自动修复</font> |

<sup><font style="color:rgb(31, 35, 40);">¹ 由 reddit 用户 OracleGreyBeard 贡献</font></sup>

***

## <font style="color:rgb(31, 35, 40);">配置</font>

<font style="color:rgb(31, 35, 40);">GSD 将项目设置保存在</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.planning/config.json</font></code><font style="color:rgb(31, 35, 40);">。你可以在</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:new-project</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">时配置，也可以稍后通过</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:settings</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">修改。完整的配置 schema、工作流开关、git branching 选项以及各代理的模型分配，请查看</font>[<font style="color:rgb(9, 105, 218);">用户指南</font>](https://github.com/gsd-build/get-shit-done/blob/main/docs/USER-GUIDE.md#configuration-reference)<font style="color:rgb(31, 35, 40);">。</font>

### <font style="color:rgb(31, 35, 40);">核心设置</font>

| **<font style="color:rgb(31, 35, 40);">Setting</font>** | **<font style="color:rgb(31, 35, 40);">Options</font>** | **<font style="color:rgb(31, 35, 40);">Default</font>** | **<font style="color:rgb(31, 35, 40);">作用</font>** |
| --- | --- | --- | --- |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">mode</font></code> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">yolo</font></code><br/><font style="color:rgb(31, 35, 40);">,</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">interactive</font></code> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">interactive</font></code> | <font style="color:rgb(31, 35, 40);">自动批准，还是每一步确认</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">granularity</font></code> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">coarse</font></code><br/><font style="color:rgb(31, 35, 40);">,</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">standard</font></code><br/><font style="color:rgb(31, 35, 40);">,</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">fine</font></code> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">standard</font></code> | <font style="color:rgb(31, 35, 40);">phase 粒度，也就是范围切分得多细</font> |

### <font style="color:rgb(31, 35, 40);">模型 Profile</font>

<font style="color:rgb(31, 35, 40);">控制各代理使用哪种 Claude 模型，在质量和 token 成本之间平衡。</font>

| **<font style="color:rgb(31, 35, 40);">Profile</font>** | **<font style="color:rgb(31, 35, 40);">Planning</font>** | **<font style="color:rgb(31, 35, 40);">Execution</font>** | **<font style="color:rgb(31, 35, 40);">Verification</font>** |
| --- | --- | --- | --- |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">quality</font></code> | <font style="color:rgb(31, 35, 40);">Opus</font> | <font style="color:rgb(31, 35, 40);">Opus</font> | <font style="color:rgb(31, 35, 40);">Sonnet</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">balanced</font></code><br/><font style="color:rgb(31, 35, 40);">（默认）</font> | <font style="color:rgb(31, 35, 40);">Opus</font> | <font style="color:rgb(31, 35, 40);">Sonnet</font> | <font style="color:rgb(31, 35, 40);">Sonnet</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">budget</font></code> | <font style="color:rgb(31, 35, 40);">Sonnet</font> | <font style="color:rgb(31, 35, 40);">Sonnet</font> | <font style="color:rgb(31, 35, 40);">Haiku</font> |

<font style="color:rgb(31, 35, 40);">切换方式：</font>

```plain
/gsd:set-profile budget
```

<font style="color:rgb(31, 35, 40);">也可以通过</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:settings</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">配置。</font>

### <font style="color:rgb(31, 35, 40);">工作流代理</font>

<font style="color:rgb(31, 35, 40);">这些设置会在规划或执行时拉起额外代理。它们能提升质量，但也会增加 token 消耗和耗时。</font>

| **<font style="color:rgb(31, 35, 40);">Setting</font>** | **<font style="color:rgb(31, 35, 40);">Default</font>** | **<font style="color:rgb(31, 35, 40);">作用</font>** |
| --- | --- | --- |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">workflow.research</font></code> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">true</font></code> | <font style="color:rgb(31, 35, 40);">每个 phase 规划前先调研领域知识</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">workflow.plan_check</font></code> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">true</font></code> | <font style="color:rgb(31, 35, 40);">执行前验证计划是否真能达成阶段目标</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">workflow.verifier</font></code> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">true</font></code> | <font style="color:rgb(31, 35, 40);">执行后确认“必须交付项”是否已经落地</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">workflow.auto_advance</font></code> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">false</font></code> | <font style="color:rgb(31, 35, 40);">自动串联 discuss → plan → execute，不中途停下</font> |

<font style="color:rgb(31, 35, 40);">可以用</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:settings</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">开关这些项，也可以在单次命令里覆盖：</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:plan-phase --skip-research</font></code>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:plan-phase --skip-verify</font></code>

### <font style="color:rgb(31, 35, 40);">执行</font>

| **<font style="color:rgb(31, 35, 40);">Setting</font>** | **<font style="color:rgb(31, 35, 40);">Default</font>** | **<font style="color:rgb(31, 35, 40);">作用</font>** |
| --- | --- | --- |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">parallelization.enabled</font></code> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">true</font></code> | <font style="color:rgb(31, 35, 40);">是否并行执行独立计划</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">planning.commit_docs</font></code> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">true</font></code> | <font style="color:rgb(31, 35, 40);">是否将</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.planning/</font></code><br/><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">纳入 git 跟踪</font> |

### <font style="color:rgb(31, 35, 40);">Git 分支策略</font>

<font style="color:rgb(31, 35, 40);">控制 GSD 在执行过程中如何处理分支。</font>

| **<font style="color:rgb(31, 35, 40);">Setting</font>** | **<font style="color:rgb(31, 35, 40);">Options</font>** | **<font style="color:rgb(31, 35, 40);">Default</font>** | **<font style="color:rgb(31, 35, 40);">作用</font>** |
| --- | --- | --- | --- |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">git.branching_strategy</font></code> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">none</font></code><br/><font style="color:rgb(31, 35, 40);">,</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">phase</font></code><br/><font style="color:rgb(31, 35, 40);">,</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">milestone</font></code> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">none</font></code> | <font style="color:rgb(31, 35, 40);">分支创建策略</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">git.phase_branch_template</font></code> | <font style="color:rgb(31, 35, 40);">string</font> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">gsd/phase-{phase}-{slug}</font></code> | <font style="color:rgb(31, 35, 40);">phase 分支模板</font> |
| <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">git.milestone_branch_template</font></code> | <font style="color:rgb(31, 35, 40);">string</font> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">gsd/{milestone}-{slug}</font></code> | <font style="color:rgb(31, 35, 40);">milestone 分支模板</font> |

**<font style="color:rgb(31, 35, 40);">策略说明：</font>**

* <code>**<font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">none</font>**</code><font style="color:rgb(31, 35, 40);">：直接提交到当前分支（GSD 默认行为）</font>
* <code>**<font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">phase</font>**</code><font style="color:rgb(31, 35, 40);">：每个 phase 创建一个分支，在 phase 完成时合并</font>
* <code>**<font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">milestone</font>**</code><font style="color:rgb(31, 35, 40);">：整个里程碑只用一个分支，在里程碑完成时合并</font>

<font style="color:rgb(31, 35, 40);">在里程碑完成时，GSD 会提供 squash merge（推荐）或保留历史的 merge 选项。</font>

***

## <font style="color:rgb(31, 35, 40);">安全</font>

### <font style="color:rgb(31, 35, 40);">保护敏感文件</font>

<font style="color:rgb(31, 35, 40);">GSD 的代码库映射和分析命令会读取文件来理解你的项目。</font>**<font style="color:rgb(31, 35, 40);">包含机密信息的文件应当加入 Claude Code 的 deny list</font>**<font style="color:rgb(31, 35, 40);">：</font>

1. <font style="color:rgb(31, 35, 40);">打开 Claude Code 设置（项目级</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.claude/settings.json</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">或全局设置）</font>
2. <font style="color:rgb(31, 35, 40);">把敏感文件模式加入 deny list：</font>

```plain
{
  "permissions": {
    "deny": [
      "Read(.env)",
      "Read(.env.*)",
      "Read(**/secrets/*)",
      "Read(**/*credential*)",
      "Read(**/*.pem)",
      "Read(**/*.key)"
    ]
  }
}
```

<font style="color:rgb(31, 35, 40);">这样无论你运行什么命令，Claude 都无法读取这些文件。</font>

**<font style="color:rgb(130, 80, 223);">Important</font>**

<font style="color:rgb(31, 35, 40);">GSD 内建了防止提交 secrets 的保护，但纵深防御依然是最佳实践。第一道防线应该是直接禁止读取敏感文件。</font>

***

## <font style="color:rgb(31, 35, 40);">故障排查</font>

**<font style="color:rgb(31, 35, 40);">安装后找不到命令？</font>**

* <font style="color:rgb(31, 35, 40);">重启你的运行时，让命令或 skills 重新加载</font>
* <font style="color:rgb(31, 35, 40);">检查文件是否存在于</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">~/.claude/commands/gsd/</font></code><font style="color:rgb(31, 35, 40);">（全局）或</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">./.claude/commands/gsd/</font></code><font style="color:rgb(31, 35, 40);">（本地）</font>
* <font style="color:rgb(31, 35, 40);">对 Codex，检查 skills 是否存在于</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">~/.codex/skills/gsd-*/SKILL.md</font></code><font style="color:rgb(31, 35, 40);">（全局）或</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">./.codex/skills/gsd-*/SKILL.md</font></code><font style="color:rgb(31, 35, 40);">（本地）</font>

**<font style="color:rgb(31, 35, 40);">命令行为不符合预期？</font>**

* <font style="color:rgb(31, 35, 40);">运行</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/gsd:help</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">确认安装成功</font>
* <font style="color:rgb(31, 35, 40);">重新执行</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">npx get-shit-done-cc</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">进行重装</font>

**<font style="color:rgb(31, 35, 40);">想更新到最新版本？</font>**

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">npx get-shit-done-cc@latest</font>

**<font style="color:rgb(31, 35, 40);">在 Docker 或容器环境中使用？</font>**

<font style="color:rgb(31, 35, 40);">如果使用波浪线路径（</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">~/.claude/...</font></code><font style="color:rgb(31, 35, 40);">）时读取失败，请在安装前设置</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">CLAUDE_CONFIG_DIR</font></code><font style="color:rgb(31, 35, 40);">：</font>

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">CLAUDE\_CONFIG\_DIR=/home/youruser/.claude npx get-shit-done-cc --global</font>

<font style="color:rgb(31, 35, 40);">这样可以确保使用绝对路径，而不是在容器里可能无法正确展开的</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">~</font></code><font style="color:rgb(31, 35, 40);">。</font>

### <font style="color:rgb(31, 35, 40);">卸载</font>

<font style="color:rgb(31, 35, 40);">如果你想彻底移除 GSD：</font>

```plain
# 全局安装
npx get-shit-done-cc --claude --global --uninstall
npx get-shit-done-cc --opencode --global --uninstall
npx get-shit-done-cc --codex --global --uninstall

# 本地安装（当前项目）
npx get-shit-done-cc --claude --local --uninstall
npx get-shit-done-cc --opencode --local --uninstall
npx get-shit-done-cc --codex --local --uninstall
```

<font style="color:rgb(31, 35, 40);">这会移除所有 GSD 命令、代理、hooks 和设置，但会保留你其他配置。</font>

***

## <font style="color:rgb(31, 35, 40);">社区移植版本</font>

<font style="color:rgb(31, 35, 40);">OpenCode、Gemini CLI 和 Codex 现在都已经通过</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">npx get-shit-done-cc</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">获得原生支持。</font>

<font style="color:rgb(31, 35, 40);">这些社区移植版本曾率先探索多运行时支持：</font>

| **<font style="color:rgb(31, 35, 40);">Project</font>** | **<font style="color:rgb(31, 35, 40);">Platform</font>** | **<font style="color:rgb(31, 35, 40);">Description</font>** |
| --- | --- | --- |
| [<font style="color:rgb(9, 105, 218);">gsd-opencode</font>](https://github.com/rokicool/gsd-opencode) | <font style="color:rgb(31, 35, 40);">OpenCode</font> | <font style="color:rgb(31, 35, 40);">最初的 OpenCode 适配版本</font> |
| <font style="color:rgb(31, 35, 40);">gsd-gemini (archived)</font> | <font style="color:rgb(31, 35, 40);">Gemini CLI</font> | <font style="color:rgb(31, 35, 40);">uberfuzzy 制作的最初 Gemini 适配版本</font> |


> 更新: 2026-03-15 22:05:56  
> 原文: <https://www.yuque.com/lixinsi/yh04az/udpk9lmrm2lnndt4>