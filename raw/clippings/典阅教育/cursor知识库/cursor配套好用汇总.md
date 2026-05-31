# cursor配套好用汇总

### 1.Ai 产品原型设计

```powershell
https://design.gemcoder.com/aiHtmlPreview.html?appuuid=1942742438556729344&uuid=1942742438590283776&version=1&appName=%E6%9C%AA%E5%91%BD%E5%90%8D
```

### 2.MCP Server

```powershell
context7
brower-tools
sequential-thinking
promptx
mysql-mcp
interactive-feedback-mcp
```

```powershell
{
  "mcpServers": {
    "sequential-thinking": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-sequential-thinking"
      ]
    }
  }
}
```

```powershell
{
  "mcpServers": {
    "promptx": {
      "command": "npx",
      "args": ["-f", "-y", "dpml-prompt@beta", "mcp-server"]
    }
  }
}
```

```json
{
  "mcpServers": {
    "interactive-feedback-mcp": {
      "command": "uv",
      "args": [
        "--directory",
        "D:/daima/interactive-feedback-mcp-main/interactive-feedback-mcp-main",
        "run",
        "server.py"
      ]
    }
  }
}
```

<https://github.com/noopstudios/interactive-feedback-mcp>

* **先决条件:**
* Python 3.11 或更高版本。
* [UV](https://github.com/astral-sh/uv) (Python 包管理器)安装它与:
  * Windows:`pip install uv`
  * Linux/Mac:`curl -LsSf https://astral.sh/uv/install.sh | sh`
* **获取代码:**
* 克隆此存储库: `git clone https://github.com/noopstudios/interactive-feedback-mcp.git`
* 或者下载源代码。
* **导航到目录:**
* `cd path/to/interactive-feedback-mcp`
* **安装依赖项:**
* `uv sync`(这创建一个虚拟环境并安装软件包)
* **运行 MCP 服务器:**
* `uv run server.py`
* **在 Cursor 中配置:**
* Cursor通常允许在其设置中指定自定义MCP服务器。您需要将 Cursor 指向此运行的服务器。确切的机制可能会有所不同,因此请查阅 Cursor 的文档以添加自定义 MCP。
* **手动配置(例如,通过**<code>**mcp.json**</code>\*\*)\*\***记得改变**<code>**/Users/fabioferreira/Dev/scripts/interactive-feedback-mcp**</code>**路径到实际路径,您克隆了系统上的存储库。**

```plain
{
  "mcpServers": {
    "interactive-feedback-mcp": {
      "command": "uv",
      "args": [
        "--directory",
        "/Users/fabioferreira/Dev/scripts/interactive-feedback-mcp",
        "run",
        "server.py"
      ],
      "timeout": 600,
      "autoApprove": [
        "interactive_feedback"
      ]
    }
  }
}
```

* 您可以使用服务器标识符,如`interactive-feedback-mcp`在 Cursor 中配置它。

### 3.专业提示词

```powershell
https://www.aiprompter.cc/
```


> 更新: 2025-07-11 21:37:02  
> 原文: <https://www.yuque.com/lixinsi/iac89w/fgsd6gq9bswan4g2>