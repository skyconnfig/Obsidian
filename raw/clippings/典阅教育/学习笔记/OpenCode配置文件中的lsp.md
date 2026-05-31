# OpenCode 配置文件中的 lsp

很好！如果使用以下配置能够正常工作，说明 OpenCode 配置文件中的 `lsp` 部分的确是导致问题的原因。

```json
{
  "$schema": "https://opencode.ai/config.json",
  "plugin": ["oh-my-opencode"],
  "mcp": {
    "my-local-mcp": {
      "type": "local",
      "command": ["npx", "-y", "@modelcontextprotocol/server-everything"],
      "enabled": true
    }
  }
}
```

### **为什么这个配置有效：**

1. **没有 LSP 配置**：OpenCode 自动识别并启用 LSP 服务器（如 `gopls`、`pyright`、`tsserver`），所以你不需要显式配置 `lsp` 部分。
2. **MCP 配置**：你的 `mcp` 配置部分正确启用了本地 MCP 服务器（`@modelcontextprotocol/server-everything`），它可以支持 OpenCode 的功能。

### **下一步操作：**

既然配置文件没有问题，确保以下几点来确保 LSP 功能正常运行：

1. **确保安装 LSP 服务器**：\
   确保你已经安装了 Go、Python 和 TypeScript 的 LSP 服务器（如 `gopls`、`pyright`、`tsserver`），并且它们的可执行文件已经添加到 `PATH` 环境变量中。
2. **验证 LSP 服务器**：\
   你可以通过以下命令验证 LSP 服务器是否已安装并在 `PATH` 中：
   * **Go LSP (**<code>**gopls**</code>**)**：

```plain
gopls version
```

```
- **Python LSP (**`**pyright**`**)**：
```

```plain
pyright --version
```

```
- **TypeScript LSP (**`**tsserver**`**)**：
```

```plain
tsserver --version
```

3. **在 OpenCode 中检查 LSP 是否工作**：
   * 打开支持的代码文件（如 Go、Python 或 TypeScript 文件），并检查是否能享受 LSP 功能，如代码补全、跳转到定义、错误诊断等。
4. **调试和查看 OpenCode 输出**：
   * 如果 LSP 功能没有启用，查看 OpenCode 控制台的日志，看看是否有任何错误信息或者没有加载 LSP 服务器的提示。

***

### **总结：**

* **成功的配置**：使用不包含 `lsp` 配置的 `opencode.json` 配置文件。
* **确保安装 LSP 服务器**：确保 `gopls`、`pyright` 和 `tsserver` 已正确安装并添加到 `PATH`。
* **验证 OpenCode 是否能自动启用 LSP**：通过代码补全、跳转等功能检查 LSP 是否启用。


> 更新: 2026-01-15 14:46:07  
> 原文: <https://www.yuque.com/lixinsi/yh04az/xdb6tqx562rrldcp>