---
title: skyconnfig/claude-ads - 付费广告审计 AI 技能
tags: [claude, ads, advertising, ppc, audit, marketing, tools]
created: 2026-06-01
---

# skyconnfig/claude-ads — 付费广告审计 AI 技能

## 概述

[Claude Ads](https://github.com/skyconnfig/claude-ads) 是一个面向 **Claude Code** 的付费广告审计 AI 技能包。它将原本需要 **4-6 小时** 资深 PPC 专家手动完成的广告账户审计，压缩到 **10-15 分钟**，覆盖 250+ 检查项，输出 0-100 加权评分和优先级的行动计划。

| 元数据 | 值 |
|--------|-----|
| GitHub | [skyconnfig/claude-ads](https://github.com/skyconnfig/claude-ads) |
| 描述 | 面向 Google、Meta、YouTube、LinkedIn、TikTok、Microsoft、Apple Ads 的综合付费广告审计与优化技能 |
| 语言 | 无特定语言（Claude Code Skill） |
| 协议 | MIT |
| 创建 | 2026-06-01 |
| 最新推送 | 2026-05-18 |

## 核心功能

### 支持的广告平台

| 平台 | 检查项数量 | 说明 |
|------|-----------|------|
| Google Ads | 80+ | AI Max 设置、品牌排除、FUE、质量得分等 |
| Meta Ads | 50+ | Andromeda + GEM + Lattice 时代的检查 |
| YouTube | — | 视频广告专项审计 |
| LinkedIn | 27+ | B2B 广告审计 |
| TikTok | — | 短视频广告审计 |
| Microsoft Ads | — | Bing 广告审计 |
| Apple Ads | — | Apple Search Ads 审计 |
| Amazon Ads | — | 电商广告审计 |

### 命令

在 Claude Code 中安装后，可使用以下命令：

- /ads audit — 运行全平台广告审计，派发 6 个并行子代理，返回 Ads Health Score
- /ads google — Google Ads 专项
- /ads meta — Meta Ads 专项
- 更多命令见 README

### 评分体系

审计输出结构化 JSON，包含：

`json
{
  "ads_health_score": 73,
  "grade": "C",
  "audit_date": "2026-05-18",
  "platforms": {
    "google_ads": { "score": 78, "grade": "B", "checks_run": 80, "critical": 2, "high": 5 },
    "meta_ads":   { "score": 64, "grade": "C", "checks_run": 50, "critical": 4, "high": 7 }
  }
}
`

### 技术亮点

- **250+ 加权检查项** — 覆盖所有主流广告平台
- **并行子代理架构** — 审计时分派 6 个独立子代理同时检查不同平台
- **行业模板** — 内置不同行业的优化模板
- **AI 创意生成** — 利用 AI 生成广告创意建议
- **10-Principle Thinking Framework** — 每个审计、计划和创意输出在共享认知框架下运行
- **Deterministic** — 本地运行，MIT 许可
- **41 项 pytest 测试套件** — 路由快照、209 检查项覆盖、评分确定性等

## 安装

### Claude Code

`ash
/plugin marketplace add skyconnfig/claude-ads
`

### 手动安装

`ash
git clone https://github.com/skyconnfig/claude-ads.git
cd claude-ads
./install.sh          # macOS/Linux
./install.ps1         # Windows PowerShell
`

支持 Claude Code、Codex CLI、Cursor、Windsurf、Gemini CLI、Goose 等运行环境。

## 适用人群

- **PPC 代理商** — 快速审计多个客户账户，输出标准化报告
- **内部营销团队** — 自审广告账户，发现优化机会
- **自由广告顾问** — 提升审计效率，提供更专业的服务

## 与同类工具对比

传统广告审计流程：
1. 手动登录每个广告平台
2. 逐项检查设置、预算、关键词、受众等
3. 整理数据，撰写报告
4. 耗时 4-6 小时/账户

Claude Ads：
1. 在 Claude Code 中运行 /ads audit
2. 10-15 分钟输出完整审计报告
3. 包含评分、优先级、行动项

## 仓库结构

`
claude-ads/
├── ads/              # 核心审计技能文件
│   ├── references/   # 参考文档（thinking-framework 等）
│   └── ...
├── assets/           # 图片、Logo、演示 GIF
├── tests/            # 41 项 pytest 测试
├── install.sh        # macOS/Linux 安装脚本
├── install.ps1       # Windows 安装脚本
├── CHANGELOG.md      # 更新日志
└── README.md         # 项目说明
`

## 总结

Claude Ads 是一个将 LLM 能力与专业领域知识深度结合的典型案例——它不是简单的"AI 包装"，而是构建了完整的审计框架、评分体系和并行代理架构，真正替代了传统需要数小时手工完成的专业工作。适合任何做付费广告投放的团队或个人使用。
