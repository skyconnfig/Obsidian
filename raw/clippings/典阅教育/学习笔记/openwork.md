# openwork

**OpenWork** 是基于 **OpenCode** 引擎构建的现代化桌面端 AI Agent 办公环境。它为非技术用户提供了直观的图形界面 (GUI)，完美对标 Anthropic 的 Claude Cowork，支持多模型切换、MCP 协议扩展及文件系统操作。

## 1. 快速安装

OpenWork 提供了开箱即用的安装包，无需繁琐的 Python/Node 环境配置。

1. **访问 GitHub 仓库**：[different-ai/openwork]([https://github.com/different-ai/openwork]\(https://github.com/different-ai/openwork\))
2. **下载安装包**：

* 点击右侧的 **Releases** 链接。
* 下载匹配自己操作系统的安装文件

3. **安装与启动**：双击运行，安装完成后打开应用。

> 💡 **提示**：OpenWork 本质是 OpenCode 的图形化“外壳”。安装 OpenWork 后，它会在后台自动管理 OpenCode 的核心引擎。

## 2. 初始化配置

### 2.1 选择工作区 (Workspace)

启动后，第一步是选择**工作目录**。

* **建议**：选择你日常办公的核心文件夹（如 `D:\Documents\Work`）或 Obsidian 知识库根目录。
* **作用**：AI Agent 将获得该目录下文件的**读写权限**（OpenWork 默认有安全锁，修改文件前通常需要人工 Confirm）。

### 2.2 模型选择

点击界面右上角或设置中的模型图标：

* **免费模型**：选择 **MiniMax M2.1** 或 **GLM-4.7**（如列表提供，显示free字样）。

## 3. 核心配置：`opencode.jsonc`

这是 OpenWork 的核心配置文件。

* **文件位置**：
  * **Windows**: `C:\Users\你的用户名\.config\opencode\opencode.jsonc`
  * **Mac**: `~/.config/opencode/opencode.jsonc` (需按 `Cmd+Shift+.` 显示隐藏文件)\
    注：.json和.jsonc本质其实都是json，而jsonc就是json with comments，带注释的json。

### 3.1 配置模板

按照下面的格式配置MCP。

````jsonc
{  
  "$schema": "[https://opencode.ai/config.json](https://opencode.ai/config.json)",  
  "mcp": {  
    // 1. 本地文件系统 (核心能力)  
    "filesystem": {  
      "type": "local",  
      "command": ["npx", "-y", "@modelcontextprotocol/server-filesystem"],  
      "enabled": true  
    },

```plain
// 2. 网页抓取 (读取公众号/推特文章)
"fetch": {
  "type": "local",
  "command": \["npx", "-y", "@modelcontextprotocol/server-fetch"\],
  "enabled": true
},

// 3. Notion 集成 (需获取 Internal Integration Token)
"notion": {
  "type": "local",
  "command": \["npx", "-y", "@notionhq/notion-mcp-server"\],
  "environment": {
    "NOTION\_TOKEN": "secret\_你的Notion密钥" 
  },
  "enabled": true
},

// 4. 联网搜索 (推荐 Brave Search，免费且干净)
"brave-search": {
  "type": "local",
  "command": \["npx", "-y", "@modelcontextprotocol/server-brave-search"\],
  "environment": {
    "BRAVE\_API\_KEY": "你的BraveAPIKey"
  },
  "enabled": true
}
````

}\
}

```

---

## 4. 插件与Skills
在 OpenWork 的左侧菜单栏中，你可以图形化地管理扩展。

### 4.1 安装 Plugins (界面功能增强)
1. 点击左侧 **Plugins** 菜单。
2. 在 **Add Plugin** 输入框中，输入 GitHub 仓库地址（推荐参考 `awesome-opencode` 列表）。

### 4.2 管理 Skills (AI 能力包)
*   **查看**：点击 **Skills** 菜单，查看当前 AI 已掌握的能力（如 `bash`, `python_interpreter` 等）。  
*   **导入**：点击Import按钮导入你的Skills。

## 5. 实战案例：自动化文件整理
**场景**：将 `Downloads` 文件夹中乱七八糟的 PDF 和 TXT 整理为 Markdown 笔记。

**操作步骤**：

1. 将 OpenWork 的工作区切换到包含 `Downloads` 的父目录。
2. 在对话框输入以下 **Prompt (提示词)**：

> "请扫描 `Downloads` 目录。
>
> 1. 读取所有 PDF 和 TXT 文件内容。
> 2. 为每个文件生成一份 Markdown 笔记，包含‘核心摘要’和‘关键洞察’。
> 3. 将笔记保存到 `Knowledge_Base/Inbox` 目录。
> 4. 遇到无法直接读取的 PDF，请编写 Python 脚本使用 pypdf 库进行提取。"
>

**预期结果**：  
*   OpenWork 会自动规划任务 (Plan)。  
*   你会看到它编写并运行 Python 代码。  
*   右侧文件管理面板中，旧文件被读取，新笔记自动生成。

## 6. 注意事项
*   **Token 消耗**：OpenWork 是多步执行的 Agent，处理一个复杂任务可能会消耗大量 Token。建议在非生产环境使用免费模型（如 MiniMax）。  
*   **权限确认**：在 **Build** 模式下，AI 修改或删除文件时，OpenWork 默认会弹出确认框。**请务必看清 AI 要删除什么文件再点 Confirm**。  
*   **本地模型**：OpenWork 支持连接本地 Ollama（如 Llama 3），但这需要你的电脑显存足够（建议 16GB+），且本地模型的逻辑规划能力弱于云端模型。

![Gemini [Alt + G]](chrome-extension://aajjgdpofhhcjmjoombjdfepplndhgcp/images/snipp6.svg)

```


> 更新: 2026-02-05 08:44:49  
> 原文: <https://www.yuque.com/lixinsi/yh04az/xedllienkrv7ck7b>