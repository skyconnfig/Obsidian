# 🎯 OpenCode 中使用 OpenAgentsControl 指南

在 OpenCode 中使用这些技能非常简单！以下是具体方法：

---

方法 1: 直接用自然语言描述需求（推荐）  
直接在 OpenCode 对话框中输入：  
📌 上下文管理  
"帮我发现项目中所有的上下文文件"  
"获取 Drizzle ORM 的官方文档"  
"清理临时文件"  
"组织我的项目上下文"  
📌 任务管理  
"查看当前所有任务的进度"  
"告诉我下一步该做什么"  
"有哪些任务被阻塞了"  
"标记 feature-abc 的第 3 个任务已完成"  
📌 智能路由  
"帮我分析这个代码问题"  
"路由这个请求到最合适的方式"  
"智能处理这个任务"

---

方法 2: 使用 Slash Commands  
如果 OpenCode 支持 slash commands，可以输入：  
/context discover authentication  
/task status  
/smart-route "帮我优化登录页面"

---

方法 3: 使用技能标签  
有些 OpenCode 配置支持技能标签：  
@context-manager discover all  
@task-management status  
@smart-router analyze

---

💡 实际使用示例  
场景 1: 开始新项目  
你: "我刚接手一个新项目，帮我整理一下"  
OpenCode 会:

1. 使用 context-manager 发现现有上下文
2. 使用 task-management 查看任务状态
3. 使用 smart-router 规划下一步行动  
场景 2: 遇到复杂任务  
你: "这个功能太大了，帮我分解一下"  
OpenCode 会:
4. 使用 task-management 分析任务结构
5. 分解为可管理的子任务
6. 显示执行顺序和依赖关系  
场景 3: 清理项目  
你: "项目太乱了，帮我整理一下"  
OpenCode 会:
7. 使用 context-manager cleanup 清理临时文件
8. 使用 context-manager organize 重组上下文
9. 使用 task-management validate 验证完整性

---

🎯 常用命令速查表

| 需求 | 输入方式 |
| --- | --- |
| 发现上下文 | "发现所有上下文" 或 discover all |
| 获取文档 | "获取 React 文档" |
| 清理文件 | "清理临时文件" |
| 查看进度 | "查看任务状态" |
| 找下一步 | "下一步做什么" |
| 标记完成 | "标记任务 3 完成" |
| 智能路由 | "帮我处理这个" |


---

🚀 立即尝试  
在 OpenCode 中输入以下任意一个：  
"使用 context-manager 发现项目中的所有上下文文件"  
"使用 task-management 查看当前项目进度"  
"使用 smart-router 帮我分析这个代码"

---

📖 详细文档  
如果你想深入了解每个技能的详细用法，查看：

+ C:\Users\lixin.agents\skills\context-manager\SKILL.md
+ C:\Users\lixin.agents\skills\task-management\SKILL.md
+ C:\Users\lixin.agents\skills\smart-router-skill\SKILL.md

---

💡 提示  
这些技能是自动集成的，不需要额外配置。OpenCode 会自动识别并在需要时使用它们！  
现在就在 OpenCode 中试试吧！ 🎉





> 更新: 2026-02-05 16:07:00  
> 原文: <https://www.yuque.com/lixinsi/yh04az/am567sv88g8vz1gl>