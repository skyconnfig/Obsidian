# Andrej Karpathy

> 前 Tesla AI 总监、OpenAI 创始成员 · LLM Knowledge Base 理念提出者 · AI 教育者
> 来源：`raw/clippings/Post by @卡帕蒂 on X`

---

## 简介

Andrej Karpathy 是 AI 领域最具影响力的研究者和教育家之一。他是 OpenAI 的创始成员之一，曾任 Tesla AI 总监（负责 Autopilot 计算机视觉），后在 OpenAI 领导研究。他以清晰的 AI 教育内容而闻名，尤其是"从零开始"系列讲座和 LLM 相关解读。

## 核心贡献

### LLM Compiled Wiki（知识库编译器）

> 2026 年 4 月，Karpathy 在 X 上发表了一篇影响深远的推文，描述了使用 LLM 构建个人知识库的方法——即本知识库的核心哲学。

其核心理念：

| 环节 | 做法 |
|------|------|
| **收集 (Ingest)** | 原始素材存入 `raw/` 目录（文章、论文、图片等）|
| **编译 (Compile)** | LLM 增量编译为 `wiki/` 目录结构，包含摘要、反向链接、概念分类 |
| **工具链** | Obsidian 作为前端 IDE，Web Clipper 剪藏，图片本地化 |
| **查询 (Q&A)** | 达到 ~100 篇 / ~40 万字后，LLM 可基于 wiki 回答复杂问题 |
| **产出 (Output)** | Markdown / Marp 幻灯片 / matplotlib，归档回 wiki 实现知识叠加 |
| **健康检查 (Lint)** | LLM 定期发现不一致、补充缺失数据、推荐新文章候选 |

Karpathy 的关键洞察：
> *"I thought I had to reach for fancy RAG, but the LLM has been pretty good at auto-maintaining index files and brief summaries."*
> *"You rarely ever write or edit the wiki manually, it's the domain of the LLM."*

### Vibe Coding（氛围编码）

Karpathy 在 2025 年提出的术语，描述通过提示让 AI 生成代码而无需深入审查的做法。这一概念引发了广泛讨论——既有支持者认为它降低了编程门槛，也有批评者担心代码质量。

## 相关链接

- Karpathy 的 X/Twitter: [@karpathy](https://x.com/karpathy)
- LLM Knowledge Base 原始推文: [[Post by @卡帕蒂 on X]]
- 本知识库的实现: [[知识库迭代机制]]

## 关联概念

- [[concepts/_index.md|核心概念]]
- [[tools/AI编程-Codex-Cursor实战]] — AI 编程工具链
