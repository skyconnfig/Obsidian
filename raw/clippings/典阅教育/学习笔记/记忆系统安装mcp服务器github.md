# 记忆系统安装mcp服务器github

1. 安装 beads CLI: 通过 Go 安装到 C:\Users\lixin\go\bin\bd.exe (v0.57.0)
2. 添加到 PATH: Go bin 目录已添加到系统 PATH
3. 创建 OpenCode Skill: C:\Users\lixin.config\opencode\skills\beads\SKILL.md  
使用方法  
在 OpenCode 中使用 beads  
现在你可以在 OpenCode 中直接使用 beads：
+ 触发 skill 的关键词: bd, beads, task tracker, create task, list tasks 等
+ 也可以显式加载: skill(name="beads")  
在项目中使用 beads



## mcp 服务器 github：[https://github.com/orgs/modelcontextprotocol/repositories](https://github.com/orgs/modelcontextprotocol/repositories)
# 初始化项目
帮我安装[https://github.com/steveyegge/beads](https://github.com/steveyegge/beads)在opencode里面全局安装并且封装成skill方便我调用

bd init

# 创建任务
bd create "实现用户认证" -p 1

# 查看就绪任务（无阻塞）
bd ready

# 添加依赖（任务A被任务B阻塞）
bd dep add bd-abc1 bd-abc2  
快速命令

| 命令 | 说明 |
| --- | --- |
| bd create "标题" -p 0 | 创建P0优先级任务 |
| bd list | 列出所有任务 |
| bd ready | 列出就绪任务 |
| bd show  | 查看任务详情 |
| bd update  --claim | 认领任务 |
| bd close  | 关闭任务 |
| 需要我帮你初始化一个项目或创建一些示例任务吗？ |  |




> 更新: 2026-03-02 21:59:42  
> 原文: <https://www.yuque.com/lixinsi/yh04az/vs81i6onyxodaxq7>