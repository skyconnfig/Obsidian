# Claude-Code-Spec-Workflow驱动开发

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">在当前的软件工程领域，如何将大型语言模型（LLM）高效、规范地集成到开发生命周期中，已成为一个重要的研究方向。</font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">claude-code-spec-workflow</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 是一个在GitHub上开源的项目（已获得1.7k Star），它为此提供了一套颇具创新性的解决方案。该项目旨在通过自动化的工作流，将针对Claude等先进AI模型的交互标准化，从而显著提升功能开发与问题修复的效率和质量。</font>

*<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">🚀</font>\_\_<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">本篇笔记所对应的视频：</font>*

* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> 通过哔哩哔哩观看</font>*](https://www.bilibili.com/video/BV1Tte9zYEGY/)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> 通过YouTube观看</font>*](https://youtu.be/ruAy8oBR5lA)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> Subagents视频</font>*](https://youtu.be/GjlkRcNNONo)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> Gemini CLI视频</font>*](https://youtu.be/v41xKxZmygU)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> Context Engineering视频</font>*](https://youtu.be/oEZ7aN7jOEI)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> SuperClaude视频</font>*](https://youtu.be/bMO13RNjvBk)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> Claudia视频</font>*](https://youtu.be/WIwW7V56wxE)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> Task Master视频</font>*](https://youtu.be/6dhOUJ_vnIY)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> Zen MCP编程视频</font>*](https://youtu.be/2WgICfNzgZY)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> Augment编程视频</font>*](https://youtu.be/DbM3QZy5I6E)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> Serena MCP视频</font>*](https://youtu.be/DZ-gLebVnmg)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> 我的开源项目</font>*](https://github.com/win4r/AISuperDomain)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);"> 请我喝咖啡</font>*](https://ko-fi.com/aila)
* *<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 我的微信：stoeng</font>*
* *<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">👉👉👉</font>\_\_<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 承接大模型微调、RAG、AI智能体、AI相关应用开发等项目。</font>*

*<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">🔥</font>\_\_<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">AI智能体相关视频</font>*

* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">AI智能体视频 1</font>*](https://youtu.be/vYm0brFoMwA)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">AI智能体视频 2</font>*](https://youtu.be/szTXELuaJos)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">AI智能体视频 3</font>*](https://youtu.be/szTXELuaJos)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">AI智能体视频 4</font>*](https://youtu.be/RxR3x_Uyq4c)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">AI智能体视频 5</font>*](https://youtu.be/IrTEDPnEVvU)
* [*<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">AI智能体视频 6</font>*](https://youtu.be/q_IdxUGZsow)

### **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">核心功能与工作流</font>**[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E6%A0%B8%E5%BF%83%E5%8A%9F%E8%83%BD%E4%B8%8E%E5%B7%A5%E4%BD%9C%E6%B5%81)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">该项目的核心是两个高度结构化的工作流：</font>

1. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">规格驱动开发（Spec Workflow）</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">: 针对新功能的开发，此工作流遵循一个经典的软件工程路径：</font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">需求分析 → 技术设计 → 任务分解 → 代码实现</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">。开发者仅需通过一个简单的指令（</font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">/spec-create</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">）发起请求，系统便会自动引导AI生成标准化的需求文档、技术架构设计以及原子化的开发任务列表。这种方式确保了从概念到代码的每一步都有据可依，降低了开发过程中的不确定性。</font>
2. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">标准化Bug修复（Bug Fix Workflow）</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">: 为应对常见的代码缺陷，项目提供了一套覆盖</font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">报告 → 分析 → 修复 → 验证</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">的完整流程。每个阶段都对应着明确的指令，旨在引导AI进行根本原因分析（RCA）、生成修复方案并最终验证其有效性，使整个修复过程更加透明和高效。</font>

### **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">关键技术优势</font>**[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E5%85%B3%E9%94%AE%E6%8A%80%E6%9C%AF%E4%BC%98%E5%8A%BF)

* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">项目级上下文感知（Steering Documents）</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">: 项目通过引入“引导文档”（Steering Documents）机制，允许团队定义项目的产品愿景、技术栈规范、代码结构标准等核心信息。AI在执行所有任务时都会以此为准绳，确保其产出（无论是代码还是文档）都与项目既定规范保持高度一致。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">极致的Token优化</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">: 该工作流内置了一套智能上下文缓存与共享机制。通过批量加载和会话级缓存，它能将API请求中的Token数量减少60-80%，这不仅加快了AI的响应速度，也为使用者大幅节省了成本。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">可视化与协同</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">: 项目提供了一个基于Web的实时仪表盘（Dashboard），用于直观地追踪所有开发任务和Bug修复的进度。此外，它还支持通过隧道技术（Tunneling）生成安全的外部访问链接，便于项目经理或客户等非技术人员进行远程监督和协作。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">专业的工程实践</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">: 整个项目采用TypeScript进行全栈开发，保证了代码的类型安全和可维护性。同时，它集成了现代化的构建工具链和严格的代码规范，体现了优秀的工程素养。</font>

### **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">应用场景</font>**[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E5%BA%94%E7%94%A8%E5%9C%BA%E6%99%AF)

<code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">claude-code-spec-workflow</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">尤其适用于以下场景：</font>

* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">敏捷开发团队</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：需要快速响应需求变化，并希望通过AI加速原型设计和功能迭代。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">大型项目维护</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：希望建立标准化的开发与修复流程，确保代码质量和团队协作的一致性。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">技术探索与集成</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">：寻求将大型语言模型深度整合到现有DevOps或开发工具链中的团队。</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">该项目不仅是一个提升效率的工具集，更代表了一种将AI能力系统化、工程化的开发新范式。它通过为AI的“创造力”套上结构化的“缰绳”，使其能更可靠、更高效地服务于复杂的软件工程任务。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">🚀</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Claude Code Spec Workflow安装与使用</font>**[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#claude-code-spec-workflow%E5%AE%89%E8%A3%85%E4%B8%8E%E4%BD%BF%E7%94%A8)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">1️⃣</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">安装</font>**

```plain
Copy code# 全局安装
npm i -g @pimzino/claude-code-spec-workflow

# 在项目目录中运行安装命令
claude-code-spec-workflow
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">2️⃣</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">使用</font>**

```plain
Copy code# 一条命令自动化执行
/spec-create feature-name "Description"
```

**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">✨</font>\*\*\*\*<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">自动化执行的工作流程：</font>**

1. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">需求</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">→ 用户故事 + 验收标准</font>
2. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">设计</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">→ 技术架构 + 图表</font>
3. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">任务</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">→ 原子化的、对智能代理友好的任务分解</font>
4. **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">命令</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">→ 自动生成的任务命令（可选）</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">3️⃣</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">执行任务</font>**

```plain
Copy code# 手动执行任务
/spec-execute 1 feature-name

# 自动执行任务
/feature-name-task-1
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">4️⃣</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> 错误修复工作流 - 快速修复</font>

```plain
Copy code# 记录这个 bug
/bug-create issue-name " Description "

# 查找根本原因
/bug-analyze

# 实施解决方案               
/bug-fix

# 确认问题已解决                   
/bug-verify
```

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">5️⃣</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Steering Setup项目导航设置 (项目上下文)</font>**

```plain
Copy code# 创建 product.md, tech.md, structure.md
/spec-steering-setup
```

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">🚀</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">MCP Server设置方式</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#mcp-server%E8%AE%BE%E7%BD%AE%E6%96%B9%E5%BC%8F)

1. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Cursor</font>

```plain
Copy code{
  "mcp.servers": {
    "spec-workflow": {
      "command": "npx",
      "args": ["-y", "@pimzino/spec-workflow-mcp@latest", "/path/to/your/project"]
    }
  }
}
```

1. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Claude Code</font>

```plain
Copy codeclaude mcp add spec-workflow npx @pimzino/spec-workflow-mcp@latest /path/to/your/project
```

1. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Claude Desktop</font>

```plain
Copy code{
  "mcpServers": {
    "spec-workflow": {
      "command": "npx",
      "args": ["-y", "@pimzino/spec-workflow-mcp@latest", "/path/to/your/project"]
    }
  }
}
```

1. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Cline</font>

```plain
Copy code{
  "mcpServers": {
    "spec-workflow": {
      "command": "npx",
      "args": ["-y", "@pimzino/spec-workflow-mcp@latest", "/path/to/your/project"]
    }
  }
}
```

1. <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">OpenCode</font>

```plain
Copy code{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
    "spec-workflow": {
      "type": "local",
      "command": ["npx", "-y", "@pimzino/spec-workflow-mcp@latest", "/path/to/your/project"],
      "enabled": true
    }
  }
}
```

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">🚀</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">启动仪表盘</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E5%90%AF%E5%8A%A8%E4%BB%AA%E8%A1%A8%E7%9B%98)

```plain
Copy codenpx -y @pimzino/spec-workflow-mcp@latest /path/to/your/project --dashboard

# 自定义端口
npx -y @pimzino/spec-workflow-mcp@latest /path/to/your/project --dashboard --port 3000
```

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">可用工具</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E5%8F%AF%E7%94%A8%E5%B7%A5%E5%85%B7)

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">工作流指南 (Workflow Guides)</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E5%B7%A5%E4%BD%9C%E6%B5%81%E6%8C%87%E5%8D%97-workflow-guides)

* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">spec-workflow-guide</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 完整的规范驱动工作流程指南。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">steering-guide</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 创建项目指导性文件的指南。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">规范管理 (Spec Management)</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E8%A7%84%E8%8C%83%E7%AE%A1%E7%90%86-spec-management)

* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">create-spec-doc</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 创建/更新规范文件（需求、设计、任务）。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">spec-list</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 列出所有规范及其状态信息。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">spec-status</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 获取特定规范的详细状态。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">manage-tasks</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 用于规范实施的综合性任务管理。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">上下文与模板 (Context & Templates)</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E4%B8%8A%E4%B8%8B%E6%96%87%E4%B8%8E%E6%A8%A1%E6%9D%BF-context--templates)

* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">get-template-context</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 获取所有文件类型的 Markdown 模板。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">get-steering-context</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 获取项目指导性上下文和指南。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">get-spec-context</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 获取特定规范的上下文。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">指导性文件 (Steering Documents)</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E6%8C%87%E5%AF%BC%E6%80%A7%E6%96%87%E4%BB%B6-steering-documents)

* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">create-steering-doc</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 创建项目指导性文件（产品、技术、结构）。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">审批系统 (Approval System)</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E5%AE%A1%E6%89%B9%E7%B3%BB%E7%BB%9F-approval-system)

* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">request-approval</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 请求用户批准文件。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">get-approval-status</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 检查批准状态。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">delete-approval</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 清理已完成的审批。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">Web 仪表板 (Web Dashboard)</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#web-%E4%BB%AA%E8%A1%A8%E6%9D%BF-web-dashboard)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">仪表板是一个独立的服务，必须与 MCP 服务器一起手动启动。每个项目都有其专用的仪表板，运行在一个临时的端口上。仪表板提供：</font>

* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">实时项目概览</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 实时更新规范和进度。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">文件查看器</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 阅读需求、设计和任务文件。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">任务进度跟踪</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 可视化的进度条和任务状态。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">指导性文件</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 快速访问项目指南。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">深色模式</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 自动启用以获得更好的可读性。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">仪表板功能 (Dashboard Features)</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E4%BB%AA%E8%A1%A8%E6%9D%BF%E5%8A%9F%E8%83%BD-dashboard-features)

* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">规范卡片 (Spec Cards)</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 每个规范的概览，带有状态指示器。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">文件导航 (Document Navigation)</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 在需求、设计和任务之间切换。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">任务管理 (Task Management)</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 查看任务进度并复制实施提示。</font>
* **<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">实时更新 (Real-Time Updates)</font>**<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">- 使用 WebSocket 连接实现实时项目状态更新。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">工作流流程 (Workflow Process)</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E5%B7%A5%E4%BD%9C%E6%B5%81%E6%B5%81%E7%A8%8B-workflow-process)

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">1. 项目设置 (推荐)</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#1-%E9%A1%B9%E7%9B%AE%E8%AE%BE%E7%BD%AE-%E6%8E%A8%E8%8D%90)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">steering-guide → create-steering-doc (产品, 技术, 结构)</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">此步骤创建基础性文件，以指导您的项目开发。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">2. 功能开发</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#2-%E5%8A%9F%E8%83%BD%E5%BC%80%E5%8F%91)

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">spec-workflow-guide → create-spec-doc → \[审查] → 实施</font>

<font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">这是一个顺序流程：需求 → 设计 → 任务 → 实施。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">3. 实施支持</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#3-%E5%AE%9E%E6%96%BD%E6%94%AF%E6%8C%81)

* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">使用</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">get-spec-context</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">获取详细的实施上下文。</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">使用</font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><code><font style="color:rgb(34, 40, 49);background-color:rgb(250, 250, 250);">manage-tasks</font></code><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);"> </font><font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">跟踪任务完成情况。</font>
* <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">通过 Web 仪表板监控进度。</font>

### <font style="color:rgb(34, 40, 49);background-color:rgb(238, 238, 238);">背单词应用Prompt</font>[<font style="color:rgb(57, 62, 70);background-color:rgb(238, 238, 238);">Permalink</font>](https://www.aivi.fyi/aiagents/introduce-Claude-Code-Spec-Workflow#%E8%83%8C%E5%8D%95%E8%AF%8D%E5%BA%94%E7%94%A8prompt)

```plain
Copy code你之前的分析是正确的，请全部保留。

接下来，我将提供 LingoLearn 应用的详细需求，请根据这些信息生成项目的指导性文档。

## 应用概述
- **应用名称：** LingoLearn
- **目标用户：** 语言学习者
- **主要功能：** 单词学习、练习测试、学习进度追踪

## 技术要求
- **UI库：** Chakra UI
- **设计范式：** 移动端优先的响应式设计
- **交互：** 支持触摸手势和滑动操作 (使用 react-swipeable)
- **平台风格：** 适配 iOS 和 Android 的设计规范

## 界面结构
1.  **顶部导航栏 (AppBar)：** 显示当前课程标题和用户的学习进度条。
2.  **主内容区域 (Main Content)：** 根据所在页面动态显示单词卡片、练习题目或学习统计图表。
3.  **底部标签栏 (Bottom Tab Navigator)：** 包含四个主要页面的入口：首页 (Home)、练习 (Practice)、进度 (Progress)、设置 (Settings)。

## 核心功能模块
### 1. 单词学习模块 (Word Learning)
- **单词卡片：** 实现卡片点击翻转效果，正面是单词，背面是释义和例句。
- **发音功能：** 卡片上提供一个发音播放按钮。
- **用户操作：** 用户可以收藏或标记（如“未掌握”）单词。
- **切换方式：** 支持左右滑动来切换上一个/下一个单词。

### 2. 练习测试模块 (Practice & Quiz)
- **题型：** 支持选择题、填空题和听力题。
- **交互元素：** 包含答题计时器和答题进度指示器。
- **反馈机制：** 用户提交答案后，立即显示正确或错误的视觉反馈。

### 3. 学习进度模块 (Progress Tracking)
- **数据可视化：** 使用图表（如条形图）展示每日学习统计。
- **成就系统：** 记录学习连续天数（streaks），并设立成就徽章系统。
- **核心指标：** 清晰展示用户已掌握的词汇总量。

## 设计与UX要求
- **颜色主题：** 使用以蓝色和绿色为主的温暖、积极的配色方案。
- **字体与尺寸：** 字体大小需保证在小屏幕上的可读性，所有交互按钮的最小触摸区域为 44x44px。
- **交互反馈：** 所有点击、滑动操作都必须有明确的视觉反馈（如波纹效果、状态变化）。
- **加载状态：** 在数据加载时，使用 Chakra UI 的 Skeleton 组件作为占位符，提升用户体验。

## 响应式布局
- **手机端 (<768px)：** 单列布局，底部标签导航。
- **平板端 (768px-1024px)：** 可考虑两列布局，例如左侧为列表，右侧为详情。
- **桌面端 (>1024px)：** 扩展为三列或更复杂的仪表盘式布局。

## 数据结构 (模拟)
- **单词 (Word):** `{ id: string, text: string, definition: string, pronunciation: string, exampleSentence: string }`
- **用户进度 (UserProgress):** `{ learnedDays: number, completedQuizzes: number, masteredWords: string[] }`
- **题目 (QuizQuestion):** `{ id: string, type: 'multiple-choice' | 'fill-in-the-blank', questionText: string, options?: string[], correctAnswer: string }`

## 性能优化
- **渲染：** 对列表等频繁渲染的组件使用 React.memo。
- **长列表：** 对单词列表等长列表采用虚拟滚动（Virtualization）技术。
- **资源：** 图片等资源使用懒加载。
- **数据持久化：** 在本地（如 localStorage）存储用户的学习进度，实现离线可用性。

请根据以上完整的需求，为我创建项目的初始指导性文档。
```


> 更新: 2025-08-30 13:35:21  
> 原文: <https://www.yuque.com/lixinsi/dtxgrg/lkzw5zww0rwwcgw3>