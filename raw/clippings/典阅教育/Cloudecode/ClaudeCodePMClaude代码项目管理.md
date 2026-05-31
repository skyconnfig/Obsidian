# Claude Code PM  Claude 代码项目管理

```sql
git clone https://github.com/automazeio/ccpm.git . && rmdir /s /q .git

```

### <font style="color:rgb(31, 35, 40);">1. 产品规划阶段</font>

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">/pm:prd-new feature-name</font>

<font style="color:rgb(31, 35, 40);">Launches comprehensive brainstorming to create a Product Requirements Document capturing vision, user stories, success criteria, and constraints.</font><font style="color:rgb(31, 35, 40);">\ </font><font style="color:rgb(31, 35, 40);">启动全面头脑风暴，创建产品需求文档，捕捉愿景、用户故事、成功标准和约束。</font>

**<font style="color:rgb(31, 35, 40);">Output:</font>**<font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.claude/prds/feature-name.md</font></code><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">输出：</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.claude/prds/feature-name.md</font></code>

### <font style="color:rgb(31, 35, 40);">2. Implementation Planning Phase</font><font style="color:rgb(31, 35, 40);">

</font><font style="color:rgb(31, 35, 40);">2. 实施规划阶段</font> <font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">/pm:prd-parse feature-name</font>

<font style="color:rgb(31, 35, 40);">Transforms PRD into a technical implementation plan with architectural decisions, technical approach, and dependency mapping.</font><font style="color:rgb(31, 35, 40);">\ </font><font style="color:rgb(31, 35, 40);">将 PRD 转化为技术实施计划，包括架构决策、技术方法和依赖关系映射。</font>

**<font style="color:rgb(31, 35, 40);">Output:</font>**<font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.claude/epics/feature-name/epic.md</font></code><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">输出：</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.claude/epics/feature-name/epic.md</font></code>

### <font style="color:rgb(31, 35, 40);">3. Task Decomposition Phase</font><font style="color:rgb(31, 35, 40);">

</font><font style="color:rgb(31, 35, 40);">3. 任务分解阶段</font> <font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">/pm:epic-decompose feature-name</font>

<font style="color:rgb(31, 35, 40);">Breaks epic into concrete, actionable tasks with acceptance criteria, effort estimates, and parallelization flags.</font><font style="color:rgb(31, 35, 40);">\ </font><font style="color:rgb(31, 35, 40);">将史诗拆分为具体可执行的任务，包含验收标准、工时估算和并行化标志。</font>

**<font style="color:rgb(31, 35, 40);">Output:</font>**<font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.claude/epics/feature-name/[task].md</font></code><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">输出：</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.claude/epics/feature-name/[task].md</font></code>

### <font style="color:rgb(31, 35, 40);">4. GitHub Synchronization</font><font style="color:rgb(31, 35, 40);">

</font><font style="color:rgb(31, 35, 40);">4. GitHub 同步</font>

```plain
/pm:epic-sync feature-name
# Or for confident workflows:
/pm:epic-oneshot feature-name
```

<font style="color:rgb(31, 35, 40);">Pushes epic and tasks to GitHub as issues with appropriate labels and relationships.</font><font style="color:rgb(31, 35, 40);">\ </font><font style="color:rgb(31, 35, 40);">将史诗和任务推送到 GitHub 作为带适当标签和关系的议题。</font>

### <font style="color:rgb(31, 35, 40);">5. Execution Phase</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">5. 执行阶段</font>

```plain
/pm:issue-start 1234  # Launch specialized agent
/pm:issue-sync 1234   # Push progress updates
/pm:next             # Get next priority task
```

<font style="color:rgb(31, 35, 40);">Specialized agents implement tasks while maintaining progress updates and an audit trail.</font><font style="color:rgb(31, 35, 40);">\ </font><font style="color:rgb(31, 35, 40);">专业代理执行任务时，会保持进度更新和审计追踪。</font>

## <font style="color:rgb(31, 35, 40);">Command Reference</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">命令参考</font>

**<font style="color:rgb(26, 127, 55);">Tip</font>****<font style="color:rgb(26, 127, 55);">  </font>****<font style="color:rgb(26, 127, 55);">提示</font>**

<font style="color:rgb(31, 35, 40);">Type</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:help</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">for a concise command summary</font><font style="color:rgb(31, 35, 40);">\ </font><font style="color:rgb(31, 35, 40);">输入</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:help</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">获取简洁的命令概要</font>

### <font style="color:rgb(31, 35, 40);">Initial Setup</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">初始设置</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:init</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Install dependencies and configure GitHub</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:init</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 安装依赖并配置 GitHub</font>

### <font style="color:rgb(31, 35, 40);">PRD Commands</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">PRD 命令</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:prd-new</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Launch brainstorming for new product requirement</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:prd-new</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 启动新产品需求的头脑风暴</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:prd-parse</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Convert PRD to implementation epic</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:prd-parse</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 将 PRD 转换为实施史诗</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:prd-list</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- List all PRDs</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:prd-list</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 列出所有 PRD</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:prd-edit</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Edit existing PRD</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:prd-edit</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 编辑现有 PRD</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:prd-status</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Show PRD implementation status</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:prd-status</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 显示 PRD 实施状态</font>

### <font style="color:rgb(31, 35, 40);">Epic Commands</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">史诗命令</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-decompose</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Break epic into task files</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-decompose</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 将史诗拆分为任务文件</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-sync</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Push epic and tasks to GitHub</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-sync</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 将史诗和任务推送到 GitHub</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-oneshot</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Decompose and sync in one command</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-oneshot</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 通过一条命令分解和同步</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-list</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- List all epics</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-list</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 列出所有史诗</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-show</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Display epic and its tasks</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-show</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 显示史诗及其任务</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-close</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Mark epic as complete</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-close</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 将史诗标记为完成</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-edit</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Edit epic details</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-edit</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 编辑史诗详情</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-refresh</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Update epic progress from tasks</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:epic-refresh</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 更新史诗进度来自任务</font>

### <font style="color:rgb(31, 35, 40);">Issue Commands</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">发布指令</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-show</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Display issue and sub-issues</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-show</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 显示问题和子问题</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-status</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Check issue status</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-status</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 检查问题状态</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-start</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Begin work with specialized agent</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-start</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 使用专用代理开始工作</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-sync</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Push updates to GitHub</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-sync</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 将更新推送到 GitHub</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-close</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Mark issue as complete</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-close</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 将问题标记为完成</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-reopen</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Reopen closed issue</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-reopen</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 重新打开已关闭的问题</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-edit</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Edit issue details</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:issue-edit</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 编辑问题详情</font>

### <font style="color:rgb(31, 35, 40);">Workflow Commands</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">工作流命令</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:next</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Show next priority issue with epic context</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:next</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 显示具有史诗上下文的下一个优先级问题</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:status</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Overall project dashboard</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:status</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 整体项目看板</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:standup</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Daily standup report</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:standup</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 每日站会报告</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:blocked</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Show blocked tasks</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:blocked</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 显示阻塞任务</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:in-progress</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- List work in progress</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:in-progress</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 列出进行中的工作</font>

### <font style="color:rgb(31, 35, 40);">Sync Commands</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">同步命令</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:sync</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Full bidirectional sync with GitHub</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:sync</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 与 GitHub 进行完全双向同步</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:import</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Import existing GitHub issues</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:import</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 导入现有的 GitHub 问题</font>

### <font style="color:rgb(31, 35, 40);">Maintenance Commands</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">维护命令</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:validate</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Check system integrity</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:validate</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 检查系统完整性</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:clean</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Archive completed work</font><font style="color:rgb(31, 35, 40);">\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:clean</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 已归档完成的工作</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:search</font></code><font style="color:rgb(31, 35, 40);"> - Search across all content\ </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">/pm:search</font></code><font style="color:rgb(31, 35, 40);"> - 搜索所有内容</font>

```sql
cd path/to/your/project/
iwr -useb https://raw.githubusercontent.com/automazeio/ccpm/main/ccpm.bat | iex
```

<https://github.com/automazeio/ccpm>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">如果只是个人写一个小脚本，AI 已经很好用了。但当一个团队想要交付一个功能完善、可追溯、可协作的大型项目时，就会遇到如下问题：</font>

* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">上下文容易丢失</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：AI 一次只能处理有限上下文，复杂项目需要反复补充说明。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">任务容易阻塞</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：传统开发往往是串行执行，一个环节没完成，后续都得等。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">代码质量不稳定</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：AI 生成的代码有时过于随意，缺乏规范和可追溯性。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">协作成本高</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：AI 和人类开发者之间如何切换和同步进展？</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这正是</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">CCPM（Claude Code Project Management）</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">想要解决的问题。</font>

***

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">什么是 CCPM？</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#%E4%BB%80%E4%B9%88%E6%98%AF-ccpm)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">CCPM，全称</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Claude Code Project Management</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">，是一个开源的项目管理框架，专为</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Claude Code 用户和 AI 辅助开发团队</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">设计。它通过 GitHub Issues 与 Git worktrees 的组合，将传统的需求文档、技术设计、任务拆分、代码生成和交付过程，完整串联成一条可追溯、可协作、可自动化的开发流水线。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">一句话总结：</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">👉</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> CCPM 可以把</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">PRD（产品需求文档） → Epic（技术方案） → Issues（任务拆分） → Code（生产代码）</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">全流程自动化执行，并确保</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">上下文不丢失、过程可追溯、结果高质量</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">。</font>

***

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">CCPM 的核心优势</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#ccpm-%E7%9A%84%E6%A0%B8%E5%BF%83%E4%BC%98%E5%8A%BF)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">相比传统的开发模式，CCPM 带来的优势非常明显：</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">1. 上下文永不丢失</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#1-%E4%B8%8A%E4%B8%8B%E6%96%87%E6%B0%B8%E4%B8%8D%E4%B8%A2%E5%A4%B1)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">CCPM 会在本地为每个任务维护独立上下文，存放在</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">.claude/</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">文件夹中。无论是 AI Agent 还是人类开发者，都能随时调取历史记录，不需要来回补充背景信息。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这极大地减少了“反复解释”的时间浪费，用户反馈显示</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">上下文切换时间可减少 89%</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">2. 并行开发，效率翻倍</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#2-%E5%B9%B6%E8%A1%8C%E5%BC%80%E5%8F%91%E6%95%88%E7%8E%87%E7%BF%BB%E5%80%8D)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">在 CCPM 中，大任务会被拆分成多个独立任务（issues），标记为</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">parallel: true</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">后，可以交给多个 AI Agent 或团队成员同时进行。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这意味着你可以让</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">5-8 个任务并行执行</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">，而不是傻等前一个任务完成。最终的交付速度，通常比传统串行开发快</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">2-3 倍</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">3. 杜绝「Vibe Coding」</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#3-%E6%9D%9C%E7%BB%9Dvibe-coding)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">所谓 Vibe Coding，就是“凭感觉写代码”。这在 AI 生成代码的场景下尤其常见，容易导致 bug 和返工。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">CCPM 强调</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">每一行代码必须可追溯到 PRD → Epic → Issue 的源头</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">，从根本上保证了代码的合理性和质量。据用户反馈，bug 率降低了</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">75%</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">4. 无缝协作，天然支持分布式团队</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#4-%E6%97%A0%E7%BC%9D%E5%8D%8F%E4%BD%9C%E5%A4%A9%E7%84%B6%E6%94%AF%E6%8C%81%E5%88%86%E5%B8%83%E5%BC%8F%E5%9B%A2%E9%98%9F)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">所有任务和进展会自动同步到</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">GitHub Issues</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">，这成为团队的“单一真相中心”。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">人类和 AI 可以随时切换执行任务，不会出现“我做了一半，AI 接不上”或者“AI 写的代码没人能看懂”的情况，非常适合远程和分布式团队。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">5. 开源、可扩展、隐私友好</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#5-%E5%BC%80%E6%BA%90%E5%8F%AF%E6%89%A9%E5%B1%95%E9%9A%90%E7%A7%81%E5%8F%8B%E5%A5%BD)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">CCPM 完全开源（MIT 协议），支持本地运行。你可以将它与自己的 CI/CD、文档生成器，甚至其他 AI Agent 通信协议（ACP）结合，实现高度定制化。</font>

***

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">CCPM 的使用场景</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#ccpm-%E7%9A%84%E4%BD%BF%E7%94%A8%E5%9C%BA%E6%99%AF)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">那么，CCPM 适合用在什么样的团队和项目里呢？</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 1. 从 0 到 1 的功能开发</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#-1-%E4%BB%8E-0-%E5%88%B0-1-%E7%9A%84%E5%8A%9F%E8%83%BD%E5%BC%80%E5%8F%91)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">假设你要开发一个全新的功能（比如一个</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Todo List 应用</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">），只需要：</font>

1. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">用</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:prd-new todo-list</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">生成产品需求文档</font>
2. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">用</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:prd-parse todo-list</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">转成技术方案</font>
3. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">用</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-decompose todo-list</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">拆解为任务</font>
4. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">启动 AI Agents 并行执行</font>
5. <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-merge todo-list</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">一键合并代码到主分支</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">最终，你会得到一个</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">可直接上线的完整应用</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">，包含 HTML、CSS、JS、测试和文档。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 2. 复杂项目的多团队协作</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#-2-%E5%A4%8D%E6%9D%82%E9%A1%B9%E7%9B%AE%E7%9A%84%E5%A4%9A%E5%9B%A2%E9%98%9F%E5%8D%8F%E4%BD%9C)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">在大型项目中，不同团队负责不同模块，AI 和人类开发者需要频繁切换。CCPM 的上下文管理和 GitHub 集成，保证了任务不会丢失、信息不会断层。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 3. 想要提升研发效率的 AI 驱动团队</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#-3-%E6%83%B3%E8%A6%81%E6%8F%90%E5%8D%87%E7%A0%94%E5%8F%91%E6%95%88%E7%8E%87%E7%9A%84-ai-%E9%A9%B1%E5%8A%A8%E5%9B%A2%E9%98%9F)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">如果你正在尝试</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">AI 结对编程（Pair Programming）</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">或</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">AI 辅助 Scrum 开发</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">，CCPM 可以作为核心工作流框架，帮你把碎片化的 AI 交互变成系统化的工程实践。</font>

***

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">一个案例：Todo List 开发</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#%E4%B8%80%E4%B8%AA%E6%A1%88%E4%BE%8Btodo-list-%E5%BC%80%E5%8F%91)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">在官方示例中，一个</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Todo List 应用</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">通过 CCPM 被完整开发：</font>

* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">HTML 架构</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：符合语义化、可访问性标准</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">CSS 系统</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：响应式布局，支持移动端</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">核心 JS 功能</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：CRUD + LocalStorage 持久化</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">用户体验优化</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：键盘快捷键 + 动画效果</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">跨浏览器测试</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：通过率 93.6%，WCAG 2.1 AA 合规</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">整个过程</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">3.5 小时完成</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">，最终产出</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">7500+ 行代码</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">和完整测试文档，达到可直接生产部署的标准。</font>

***

## <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">总结</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#%E6%80%BB%E7%BB%93)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">在 AI 编程逐渐成为主流的今天，CCPM 提供了一种全新的思路：</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">它不是替代开发者，而是通过</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">上下文管理 + 并行执行 + 可追溯性 + 自动化协作</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">，让人类与 AI 的合作更加高效、可靠、专业。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">如果你是：</font>

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">想要快速交付产品的创业团队</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">想探索 AI 辅助敏捷开发的新方式</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">或者是分布式远程团队，想解决协作和上下文丢失的问题</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">👉</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 那么 CCPM 将会是你非常值得尝试的一款工具。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">项目地址：</font>

[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">https://github.com/automazeio/ccpm</font>](https://github.com/automazeio/ccpm)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">未来，随着 AI 辅助开发工具不断进化，像 CCPM 这样连接</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">需求 → 计划 → 执行 → 测试 → 部署</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">的工作流系统，或许会成为开发团队的标配。</font>

***

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">⚡</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">️安装方式</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#%EF%B8%8F%E5%AE%89%E8%A3%85%E6%96%B9%E5%BC%8F)

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font>\*\*\*\*<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Unix/Linux/macOS (direct commands)</font>**

```plain
git clone https://github.com/automazeio/ccpm.git . && rm -rf .git
```

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font>\*\*\*\*<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Windows (cmd)</font>**

```plain
git clone https://github.com/automazeio/ccpm.git . && rmdir /s /q .git
```

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✅</font>\*\*\*\*<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Windows (PowerShell)</font>**

```plain
git clone https://github.com/automazeio/ccpm.git .; Remove-Item -Recurse -Force .git
```

***

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">⏺</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>***<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">📚</font>**\_\_**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> Claude Code PM 帮助文档（中文版）</font>***[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-PM#--claude-code-pm-%E5%B8%AE%E5%8A%A9%E6%96%87%E6%A1%A3%E4%B8%AD%E6%96%87%E7%89%88)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">🎯</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">快速开始工作流</font>**

1. <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:prd-new</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 创建一个新的 PRD（产品需求文档）</font>
2. <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:prd-parse</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 将 PRD 转换为 Epic（实现方案）</font>
3. <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-decompose</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 将 Epic 拆分为任务</font>
4. <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-sync</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 同步到 GitHub</font>
5. <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-start</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 启动并行执行</font>

***

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">📄</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">PRD 命令</font>**

* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:prd-new</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 新建一个产品需求文档（头脑风暴入口）</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:prd-parse</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 将 PRD 转换为实现方案（Epic）</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:prd-list</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 列出所有 PRD</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:prd-edit</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 编辑现有 PRD</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:prd-status</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 查看 PRD 的实现进度</font>

***

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">📚</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Epic 命令</font>**

* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-decompose</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 将 Epic 拆分为任务文件</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-sync</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 同步 Epic 和任务到 GitHub</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-oneshot</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 一键完成拆分和同步</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-list</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 列出所有 Epic</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-show</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 展示 Epic 及其任务</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-status [name]</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 查看某个 Epic 的进度</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-close</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 标记 Epic 为已完成</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-edit</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 编辑 Epic 详情</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-refresh</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 根据任务更新 Epic 进度</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:epic-start</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 启动并行 Agent 执行</font>

***

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">📝</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Issue 命令</font>**

* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:issue-show</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 展示某个 Issue 及子任务</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:issue-status</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 查看 Issue 状态</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:issue-start</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 启动专用 Agent 开始处理 Issue</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:issue-sync</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 将 Issue 更新同步到 GitHub</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:issue-close</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 标记 Issue 为完成</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:issue-reopen</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 重新打开已关闭的 Issue</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:issue-edit</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 编辑 Issue 详情</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:issue-analyze</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 分析 Issue，发现可并行的子任务</font>

***

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">🔄</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">工作流命令</font>**

* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:next</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 显示下一个优先级最高的任务</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:status</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 查看整个项目的总体进度面板</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:standup</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 生成每日站会报告</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:blocked</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 显示所有被阻塞的任务</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:in-progress</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 列出正在进行中的任务</font>

***

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">🔗</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">同步命令</font>**

* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:sync</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 与 GitHub 双向完全同步</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:import</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 导入已有的 GitHub Issues</font>

***

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">🔧</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">维护命令</font>**

* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:validate</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 检查系统完整性</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:clean</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 归档已完成的工作</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:search</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 全局搜索所有内容</font>

***

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">⚙️</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">设置命令</font>**

* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:init</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 安装依赖并配置 GitHub</font>
* <code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:help</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">—— 显示帮助信息</font>

***

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">💡</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">小贴士</font>**

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">使用</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:next</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">快速找到可做的任务</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">使用</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/pm:status</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">查看项目整体情况</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">标准 Epic 流程：</font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">prd-new → prd-parse → epic-decompose → epic-sync</font></code>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">查看 </font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">README.md</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 获取完整文档</font>


> 更新: 2025-09-06 22:49:41  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/gqvyrhyygc2hkazb>