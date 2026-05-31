# OpenRouter

> 多模型 LLM API 聚合网关 · 单一 API 端点访问数百个模型 · 支持免费额度
> 来源：`raw/clippings/白嫖 OpenRouter 免费模型` + `Horizon 日报 2026-05-31`

---

## 简介

OpenRouter 是一个 LLM API 网关，充当用户与各种大模型提供商之间的代理。通过一个 API Key，即可访问包括 DeepSeek、Qwen、Llama 等在内的数百个模型，统一管理账单和用量。

## 核心特点

| 特性 | 说明 |
|------|------|
| **多模型接入** | 单一 API 端点访问数百个模型 |
| **免费额度** | 免费账号每天 50 次请求 |
| **账单上限** | 支持硬性账单上限，避免意外超支 |
| **付费升级** | Pay-as-you-go 计划（最低 $10），免费模型额度提升至每天 1000 次 |
| **模型前缀** | 免费模型 ID 以 `:free` 结尾（如 `deepseek/deepseek-v4-flash:free`） |

## 融资动态

2026 年 5 月，OpenRouter 完成 **1.13 亿美元 B 轮融资**，由创始人领导和控制。这笔融资验证了市场对统一、可控制成本的多样化 LLM 访问的日益增长的需求。

## 使用方式

### 1. 注册并获取 API Key

1. 访问 [openrouter.ai](https://openrouter.ai/) 注册账号
2. 登录后点击 **Get API Key** 创建 Key
3. 在搜索框输入 `free` 查看当前免费模型
4. 复制模型 ID（如 `deepseek/deepseek-v4-flash:free`），**保留 `:free` 后缀**

### 2. 在 EchoBird 中配置

在模型中心 → 模型中转站 → OpenRouter，添加模型配置：
- **名称**：自定义标签
- **模型 ID**：带 `:free` 后缀的 ID
- **API 密钥**：粘贴 OpenRouter API Key

## 相关概念

- [[tools/_index.md|工具生态索引]]
- [[AI编程-Codex-Cursor实战]] — AI 编程工具链
