# 项目迭代功能openspec

<font style="color:rgb(19, 19, 19);background-color:rgba(0, 0, 0, 0.05);">OpenSpec规范驱动开发框架的完整使用流程！OpenSpec是专为AI编码助手设计的开源工作流工具，支持Claude Code、Cursor、Windsurf等主流AI编程助手，特别适合在已有项目基础上进行迭代开发。 </font><font style="color:rgb(19, 19, 19);background-color:rgba(0, 0, 0, 0.05);">📱</font><font style="color:rgb(19, 19, 19);background-color:rgba(0, 0, 0, 0.05);"> 视频通过真实案例——为iOS番茄专注APP新增"自定义时长"功能，完整展示了OpenSpec的五大工作流程：创建提议→审核规范→AI自动编码→功能测试→归档文档。相比传统开发方式，OpenSpec让AI生成的代码具有可预测性、高质量和零猜测的特点，彻底解决AI编程助手"不可控"的痛点。 </font><font style="color:rgb(19, 19, 19);background-color:rgba(0, 0, 0, 0.05);">✨</font><font style="color:rgb(19, 19, 19);background-color:rgba(0, 0, 0, 0.05);"> 核心亮点：工具无关、完整审计轨迹、自动归档合并、团队协作友好。视频包含完整的安装配置教程和实战演示，适合所有想提升AI辅助开发效率的程序员！ </font>\
<https://github.com/Fission-AI/OpenSpec>

### <font style="color:rgb(31, 35, 40);">Install & Initialize</font><font style="color:rgb(31, 35, 40);">安装和初始化</font>

#### <font style="color:rgb(31, 35, 40);">Prerequisites</font><font style="color:rgb(31, 35, 40);">先决条件</font>

* **<font style="color:rgb(31, 35, 40);">Node.js >= 20.19.0</font>**<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Check your version with</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">node --version</font></code><font style="color:rgb(31, 35, 40);">\ </font>**<font style="color:rgb(31, 35, 40);">Node.js >= 20.19.0</font>**<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 使用</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">node --version</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">检查您的版本</font>

#### <font style="color:rgb(31, 35, 40);">Step 1: Install the CLI globally</font><font style="color:rgb(31, 35, 40);">

</font><font style="color:rgb(31, 35, 40);">步骤 1：全局安装 CLI</font>

```plain
npm install -g @fission-ai/openspec@latest
```

<font style="color:rgb(31, 35, 40);">Verify installation:</font><font style="color:rgb(31, 35, 40);">验证安装：</font>

```plain
openspec --version
```

#### <font style="color:rgb(31, 35, 40);">Step 2: Initialize OpenSpec in your project</font><font style="color:rgb(31, 35, 40);">

</font><font style="color:rgb(31, 35, 40);">第 2 步：在项目中初始化 OpenSpec</font> <font style="color:rgb(31, 35, 40);">Navigate to your project directory:</font><font style="color:rgb(31, 35, 40);">\ </font><font style="color:rgb(31, 35, 40);">导航到您的项目目录：</font>

```plain
cd my-project
```

<font style="color:rgb(31, 35, 40);">Run the initialization:</font><font style="color:rgb(31, 35, 40);">\ </font><font style="color:rgb(31, 35, 40);">运行初始化：</font>

```plain
openspec init
```

#### <font style="color:rgb(31, 35, 40);">1. Draft the Proposal

</font><font style="color:rgb(31, 35, 40);">起草提案</font> <font style="color:rgb(31, 35, 40);">Start by asking your AI to create a change proposal:\ </font><font style="color:rgb(31, 35, 40);">首先要求您的 AI 创建变更提案</font>

```plain
 /openspec:proposal
```

#### <font style="color:rgb(31, 35, 40);">2. Verify & Review</font><font style="color:rgb(31, 35, 40);">2. 验证和审查</font>

<font style="color:rgb(31, 35, 40);">Check that the change was created correctly and review the proposal:</font><font style="color:rgb(31, 35, 40);">\ </font><font style="color:rgb(31, 35, 40);">检查更改是否正确创建，然后查看提案：</font>

```plain
$ openspec list                             # Confirm the change folder exists
$ openspec validate add-profile-filters     # Validate spec formatting
$ openspec show add-profile-filters         # Review proposal, tasks, and spec delta
```

#### <font style="color:rgb(31, 35, 40);">3. 完善规格</font>

<font style="color:rgb(31, 35, 40);">Iterate on the specifications until they match your needs:</font><font style="color:rgb(31, 35, 40);">\ </font><font style="color:rgb(31, 35, 40);">迭代规范，直到它们符合您的需求：</font>

```plain
You: Can you add acceptance criteria for the role and team filters?

AI:  I'll update the spec delta with scenarios for role and team filters.
     *Edits openspec/changes/add-profile-filters/specs/profile/spec.md and tasks.md.*
```

<font style="color:rgb(31, 35, 40);">  
</font>

#### <font style="color:rgb(31, 35, 40);">4. 实施变革</font>

<font style="color:rgb(31, 35, 40);">Once specs look good, start implementation:</font><font style="color:rgb(31, 35, 40);">\ </font><font style="color:rgb(31, 35, 40);">一旦规格看起来不错，就开始实施：</font>

```plain
 /openspec:apply
```

<font style="color:rgb(31, 35, 40);">  
</font>

#### <font style="color:rgb(31, 35, 40);">5. 存档已完成的更改</font>

<font style="color:rgb(31, 35, 40);">After implementation is complete, archive the change:</font><font style="color:rgb(31, 35, 40);">\ </font><font style="color:rgb(31, 35, 40);">实现完成后，存档更改：</font>

```plain
/openspec:archive 
```

<font style="color:rgb(31, 35, 40);">或者在终端中自己运行命令：</font>

```plain
openspec archive add-profile-filters --yes  # Archive the completed change without prompts
```

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">实战演示：给ForestFocus添加自定义时长</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%9B%9B%E5%AE%9E%E6%88%98%E6%BC%94%E7%A4%BA%E7%BB%99forestfocus%E6%B7%BB%E5%8A%A0%E8%87%AA%E5%AE%9A%E4%B9%89%E6%97%B6%E9%95%BF)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">下面用一个真实案例，带你完整走一遍OpenSpec流程。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">背景介绍</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E8%83%8C%E6%99%AF%E4%BB%8B%E7%BB%8D)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">我有一个名为ForestFocus的iOS应用，是一个专注计时器（类似番茄钟）。用户专注25分钟，就能种一棵树。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">现在我想</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">添加自定义时长功能</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：让用户可以选择15分钟、45分钟、90分钟等不同的专注时长，而不是固定的25分钟。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">准备工作</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%87%86%E5%A4%87%E5%B7%A5%E4%BD%9C)

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">1. 安装OpenSpec</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#1-%E5%AE%89%E8%A3%85openspec)

```plain
Copy code# 检查Node.js版本（需要 >= 20.19.0）
node --version
# v22.20.0 ✓

# 全局安装OpenSpec
npm install -g @fission-ai/openspec@latest
```

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">2. 初始化项目</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#2-%E5%88%9D%E5%A7%8B%E5%8C%96%E9%A1%B9%E7%9B%AE)

```plain
Copy code# 进入项目目录
cd /Users/charlesqin/Desktop/ForestFocus-main

# 初始化OpenSpec
openspec init
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">初始化时会问你：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">用什么AI工具？我选了</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Claude Code</font>**
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">是否创建项目信息文件？选</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">是</font>**

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">完成后，项目里会多一个</font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">openspec</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">目录：</font>

```plain
Copy codeForestFocus-main/
├── AGENTS.md              # AI助手指令
└── openspec/
    ├── AGENTS.md          # OpenSpec工作流说明
    ├── project.md         # 项目信息
    ├── specs/             # 规范文档（当前真实状态）
    └── changes/           # 变更提案（进行中的修改）
```

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">3. 填充项目信息</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#3-%E5%A1%AB%E5%85%85%E9%A1%B9%E7%9B%AE%E4%BF%A1%E6%81%AF)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">让Claude Code帮忙填充</font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">project.md</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：</font>

```plain
Copy codePlease read openspec/project.md and help me fill it out
with details about my project, tech stack, and conventions
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Claude Code会自动分析你的代码，填写：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">项目用途</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">技术栈</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">代码规范</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">领域知识</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">约束条件</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这一步很重要，它让AI充分理解你的项目背景。</font>

***

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Step 1：创建变更提案</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#step-1%E5%88%9B%E5%BB%BA%E5%8F%98%E6%9B%B4%E6%8F%90%E6%A1%88)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">在Claude Code中输入斜杠命令：</font>

```plain
/openspec:proposal Custom Focus Duration
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Claude Code不会立即写代码，而是先问我5个关键问题：</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">问题1：时长范围</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E9%97%AE%E9%A2%981%E6%97%B6%E9%95%BF%E8%8C%83%E5%9B%B4)

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">最小时长是多少？</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">最大时长是多少？</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">步长是多少？（每次增加几分钟）</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">问题2：UI设计</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E9%97%AE%E9%A2%982ui%E8%AE%BE%E8%AE%A1)

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">在哪里选择时长？</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">放在设置页面还是主界面？</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">问题3：统计影响</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E9%97%AE%E9%A2%983%E7%BB%9F%E8%AE%A1%E5%BD%B1%E5%93%8D)

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">如何计算”番茄钟个数”？</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">45分钟算几个番茄钟？</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">问题4：向后兼容</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E9%97%AE%E9%A2%984%E5%90%91%E5%90%8E%E5%85%BC%E5%AE%B9)

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">旧的会话记录怎么处理？</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">要迁移数据吗？</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">问题5：树木生长</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E9%97%AE%E9%A2%985%E6%A0%91%E6%9C%A8%E7%94%9F%E9%95%BF)

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">不同时长下，树木生长的5个阶段如何计算？</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这些问题看似简单，但</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">每一个都直接影响最终实现</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">。如果不提前明确，AI就只能自己猜，很可能猜错。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">我的回答</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E6%88%91%E7%9A%84%E5%9B%9E%E7%AD%94)

```plain
Copy code1. 时长范围：1-180分钟，快捷按钮15/25/45/60/90分钟
2. UI设计：主界面TimerView上，点击当前时长显示，弹出底部弹窗
3. 统计影响：显示实际时长 + 番茄钟等效（公式：向上取整duration/25）
4. 向后兼容：旧数据默认25分钟
5. 树木生长：按比例，公式 stageDuration = totalDuration / 5
```

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">AI生成提案</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#ai%E7%94%9F%E6%88%90%E6%8F%90%E6%A1%88)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">我回答完问题后，Claude Code自动生成了完整提案：</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">📄</font>\*\*\*\*<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**[**<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">proposal.md</font>**](http://proposal.md/)

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">为什么做这个功能？</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">要改哪些地方？</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">影响哪些模块？</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">向后兼容吗？</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">📄</font>\*\*\*\*<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**[**<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">design.md</font>**](http://design.md/)

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">技术决策：为什么用UserDefaults而不是SwiftData？</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">数据存储：为什么用”分钟”而不是”秒”？</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">算法说明：树木阶段如何计算？</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">📄</font>\*\*\*\*<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**[**<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">tasks.md</font>**](http://tasks.md/)

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">44个具体任务</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">分成9个阶段</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">包含8个测试任务</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">📁</font>\*\*\*\*<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> specs/</font>**

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">4个能力的规范增量</font>
  * <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">timer-session（计时会话）</font>
  * <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">tree-visualization（树木可视化）</font>
  * <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">statistics-tracking（统计追踪）</font>
  * <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">data-persistence（数据持久化）</font>

***

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Step 2：审查和验证</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#step-2%E5%AE%A1%E6%9F%A5%E5%92%8C%E9%AA%8C%E8%AF%81)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">生成提案后，我可以用命令行工具审查：</font>

```plain
# 查看活跃的变更
openspec list

# 验证提案格式
openspec validate add-custom-focus-duration

# 查看提案详情
openspec show add-custom-focus-duration
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">如果发现问题，继续和Claude Code对话：</font>

```plain
Copy codeCan you add more acceptance criteria for the duration picker UI?
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">或者：</font>

```plain
Copy codeThe tree growth calculation seems complex. Can we simplify it?
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">可以反复迭代，直到提案完全符合预期。</font>

***

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Step 3：实现功能</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#step-3%E5%AE%9E%E7%8E%B0%E5%8A%9F%E8%83%BD)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">提案审查通过后，执行实现命令：</font>

```plain
/openspec:apply add-custom-focus-duration
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Claude Code开始按照任务清单逐项实现：</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Phase 1：数据模型更新 </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#phase-1%E6%95%B0%E6%8D%AE%E6%A8%A1%E5%9E%8B%E6%9B%B4%E6%96%B0-)

```plain
// FocusSession.swift
var durationMinutes: Int = 25  // 新增字段
var pomodoroEquivalent: Double {
    ceil(Double(durationMinutes) / 25.0)  // 番茄钟等效
}
```

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Phase 2：时长持久化 </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#phase-2%E6%97%B6%E9%95%BF%E6%8C%81%E4%B9%85%E5%8C%96-)

```plain
// DurationPreference.swift
class DurationPreference {
    func save(_ duration: Int) { ... }
    func load() -> Int { ... }  // 默认25分钟
}
```

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Phase 3：计时服务增强 </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#phase-3%E8%AE%A1%E6%97%B6%E6%9C%8D%E5%8A%A1%E5%A2%9E%E5%BC%BA-)

```plain
// TimerService.swift
@Published var sessionDuration: Int

func calculateTreeStage(elapsed: Int, totalDuration: Int) -> Int {
    let stageDuration = totalDuration / 5  // 比例计算
    return min(elapsed / stageDuration, 4)
}
```

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Phase 4：时长选择器UI </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#phase-4%E6%97%B6%E9%95%BF%E9%80%89%E6%8B%A9%E5%99%A8ui-)

```plain
Copy code// DurationPickerView.swift
- 快捷按钮：15、25、45、60、90分钟
- 滑块：1-180分钟范围
- 文本输入：精确值
- 无障碍支持
```

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Phase 5：界面集成 </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#phase-5%E7%95%8C%E9%9D%A2%E9%9B%86%E6%88%90-)

```plain
// TimerView.swift
HStack {
    Image(systemName: "clock")
    Text("\\(duration) min")
}
.onTapGesture {
    showDurationPicker = true
}
```

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Phase 6：统计显示 </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#phase-6%E7%BB%9F%E8%AE%A1%E6%98%BE%E7%A4%BA-)

```plain
// StatsView.swift
Text("\\(hours)h \\(minutes)m (≈\\(pomodoroCount) 🍅)")
// 例如："2h 15m (≈5 🍅)"
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">整个过程中，Claude Code：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">严格按照规范实现</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">标记完成的任务</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">保持代码风格一致</font>

***

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">插曲：发现并修复Bug</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E6%8F%92%E6%9B%B2%E5%8F%91%E7%8E%B0%E5%B9%B6%E4%BF%AE%E5%A4%8Dbug)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">实现完成后，我进行手动测试，发现了一个问题：</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Bug描述</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：用户设置了1分钟时长后，下次想改时长，找不到设置入口了。原来的时长显示组件不够明显。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">我立即告诉Claude Code：</font>

```plain
Bug: After setting duration to 1 min, I can't find where to change it again.
Make the duration badge always visible and tappable.
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Claude Code理解问题后，增强了UI：</font>

```plain
// 修复后的设计
HStack {
    Image(systemName: "clock")
    Text("\\(duration)")
        .font(.system(size: 32, weight: .bold))  // 大字体
}
.padding()
.background(
    RoundedRectangle(cornerRadius: 12)
        .stroke(Color.green, lineWidth: 2)       // 绿色边框
        .shadow(radius: 4)                        // 阴影
)

Text("Tap to change")  // 提示文字
    .font(.caption)
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">修复后：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">时长数字变成32pt粗体（高度可见）</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">加了绿色边框和阴影（吸引注意）</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">加了”Tap to change”提示（明确交互）</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">重新测试，问题完美解决！</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这就是OpenSpec的优势</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：在归档前发现的问题，可以直接修复，不需要走复杂的流程。</font>

***

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Step 4：归档变更</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#step-4%E5%BD%92%E6%A1%A3%E5%8F%98%E6%9B%B4)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">所有测试通过后，执行归档命令：</font>

```plain
Copy codeopenspec archive add-custom-focus-duration --yes
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">或在Claude Code中：</font>

```plain
Copy code/openspec:archive add-custom-focus-duration
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">归档过程中，OpenSpec会：</font>

1. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">移动变更到归档</font>**

```plain
Copy codeopenspec/changes/add-custom-focus-duration/
  → openspec/changes/archive/2025-10-17-add-custom-focus-duration/
```

1. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">合并规范增量</font>**

```plain
Copy codespecs/timer-session/spec.md 更新（新增3个需求，9个场景）
specs/tree-visualization/spec.md 更新（新增1个需求，2个场景）
specs/statistics-tracking/spec.md 更新（新增2个需求，5个场景）
specs/data-persistence/spec.md 更新（新增2个需求，4个场景）
```

1. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">验证所有规范</font>**

```plain
Copy code✓ spec/data-persistence
✓ spec/statistics-tracking
✓ spec/timer-session
✓ spec/tree-visualization
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">归档完成后，Claude Code报告：</font>

```plain
Copy code✅ Archive Complete: Custom Focus Duration Feature

- 6 new files created
- 8 existing files updated
- 43/53 tasks completed (core functionality 100%)
- All validations passing
```

***

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">五、OpenSpec的核心优势</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E4%BA%94openspec%E7%9A%84%E6%A0%B8%E5%BF%83%E4%BC%98%E5%8A%BF)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">通过这个完整案例，我深刻体会到OpenSpec的价值：</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">1. 需求明确性</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#1-%E9%9C%80%E6%B1%82%E6%98%8E%E7%A1%AE%E6%80%A7)

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">传统方式</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：</font>

```plain
Copy code我：给我加个自定义时长功能
AI：好的（开始写代码）
我：等等，我想要滑块和快捷按钮
AI：好的（改代码）
我：还要显示番茄钟个数
AI：好的（再改代码）
```

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">OpenSpec方式</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：</font>

```plain
Copy code我：/openspec:proposal 自定义时长
AI：请先回答5个问题...
我：（回答详细需求）
AI：生成完整提案
我：审查通过
AI：开始实现（一次到位）
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">在写代码前把需求说清楚，避免了反复修改的麻烦。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">2. 技术决策有据可查</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#2-%E6%8A%80%E6%9C%AF%E5%86%B3%E7%AD%96%E6%9C%89%E6%8D%AE%E5%8F%AF%E6%9F%A5)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">每个设计选择都有记录：</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">为什么用UserDefaults而不是SwiftData？</font>**

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">时长偏好是简单的Int值</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">不需要复杂查询</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">UserDefaults更轻量快速</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">为什么用”分钟”而不是”秒”？</font>**

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">人类可读（25分钟 vs 1500秒）</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">与UI一致</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">减少转换错误</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">6个月后，当你想改进这个功能时，翻看</font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">design.md</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">，立刻就能理解当时为什么这么做。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">3. 可追溯的完整历史</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#3-%E5%8F%AF%E8%BF%BD%E6%BA%AF%E7%9A%84%E5%AE%8C%E6%95%B4%E5%8E%86%E5%8F%B2)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">每个功能变更都有完整记录：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">什么时候加的？（2025-10-17）</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">为什么加？（用户需要灵活的时长）</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">怎么实现的？（44个任务的详细步骤）</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">遇到什么问题？（UI可见性bug及修复）</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这对团队协作和知识传递非常有价值。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">4. 迭代友好</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#4-%E8%BF%AD%E4%BB%A3%E5%8F%8B%E5%A5%BD)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">在归档前发现的问题，可以直接修复：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">不需要创建新提案</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">修复记录在同一变更中</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">保持变更的完整性</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这种灵活性让OpenSpec非常适合实际开发。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">5. 规范即文档</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#5-%E8%A7%84%E8%8C%83%E5%8D%B3%E6%96%87%E6%A1%A3)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">归档后，项目自动拥有了高质量的文档：</font>

```plain
Copy codeopenspec/specs/timer-session/spec.md

## Requirement: Custom Duration Selection
The system SHALL allow users to select focus duration
between 1 and 180 minutes.

### Scenario: Quick button selection
- WHEN user taps a quick-select button (15/25/45/60/90)
- THEN the duration is immediately set to that value
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这些文档：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">结构化（需求、场景）</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">可验证（通过测试确保实现符合规范）</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">易维护（与代码同步演进）</font>

***

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">六、OpenSpec适合什么场景？</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%85%ADopenspec%E9%80%82%E5%90%88%E4%BB%80%E4%B9%88%E5%9C%BA%E6%99%AF)

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">最适合的场景</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E6%9C%80%E9%80%82%E5%90%88%E7%9A%84%E5%9C%BA%E6%99%AF)

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">1. 改进现有项目（1→n）</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#1-%E6%94%B9%E8%BF%9B%E7%8E%B0%E6%9C%89%E9%A1%B9%E7%9B%AE1n)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">OpenSpec专门为此设计。它的双文件夹模型（</font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">specs/</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">存放当前状态，</font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">changes/</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">存放提议更新）让复杂的功能演进变得清晰可管理。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">2. 需要高质量的场景</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#2-%E9%9C%80%E8%A6%81%E9%AB%98%E8%B4%A8%E9%87%8F%E7%9A%84%E5%9C%BA%E6%99%AF)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">当你需要：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">准确的实现</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">清晰的文档</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">可追溯的决策</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">团队协作</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">OpenSpec能提供规范化的支持。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">3. 使用AI编码助手</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#3-%E4%BD%BF%E7%94%A8ai%E7%BC%96%E7%A0%81%E5%8A%A9%E6%89%8B)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">OpenSpec的核心就是帮助AI更好地理解和实现你的需求。如果你已经在用Claude Code、Cursor等工具，OpenSpec会让你的效率翻倍。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">不太适合的场景</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E4%B8%8D%E5%A4%AA%E9%80%82%E5%90%88%E7%9A%84%E5%9C%BA%E6%99%AF)

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">1. 原型快速验证</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#1-%E5%8E%9F%E5%9E%8B%E5%BF%AB%E9%80%9F%E9%AA%8C%E8%AF%81)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">如果你只是想快速试试一个想法，直接让AI写可能更快。OpenSpec的流程会增加一些前期时间（虽然能节省后期时间）。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">2. 一次性脚本</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#2-%E4%B8%80%E6%AC%A1%E6%80%A7%E8%84%9A%E6%9C%AC)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">写个几十行的小工具脚本，不需要OpenSpec的完整流程。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">3. 需求极度不明确</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#3-%E9%9C%80%E6%B1%82%E6%9E%81%E5%BA%A6%E4%B8%8D%E6%98%8E%E7%A1%AE)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">如果你连大概想要什么都不知道，OpenSpec帮不了你。它的价值在于帮你</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">把想法变成清晰的规范</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">，而不是帮你</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">想出想法</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">。</font>

***

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">七、上手OpenSpec：5分钟快速开始</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E4%B8%83%E4%B8%8A%E6%89%8Bopenspec5%E5%88%86%E9%92%9F%E5%BF%AB%E9%80%9F%E5%BC%80%E5%A7%8B)

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">1. 安装（1分钟）</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#1-%E5%AE%89%E8%A3%851%E5%88%86%E9%92%9F)

```plain
Copy codenpm install -g @fission-ai/openspec@latest
```

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">2. 初始化项目（2分钟）</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#2-%E5%88%9D%E5%A7%8B%E5%8C%96%E9%A1%B9%E7%9B%AE2%E5%88%86%E9%92%9F)

```plain
Copy codecd your-project
openspec init
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">选择你使用的AI工具，完成配置。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">3. 填充项目信息（2分钟）</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#3-%E5%A1%AB%E5%85%85%E9%A1%B9%E7%9B%AE%E4%BF%A1%E6%81%AF2%E5%88%86%E9%92%9F)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">让AI帮你填写</font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">openspec/project.md</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">，描述项目背景。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">4. 创建第一个提案（开始真正的工作）</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#4-%E5%88%9B%E5%BB%BA%E7%AC%AC%E4%B8%80%E4%B8%AA%E6%8F%90%E6%A1%88%E5%BC%80%E5%A7%8B%E7%9C%9F%E6%AD%A3%E7%9A%84%E5%B7%A5%E4%BD%9C)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">在你的AI编码助手中：</font>

```plain
Copy code/openspec:proposal [你想要的功能]
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">或者用自然语言：</font>

```plain
Copy codeI want to add [功能描述]. Please create an OpenSpec proposal.
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">就这么简单！</font>

***

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">八、一些使用建议</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%85%AB%E4%B8%80%E4%BA%9B%E4%BD%BF%E7%94%A8%E5%BB%BA%E8%AE%AE)

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">建议1：第一个提案从小功能开始</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%BB%BA%E8%AE%AE1%E7%AC%AC%E4%B8%80%E4%B8%AA%E6%8F%90%E6%A1%88%E4%BB%8E%E5%B0%8F%E5%8A%9F%E8%83%BD%E5%BC%80%E5%A7%8B)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">不要一上来就用OpenSpec做大重构。先从一个小功能入手，熟悉流程：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">添加一个新字段</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">修改一个UI组件</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">优化一个算法</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">走完一遍完整流程后，你会对OpenSpec有更深的理解。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">建议2：认真对待澄清问题</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%BB%BA%E8%AE%AE2%E8%AE%A4%E7%9C%9F%E5%AF%B9%E5%BE%85%E6%BE%84%E6%B8%85%E9%97%AE%E9%A2%98)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">当AI问你问题时，不要敷衍回答。这些问题往往直指需求的核心模糊点。花几分钟认真回答，能节省几小时的返工时间。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">建议3：提案阶段多迭代</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%BB%BA%E8%AE%AE3%E6%8F%90%E6%A1%88%E9%98%B6%E6%AE%B5%E5%A4%9A%E8%BF%AD%E4%BB%A3)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">不要急着批准提案去写代码。仔细审查：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">需求是否完整？</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">技术方案是否合理？</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">有没有遗漏的边界情况？</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">提案阶段改起来很容易，代码写了再改就麻烦了。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">建议4：测试后再归档</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%BB%BA%E8%AE%AE4%E6%B5%8B%E8%AF%95%E5%90%8E%E5%86%8D%E5%BD%92%E6%A1%A3)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">归档意味着”这个变更完成了”。在归档前：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">手动测试核心流程</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">确保没有明显bug</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">验证规范都已实现</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">归档后虽然还能修复问题（创建新提案），但保持变更的原子性会让历史记录更清晰。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">建议5：规范文档是活的</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%BB%BA%E8%AE%AE5%E8%A7%84%E8%8C%83%E6%96%87%E6%A1%A3%E6%98%AF%E6%B4%BB%E7%9A%84)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">OpenSpec生成的规范不是一次性的。每次添加功能，规范都会更新。几个月后，你会拥有一份完整、准确、与代码同步的项目文档。</font>

***

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">九、OpenSpec vs 其他方案</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E4%B9%9Dopenspec-vs-%E5%85%B6%E4%BB%96%E6%96%B9%E6%A1%88)

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">vs 直接让AI写代码</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#vs-%E7%9B%B4%E6%8E%A5%E8%AE%A9ai%E5%86%99%E4%BB%A3%E7%A0%81)

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">直接方式</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">优点：快</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">缺点：容易偏离需求，反复修改，没有文档</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">OpenSpec</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">优点：准确、可追溯、有文档</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">缺点：前期多花几分钟澄清需求</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">结论</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：小脚本用直接方式，正式项目用OpenSpec。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">vs 传统需求文档</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#vs-%E4%BC%A0%E7%BB%9F%E9%9C%80%E6%B1%82%E6%96%87%E6%A1%A3)

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">传统文档</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">（Word/Confluence）：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">文档和代码分离</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">容易过时</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">难以和AI集成</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">OpenSpec</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">文档和代码同步</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">自动更新</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">AI原生支持</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">结论</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：OpenSpec是为AI时代设计的需求管理方式。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">vs spec-kit / Kiro</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#vs-spec-kit--kiro)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这些都是类似的规范驱动工具：</font>

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">spec-kit</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：擅长新项目（0→1）</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Kiro</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：更新分散在多个文件</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">OpenSpec</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：专为改进现有项目设计（1→n），变更集中管理</font>

***

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">十、总结</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%8D%81%E6%80%BB%E7%BB%93)

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">OpenSpec解决的核心问题</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#openspec%E8%A7%A3%E5%86%B3%E7%9A%84%E6%A0%B8%E5%BF%83%E9%97%AE%E9%A2%98)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">AI编码助手很强大，但当需求模糊时，它会变得不可预测。OpenSpec通过引入</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">规范驱动的工作流</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">，确保在写代码前，人和AI就要做什么达成一致。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">四步工作流</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%9B%9B%E6%AD%A5%E5%B7%A5%E4%BD%9C%E6%B5%81)

1. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">起草提案</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 明确需求，AI询问关键问题</font>
2. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">审查对齐</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 人和AI共同审查，反复迭代</font>
3. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">实现任务</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- AI按批准的规范写代码</font>
4. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">归档更新</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 变更归档，规范文档自动更新</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">核心价值</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E6%A0%B8%E5%BF%83%E4%BB%B7%E5%80%BC)

* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">准确性</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：需求明确后，AI实现准确</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">可追溯性</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：每个决策都有记录</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">文档化</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：规范自动生成，与代码同步</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">团队友好</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：清晰的提案便于协作和交接</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">适用场景</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E9%80%82%E7%94%A8%E5%9C%BA%E6%99%AF)

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 改进现有项目</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 需要高质量实现</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 使用AI编码助手</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 团队协作开发</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">❌</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 快速原型验证</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">❌</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 一次性小脚本</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">我的体验</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E6%88%91%E7%9A%84%E4%BD%93%E9%AA%8C)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">作为第一次使用OpenSpec的开发者，整个过程给我最大的感受是：</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这才是AI时代应该有的开发方式</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">不是让AI瞎猜，而是：</font>

1. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">我说清楚想要什么</font>
2. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">AI帮我把想法变成规范</font>
3. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">我们一起审查确认</font>
4. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">AI精确实现</font>
5. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">留下完整文档</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这个流程可能比直接写代码多花10分钟，但节省的是几小时的返工和几周后”这代码到底为什么这么写”的困惑。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">开始使用</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%BC%80%E5%A7%8B%E4%BD%BF%E7%94%A8)

```plain
Copy codenpm install -g @fission-ai/openspec@latest
cd your-project
openspec init
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">然后在你的AI编码助手中：</font>

```plain
Copy code/openspec:proposal [你的第一个功能]
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">试一次，你会明白我在说什么。</font>

***

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">写在最后</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E5%86%99%E5%9C%A8%E6%9C%80%E5%90%8E)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">AI正在改变软件开发的方式，但它不是魔法。AI需要清晰的指令，需要结构化的输入，需要人类的引导。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">OpenSpec不是让AI变得更智能，而是让</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">我们和AI的协作变得更高效</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">它像是人和AI之间的”协议”：我们用结构化的方式表达需求，AI用规范化的方式实现功能。双方都知道对方在说什么，这才是真正的协作。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">如果你也在用AI编码助手，如果你也遇到过需求理解偏差的问题，如果你也希望代码有清晰的文档和历史，那么，试试OpenSpec吧。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">也许它就是你一直在找的那个”更好的方式”。</font>

***

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">相关链接</font>**

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">GitHub:</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">https://github.com/Fission-AI/OpenSpec</font>](https://github.com/Fission-AI/OpenSpec)

***

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">🚀</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">笔记</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/llms/introduce-OpenSpec#%E7%AC%94%E8%AE%B0)

```plain
Copy code
# 0️⃣安装OpenSpec
npm install -g @fission-ai/openspec@latest

# 1️⃣新增自定义时长
/openspec:proposal Custom Focus Duration

# 2️⃣继续输入回答

1. Duration Options: Support 1-180 minutes range. Quick buttons: 15/25/45/60/90 min. 
   Users can also use slider or text input for any value in range.

2. Tree Growth Stages: Scale proportionally. Formula: stageDuration = totalDuration / 5
   Example: 45-min session → stages every 9 minutes

3. Duration Selection UI: Picker on main TimerView (tap current duration display).
   Opens as bottom sheet with quick buttons + slider + text input. NOT in Settings.

4. Duration Persistence: Remember last selected duration using UserDefaults.
   First launch defaults to 25 min, then uses user's last choice.

5. Statistics Impact: Show both actual time AND equivalent Pomodoro count.
   Formula: pomodoroCount = ceil(duration / 25.0)
   Example display: "45 min (≈2 🍅)"

Data Model:
- Store: duration (Int), startTime (Date), taskTag (String?)
- Calculate: pomodoroEquivalent (computed property)

Please proceed with creating the proposal based on these specifications.

# 3️⃣查看提议概要
## 1.直接查看文件
cat openspec/changes/add-custom-focus-duration/proposal.md
cat openspec/changes/add-custom-focus-duration/tasks.md

## 2.在编辑器中查看
code openspec/changes/add-custom-focus-duration/

## 3.使用交互式仪表板
openspec view

## 重点查看的文件：

proposal.md - 了解功能动机和整体设计
tasks.md - 确认任务分解是否合理
specs/ui-components/spec.md - UI交互细节
specs/timer-management/spec.md - 核心计时逻辑

# 4️⃣调整提议（如果需要）
## 1.直接在Claude Code中说：
请修改 add-custom-focus-duration 提议：
- 将最大时长从180分钟改为120分钟
- 添加一个新的快捷按钮：30分钟

## 2.手动编辑文件
nano openspec/changes/add-custom-focus-duration/proposal.md

# 5️⃣实施
/openspec:apply add-custom-focus-duration

## Claude Code会做什么：
读取 tasks.md 中的所有任务
按顺序逐个实施
自动标记完成的任务 ✓
生成或修改代码文件
遇到问题时询问你的决策

# 6️⃣测试

# 7️⃣测试全部通过（推荐路径）
## 步骤 1：归档 OpenSpec 变更 (1分钟)
### 方式A：使用 Claude Code（推荐）
### 在 Claude Code 中输入：
/openspec:archive add-custom-focus-duration

### 方式B：使用终端
### 在项目根目录执行
openspec archive add-custom-focus-duration --yes

# 8️⃣提交代码（2分钟）
git add .
git commit -m "feat: add custom focus duration feature

- Support 1-180 minute custom durations
- Quick-select buttons and slider input
- Proportional tree growth
- Persistent preferences
- Enhanced statistics with Pomodoro tracking

Implemented via OpenSpec workflow"

git push origin main
```

<https://www.aivi.fyi/llms/introduce-OpenSpec>


> 更新: 2025-11-03 12:42:03  
> 原文: <https://www.yuque.com/lixinsi/vnere7/knbdv0ihpa5biqth>