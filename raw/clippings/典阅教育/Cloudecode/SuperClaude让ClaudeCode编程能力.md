# SuperClaude让Claude Code编程能力

SuperClaude是一个专门为Claude Code设计的综合配置框架，旨在将Claude Code转变为一个专业的AI开发助手。它通过结构化的配置文件和专业化的工作流程，极大地增强了Claude Code的开发能力。

```plain
cmd /c npx -y @21st-dev/cli@latest install cursor --api-key "0dbb70f79ec8ea55d83bb1329d0c8c0dc3754bede14539e50c4cb1804ceb3f63"
```

```plain
# 添加context7
claude mcp add --transport http context7 https://mcp.context7.com/mcp

# 添加sequential-thinking
claude mcp add sequential-thinking npx @modelcontextprotocol/server-sequential-thinking

# 添加puppeteer
npx @modelcontextprotocol/server-puppeteer

claude mcp add puppeteer npx @modelcontextprotocol/server-puppeteer

# 添加magic (https://21st.dev/magic/onboarding?step=create-component)
claude mcp add magic npx @21st-dev/magic@latest --env API_KEY= "0dbb70f79ec8ea55d83bb1329d0c8c0dc3754bede14539e50c4cb1804ceb3f63"

```

## 主要作用[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#主要作用)

### 1. 认知专业化[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#1-认知专业化)

SuperClaude提供了9种专业化的思维模式（Personas），每种模式都针对特定的开发场景：

* **architect**：系统设计和可扩展性
* **frontend**：用户体验和React开发
* **backend**：API开发和性能优化
* **security**：威胁建模和安全代码
* **analyzer**：根因分析和调试
* **mentor**：教学和指导
* **refactorer**：代码质量和简化
* **performance**：性能优化
* **qa**：质量保证和测试

### 2. 工作流程标准化[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#2-工作流程标准化)

提供了18个专业化的斜杠命令，涵盖开发的各个方面：

* 开发命令：`/user:build`、`/user:dev-setup`、`/user:test`
* 分析命令：`/user:analyze`、`/user:troubleshoot`、`/user:improve`
* 运维命令：`/user:deploy`、`/user:migrate`、`/user:scan`
* 设计命令：`/user:design`

### 3. 智能文档查找[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#3-智能文档查找)

通过Context7自动查找和引用官方文档，确保代码实现基于最新的最佳实践。

## 使用场景[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#使用场景)

### 1. 个人开发者[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#1-个人开发者)

* **快速项目搭建**：使用`/user:build --react`快速创建React应用
* **代码质量提升**：通过`/persona:refactorer`模式进行代码重构
* **问题诊断**：使用`/user:troubleshoot --investigate`深入分析问题

### 2. 团队协作[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#2-团队协作)

* **一致性保证**：所有团队成员使用相同的AI助手模式
* **知识传承**：通过`/persona:mentor`模式进行技术指导
* **代码审查**：使用`/user:analyze --code`进行代码分析

### 3. 复杂项目开发[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#3-复杂项目开发)

* **系统设计**：`/persona:architect`模式进行架构设计
* **安全审计**：`/user:scan --security`进行安全扫描
* **性能优化**：`/persona:performance`模式优化系统性能

## 安装和使用方式[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#安装和使用方式)

### 安装步骤[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#安装步骤)

```plain
# 1. 克隆项目
git clone https://github.com/NomenAK/SuperClaude.git
cd SuperClaude

# 2. 执行安装脚本
./install.sh

# 3. 验证安装
ls -la ~/.claude/  # 应该显示4个主要文件
ls -la ~/.claude/commands/  # 应该显示17个文件
```

## 📋 命令格式规范[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#-命令格式规范)

### 基本格式[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#基本格式)

```plain
/命令名 --标志1 --标志2 --persona-角色名 "任务描述"
```

### 重要说明[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#重要说明)

* ✅ 使用直接斜杠格式：`/build`, `/analyze`, `/review`
* ✅ 标志使用双破折号：`-flag`
* ✅ Persona作为通用标志使用：`-persona-名称`

***

## 🏗️ 开发构建类命令[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#️-开发构建类命令)

### 1. React项目开发[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#1-react项目开发)

```plain
/build --react --magic --tdd --persona-frontend
```

**用途：** 使用React框架开发项目，集成Magic UI构建器和测试驱动开发

### 2. API后端开发[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#2-api后端开发)

```plain
/build --api --tdd --coverage --persona-backend
```

**用途：** 构建后端API，采用测试驱动开发和代码覆盖率检查

### 3. 项目初始化[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#3-项目初始化)

```plain
/build --init --magic --c7 --plan --persona-frontend
```

**用途：** 初始化新项目，启用Magic UI构建器和Context7文档查找

### 4. 功能开发[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#4-功能开发)

```plain
/build --feature --tdd --persona-frontend
```

**用途：** 开发特定功能，采用测试驱动开发方法

### 🚀必要的MCP Server添加命令[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#必要的mcp-server添加命令)

```plain
# 添加context7
claude mcp add --transport http context7 https://mcp.context7.com/mcp

# 添加sequential-thinking
claude mcp add sequential-thinking npx @modelcontextprotocol/server-sequential-thinking

# 添加puppeteer
npx @modelcontextprotocol/server-puppeteer

claude mcp add puppeteer npx @modelcontextprotocol/server-puppeteer

# 添加magic (https://21st.dev/magic/onboarding?step=create-component)
claude mcp add magic npx @21st-dev/magic@latest --env API_KEY=你的api key
```

### 🚀测试用例[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#测试用例)

```plain
# 分析开源项目
/analyze --architecture --persona-architect  --seq

# 组合命令
/build --react --magic "简单的todo list 应用"

/build --init --c7 --plan --persona-frontend "创建一个模拟太阳系的HTML动画，包含8大行星的轨道运动"

/build --react --magic "todo应用原型"

# 分析架构
/analyze --architecture --persona-architect

# 调用MCP分析架构
/analyze --architecture --seq

# 规划整体技术架构
/design --api --ddd "用户管理系统" --persona-architect

# 生成产品需求文档
/design --api --prd "进销存管理系统"

# 生成产品需求文档
/design --prd "移动端社交应用" --persona-frontend

# 定义REST或GraphQL API规范
/design --api --openapi "电商订单API" --persona-backend

# 教育平台设计
/design --api --openapi "在线学习管理系统" --persona-backend
```

***

## 🎯 Persona角色系统[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#-persona角色系统)

### 可用角色[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#可用角色)

* `-persona-architect` - 系统架构师，专注设计和可扩展性
* `-persona-frontend` - 前端专家，专注UX和React开发
* `-persona-backend` - 后端专家，专注API和性能
* `-persona-security` - 安全专家，专注威胁建模和安全代码
* `-persona-qa` - 质量保证专家，专注测试和质量
* `-persona-performance` - 性能专家，专注优化和瓶颈分析
* `-persona-analyzer` - 分析专家，专注根因分析和调试
* `-persona-mentor` - 导师专家，专注教学和指导
* `-persona-refactorer` - 重构专家，专注代码质量和简化

***

## 🚩 通用标志说明[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#-通用标志说明)

### 规划与思考[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#规划与思考)

* `-plan` - 显示执行计划（在执行前预览）
* `-think` - 标准分析模式
* `-think-hard` - 深度分析模式
* `-ultrathink` - 关键分析模式

### MCP服务器控制[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#mcp服务器控制)

* `-c7` - 启用Context7文档查找
* `-seq` - 启用Sequential深度思维
* `-magic` - 启用Magic UI构建器
* `-pup` - 启用Puppeteer浏览器测试

### 输出控制[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#输出控制)

* `-uc` - UltraCompressed模式（约70%令牌减少）
* `-verbose` - 详细输出模式

### 特定功能标志[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#特定功能标志)

* `-init` - 项目初始化
* `-feature` - 功能开发
* `-tdd` - 测试驱动开发
* `-coverage` - 代码覆盖率
* `-e2e` - 端到端测试
* `-dry-run` - 预演模式
* `-rollback` - 回滚准备

***

## 📈 复杂工作流示例[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#-复杂工作流示例)

### 完整开发流程[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#完整开发流程)

```plain
# 1. 项目规划
/design --api --ddd --plan --persona-architect

# 2. 前端开发
/build --react --magic --tdd --persona-frontend

# 3. 后端开发
/build --api --tdd --coverage --persona-backend

# 4. 质量检查
/review --quality --evidence --persona-qa

# 5. 安全扫描
/scan --security --owasp --persona-security

# 6. 性能优化
/improve --performance --iterate --persona-performance

# 7. 部署准备
/deploy --env staging --plan --persona-architect
```

### 问题排查流程[Permalink](https://www.aivi.fyi/aiagents/introduce-SuperClaude#问题排查流程)

```plain
# 1. 问题分析
/troubleshoot --investigate --prod --persona-analyzer

# 2. 根因分析
/troubleshoot --prod --five-whys --seq --persona-analyzer

# 3. 性能分析
/analyze --profile --perf --seq --persona-performance

# 4. 修复实施
/improve --quality --threshold 95% --persona-refactorer
```

***

SuperClaude将Claude Code从通用AI助手转变为专业的开发伙伴，通过结构化的配置和专业化的工作流程，显著提升了开发效率、代码质量和团队协作能力。这个项目特别适合追求高效、高质量开发流程的个人开发者和团队。

\*\*Tags: \*\*[AI智能体](https://www.aivi.fyi/tags/#ai%E6%99%BA%E8%83%BD%E4%BD%93)[AI编程](https://www.aivi.fyi/tags/#ai%E7%BC%96%E7%A8%8B)[Claude](https://www.aivi.fyi/tags/#claude)[Claude Code](https://www.aivi.fyi/tags/#claude-code)[Claude4](https://www.aivi.fyi/tags/#claude4)[Context7](https://www.aivi.fyi/tags/#context7)[Cursor](https://www.aivi.fyi/tags/#cursor)[MC](https://www.aivi.fyi/tags/#mcp-server)


> 更新: 2025-07-13 20:34:15  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/hg5xgg3p20n6d2i8>