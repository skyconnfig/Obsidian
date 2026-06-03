---
title: skyconnfig/gsap-skills - GSAP AI 技能包
tags: [gsap, animation, ai-skills, tools]
created: 2026-06-01
---

# skyconnfig/gsap-skills — GSAP AI 技能包

## 概述

**skyconnfig/gsap-skills** 是 [GSAP](https://gsap.com)（GreenSock Animation Platform）官方 AI 技能包的镜像/复刻，托管于 GitHub 账户 skyconnfig 下。原始仓库由 GSAP 官方团队维护（[greensock/gsap-skills](https://github.com/greensock/gsap-skills)）。

这个仓库包含一组 **AI 技能文件**，专门用于指导 AI 编程助手（如 Codex、Cursor、Claude Code、Windsurf 等）正确使用 GSAP API。技能文件格式遵循 [Agent Skills](https://agentskills.io) 规范。

## 包含的技能模块

| 模块 | 说明 |
|------|------|
| **gsap-core** | 核心 API：gsap.to() / rom() / romTo()、缓动、持续时长、stagger、defaults、gsap.matchMedia() |
| **gsap-timeline** | 时间线：排序、position 参数、标签、嵌套、播放控制 |
| **gsap-scrolltrigger** | 滚动驱动动画：固定、scrub、触发器、刷新与清理 |
| **gsap-plugins** | 所有插件：ScrollTo、ScrollSmoother、Flip、Draggable、SplitText、MorphSVG、CustomEase 等 |
| **gsap-utils** | 工具函数：clamp、mapRange、
ormalize、interpolate、
andom、snap、wrap、pipe |
| **gsap-react** | React 集成：useGSAP hook、gsap.context()、清理、SSR |
| **gsap-performance** | 性能优化：使用 transform 而非布局属性、will-change、批处理、ScrollTrigger 建议 |
| **gsap-frameworks** | Vue / Svelte 等框架：生命周期、选择器作用域、卸载清理 |

## GSAP 免费说明

**GSAP 现已 100% 免费**（包括所有插件）。自 [Webflow 收购 GSAP](https://gsap.com/blog/webflow-GSAP/) 后，原 Club GSAP 专属插件（SplitText、MorphSVG、MotionPath 等）已面向所有人免费开放，包括商业用途。

安装方式：

`ash
npm install gsap
`

无需 .npmrc、无需认证 Token、无需私有仓库。

## 安装到 AI 助手

### npx skills（推荐，通用）

支持 Cursor、Claude Code、Codex、Windsurf、Copilot、Google Antigravity 等 40+ 智能助手：

`ash
npx skills add https://github.com/skyconnfig/gsap-skills
`

指定目标助手：

`ash
npx skills add https://github.com/skyconnfig/gsap-skills --agent cursor
`

### Claude Code

在 Claude Code 中使用插件市场：/plugin marketplace add greensock/gsap-skills

### Cursor

**Settings → Rules → Add Rule → Remote Rule (Github)**，填入 greensock/gsap-skills。

### 手动安装

将 skills/ 目录复制到对应助手的技能目录：

| 助手 | 技能目录 |
|------|----------|
| Claude Code | ~/.claude/skills/ |
| Cursor | ~/.cursor/skills/ |
| Codex | ~/.codex/skills/ |
| Google Antigravity | ~/.gemini/antigravity/skills/ 或 .agent/skills/ |

## 代码示例

安装到 AI 助手后，当询问动画相关问题时，AI 将按照官方最佳实践生成代码，例如：

### 基础动画

`javascript
import { gsap } from "gsap";

// 使用 transform 别名（推荐），而非 left/top
gsap.to(".box", {
  x: 100,          // 默认单位 px
  autoAlpha: 1,    // 自动处理 visibility + opacity
  duration: 0.6,
  ease: "power2.inOut"
});
`

### 时间线

`javascript
const tl = gsap.timeline({ defaults: { duration: 0.5, ease: "power2" } });
tl.to(".a", { x: 100 })
  .to(".b", { y: 50 }, "+=0.2")
  .to(".c", { opacity: 0 }, "-=0.1");
`

### ScrollTrigger

`javascript
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
gsap.registerPlugin(ScrollTrigger);

const tl = gsap.timeline({
  scrollTrigger: {
    trigger: ".section",
    start: "top center",
    end: "bottom center",
    scrub: true
  }
});
tl.to(".panel", { x: 100 });
`

### React

`javascript
import { useGSAP } from "@gsap/react";
gsap.registerPlugin(useGSAP);

function MyComponent() {
  const container = useRef();

  useGSAP(() => {
    gsap.to(".box", { x: 100 });
  }, { scope: container });

  return <div ref={container}><div className="box">Animate me</div></div>;
}
`

## 仓库结构

`
skyconnfig/gsap-skills/
├── README.md
├── AGENTS.md              # AI 编辑此仓库时的指引
├── LICENSE                # MIT
├── CLAUDE.md / GEMINI.md  # 重定向到 AGENTS.md
├── .claude-plugin/        # Claude Code 插件配置
├── .cursor-plugin/        # Cursor 插件配置
├── .github/
│   ├── copilot-instructions.md
│   └── instructions/      # Copilot 路径级指令
├── assets/                # 图标和 Logo
├── examples/              # 示例代码（vanilla、React、Vue、Nuxt）
└── skills/                # 核心：AI 技能文件
    ├── llms.txt           # 技能索引
    ├── gsap-core/
    ├── gsap-timeline/
    ├── gsap-scrolltrigger/
    ├── gsap-plugins/
    ├── gsap-utils/
    ├── gsap-react/
    ├── gsap-performance/
    └── gsap-frameworks/
`

## 和 greensock/gsap-skills 的关系

skyconnfig/gsap-skills 与官方 greensock/gsap-skills 在内容上完全一致，是官方仓库的一份镜像。原始作者为 GSAP 核心团队成员 jackdoyle（jack@greensock.com），该复刻主要用于国内网络环境下的加速访问或特定场景使用。

## 总结

skyconnfig/gsap-skills 是一份 **面向 AI 编程助手的 GSAP 最佳实践百科**。安装后，AI 助手在生成动画相关代码时将自动遵循 GSAP 官方推荐的方式编写——使用 transform 别名、避免布局属性动画、正确注册插件、处理 React/Vue 清理逻辑等。如果你是前端开发者并频繁使用 AI 辅助编程，建议在两个地方使用这个技能包：
1. **个人 AI 编程助手的技能目录**
2. **项目根目录**（通过 .cursorrules / .claude/skills 等机制让项目级 AI 也遵循 GSAP 最佳实践）
