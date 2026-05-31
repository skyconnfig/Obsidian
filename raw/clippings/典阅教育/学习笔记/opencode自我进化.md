# opencode自我进化

完整备份方案  
步骤 1：创建 GitHub 私有仓库

# 在 GitHub 创建名为 "my-instincts-backup" 的私有仓库
# 网址：[https://github.com/new](https://github.com/new)
# 选择 "Private"，不要勾选 "Add a README file"
步骤 2：克隆到本地  
git clone [https://github.com/你的用户名/my-instincts-backup.git](https://github.com/你的用户名/my-instincts-backup.git)  
cd my-instincts-backup  
步骤 3：导出本能并保存

# 导出所有本能
/instinct-export --output instincts.yaml

# 复制到备份仓库
cp ~/.claude/homunculus/instincts/instincts.yaml ./

# 或者直接指定输出路径到仓库目录
/instinct-export --output ./my-instincts-backup/instincts.yaml  
步骤 4：推送到 GitHub  
cd my-instincts-backup  
git add .  
git commit -m "Backup instincts - $(date +%Y-%m-%d)"  
git push

---

恢复方案  
在新电脑/新环境恢复

# 1. 克隆仓库
git clone [https://github.com/你的用户名/my-instincts-backup.git](https://github.com/你的用户名/my-instincts-backup.git)

# 2. 导入本能
/instinct-import ./my-instincts-backup/instincts.yaml

# 3. 查看状态
/instinct-status

你需要做的

1. 在你的主 OpenCode 环境（不是这个 demo 目录）

让我在你的主 OpenCode 环境中帮你一次性分析所有历史 session 并生成本能文件。

请在你的日常使用的 OpenCode 项目目录中告诉我，我会：

1. 扫描所有历史 session

2. 提取你的使用习惯（编码偏好、工作流、工具偏好等）

3. 手动创建本能文件到 ~/.claude/homunculus/instincts/personal/

2. 手动创建配置（如果需要 hooks）

在你的 C:\Users\lixin\.claude\ 目录下创建或修改 settings.json：

{

  hooks: {

    PreToolUse: [{

      matcher: *,

      hooks: [{

        type: command,

        command: ~/.claude/skills/continuous-learning-v2/hooks/observe.sh pre

      }]

    }],

    PostToolUse: [{

      matcher: *,

      hooks: [{

        type: command,

        command: ~/.claude/skills/continuous-learning-v2/hooks/observe.sh post

      }]

    }]

  }

}

---

最简单的开始方式

现在就在你的主项目目录中告诉我：

> "请扫描我所有的历史 session，提取我的使用习惯和偏好，并创建本能文件"

我会自动完成以下工作：

- 读取所有 session 历史

- 分析你的编码风格偏好

- 检测你的工作流习惯

- 识别你常用的工具和模式

- 生成可复用的本能文件

你想现在就开始吗？

▣  Sisyphus (Ultraworker) · minimax-m2.5-free · 3m 10s

最好这种技能我可以备份然后我可以随时恢复我迭代的历史经验

Thinking: 用户想要备份和恢复他随着使用迭代积累的经验/本能。这是一个很好的需求 - 类似于版本控制，但针对的是 AI 学习到的知识。

continuous-learning-v2 技能已经有这个功能：

- /instinct-export - 导出本能

- /instinct-import - 导入本能

我需要帮用户：

1. 找到导出/导入的方法

2. 确保用户知道如何备份到安全的地方（如 GitHub、NAS、云盘等）

3. 展示如何恢复

让我查看一下这个技能的导出/导入命令具体是什么。

这个需求很棒！continuous-learning-v2 技能已经内置了导出/导入功能。

备份方案

1. 导出本能（备份）

使用 /instinct-export 命令可以将你学习到的所有本能导出为一个文件：

→ Read ..\..\..\.claude\skills\continuous-learning-v2\commands\instinct-export.md 

Thinking: 现在让我查看导入功能。

→ Read ..\..\..\.claude\skills\continuous-learning-v2\commands\instinct-import.md 

Thinking: 太好了！技能已经内置了完整的导出/导入功能。现在让我给用户一个完整的备份和恢复方案。

完美！技能已内置完整的备份/恢复功能。

---

完整备份恢复方案

📤 备份（导出）

# 导出所有本能

/instinct-export

# 只导出高置信度的

/instinct-export --min-confidence 0.7

# 指定输出文件

/instinct-export --output my-instincts-2026-02-22.yaml

# 导出为 JSON 格式

/instinct-export --format json --output backup.json

导出的文件不包含敏感信息：

- ✅ 触发模式、动作、置信度、领域

- ❌ 不含实际代码片段、文件路径、会话记录

---

📥 恢复（导入）

# 从文件恢复

/instinct-import my-instincts-2026-02-22.yaml

# 从 URL 恢复（GitHub、云盘等）

/instinct-import [https://example.com/my-instincts.yaml](https://example.com/my-instincts.yaml)

# 预览但不导入

/instinct-import my-instincts.yaml --dry-run

导入时会智能合并：

- 高置信度覆盖低置信度

- 冲突本能需要手动处理

---

💾 推荐备份策略

1. 定期导出：每周或每月手动导出一次

   

2. 备份位置：

   - GitHub 私有仓库

   - 云盘（OneDrive、Google Drive）

   - NAS/本地备份

3. 文件命名：insteincts-{日期}.yaml

---

完整工作流

┌─────────────────────────────────────────────────┐

│           日常使用 OpenCode                      │

│         (hooks 自动学习本能)                      │

└─────────────────┬───────────────────────────────┘

                  │

                  ▼

┌─────────────────────────────────────────────────┐

│  /instinct-export --output instincts-2026-02.yaml │

└─────────────────┬───────────────────────────────┘

                  │

                  ▼ 保存到云盘/GitHub

┌─────────────────────────────────────────────────┐

│  新电脑 / 重装系统                                │

└─────────────────┬───────────────────────────────┘

                  │

                  ▼

┌─────────────────────────────────────────────────┐

│  /instinct-import instincts-2026-02.yaml         │

└─────────────────────────────────────────────────┘

---

你现在就可以做

在你的主 OpenCode 项目目录中运行：

1. 先查看当前有多少本能：

      /instinct-status

   

2. 导出备份：

      /instinct-export --output instincts-backup.yaml

   

3. 把文件保存到安全的地方



> 更新: 2026-02-22 17:33:04  
> 原文: <https://www.yuque.com/lixinsi/yh04az/bk6wxowg7aaa8pc3>