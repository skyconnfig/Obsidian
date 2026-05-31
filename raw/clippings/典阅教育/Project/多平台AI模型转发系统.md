# 多平台AI模型转发系统

<https://github.com/skyconnfig/redwolf>

<font style="color:rgb(31, 35, 40);">一个功能完整、安全可靠的多平台AI模型智能转发系统，支持认证、智能路由、格式转换和容错降级机制。</font>

<font style="color:rgb(89, 99, 110);">因为精力有限，产品仍存在不少 BUG，如果遇到，请提 issue，我会尽快处理，也欢迎共建产品。</font>

## <font style="color:rgb(31, 35, 40);">🎯</font><font style="color:rgb(31, 35, 40);"> 设计理念</font>

### <font style="color:rgb(31, 35, 40);">💡</font><font style="color:rgb(31, 35, 40);"> 核心价值</font>

<font style="color:rgb(31, 35, 40);">让</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">Claude Code</font>**<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">能够使用任何大模型，实现最大成本节约和智能化管理：</font>

* **<font style="color:rgb(31, 35, 40);">🧠</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> 智能意图识别</font>**<font style="color:rgb(31, 35, 40);">：根据用户意图，智能分流到合适的模型</font>
  * <font style="color:rgb(31, 35, 40);">简单对话 → 小模型（成本低）</font>
  * <font style="color:rgb(31, 35, 40);">代码创建 → Qwen Coder（专业）</font>
  * <font style="color:rgb(31, 35, 40);">逻辑修改 → Claude-4（高级推理）</font>
* **<font style="color:rgb(31, 35, 40);">💰</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> 成本优化策略</font>**<font style="color:rgb(31, 35, 40);">：避免大材小用，节约 API 调用费用</font>
  * <font style="color:rgb(31, 35, 40);">Claude Code 的系统提示词 token 很多，用小模型处理简单任务更经济</font>
  * <font style="color:rgb(31, 35, 40);">根据任务复杂度自动选择合适规模的模型</font>
* **<font style="color:rgb(31, 35, 40);">🏢</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> 企业级私有化</font>**<font style="color:rgb(31, 35, 40);">：支持企业内部完全私有化部署</font>
  * <font style="color:rgb(31, 35, 40);">本地部署大尺寸 Coder 模型（如480B参数）</font>
  * <font style="color:rgb(31, 35, 40);">避免代码泄露给外部服务（Qwen、Kimi等）</font>
  * <font style="color:rgb(31, 35, 40);">支持多用户 KEY 管理和使用统计</font>
  * <font style="color:rgb(31, 35, 40);">更好掌控数据安全和成本</font>
* **<font style="color:rgb(31, 35, 40);">🔄</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> 高可用保障</font>**<font style="color:rgb(31, 35, 40);">：模型欠费或不可达时自动降级</font>
  * <font style="color:rgb(31, 35, 40);">多层备用方案确保服务连续性</font>
  * <font style="color:rgb(31, 35, 40);">模型不可用时，智能切换</font>

### <font style="color:rgb(31, 35, 40);">🎪</font><font style="color:rgb(31, 35, 40);"> 典型应用场景</font>

1. **<font style="color:rgb(31, 35, 40);">个人开发者</font>**<font style="color:rgb(31, 35, 40);">：用本地模型替代昂贵的 Claude API</font>
2. **<font style="color:rgb(31, 35, 40);">小团队</font>**<font style="color:rgb(31, 35, 40);">：混合使用本地+云端模型，平衡成本与效果</font>
3. **<font style="color:rgb(31, 35, 40);">企业用户</font>**<font style="color:rgb(31, 35, 40);">：完全私有化部署，保护代码安全</font>
4. **<font style="color:rgb(31, 35, 40);">学习研究</font>**<font style="color:rgb(31, 35, 40);">：捕获和分析 Claude Code 的 Prompt 模式</font>

<font style="color:rgb(89, 99, 110);">💡</font><font style="color:rgb(89, 99, 110);"> </font>**<font style="color:rgb(89, 99, 110);">了解私有化部署细节</font>**<font style="color:rgb(89, 99, 110);">，请关注微信公众号：</font>**<font style="color:rgb(89, 99, 110);">洛小山</font>**

## <font style="color:rgb(31, 35, 40);">📖</font><font style="color:rgb(31, 35, 40);"> 目录</font>

* [<font style="color:rgb(9, 105, 218);">🚀</font><font style="color:rgb(9, 105, 218);"> 快速开始</font>](https://github.com/skyconnfig/redwolf#-%E5%BF%AB%E9%80%9F%E5%BC%80%E5%A7%8B)
* [<font style="color:rgb(9, 105, 218);">✨</font><font style="color:rgb(9, 105, 218);"> 核心特性</font>](https://github.com/skyconnfig/redwolf#-%E6%A0%B8%E5%BF%83%E7%89%B9%E6%80%A7)
* [<font style="color:rgb(9, 105, 218);">📝</font><font style="color:rgb(9, 105, 218);"> API使用</font>](https://github.com/skyconnfig/redwolf#-api%E4%BD%BF%E7%94%A8)
* [<font style="color:rgb(9, 105, 218);">⚙️</font><font style="color:rgb(9, 105, 218);"> 配置说明</font>](https://github.com/skyconnfig/redwolf#-%E9%85%8D%E7%BD%AE%E8%AF%B4%E6%98%8E)
* [<font style="color:rgb(9, 105, 218);">🔧</font><font style="color:rgb(9, 105, 218);"> 技术架构</font>](https://github.com/skyconnfig/redwolf#-%E6%8A%80%E6%9C%AF%E6%9E%B6%E6%9E%84)
* [<font style="color:rgb(9, 105, 218);">🎨</font><font style="color:rgb(9, 105, 218);"> 界面功能</font>](https://github.com/skyconnfig/redwolf#-%E7%95%8C%E9%9D%A2%E5%8A%9F%E8%83%BD)
* [<font style="color:rgb(9, 105, 218);">🔍</font><font style="color:rgb(9, 105, 218);"> 故障排除</font>](https://github.com/skyconnfig/redwolf#-%E6%95%85%E9%9A%9C%E6%8E%92%E9%99%A4)
* [<font style="color:rgb(9, 105, 218);">🛠️</font><font style="color:rgb(9, 105, 218);"> 开发扩展</font>](https://github.com/skyconnfig/redwolf#-%E5%BC%80%E5%8F%91%E6%89%A9%E5%B1%95)
* [<font style="color:rgb(9, 105, 218);">📊</font><font style="color:rgb(9, 105, 218);"> 项目信息</font>](https://github.com/skyconnfig/redwolf#-%E9%A1%B9%E7%9B%AE%E4%BF%A1%E6%81%AF)

## <font style="color:rgb(31, 35, 40);">🚀</font><font style="color:rgb(31, 35, 40);"> 快速开始</font>

<font style="color:rgb(31, 35, 40);">只需</font>**<font style="color:rgb(31, 35, 40);">4步</font>**<font style="color:rgb(31, 35, 40);">即可体验多平台AI模型转发：</font>

### <font style="color:rgb(31, 35, 40);">📦</font><font style="color:rgb(31, 35, 40);"> 步骤1：启动服务</font>

```plain
# 自动安装依赖并启动
python3.11 start.py

# 或开启调试模式
python3.11 start.py --debug
```

### <font style="color:rgb(31, 35, 40);">🌐</font><font style="color:rgb(31, 35, 40);"> 步骤2：登录系统</font>

1. <font style="color:rgb(31, 35, 40);">访问：</font>[<font style="color:rgb(9, 105, 218);">http://127.0.0.1:8000</font>](http://127.0.0.1:8000/)
2. <font style="color:rgb(31, 35, 40);">初始密码：</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">admin</font></code>
3. <font style="color:rgb(31, 35, 40);">按提示修改密码（至少6位）</font>

### <font style="color:rgb(31, 35, 40);">⚙️</font><font style="color:rgb(31, 35, 40);"> 步骤3：配置平台</font>

<font style="color:rgb(31, 35, 40);">点击「配置」→「平台配置」，至少启用一个平台：</font>

| **<font style="color:rgb(31, 35, 40);">平台</font>** | **<font style="color:rgb(31, 35, 40);">配置要求</font>** | **<font style="color:rgb(31, 35, 40);">说明</font>** |
| --- | --- | --- |
| <font style="color:rgb(31, 35, 40);">🌟</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">阿里云百炼</font>** | <font style="color:rgb(31, 35, 40);">API Key</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">API 密钥</font> | <font style="color:rgb(31, 35, 40);">支持通义千问系列</font> |
| <font style="color:rgb(31, 35, 40);">🌐</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">OpenRouter</font>**<font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">🌐</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">开放路由器</font>** | <font style="color:rgb(31, 35, 40);">API Key</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">API 密钥</font> | <font style="color:rgb(31, 35, 40);">访问多种商业模型</font> |
| <font style="color:rgb(31, 35, 40);">🔥</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">硅基流动</font>** | <font style="color:rgb(31, 35, 40);">API Key</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">API 密钥</font> | <font style="color:rgb(31, 35, 40);">高性价比开源模型聚合</font> |
| <font style="color:rgb(31, 35, 40);">⚙️</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">OpenAI兼容</font>** | <font style="color:rgb(31, 35, 40);">API Key + Base URL</font><font style="color:rgb(31, 35, 40);">   </font><font style="color:rgb(31, 35, 40);">API 密钥 + 基本 URL</font> | <font style="color:rgb(31, 35, 40);">任何兼容OpenAI API的服务</font> |
| <font style="color:rgb(31, 35, 40);">🐋</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">Ollama</font>**<font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">🐋</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">奥拉玛</font>** | <font style="color:rgb(31, 35, 40);">本地服务</font> | <font style="color:rgb(31, 35, 40);">需启动</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">ollama serve</font></code> |
| <font style="color:rgb(31, 35, 40);">🖥️</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">LMStudio</font>** | <font style="color:rgb(31, 35, 40);">本地服务</font> | <font style="color:rgb(31, 35, 40);">需启动本地服务器</font> |

### <font style="color:rgb(31, 35, 40);">🎯</font><font style="color:rgb(31, 35, 40);"> 步骤4：选择模式</font>

<font style="color:rgb(31, 35, 40);">选择适合的工作模式：</font>

* **<font style="color:rgb(31, 35, 40);">🔵</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> Claude Code模式</font>**<font style="color:rgb(31, 35, 40);">：简单代理（适合已有Claude服务）</font>
* **<font style="color:rgb(31, 35, 40);">🟢</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> 全局直连模式</font>**<font style="color:rgb(31, 35, 40);">：手动优先级排序（推荐新手）</font>
* **<font style="color:rgb(31, 35, 40);">🟣</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> 智能路由模式</font>**<font style="color:rgb(31, 35, 40);">：AI自动选择模型（高级功能）</font>

<font style="color:rgb(89, 99, 110);">💡</font><font style="color:rgb(89, 99, 110);"> </font>**<font style="color:rgb(89, 99, 110);">提示</font>**<font style="color:rgb(89, 99, 110);">：配置完成后点击「刷新模型列表」，即可开始使用！</font>

### <font style="color:rgb(31, 35, 40);">🎯</font><font style="color:rgb(31, 35, 40);"> Claude Code 快速使用</font>

#### <font style="color:rgb(31, 35, 40);">配置环境变量</font>

<font style="color:rgb(31, 35, 40);">在您的项目目录中执行以下命令：</font>

```plain
# 设置代理地址
export ANTHROPIC_BASE_URL=http://127.0.0.1:8000/api/v1/claude-code

# 设置认证Token（根据模式选择，分发和路由模式需要填本平台的 KEY，ClaudeCode 模式填第三方 KEY）
export ANTHROPIC_AUTH_TOKEN=your_key_here

# 启动 Claude Code
claude
```

#### <font style="color:rgb(31, 35, 40);">KEY 配置说明</font>

<font style="color:rgb(31, 35, 40);">根据您选择的工作模式，使用不同的 KEY：</font>

| **<font style="color:rgb(31, 35, 40);">工作模式</font>** | **<font style="color:rgb(31, 35, 40);">KEY 来源</font>** | **<font style="color:rgb(31, 35, 40);">用途</font>** |
| --- | --- | --- |
| **<font style="color:rgb(31, 35, 40);">🔵</font>****<font style="color:rgb(31, 35, 40);"> Claude Code模式</font>****<font style="color:rgb(31, 35, 40);">  </font>****<font style="color:rgb(31, 35, 40);">🔵</font>****<font style="color:rgb(31, 35, 40);"> Claude Code 模式</font>** | <font style="color:rgb(31, 35, 40);">第三方服务的 KEY</font> | <font style="color:rgb(31, 35, 40);">代理转发，可捕获 Prompt</font> |
| **<font style="color:rgb(31, 35, 40);">🟢</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> 全局直连模式</font>** | <font style="color:rgb(31, 35, 40);">各平台官方申请的 KEY</font> | <font style="color:rgb(31, 35, 40);">直连各大模型平台</font> |
| **<font style="color:rgb(31, 35, 40);">🟣</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> 智能路由模式</font>** | <font style="color:rgb(31, 35, 40);">各平台官方申请的 KEY</font> | <font style="color:rgb(31, 35, 40);">智能选择最佳模型</font> |

#### <font style="color:rgb(31, 35, 40);">✨</font><font style="color:rgb(31, 35, 40);"> 特殊优势</font>

* **<font style="color:rgb(31, 35, 40);">📝</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> Prompt 捕获</font>**<font style="color:rgb(31, 35, 40);">：在 Claude Code 模式下，可以捕获所有用户提示词，用于学习分析</font>
* **<font style="color:rgb(31, 35, 40);">💰</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> 成本优化</font>**<font style="color:rgb(31, 35, 40);">：通过智能路由避免使用昂贵模型处理简单任务</font>
* **<font style="color:rgb(31, 35, 40);">🔄</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> 自动降级</font>**<font style="color:rgb(31, 35, 40);">：模型不可用时自动切换到备用模型</font>
* **<font style="color:rgb(31, 35, 40);">📊</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> 使用统计</font>**<font style="color:rgb(31, 35, 40);">：详细记录所有 API 调用，便于成本分析</font>

***

### <font style="color:rgb(31, 35, 40);">🛠️</font><font style="color:rgb(31, 35, 40);"> 本地服务准备（可选）</font>

<font style="color:rgb(31, 35, 40);">如需使用本地模型，请提前准备：</font>

**<font style="color:rgb(31, 35, 40);">Ollama 设置：</font>**

```plain
# 安装并启动服务
ollama serve

# 验证：curl http://localhost:11434/api/tags
```

**<font style="color:rgb(31, 35, 40);">LMStudio 设置：</font>**

1. <font style="color:rgb(31, 35, 40);">启动 LMStudio 应用</font>
2. <font style="color:rgb(31, 35, 40);">加载任意模型</font>
3. <font style="color:rgb(31, 35, 40);">启动本地服务器（默认端口1234）</font>

## <font style="color:rgb(31, 35, 40);">✨</font><font style="color:rgb(31, 35, 40);"> 核心特性</font>

### <font style="color:rgb(31, 35, 40);">🔐</font><font style="color:rgb(31, 35, 40);"> 安全认证系统</font>

* **<font style="color:rgb(31, 35, 40);">密码认证</font>**<font style="color:rgb(31, 35, 40);">：初始密码</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">admin</font></code><font style="color:rgb(31, 35, 40);">，首次登录强制修改密码</font>
* **<font style="color:rgb(31, 35, 40);">会话管理</font>**<font style="color:rgb(31, 35, 40);">：基于Cookie的会话认证，有效期7天</font>
* **<font style="color:rgb(31, 35, 40);">密码安全</font>**<font style="color:rgb(31, 35, 40);">：SHA256 + 随机盐哈希存储</font>
* **<font style="color:rgb(31, 35, 40);">API保护</font>**<font style="color:rgb(31, 35, 40);">：所有管理接口都需要认证</font>

### <font style="color:rgb(31, 35, 40);">🔌</font><font style="color:rgb(31, 35, 40);"> 多平台支持</font>

* **<font style="color:rgb(31, 35, 40);">阿里云百炼 (DashScope)</font>**<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 通义千问系列模型</font>
* **<font style="color:rgb(31, 35, 40);">OpenRouter</font>**<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 访问多种开源和商业模型</font>
* **<font style="color:rgb(31, 35, 40);">硅基流动 (SiliconFlow)</font>**<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 高性价比开源模型聚合服务</font>
* **<font style="color:rgb(31, 35, 40);">OpenAI兼容</font>**<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 任何兼容OpenAI API格式的第三方服务</font>
* **<font style="color:rgb(31, 35, 40);">Ollama</font>**<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 本地部署的开源模型</font>
* **<font style="color:rgb(31, 35, 40);">LMStudio</font>**<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 本地GPU加速的模型服务</font>

### <font style="color:rgb(31, 35, 40);">🧠</font><font style="color:rgb(31, 35, 40);"> 智能路由系统</font>

* **<font style="color:rgb(31, 35, 40);">小模型路由模式</font>**<font style="color:rgb(31, 35, 40);">: 使用小模型分析用户意图，智能选择最适合的大模型</font>
* **<font style="color:rgb(31, 35, 40);">全局直连模式</font>**<font style="color:rgb(31, 35, 40);">: 按优先级顺序使用模型，支持自动降级</font>
* **<font style="color:rgb(31, 35, 40);">Claude Code API模式</font>**<font style="color:rgb(31, 35, 40);">: 保持原有的代理转发逻辑</font>

### <font style="color:rgb(31, 35, 40);">🔄</font><font style="color:rgb(31, 35, 40);"> 格式转换</font>

* **<font style="color:rgb(31, 35, 40);">Claude ⟷ OpenAI</font>**<font style="color:rgb(31, 35, 40);">: 自动转换不同平台的API格式</font>
* **<font style="color:rgb(31, 35, 40);">Tool Use 处理</font>**<font style="color:rgb(31, 35, 40);">: 智能将工具调用转换为自然语言描述</font>
* **<font style="color:rgb(31, 35, 40);">流式响应</font>**<font style="color:rgb(31, 35, 40);">: 支持实时流式输出转换</font>

### <font style="color:rgb(31, 35, 40);">🛡️</font><font style="color:rgb(31, 35, 40);"> 容错机制</font>

* **<font style="color:rgb(31, 35, 40);">自动降级</font>**<font style="color:rgb(31, 35, 40);">: 主模型不可用时自动切换到备用模型</font>
* **<font style="color:rgb(31, 35, 40);">连接测试</font>**<font style="color:rgb(31, 35, 40);">: 实时检测各平台连接状态</font>
* **<font style="color:rgb(31, 35, 40);">错误处理</font>**<font style="color:rgb(31, 35, 40);">: 详细的错误信息和恢复机制</font>

### <font style="color:rgb(31, 35, 40);">🎨</font><font style="color:rgb(31, 35, 40);"> 现代化界面</font>

* **<font style="color:rgb(31, 35, 40);">响应式设计</font>**<font style="color:rgb(31, 35, 40);">: 适配各种屏幕尺寸</font>
* **<font style="color:rgb(31, 35, 40);">拖拽排序</font>**<font style="color:rgb(31, 35, 40);">: 支持模型优先级的拖拽设置</font>
* **<font style="color:rgb(31, 35, 40);">实时监控</font>**<font style="color:rgb(31, 35, 40);">: 自动记录所有API调用，实时更新列表</font>
* **<font style="color:rgb(31, 35, 40);">JSON美化</font>**<font style="color:rgb(31, 35, 40);">: 语法高亮、格式化显示、一键复制</font>

## <font style="color:rgb(31, 35, 40);">📝</font><font style="color:rgb(31, 35, 40);"> API使用</font>

### <font style="color:rgb(31, 35, 40);">📡</font><font style="color:rgb(31, 35, 40);"> 接口地址</font>

```plain
POST http://127.0.0.1:8000/api/v1/claude-code/messages
```

### <font style="color:rgb(31, 35, 40);">💬</font><font style="color:rgb(31, 35, 40);"> 基础聊天</font>

```plain
curl -X POST http://127.0.0.1:8000/api/v1/claude-code/messages \
  -H "Content-Type: application/json" \
  -d '{
    "model": "claude-3-haiku",
    "messages": [
      {"role": "user", "content": "你好，请介绍一下你自己"}
    ],
    "stream": false
  }'
```

### <font style="color:rgb(31, 35, 40);">📊</font><font style="color:rgb(31, 35, 40);"> 流式响应</font>

```plain
curl -X POST http://127.0.0.1:8000/api/v1/claude-code/messages \
  -H "Content-Type: application/json" \
  -d '{
    "model": "claude-3-haiku",
    "messages": [
      {"role": "user", "content": "写一首关于春天的诗"}
    ],
    "stream": true
  }'
```

### <font style="color:rgb(31, 35, 40);">🔧</font><font style="color:rgb(31, 35, 40);"> 工具调用示例</font>

```plain
curl -X POST http://127.0.0.1:8000/api/v1/claude-code/messages \
  -H "Content-Type: application/json" \
  -d '{
    "model": "claude-3-sonnet",
    "messages": [
      {
        "role": "user",
        "content": [
          {
            "type": "text",
            "text": "帮我分析一下这个数据"
          },
          {
            "type": "tool_use", 
            "name": "data_analyzer",
            "input": {"data": [1,2,3,4,5]}
          }
        ]
      }
    ]
  }'
```

### <font style="color:rgb(31, 35, 40);">📋</font><font style="color:rgb(31, 35, 40);"> 支持的模型</font>

| **<font style="color:rgb(31, 35, 40);">平台</font>** | **<font style="color:rgb(31, 35, 40);">可用模型</font>** |
| --- | --- |
| <font style="color:rgb(31, 35, 40);">阿里云百炼</font> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">qwen-plus</font></code><br/><font style="color:rgb(31, 35, 40);">,</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">qwen-max</font></code><br/><font style="color:rgb(31, 35, 40);">,</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">qwen-coder</font></code><br/><font style="color:rgb(31, 35, 40);">   </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">QWEN-PLUS</font></code><br/><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">QWEN-MAX</font></code><br/><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">QWEN-编码器</font></code> |
| <font style="color:rgb(31, 35, 40);">OpenRouter</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">开放路由器</font> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">claude-3-opus</font></code><br/><font style="color:rgb(31, 35, 40);">,</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">gpt-4o</font></code><br/><font style="color:rgb(31, 35, 40);">,</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">llama-3.1-405b</font></code><br/><font style="color:rgb(31, 35, 40);">   </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">Claude-3-OPUS</font></code><br/><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">GPT-4O</font></code><br/><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);"> 骆驼-3.1-405B</font></code> |
| <font style="color:rgb(31, 35, 40);">硅基流动</font> | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">Qwen/QwQ-32B</font></code><br/><font style="color:rgb(31, 35, 40);">,</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">Qwen/Qwen2.5-72B-Instruct</font></code><br/><font style="color:rgb(31, 35, 40);">,</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">deepseek-ai/DeepSeek-V2.5</font></code><br/><font style="color:rgb(31, 35, 40);">   </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">Qwen/QwQ-32B</font></code><br/><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">Qwen/Qwen2.5-72B-Instruct</font></code><br/><font style="color:rgb(31, 35, 40);">、</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">deepseek-ai/DeepSeek-V2.5</font></code> |
| <font style="color:rgb(31, 35, 40);">OpenAI兼容</font> | <font style="color:rgb(31, 35, 40);">根据具体服务提供的模型</font> |
| <font style="color:rgb(31, 35, 40);">Ollama</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">成为</font> | <font style="color:rgb(31, 35, 40);">本地下载的所有模型</font> |
| <font style="color:rgb(31, 35, 40);">LMStudio</font> | <font style="color:rgb(31, 35, 40);">已加载的模型</font> |

<font style="color:rgb(89, 99, 110);">💡</font><font style="color:rgb(89, 99, 110);"> </font>**<font style="color:rgb(89, 99, 110);">提示</font>**<font style="color:rgb(89, 99, 110);">：完整模型列表可通过「刷新模型列表」功能获取</font>

## <font style="color:rgb(31, 35, 40);">⚙️</font><font style="color:rgb(31, 35, 40);"> 配置说明</font>

### <font style="color:rgb(31, 35, 40);">🔧</font><font style="color:rgb(31, 35, 40);"> 平台配置</font>

<font style="color:rgb(31, 35, 40);">所有配置都通过Web界面完成，支持实时保存和验证：</font>

| **<font style="color:rgb(31, 35, 40);">配置项</font>** | **<font style="color:rgb(31, 35, 40);">阿里云百炼</font>** | **<font style="color:rgb(31, 35, 40);">OpenRouter</font>****<font style="color:rgb(31, 35, 40);">  </font>****<font style="color:rgb(31, 35, 40);">开放路由器</font>** | **<font style="color:rgb(31, 35, 40);">硅基流动</font>** | **<font style="color:rgb(31, 35, 40);">OpenAI兼容</font>** | **<font style="color:rgb(31, 35, 40);">Ollama</font>****<font style="color:rgb(31, 35, 40);">  </font>****<font style="color:rgb(31, 35, 40);">成为</font>** | **<font style="color:rgb(31, 35, 40);">LMStudio</font>** |
| --- | --- | --- | --- | --- | --- | --- |
| **<font style="color:rgb(31, 35, 40);">API Key</font>****<font style="color:rgb(31, 35, 40);">  </font>****<font style="color:rgb(31, 35, 40);">API 密钥</font>** | <font style="color:rgb(31, 35, 40);">✅</font><font style="color:rgb(31, 35, 40);"> 必需</font> | <font style="color:rgb(31, 35, 40);">✅</font><font style="color:rgb(31, 35, 40);"> 必需</font> | <font style="color:rgb(31, 35, 40);">✅</font><font style="color:rgb(31, 35, 40);"> 必需</font> | <font style="color:rgb(31, 35, 40);">✅</font><font style="color:rgb(31, 35, 40);"> 必需</font> | <font style="color:rgb(31, 35, 40);">❌</font><font style="color:rgb(31, 35, 40);"> 不需要</font> | <font style="color:rgb(31, 35, 40);">❌</font><font style="color:rgb(31, 35, 40);"> 不需要</font> |
| **<font style="color:rgb(31, 35, 40);">服务地址</font>** | <font style="color:rgb(31, 35, 40);">默认</font> | <font style="color:rgb(31, 35, 40);">默认</font> | <font style="color:rgb(31, 35, 40);">默认</font> | <font style="color:rgb(31, 35, 40);">✅</font><font style="color:rgb(31, 35, 40);"> 必需配置</font> | <font style="color:rgb(31, 35, 40);">localhost:11434</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">本地主机：11434</font> | <font style="color:rgb(31, 35, 40);">localhost:1234</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">本地主机：1234</font> |
| **<font style="color:rgb(31, 35, 40);">超时设置</font>** | <font style="color:rgb(31, 35, 40);">30秒</font> | <font style="color:rgb(31, 35, 40);">30秒</font> | <font style="color:rgb(31, 35, 40);">30秒</font> | <font style="color:rgb(31, 35, 40);">30秒</font> | <font style="color:rgb(31, 35, 40);">30秒</font> | <font style="color:rgb(31, 35, 40);">30秒</font> |

### <font style="color:rgb(31, 35, 40);">🎯</font><font style="color:rgb(31, 35, 40);"> 路由模式配置</font>

#### <font style="color:rgb(31, 35, 40);">🟣</font><font style="color:rgb(31, 35, 40);"> 智能路由模式</font>

**<font style="color:rgb(31, 35, 40);">AI驱动的成本优化方案</font>**<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 专为 Claude Code 优化设计</font>

<font style="color:rgb(31, 35, 40);">使用小模型分析用户意图，智能选择最合适的模型，最大化节约成本：</font>

##### <font style="color:rgb(31, 35, 40);">🎯</font><font style="color:rgb(31, 35, 40);"> 路由策略</font>

<font style="color:rgb(31, 35, 40);">考虑到 Claude Code 系统提示词 token 很多的特点，通过智能路由避免大材小用：</font>

```plain
用户输入分析 → 意图识别 → 模型选择 → 成本优化
├─ "你好" → 简单对话 → 本地小模型 → 💰 节约90%成本
├─ "写一个函数" → 代码创建 → Qwen Coder → 🎯 专业能力
├─ "修改这个逻辑" → 代码优化 → Claude-4 → 🧠 高级推理
└─ "解释这段代码" → 代码理解 → 中等模型 → ⚖️ 平衡成本效果
```

##### <font style="color:rgb(31, 35, 40);">⚙️</font><font style="color:rgb(31, 35, 40);"> 配置示例</font>

```plain
{
  "config_type": "smart_routing",
  "routing_models": ["qwen-plus"],  // 用于意图识别的小模型
  "scenes": [
    {
      "name": "简单对话",
      "description": "日常问候、简单问答",
      "models": ["ollama:qwen-7b", "qwen-plus"]
    },
    {
      "name": "代码创建", 
      "description": "编写新函数、创建项目",
      "models": ["qwen-coder", "claude-3-sonnet"]
    },
    {
      "name": "逻辑修改",
      "description": "修改复杂逻辑、重构代码", 
      "models": ["claude-4", "gpt-4o"]
    }
  ]
}
```

##### <font style="color:rgb(31, 35, 40);">💡</font><font style="color:rgb(31, 35, 40);"> 智能路由优势</font>

* **<font style="color:rgb(31, 35, 40);">成本节约</font>**<font style="color:rgb(31, 35, 40);">：简单任务不浪费昂贵模型资源</font>
* **<font style="color:rgb(31, 35, 40);">专业匹配</font>**<font style="color:rgb(31, 35, 40);">：代码任务路由到代码专业模型</font>
* **<font style="color:rgb(31, 35, 40);">自动降级</font>**<font style="color:rgb(31, 35, 40);">：主模型不可用时自动切换备用方案</font>
* **<font style="color:rgb(31, 35, 40);">学习优化</font>**<font style="color:rgb(31, 35, 40);">：可捕获并分析路由决策，持续优化</font>

#### <font style="color:rgb(31, 35, 40);">🟢</font><font style="color:rgb(31, 35, 40);"> 全局直连模式</font>

<font style="color:rgb(31, 35, 40);">按优先级顺序使用模型，支持拖拽排序：</font>

```plain
{
  "config_type": "global_direct",
  "model_priority_list": [
    "claude-3-opus",
    "qwen-max", 
    "qwen-plus",
    "llama3.2"
  ]
}
```

<font style="color:rgb(89, 99, 110);">💡</font><font style="color:rgb(89, 99, 110);"> </font>**<font style="color:rgb(89, 99, 110);">提示</font>**<font style="color:rgb(89, 99, 110);">：所有配置都可在Web界面进行可视化管理</font>

## <font style="color:rgb(31, 35, 40);">🔧</font><font style="color:rgb(31, 35, 40);"> 技术架构</font>

### <font style="color:rgb(31, 35, 40);">🗂️</font><font style="color:rgb(31, 35, 40);"> 核心组件</font>

| **<font style="color:rgb(31, 35, 40);">模块</font>** | **<font style="color:rgb(31, 35, 40);">文件</font>** | **<font style="color:rgb(31, 35, 40);">功能描述</font>** |
| --- | --- | --- |
| **<font style="color:rgb(31, 35, 40);">平台接入</font>** | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">platforms.py</font></code> | <font style="color:rgb(31, 35, 40);">多平台API客户端实现</font> |
| **<font style="color:rgb(31, 35, 40);">智能路由</font>** | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">routing_system.py</font></code> | <font style="color:rgb(31, 35, 40);">意图识别和模型选择</font> |
| **<font style="color:rgb(31, 35, 40);">格式转换</font>** | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">format_converter.py</font></code> | <font style="color:rgb(31, 35, 40);">Claude⟷OpenAI格式互转</font> |
| **<font style="color:rgb(31, 35, 40);">统一服务</font>** | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">multi_platform_service.py</font></code> | <font style="color:rgb(31, 35, 40);">整合所有组件的入口</font> |
| **<font style="color:rgb(31, 35, 40);">数据存储</font>** | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">database.py</font></code> | <font style="color:rgb(31, 35, 40);">配置和会话数据管理</font> |
| **<font style="color:rgb(31, 35, 40);">Web接口</font>** | <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">main.py</font></code> | <font style="color:rgb(31, 35, 40);">FastAPI路由和认证</font> |

### <font style="color:rgb(31, 35, 40);">🏗️</font><font style="color:rgb(31, 35, 40);"> 系统架构</font>

```plain
[客户端请求] → [认证中间件] → [路由选择] → [格式转换] → [平台API] → [响应转换] → [返回结果]
```

### <font style="color:rgb(31, 35, 40);">💾</font><font style="color:rgb(31, 35, 40);"> 技术栈</font>

* **<font style="color:rgb(31, 35, 40);">后端</font>**<font style="color:rgb(31, 35, 40);">：FastAPI + SQLAlchemy + httpx</font><font style="color:rgb(31, 35, 40);">\ </font>**<font style="color:rgb(31, 35, 40);">后端</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">：FastAPI + SQLAlchemy + httpx</font>
* **<font style="color:rgb(31, 35, 40);">前端</font>**<font style="color:rgb(31, 35, 40);">：HTML + Tailwind CSS + JavaScript + Dragula.js</font><font style="color:rgb(31, 35, 40);">\ </font>**<font style="color:rgb(31, 35, 40);">前端</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">：HTML + Tailwind CSS + JavaScript + Dragula.js</font>
* **<font style="color:rgb(31, 35, 40);">数据库</font>**<font style="color:rgb(31, 35, 40);">：SQLite</font>
* **<font style="color:rgb(31, 35, 40);">异步</font>**<font style="color:rgb(31, 35, 40);">：asyncio + async/await</font><font style="color:rgb(31, 35, 40);">\ </font>**<font style="color:rgb(31, 35, 40);">异步</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">：asyncio + async/await</font>

### <font style="color:rgb(31, 35, 40);">📊</font><font style="color:rgb(31, 35, 40);"> 数据存储</font>

<font style="color:rgb(31, 35, 40);">系统使用SQLite存储以下数据：</font>

* <font style="color:rgb(31, 35, 40);">平台配置（API Keys、服务地址）</font>
* <font style="color:rgb(31, 35, 40);">模型配置（可用模型、优先级）</font>
* <font style="color:rgb(31, 35, 40);">路由配置（工作模式、场景设置）</font>
* <font style="color:rgb(31, 35, 40);">用户认证（密码哈希、会话token）</font>
* <font style="color:rgb(31, 35, 40);">API记录（调用历史、性能数据）</font>

## <font style="color:rgb(31, 35, 40);">📊</font><font style="color:rgb(31, 35, 40);"> API接口说明</font>

### <font style="color:rgb(31, 35, 40);">🔐</font><font style="color:rgb(31, 35, 40);"> 认证相关</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">POST /login</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 用户登录</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">POST /logout</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 用户登出</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">POST /change-password</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 修改密码</font>

### <font style="color:rgb(31, 35, 40);">⚙️</font><font style="color:rgb(31, 35, 40);"> 配置管理</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">GET/POST /api/platforms</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 平台配置管理</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">GET /api/models</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">+</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">POST /api/models/refresh</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 模型管理</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">GET/POST /api/routing</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 路由配置管理</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">GET /api/platforms/test</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 连接测试</font>

### <font style="color:rgb(31, 35, 40);">📋</font><font style="color:rgb(31, 35, 40);"> 数据查询</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">GET /api/records</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- API调用记录</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">GET /api/records/{id}</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 单条记录详情</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">POST /control/clear-records</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 清空记录</font>

### <font style="color:rgb(31, 35, 40);">🚀</font><font style="color:rgb(31, 35, 40);"> 核心转发</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">POST /{path:path}</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 统一API转发入口</font>

## <font style="color:rgb(31, 35, 40);">🔍</font><font style="color:rgb(31, 35, 40);"> 故障排除</font>

### <font style="color:rgb(31, 35, 40);">🚨</font><font style="color:rgb(31, 35, 40);"> 常见问题解决</font>

#### <font style="color:rgb(31, 35, 40);">❌</font><font style="color:rgb(31, 35, 40);"> 看不到任何模型</font>

**<font style="color:rgb(31, 35, 40);">症状</font>**<font style="color:rgb(31, 35, 40);">：刷新模型列表后仍然为空</font>

**<font style="color:rgb(31, 35, 40);">解决步骤</font>**<font style="color:rgb(31, 35, 40);">：</font>

1. <font style="color:rgb(31, 35, 40);">检查至少启用了一个平台 </font><font style="color:rgb(31, 35, 40);">✅</font>
2. <font style="color:rgb(31, 35, 40);">验证API Key或本地服务配置 </font><font style="color:rgb(31, 35, 40);">✅</font>
3. <font style="color:rgb(31, 35, 40);">查看终端错误日志 </font><font style="color:rgb(31, 35, 40);">✅</font>
4. <font style="color:rgb(31, 35, 40);">测试网络连接：</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">curl http://localhost:8000/api/models</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">✅</font>

#### <font style="color:rgb(31, 35, 40);">🔐</font><font style="color:rgb(31, 35, 40);"> 登录异常</font>

**<font style="color:rgb(31, 35, 40);">症状</font>**<font style="color:rgb(31, 35, 40);">：无法登录或登录后跳转异常</font>

**<font style="color:rgb(31, 35, 40);">解决方案</font>**<font style="color:rgb(31, 35, 40);">：</font>

* <font style="color:rgb(31, 35, 40);">使用初始密码：</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">admin</font></code>
* <font style="color:rgb(31, 35, 40);">确保新密码至少6位</font>
* <font style="color:rgb(31, 35, 40);">清除浏览器Cookie后重试</font>
* <font style="color:rgb(31, 35, 40);">检查是否有多个窗口同时登录</font>

#### <font style="color:rgb(31, 35, 40);">🌐</font><font style="color:rgb(31, 35, 40);"> 平台连接失败</font>

**<font style="color:rgb(31, 35, 40);">症状</font>**<font style="color:rgb(31, 35, 40);">：特定平台显示连接错误</font>

**<font style="color:rgb(31, 35, 40);">排查清单</font>**<font style="color:rgb(31, 35, 40);">：</font>

* **<font style="color:rgb(31, 35, 40);">网络问题</font>**<font style="color:rgb(31, 35, 40);">：检查互联网连接</font>
* **<font style="color:rgb(31, 35, 40);">服务状态</font>**<font style="color:rgb(31, 35, 40);">：确认本地服务已启动（Ollama/LMStudio）</font>
* **<font style="color:rgb(31, 35, 40);">配置错误</font>**<font style="color:rgb(31, 35, 40);">：验证API Key和服务地址</font>
* **<font style="color:rgb(31, 35, 40);">防火墙</font>**<font style="color:rgb(31, 35, 40);">：检查端口是否被阻止</font>

#### <font style="color:rgb(31, 35, 40);">🐛</font><font style="color:rgb(31, 35, 40);"> 启动失败</font>

**<font style="color:rgb(31, 35, 40);">症状</font>**<font style="color:rgb(31, 35, 40);">：服务无法正常启动</font>

**<font style="color:rgb(31, 35, 40);">解决方案</font>**<font style="color:rgb(31, 35, 40);">：</font>

```plain
# 1. 更新依赖
pip install -r requirements.txt

# 2. 检查端口占用
lsof -i :8000

# 3. 使用DEBUG模式启动
python3.11 start.py --debug
```

### <font style="color:rgb(31, 35, 40);">🔧</font><font style="color:rgb(31, 35, 40);"> 调试工具</font>

#### <font style="color:rgb(31, 35, 40);">📊</font><font style="color:rgb(31, 35, 40);"> 日志解读</font>

<font style="color:rgb(31, 35, 40);">主要日志标识符：</font>

* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">🚀</font><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);"> [MultiPlatformService]</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 多平台服务</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">📞</font><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);"> [DashScope]</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 阿里云百炼</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">🐋</font><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);"> [Ollama]</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- Ollama本地服务</font>
* <code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">🔐</font><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);"> [API]</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- 认证相关</font>

#### <font style="color:rgb(31, 35, 40);">🧪</font><font style="color:rgb(31, 35, 40);"> 快速验证</font>

```plain
# 检查服务状态
curl http://localhost:8000/api/models

# 测试平台连接
curl http://localhost:8000/api/platforms/test

# 查看配置信息
curl http://localhost:8000/control/config
```

### <font style="color:rgb(31, 35, 40);">💡</font><font style="color:rgb(31, 35, 40);"> 调试技巧</font>

#### <font style="color:rgb(31, 35, 40);">启用DEBUG模式</font>

```plain
# 方法1：启动时启用
python3.11 start.py --debug

# 方法2：Web界面控制
配置 → 系统设置 → 开启DEBUG模式

# 方法3：浏览器控制台
localStorage.setItem('DEBUG_MODE', 'true');
```

#### <font style="color:rgb(31, 35, 40);">重置配置</font>

<font style="color:rgb(31, 35, 40);">如果配置错乱，可以：</font>

1. <font style="color:rgb(31, 35, 40);">停止服务</font>
2. <font style="color:rgb(31, 35, 40);">删除</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">api_records.db</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">文件</font>
3. <font style="color:rgb(31, 35, 40);">重新启动服务</font>
4. <font style="color:rgb(31, 35, 40);">重新配置平台</font>

## <font style="color:rgb(31, 35, 40);">🛠️</font><font style="color:rgb(31, 35, 40);"> 开发扩展</font>

### <font style="color:rgb(31, 35, 40);">🔌</font><font style="color:rgb(31, 35, 40);"> 添加新平台</font>

<font style="color:rgb(31, 35, 40);">在</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">platforms.py</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">中继承</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">PlatformClient</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">基类：</font>

```plain
class NewPlatformClient(PlatformClient):
    async def get_models(self):
        # 实现获取模型列表
        pass
    
    async def chat_completion(self, model, messages, stream=False, **kwargs):
        # 实现聊天补全
        pass
```

### <font style="color:rgb(31, 35, 40);">🏢</font><font style="color:rgb(31, 35, 40);"> 企业级特性</font>

#### <font style="color:rgb(31, 35, 40);">🔒</font><font style="color:rgb(31, 35, 40);"> 私有化部署优势</font>

* **<font style="color:rgb(31, 35, 40);">代码安全</font>**<font style="color:rgb(31, 35, 40);">：完全本地部署，避免代码泄露给 Qwen、Kimi 等外部服务</font>
* **<font style="color:rgb(31, 35, 40);">成本可控</font>**<font style="color:rgb(31, 35, 40);">：使用本地大模型（如30B Coder），无需按 token 付费</font>
* **<font style="color:rgb(31, 35, 40);">多用户管理</font>**<font style="color:rgb(31, 35, 40);">：支持为公司同事分配多个 KEY，统一管理</font>
* **<font style="color:rgb(31, 35, 40);">详细统计</font>**<font style="color:rgb(31, 35, 40);">：记录每个用户的使用情况，便于成本分析和管理</font>

#### <font style="color:rgb(31, 35, 40);">🎯</font><font style="color:rgb(31, 35, 40);"> 典型企业应用</font>

1. **<font style="color:rgb(31, 35, 40);">软件公司</font>**<font style="color:rgb(31, 35, 40);">：开发团队使用本地 Coder 模型，保护代码机密</font>
2. **<font style="color:rgb(31, 35, 40);">金融机构</font>**<font style="color:rgb(31, 35, 40);">：严格的数据安全要求，完全私有化部署</font>
3. **<font style="color:rgb(31, 35, 40);">研发团队</font>**<font style="color:rgb(31, 35, 40);">：混合本地+云端模型，平衡安全与效果</font>
4. **<font style="color:rgb(31, 35, 40);">创业公司</font>**<font style="color:rgb(31, 35, 40);">：成本敏感，通过智能路由最大化节约 API 费用</font>


> 更新: 2025-08-08 16:39:29  
> 原文: <https://www.yuque.com/lixinsi/dtxgrg/tnohe0yb6daxihs4>