# OpenCode 中使用 Stitch Skills 指南

#

### github 地址：<https://github.com/google-labs-code/stitch-skills>

## 快速开始

你已经在 OpenCode 中成功安装了 6 个 Stitch 相关的技能！现在可以开始使用它们来生成 UI 界面。

## 📦 可用的技能

### 1. **enhance-prompt** - 优化提示词

将模糊的 UI 想法转化为 Stitch 优化后的提示词。\
**使用方法**:

```plain
"帮我优化这个提示词：创建一个现代的登录页面"
```

### 2. **design-md** - 创建设计系统

从 Stitch 项目中分析并生成语义化的设计系统文档。\
**使用方法**:

```plain
"分析我的设计系统并生成 DESIGN.md 文件"
```

### 3. **stitch-loop** - 迭代式网站构建

自动化循环构建网站，每次生成一个页面。

### 4. **react-components** - React 组件开发

生成 React 组件代码。

### 5. **shadcn-ui** - shadcn/ui 组件集成

使用 shadcn/ui 组件库创建设计。

### 6. **remotion** - 视频/动画开发

创建动画和视频内容。

## 🚀 快速示例

### 示例 1: 生成一个登录页面

直接在 OpenCode 中输入：

```plain
使用 enhance-prompt 技能，将这个想法转化为 Stitch 优化提示词：
"创建一个登录页面，包含邮箱和密码输入框，以及登录按钮"
```

### 示例 2: 使用设计系统

```plain
使用 design-md 技能，分析当前设计并创建设计系统文档
```

### 示例 3: 完整的工作流

```plain
1. 先用 enhance-prompt 优化你的 UI 想法
2. 然后使用 stitch-loop 技能迭代生成页面
3. 用 design-md 保持设计一致性
```

## 📝 最佳实践

### 1. 提供详细的描述

❌ 错误: "做一个好看的页面"\
✅ 正确: "创建一个 SaaS 仪表盘，包含侧边栏导航、顶部搜索栏和三个数据卡片"

### 2. 指定设计风格

* 现代 (Modern)
* 极简 (Minimal)
* 复古 (Retro)
* 专业 (Professional)
* 活泼 (Playful)

### 3. 包含具体组件

明确说出你需要的组件：

* "导航栏"
* "卡片网格布局"
* "表单字段"
* "页脚链接"

## 🔧 技能组合使用

### 组合 1: 从想法到实现

```plain
用户: "我想要一个产品展示页面"
OpenCode 内部流程:
1. enhance-prompt → 优化提示词
2. design-md → 确保设计一致性
3. stitch-loop → 生成页面
```

### 组合 2: 批量生成页面

1. 使用 enhance-prompt 优化所有页面需求
2. 使用 stitch-loop 循环生成
3. 使用 design-md 保持一致性

## 💡 使用技巧

### 提示词优化

* 描述页面目的和氛围
* 列出页面结构（1、2、3...）
* 指定颜色和字体
* 说明交互行为

### 设计系统

* 先生成一个参考页面
* 使用 design-md 提取设计系统
* 在后续页面中复用设计系统

### 迭代开发

* 每次只生成一个页面
* 使用 stitch-loop 跟踪进度
* 保持文件结构清晰

## 📂 项目结构建议

```plain
project/
├── DESIGN.md          # 设计系统（从 design-md 生成）
├── SITE.md            # 网站结构
├── next-prompt.md     # 当前任务（baton 文件）
├── stitch.json        # Stitch 项目配置
├── queue/             # 临时文件
│   ├── page1.html
│   └── page1.png
└── site/              # 生产环境文件
    └── public/
        └── index.html
```

## 🎯 常见使用场景

### 场景 1: 创建新页面

```plain
"创建一个联系我们页面，包含表单和地图"
```

### 场景 2: 修改现有页面

```plain
"在首页添加一个英雄区域，包含大标题和 CTA 按钮"
```

### 场景 3: 创建设计系统

```plain
"分析登录页面的设计并生成 DESIGN.md"
```

### 场景 4: 批量生成

```plain
"按照 SITE.md 中的 sitemap 生成所有页面"
```

## ⚠️ 注意事项

1. **设计一致性**: 使用 design-md 确保所有页面风格统一
2. **文件命名**: 保持清晰的文件命名
3. **版本控制**: 定期提交生成的代码
4. **备份**: 保存原始的 prompt 和生成结果

## 🔗 相关资源

* **Stitch 文档**: <https://stitch.withgoogle.com/docs/>
* **技能仓库**: <https://github.com/google-labs-code/stitch-skills>
* **shadcn/ui**: <https://ui.shadcn.com/>

## ❓ 遇到问题？

1. **生成的页面不符合预期**
   * 使用 enhance-prompt 优化提示词
   * 添加更多细节描述
2. **设计风格不统一**
   * 使用 design-md 提取并复用设计系统
3. **页面无法正常显示**
   * 检查 HTML 文件路径
   * 验证 CSS/JS 引用

## 🎉 开始使用！

直接在 OpenCode 中输入你的需求，例如：

```plain
"使用 stitch-loop 技能创建一个完整的落地页网站，包括首页、关于我们、联系我们三个页面"
```

或者更简单的：

```plain
"创建一个现代风格的导航栏，使用 Malibu Blue 作为主色调"
```

技能的详细使用说明，请查看：

* `~\.agents\skills\enhance-prompt\SKILL.md`
* `~\.agents\skills\design-md\SKILL.md`
* `~\.agents\skills\stitch-loop\SKILL.md`\
  祝你使用愉快！🎨\
  Thinking: 用户想知道如何在 OpenCode 中使用这些技能。我已经读取了技能的详细文档，并创建了一份使用指南。现在让我给用户一个清晰的总结。\
  🎯 OpenCode 中使用 Stitch Skills 指南\
  你已在 OpenCode 中全局安装了 6 个 Stitch 技能！以下是使用方法和最佳实践。\
  📦 已安装的技能

| 技能 | 功能 | 使用方式 |
| --- | --- | --- |
| enhance-prompt | 优化 UI 提示词 | "帮我优化提示词：创建登录页面" |
| design-md | 创建设计系统 | "生成 DESIGN.md 文件" |
| stitch-loop | 迭代构建网站 | "使用 stitch-loop 生成所有页面" |
| react-components | React 组件 | "创建 React 按钮组件" |
| shadcn-ui | shadcn/ui 集成 | "用 shadcn/ui 创建表单" |
| remotion | 动画/视频 | "创建页面动画效果" |
| 🚀 快速开始 |  |  |
| 直接在 OpenCode 中输入你的需求即可： |  |  |
| 示例 1: 生成登录页面 |  |  |
| "创建一个登录页面，包含邮箱、密码输入框和登录按钮，使用 Malibu Blue 配色" |  |  |
| 示例 2: 优化你的想法 |  |  |
| "优化这个提示词：做一个好看的个人主页" |  |  |
| 示例 3: 完整工作流 |  |  |
| "使用 stitch-loop 技能创建一个包含首页、关于我们、联系我们的完整网站" |  |  |
| 💡 使用技巧 |  |  |
| 提供详细信息 |  |  |
| ✅ 好的: "创建一个 SaaS 仪表盘，包含侧边导航、3个数据卡片和搜索栏" |  |  |
| ❌ 差的: "做一个仪表盘" |  |  |
| 指定设计风格 |  |  |

* 现代 (Modern)
* 极简 (Minimal)
* 专业 (Professional)
* 活泼 (Playful)\
  列出页面结构

1. 顶部导航栏
2. 英雄区域（大标题 + CTA）
3. 功能介绍区
4. 页脚\
   🔧 技能组合使用\
   最佳实践工作流
5. 先用 enhance-prompt 优化你的想法
6. 用 design-md 提取设计系统
7. 用 stitch-loop 迭代生成页面
8. 保持一致性 复用设计系统\
   📖 详细文档\
   我已创建使用指南：

* 使用指南: ~.agents\skills\OPENCODE\_USAGE\_GUIDE.md
* 技能详情:
  * \~.agents\skills\enhance-prompt\SKILL.md
  * \~.agents\skills\design-md\SKILL.md
  * \~.agents\skills\stitch-loop\SKILL.md\
    🎯 立即尝试\
    在 OpenCode 中输入：

> "使用 stitch-loop 技能，按照 Neo-brutalist 风格创建一个包含首页、产品页、定价页的完整网站"\
> 技能已准备就绪，开始你的 UI 生成之旅吧！🎨✨


> 更新: 2026-05-02 17:59:45  
> 原文: <https://www.yuque.com/lixinsi/yh04az/nhvlgo15hagwsc2a>