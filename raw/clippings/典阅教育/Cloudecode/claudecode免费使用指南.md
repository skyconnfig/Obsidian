# claude code 免费使用指南

````markdown
当然可以！以下是您提供的 **Claude Code Router** 全部内容，经过**深度 Markdown 结构化排版优化**后的版本。我已：
# 🤖 Claude Code Router —— 智能模型路由网关

> 一款强大的工具，可将 **Claude Code** 请求智能路由至不同大模型提供商，并自定义请求/响应转换逻辑。

---

## ✨ 核心功能

| 功能 | 描述 |
|------|------|
| 🔄 **模型路由** | 根据任务类型（如 `background`、`think`、`longContext`）自动选择最优模型 |
| 🌐 **多提供商支持** | 原生支持 OpenRouter、DeepSeek、Ollama、Gemini、Volcengine、SiliconFlow、ModelScope、DashScope、AIHubMix 等 |
| ⚙️ **请求/响应转换器** | 使用内置或自定义 Transformer 自动适配不同 API 格式 |
| 🔁 **动态模型切换** | 在 Claude Code 中使用 `/model provider,model` 实时切换模型 |
| 🧩 **插件系统** | 支持加载自定义 JavaScript 转换器插件 |
| 🤖 **GitHub Actions 集成** | 在 CI/CD 流程中触发 AI 编码任务 |
| 🖥️ **Web UI 模式（Beta）** | 可视化编辑 `config.json`，实时预览配置 |

---

## 🚀 快速入门

### 1. 安装

确保已安装 [Claude Code](https://github.com/anthropic/claude-code)：

```bash
npm install -g @anthropic-ai/claude-code
````

再安装 **Claude Code Router**：

```bash
npm install -g @musistudio/claude-code-router
```

> 💡 建议使用 Node.js v18+ 和 npm v9+

***

### 2. 配置文件：`~/.claude-code-router/config.json`

创建并编辑配置文件：

```bash
mkdir -p ~/.claude-code-router
touch ~/.claude-code-router/config.json
```

> 🔗 示例模板参考：[config.example.json](https://github.com/musistudio/claude-code-router/blob/main/config.example.json)

#### ✅ 配置项详解

| 字段 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `PROXY_URL` | string | ✅ 可选 | 设置代理，如 `"http://127.0.0.1:7890"` |
| `LOG` | boolean | ✅ 可选 | 启用日志，日志路径：`$HOME/.claude-code-router.log` |
| `APIKEY` | string | ✅ 可选 | 访问认证密钥，客户端需在 <code>Authorization: Bearer <key></code> 或 `x-api-key` 头中携带 |
| `HOST` | string | ✅ 可选 | 监听地址。**未设 `APIKEY` 时默认强制为 `127.0.0.1`**（安全保护） |
| `API_TIMEOUT_MS` | number | ✅ 可选 | API 请求超时时间（毫秒），建议 ≥30000（30s） |
| `Providers` | array | ✅ 必须 | 模型提供商列表（见下文） |
| `Router` | object | ✅ 必须 | 路由规则配置（见下文） |
| `CUSTOM_ROUTER_PATH` | string | ✅ 可选 | 自定义路由脚本路径（高级用法） |
| `transformers` | array | ✅ 可选 | 加载自定义转换器插件 |

***

### 📄 综合配置示例（推荐复制使用）

```json
{
  "APIKEY": "your-secret-key",
  "PROXY_URL": "http://127.0.0.1:7890",
  "LOG": true,
  "API_TIMEOUT_MS": 600000,
  "Providers": [
    {
      "name": "openrouter",
      "api_base_url": "https://openrouter.ai/api/v1/chat/completions",
      "api_key": "sk-xxx",
      "models": [
        "google/gemini-2.5-pro-preview",
        "anthropic/claude-sonnet-4",
        "anthropic/claude-3.5-sonnet",
        "anthropic/claude-3.7-sonnet:thinking"
      ],
      "transformer": { "use": ["openrouter"] }
    },
    {
      "name": "deepseek",
      "api_base_url": "https://api.deepseek.com/chat/completions",
      "api_key": "sk-xxx",
      "models": ["deepseek-chat", "deepseek-reasoner"],
      "transformer": {
        "use": ["deepseek"],
        "deepseek-chat": { "use": ["tooluse"] }
      }
    },
    {
      "name": "ollama",
      "api_base_url": "http://localhost:11434/v1/chat/completions",
      "api_key": "ollama",
      "models": ["qwen2.5-coder:latest"]
    },
    {
      "name": "gemini",
      "api_base_url": "https://generativelanguage.googleapis.com/v1beta/models/",
      "api_key": "sk-xxx",
      "models": ["gemini-2.5-flash", "gemini-2.5-pro"],
      "transformer": { "use": ["gemini"] }
    },
    {
      "name": "volcengine",
      "api_base_url": "https://ark.cn-beijing.volces.com/api/v3/chat/completions",
      "api_key": "sk-xxx",
      "models": ["deepseek-v3-250324", "deepseek-r1-250528"],
      "transformer": { "use": ["deepseek"] }
    },
    {
      "name": "modelscope",
      "api_base_url": "https://api-inference.modelscope.cn/v1/chat/completions",
      "api_key": "",
      "models": [
        "Qwen/Qwen3-Coder-480B-A35B-Instruct",
        "Qwen/Qwen3-235B-A22B-Thinking-2507"
      ],
      "transformer": {
        "use": [
          ["maxtoken", { "max_tokens": 65536 }],
          "enhancetool"
        ],
        "Qwen/Qwen3-235B-A22B-Thinking-2507": { "use": ["reasoning"] }
      }
    },
    {
      "name": "dashscope",
      "api_base_url": "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions",
      "api_key": "",
      "models": ["qwen3-coder-plus"],
      "transformer": {
        "use": [
          ["maxtoken", { "max_tokens": 65536 }],
          "enhancetool"
        ]
      }
    },
    {
      "name": "aihubmix",
      "api_base_url": "https://aihubmix.com/v1/chat/completions",
      "api_key": "sk-",
      "models": [
        "Z/glm-4.5",
        "claude-opus-4-20250514",
        "gemini-2.5-pro"
      ]
    }
  ],
  "Router": {
    "default": "deepseek,deepseek-chat",
    "background": "ollama,qwen2.5-coder:latest",
    "think": "deepseek,deepseek-reasoner",
    "longContext": "openrouter,google/gemini-2.5-pro-preview",
    "longContextThreshold": 60000,
    "webSearch": "gemini,gemini-2.5-flash"
  }
}
```

> ⚠️ **重要提醒**：\
> 所有 `api_base_url` 后的多余空格（如 `...completions  `）已被清理，请勿复制粘贴含空格的 URL！

***

## 🧩 Transformers（请求/响应转换器）

用于适配不同 API 的请求格式、响应结构或行为增强。

### ✅ 内置转换器列表

| 名称 | 用途 | 是否支持选项 |
|------|------|---------------|
| `anthropic` | 透传 Anthropic API 请求（兼容其他服务端点） | ❌ |
| `deepseek` | 适配 DeepSeek API 格式 | ❌ |
| `gemini` | 适配 Google Gemini API | ❌ |
| `openrouter` | 适配 OpenRouter，支持指定底层提供商 | ✅ |
| `groq` | 适配 Groq API | ❌ |
| `maxtoken` | 强制设置 `max_tokens` 值 | ✅ |
| `tooluse` | 优化工具调用（通过 `tool_choice`） | ❌ |
| `gemini-cli` (实验性) | 通过 CLI 工具支持 Gemini | ❌ |
| `reasoning` | 处理 `reasoning_content` 字段 | ❌ |
| `sampling` | 控制采样参数（temperature/top\_p/top\_k/repetition\_penalty） | ✅ |
| `enhancetool` | 增强工具调用容错（牺牲流式返回） | ❌ |
| `cleancache` | 清除 `cache_control` 字段 | ❌ |
| `vertex-gemini` | 适配 Vertex AI 鉴权的 Gemini | ❌ |

### 📌 使用方式

#### 1. 全局转换器（适用于所有模型）

```json
"transformer": { "use": ["openrouter"] }
```

#### 2. 模型专属转换器

```json
"transformer": {
  "use": ["deepseek"],
  "deepseek-chat": { "use": ["tooluse"] }
}
```

#### 3. 带参数的转换器（如 `maxtoken`）

```json
"transformer": {
  "use": [
    ["maxtoken", { "max_tokens": 16384 }]
  ]
}
```

#### 4. OpenRouter 子提供商路由示例

```json
"transformer": {
  "use": ["openrouter"],
  "moonshotai/kimi-k2": {
    "use": [
      ["openrouter", {
        "provider": { "only": ["moonshotai/fp8"] }
      }]
    ]
  }
}
```

### 🛠 自定义 Transformer 插件

创建 JS 文件（如 `$HOME/.claude-code-router/plugins/gemini-cli.js`）：

```js
// gemini-cli.js
module.exports = function transformer(req, config) {
  // 修改 req.body...
  return req;
};
```

在 `config.json` 中引用：

```json
{
  "transformers": [
    {
      "path": "$HOME/.claude-code-router/plugins/gemini-cli.js",
      "options": { "project": "my-project" }
    }
  ]
}
```

> ✅ 支持 `$HOME`、`$USERPROFILE` 等环境变量替换。

***

## 🧭 Router（路由规则）

定义不同场景下使用的模型组合。

| 路由键 | 用途 | 示例值 |
|--------|------|--------|
| `default` | 默认任务 | `"deepseek,deepseek-chat"` |
| `background` | 后台轻量任务 | `"ollama,qwen2.5-coder:latest"` |
| `think` | 思考/推理密集型 | `"deepseek,deepseek-reasoner"` |
| `longContext` | 长上下文（>阈值） | `"openrouter,google/gemini-2.5-pro-preview"` |
| `longContextThreshold` | 触发长上下文模型的令牌阈值 | `60000`（默认） |
| `webSearch` | 网络搜索任务 | `"gemini,gemini-2.5-flash"` |

> 💡 若模型名称包含 `:thinking`、`:online` 等后缀（如 `anthropic/claude-3.7-sonnet:thinking`），请确保提供商支持该语法。

### 🔁 动态切换模型（在 Claude Code 中）

在聊天窗口输入：

```text
/model openrouter,anthropic/claude-3.5-sonnet
```

即可临时切换当前会话使用的模型。

***

## 🧩 子代理路由（Sub-agent Routing）

在子代理提示词开头插入特殊标签，强制指定模型：

```text
<CCR-SUBAGENT-MODEL>openrouter,anthropic/claude-3.5-sonnet</CCR-SUBAGENT-MODEL>
你的子代理任务描述...
```

此机制适用于复杂工作流中的精细控制。

***

## 🔧 自定义路由器（Advanced）

创建自定义路由逻辑脚本：

```bash
mkdir -p ~/.claude-code-router
touch ~/.claude-code-router/custom-router.js
```

编写 `custom-router.js`：

```js
// $HOME/.claude-code-router/custom-router.js

/**
 * 根据用户消息内容决定使用哪个模型
 * @param {object} req - Claude Code 请求对象
 * @param {object} config - 应用配置
 * @returns {Promise<string|null>} 返回 "provider,model" 或 null（使用默认）
 */
module.exports = async function router(req, config) {
  const userMessage = req.body.messages?.find(m => m.role === 'user')?.content;

  if (!userMessage) return null;

  if (userMessage.includes('解释这段代码')) {
    return 'openrouter,anthropic/claude-3.5-sonnet';
  }

  if (userMessage.includes('写单元测试')) {
    return 'deepseek,deepseek-reasoner';
  }

  return null; // 回退到 Router.default
};
```

在 `config.json` 中启用：

```json
{
  "CUSTOM_ROUTER_PATH": "$HOME/.claude-code-router/custom-router.js"
}
```

> ✅ 支持异步函数，可用于调用外部 API 或数据库做决策。

***

## 🤖 GitHub Actions 集成

在 `.github/workflows/claude.yaml` 中集成自动化：

```yaml
name: Claude Code Automation

on:
  issue_comment:
    types: [created]

jobs:
  claude:
    if: |
      (github.event_name == 'issue_comment' && contains(github.event.comment.body, '@claude'))
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pull-requests: read
      issues: read
      id-token: write

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 1

      - name: Install Bun
        run: |
          curl -fsSL https://bun.sh/install | bash

      - name: Setup Config
        run: |
          mkdir -p $HOME/.claude-code-router
          cat << 'EOF' > $HOME/.claude-code-router/config.json
          {
            "log": true,
            "OPENAI_API_KEY": "${{ secrets.OPENAI_API_KEY }}",
            "OPENAI_BASE_URL": "https://api.deepseek.com",
            "OPENAI_MODEL": "deepseek-chat"
          }
          EOF

      - name: Start Claude Code Router
        run: |
          nohup ~/.bun/bin/bunx @musistudio/claude-code-router@1.0.8 start &
          sleep 5

      - name: Run Claude Code
        id: claude
        uses: anthropics/claude-code-action@beta
        env:
          ANTHROPIC_BASE_URL: http://localhost:3456
        with:
          anthropic_api_key: "any-string-is-ok"
```

> 💡 优势：可在非高峰时段低成本运行 AI 编码任务，节省 API 成本。

***

## 💡 免费方案推荐

| 提供商 | 免费额度 | 地区限制 | 链接 |
|--------|----------|-----------|------|
| **ModelScope** | 2,000 次/天 | 中国大陆 | [Qwen-Code](https://github.com/QwenLM/qwen-code) |
| **OpenRouter** | 1,000 次/天 | 全球 | [openrouter.ai](https://openrouter.ai) |
| **Ollama** | 无限本地 | 无 | [ollama.ai](https://ollama.ai) |
| **Qwen3-Coder** | 免费商用 | 全球 | [HuggingFace](https://huggingface.co/Qwen) |

> ✅ 推荐组合：**Ollama（本地） + ModelScope（免费云端）**

***

## 🖥️ Web UI 模式（Beta）

启动可视化配置界面：

```bash
ccr ui
```

打开浏览器访问 `http://localhost:3000`，即可：

* 编辑 `config.json`
* 实时预览效果
* 一键重启服务

> ⚠️ 当前为 Beta 版，建议仅用于开发调试，生产环境仍推荐手动编辑 JSON。

***

## 🛠 启动与管理命令

| 命令 | 说明 |
|------|------|
| `ccr code` | 启动 Claude Code 并连接 Router |
| `ccr start` | 仅启动 HTTP 服务（默认端口 3456） |
| `ccr restart` | 重启服务（修改配置后必须执行） |
| `ccr ui` | 启动 Web 配置界面 |
| `ccr version` | 查看当前版本 |

> 💡 服务默认监听 `http://localhost:3456`，Claude Code 将自动连接此地址。

***

## 📂 安装路径说明（Windows 用户）

在 Windows 上，配置文件路径为：

```
C:\Users\你的用户名\.claude-code-router\config.json
```

确保路径存在且可写入：

```powershell
mkdir $env:USERPROFILE\.claude-code-router
notepad $env:USERPROFILE\.claude-code-router\config.json
```

***

## 🧪 开发者提示

* 所有 `api_base_url` 必须是完整端点（以 `/chat/completions` 结尾）
* 模型名格式：`provider/model-name` 或 `model-name@version`
* 日志文件位于：`~/.claude-code-router.log`
* 如遇权限问题，尝试加 `sudo`（Linux/macOS）
* 使用 `DEBUG=1 ccr start` 可开启调试日志

***

## 📣 最后建议

> ✅ **最佳实践**：\
> 将 `default` 设为廉价模型（如 Ollama 本地 Qwen），\
> `think` / `longContext` 设为 GPT-4/Claude 3.5，\
> `webSearch` 设为 Gemini，\
> `background` 设为最小模型，\
> 配合 `longContextThreshold: 60000`，实现极致成本优化！

***

✅ **项目状态**：这是一个 100% 由 `ccr + qwen3-coder + gemini(webSearch)` 自动生成的文档，欢迎提交 Issue 或 PR 优化！

🔗 项目主页：<https://github.com/musistudio/claude-code-router>

***

最后推荐两个免费api站点
https://anyrouter.top/login  此网址每天签到获得25美元免费额度，用github账号登入即可
https://www.yuque.com/lixinsi/hw0k6o/abqmzkwnuz3x6y5x?singleDoc# 《国内中转站API 接口》

```
```


> 更新: 2025-09-12 08:46:55  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/par6h913sd1ywgl6>