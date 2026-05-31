# opencode配置文件

```json
c:\Users\lixin\Desktop\opencode\sql\main_app.py请在这个gui页面合理添加上c:\Users\lixin\Desktop\opencode\sql\SQL_BATCH_GUIDE.md这些功能
```

```json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "zhipu": {
      "npm": "@ai-sdk/openai-compatible",
      "options": {
        "baseURL": "https://open.bigmodel.cn/api/paas/v4"
      },
      "models": {
        "glm-4.7": {}
      }
    }
  },
  "model": "zhipu/glm-4.7",
  "plugin": [
    "oh-my-opencode"
  ],
  "mcp": {
    "pencil": {
      "command": [
        "c:\\Users\\lixin\\.vscode\\extensions\\highagency.pencildev-0.6.16\\out\\mcp-server-windows-x64.exe",
        "--ws-port",
        "52795"
      ],
      "enabled": true,
      "type": "local"
    }
  }
}
```



> 更新: 2026-01-27 11:41:30  
> 原文: <https://www.yuque.com/lixinsi/yh04az/tm4u05qrw1stu4fc>