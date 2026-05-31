# ccswitchWindows配置

```bash
{
  "attribution": {
    "commit": "",
    "pr": ""
  },
  "env": {
    "ANTHROPIC_AUTH_TOKEN": "YOUR_NEW_KEY",
    "ANTHROPIC_BASE_URL": "https://api.deepseek.com/anthropic",
    "ANTHROPIC_MODEL": "deepseek-chat",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "deepseek-chat",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "deepseek-chat",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "deepseek-chat",
    "ANTHROPIC_REASONING_MODEL": "deepseek-reasoner",
    "CLAUDE_CODE_SUBAGENT_MODEL": "deepseek-chat",
    "CLAUDE_CODE_EFFORT_LEVEL": "high",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "CLAUDE_CODE_DISABLE_NONSTREAMING_FALLBACK": "1",
    "CLAUDE_CODE_USE_POWERSHELL_TOOL": "1",
    "ENABLE_TOOL_SEARCH": "true",
    "API_TIMEOUT_MS": "600000"
  },
  "includeCoAuthoredBy": false,
  "statusLine": {
    "command": "npx -y ccstatusline@latest",
    "padding": 0,
    "type": "command"
  },
  "enabledPlugins": {
    "chrome-devtools-mcp@claude-plugins-official": true,
    "codex@openai-codex": true,
    "context7@claude-plugins-official": true,
    "firecrawl@claude-plugins-official": true,
    "frontend-design@claude-plugins-official": true,
    "gopls-lsp@claude-plugins-official": true
  }
}
```



> 更新: 2026-05-06 16:56:09  
> 原文: <https://www.yuque.com/lixinsi/dtxgrg/ba8lywo4tqlgtg1k>