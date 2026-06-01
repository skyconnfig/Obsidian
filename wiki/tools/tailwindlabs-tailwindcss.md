---
title: tailwindlabs/tailwindcss - 工具优先 CSS 框架
tags: [css, tailwindcss, framework, frontend, tools]
created: 2026-06-01
---

# tailwindlabs/tailwindcss — 工具优先 CSS 框架

## 概述

[Tailwind CSS](https://tailwindcss.com) 是一个**工具优先（utility-first）的 CSS 框架**，由 Tailwind Labs 开发（创始人 Adam Wathan）。它提供低级别的工具类（utility class），让你直接在 HTML 中组合样式，无需编写自定义 CSS。

| 元数据 | 值 |
|--------|-----|
| GitHub | [tailwindlabs/tailwindcss](https://github.com/tailwindlabs/tailwindcss) |
| Star | ⭐ 95,176 |
| 语言 | TypeScript |
| 协议 | MIT |
| 创建 | 2017-10-06 |
| 最新推送 | 2026-05-29 |

## 核心特性

- **工具优先** — 提供 lex、pt-4、	ext-center、otate-90 等数千个工具类，直接组合使用
- **响应式设计** — 通过 sm:、md:、lg:、xl:、2xl: 前缀实现断点
- **暗色模式** — 通过 dark: 前缀支持
- **自定义设计系统** — 通过 	ailwind.config.js 配置文件定制颜色、间距、字体等
- **JIT（Just-in-Time）引擎** — 按需生成 CSS，文件体积极小
- **PostCSS 插件** — 作为 PostCSS 插件集成到构建流程
- **框架无关** — 支持 React、Vue、Next.js、Nuxt、Astro 等所有主流前端框架

## 安装

`ash
npm install tailwindcss @tailwindcss/vite
`

然后在 Vite 配置中添加插件：

`javascript
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [tailwindcss()],
})
`

在 CSS 入口文件引入：

`css
@import "tailwindcss";
`

## 生态

| 项目 | 说明 |
|------|------|
| [Tailwind CSS](https://github.com/tailwindlabs/tailwindcss) | 核心框架 |
| [@tailwindcss/typography](https://github.com/tailwindlabs/tailwindcss-typography) | 文章排版插件（prose 类） |
| [@tailwindcss/forms](https://github.com/tailwindlabs/tailwindcss-forms) | 表单样式重置 |
| [@tailwindcss/aspect-ratio](https://github.com/tailwindlabs/tailwindcss-aspect-ratio) | 宽高比工具 |
| [@tailwindcss/container-queries](https://github.com/tailwindlabs/tailwindcss-container-queries) | 容器查询支持 |
| [Headless UI](https://github.com/tailwindlabs/headlessui) | 无样式 UI 组件库 |
| [Heroicons](https://heroicons.com) | Tailwind 团队设计的 SVG 图标集 |

## 社区

- 官网与文档: [tailwindcss.com](https://tailwindcss.com)
- GitHub Discussions: 讨论最佳实践和功能建议
- 贡献指南: [CONTRIBUTING.md](https://github.com/tailwindlabs/tailwindcss/blob/main/.github/CONTRIBUTING.md)

## 总结

Tailwind CSS 是目前最流行的 CSS 框架之一，95k+ Star。它颠覆了传统"语义化 CSS"的写法，通过组合工具类来构建 UI，特别适合组件化开发（React/Vue）和快速原型。缺点是 HTML 中类名会变得冗长，但配合组件抽象可以很好解决。
