# Windows安装Cloude code

### 1.windows 电脑开启虚拟化

### ![1752371630323-b82705e1-439a-4495-a47c-693f3548c54c.png](./img/eFCH2gPnTDVm5sm6/1752371630323-b82705e1-439a-4495-a47c-693f3548c54c-845122.png)

# 国内如何安装和使用 Claude Code镜像教程

结论论**因为 Claude Code 本身并不支持 Windows 的文件系统，而 Windows 要运行 Claude Code 稍微复杂一些，需要借助在 WSL 上运行。**

下面将教你学会如何在 Windows 上安装和部署 Claude Code 工具。如果是Mac用户可直接移步这个教程：[Mac安装部署使用Claude Code](https://link.zhihu.com/?target=https%3A//h5ma.cn/nvn)

![1752371630413-4c574de6-35dc-4846-ba4b-91f7b0420626.png](./img/eFCH2gPnTDVm5sm6/1752371630413-4c574de6-35dc-4846-ba4b-91f7b0420626-879902.png)

## 什么是WSL？

WSL（Windows Subsyetem for Linux，适用于 Linux 的 Windows 子系统），是 Microsoft 公司于 2016 年在 Windows 10 平台发布的一项功能，其使得用户可以在 Windows 操作系统上运行 ELF 格式的 Linux 可执行文件。

## Claude Code 在 WSL 上部署

### **安装WSL，必须满足以下要求：**

* Windows 11 或 Windows 10 21H2以上，专业版/工作站版/企业版（非家庭版，需支持Hyper-V）
* CPU 需支持且已在 BIOS/UEFI 中启用虚拟化

### **（1）按照以下步骤安装WSL：**

安装之前需要打开虚拟化，否则过程会出现未知的错误。

打开路径：`控制面板 -> 程序与功能 -> 打开或关闭 Windows 功能` 启动以下功能：

* Virtual Machine Platform（虚拟机平台）
* Windows Subsystem for Linux Support（WSL1）

**下载和安装对应版本的 WSL，** 选择您的系统版本，复制到浏览器进行下载 WSL 安装包:

* 64-Bit WSL-2.5.9.0 \[推荐]

```plain
https://vip.123pan.cn/1831946356/links/wsl.2.5.9.0.x64.msi
```

* ARM64 WSL-2.5.9.0

```plain
https://vip.123pan.cn/1831946356/links/wsl.2.5.9.0.arm64.msi
```

* ARM64\_MicrosoftStore WSL-2.5.9.0

```plain
https://vip.123pan.cn/1831946356/links/Microsoft.WSL_2.5.9.0_x64_ARM64.msixbundle
```

你也可以不用上面的安装包，直接访问 GitHub 安装最新的版本：

[https://github.com/microsoft/WSL/releases](https://link.zhihu.com/?target=https%3A//github.com/microsoft/WSL/releases)

### **（2）安装虚拟机：**

安装完WSL之后，你可以在微软应用商店中安装最新的[Ubuntu 24.04 LTS](https://zhida.zhihu.com/search?content_id=259952879\&content_type=Article\&match_order=1\&q=Ubuntu+24.04+LTS\&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NTI1NDQzNDQsInEiOiJVYnVudHUgMjQuMDQgTFRTIiwiemhpZGFfc291cmNlIjoiZW50aXR5IiwiY29udGVudF9pZCI6MjU5OTUyODc5LCJjb250ZW50X3R5cGUiOiJBcnRpY2xlIiwibWF0Y2hfb3JkZXIiOjEsInpkX3Rva2VuIjpudWxsfQ.DRPThCynrv-HIifQHgAFOCTivnrHSixSKmvWWl52oTA\&zhida_source=entity)

或者 通过以下命令安装：

```plain
wsl --install -d Ubuntu-24.04
```

你也可通过 `wsl -l -o` 命令选择其他系统版本。

安装完 **Ubuntu** 之后，你可以在\*\*终端（或PowerShell）\*\*输入wsl访问安装的操作系统：

* **首次用需要设置用户名和密码：**

如果您通过开始菜单的应用访问一次，直接关闭窗口而不输入用户名和密码，下次访问将使用root用户

* Windows将安装的操作系统虚拟机视作一个应用，如Ubuntu 24.04 LTS 会出现在你的开始菜单

### **（3）Claude Code 安装**

Claude Code 是用 <code>[Node.js](https://zhida.zhihu.com/search?content_id=259952879&content_type=Article&match_order=1&q=Node.js&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NTI1NDQzNDQsInEiOiJOb2RlLmpzIiwiemhpZGFfc291cmNlIjoiZW50aXR5IiwiY29udGVudF9pZCI6MjU5OTUyODc5LCJjb250ZW50X3R5cGUiOiJBcnRpY2xlIiwibWF0Y2hfb3JkZXIiOjEsInpkX3Rva2VuIjpudWxsfQ._oBJeXsu4EVJJ-91qKp1NSEJ9fAT4iP5YQfZgR_Oufw&zhida_source=entity)</code>

开发的，所以依赖 `Node.js` 环境，可以通过以下方式安装对应的环境（Node.js 18+）：

```plain
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo bash -
sudo apt-get install -y nodejs
node --version
npm --version
```

确保你的npm与 Node.js可用后，通过以下命令安装Claude Code。

**Claude Code 包 二选一：**

A. 全局安装 Claude Code **（这个是官⽅的）**, 你有官⽅Claude Pro 账号就⽤这个指令

```plain
cd ~
npm install -g @anthropic-ai/claude-code
```

B. 全局安装 Claude Code **（这个是中转站的）**, 如果是中转站⽤户,选这个!

```plain
cd ~
npm install -g https://gaccode.com/claudecode/install --registry=https://registry.npmmirror.com
```

如果 GAC Claude Code 中转站用户，有安装了官方的Claude Code 包的话，还需要卸载掉，两者有冲突。

```plain
npm uninstall -g @anthropic-ai/claude-code
```

安装完之后，你就可以访问你的项目文件夹，并在该目录下的终端输入以下命令直接运行 Claude Code:

```plain
mkdir claude-test-demo
cd claude-test-demo
claude
```

![1752371629989-25a267b0-e5e0-4ce6-ae50-fd28dde6c4a2.png](./img/eFCH2gPnTDVm5sm6/1752371629989-25a267b0-e5e0-4ce6-ae50-fd28dde6c4a2-842158.png)

### 如果未安装成功请切到 root 用户

```plain
sudo su
```

运行后

### **使用中转站的用户**

没有 Claude Pro 或者 Max 账号的伙伴，在国内可以直接使用中转站。无需魔法，直接可用。

Claude code镜像使用指南：[https://h5ma.cn/bxa](https://link.zhihu.com/?target=https%3A//h5ma.cn/bxa)

Claude code镜像权限获取：[http://h5ma.cn/gaccode](https://link.zhihu.com/?target=http%3A//h5ma.cn/gaccode)

**安装过程出现的问题，都可以在发送任意邮件到ClaudeCode@163.com获取帮助，实时更新。**

## **对 WSL 使用的一些说明**

如果你是首次使用 WSL，可以在弹出的 **“欢迎使用WSL”** 页面了解帮助，你也可以在 **【WSL设置】** 中找到入口。

WSL 不只是命令行版本的Linux操作系统，它是有对应的桌面环境的！

**如果你使用的IDE编程工具是VSCode、Cursor之类的，可以使用VSCode的WSL插件，链接并使用你的WSL。**

安装完插件之后，使用 `code .` 启动VSCode，这样启动可以使用 Claude Code IDE 插件。

灵活使用方法有很多种，你也可以单独直接在IDE上开启终端，执行你的 Claude Code 都行！

\*\*恭喜您！您已经完成了 Claude Code的安装与部署 \*\*

**下面分享一些使用Claude code的新的和体会。**

***

## 如何使用Claude Code

### **⭐**\*\* 开始新的对话\*\*

如果有一件事我希望你从中学到，那就是你绝对应该**更频繁地调用**/clear。

**关键要点：**

* AI代理在**对话时间越长**时往往变得更**不可预测**
* 当你问**不同的问题**时尤其如此
* 即使这意味着**重复一些指令**，创建一个新的提示通常**更有效**
* 一旦我开始更积极地这样做，我的结果**显著改善**了

### **创建精确的提示**

我觉得这不言而喻，但当你与**一个健忘的新毕业生**一起工作时（我喜欢这样想Claude），重要的是你要写出你脑中拥有的**所有上下文**。

**提示编写要点：**

* 这很困难，坦率地说，我认为我自己还不是很擅长
* 你能给Claude提供的**上下文越多**，它就会**越有效**
* 如果你想到一些**边缘情况**，绝对要告诉Claude
* 如果你记得"在这个代码库中我们过去为这类问题使用过类似的模式"，**写下来**！
* **提示越精确**，Claude做得就**越好**
* 读心术技术还**没有**到那里

**隐含上下文的重要性：**

* 考虑任何**隐含的上下文**
* 例如：如果你要求Claude创建一个**现代设计**，它可能完全不知道你指的现代是什么
* **最好给出例子**：创建一个**Linear风格**的应用UI设计

### **让Claude Code使用Claude Code**

你知道吗，你可以将**Claude Code的工具**用作[**MCP服务器**](https://zhida.zhihu.com/search?content_id=259952879\&content_type=Article\&match_order=1\&q=MCP%E6%9C%8D%E5%8A%A1%E5%99%A8\&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NTI1NDQzNDQsInEiOiJNQ1DmnI3liqHlmagiLCJ6aGlkYV9zb3VyY2UiOiJlbnRpdHkiLCJjb250ZW50X2lkIjoyNTk5NTI4NzksImNvbnRlbnRfdHlwZSI6IkFydGljbGUiLCJtYXRjaF9vcmRlciI6MSwiemRfdG9rZW4iOm51bGx9.uWVN2qdD-9iiKj3gwuoTh03wf_6SOt5LyCSjdEtL3C4\&zhida_source=entity)

（claude mcp serve）？

[**Task工具**](https://zhida.zhihu.com/search?content_id=259952879\&content_type=Article\&match_order=1\&q=Task%E5%B7%A5%E5%85%B7\&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NTI1NDQzNDQsInEiOiJUYXNr5bel5YW3IiwiemhpZGFfc291cmNlIjoiZW50aXR5IiwiY29udGVudF9pZCI6MjU5OTUyODc5LCJjb250ZW50X3R5cGUiOiJBcnRpY2xlIiwibWF0Y2hfb3JkZXIiOjEsInpkX3Rva2VuIjpudWxsfQ.7bb_XxV8iUJVKze9YqBVn3k_5CbAXQU8Rl2rPfA9VG8\&zhida_source=entity)

**的强大功能：**

* 当我发现这一点时，我查看了它暴露的工具，并注意到一个叫做Task的工具
* 这个工具的前提是**启动一个子代理**
* 子代理将拥有与你的**主代理相同的工具访问权限**（除了它不能生成另一个子任务）
* 子代理会**报告结果**

**使用场景：**

* 知道这个功能可用在你有一个需要**监督的更复杂问题**时非常方便
* 以下是我最近如何使用此功能对同一问题进行**四种不同角色深入分析**的例子：

```plain
> 读取当前目录中的文件以推断构建Tailwind Plus组件的模式。你应该生成4个具有略微不同优先级的子任务（例如设计颜色导出、可访问性导出、移动/响应式专家、整体样式专家）并比较他们的结果。

✻ 思考中…

  现在我将生成4个专门的子任务，具有不同的优先级来分析组件的各个方面。

⏺ Task(设计颜色专家分析)
  ⎿  完成 (24个工具使用 · 41.5k tokens · 3分4.4秒)

⏺ Task(可访问性专家分析)
  ⎿  完成 (15个工具使用 · 38.0k tokens · 2分0.0秒)

⏺ Task(移动/响应式专家分析)
  ⎿  完成 (14个工具使用 · 45.5k tokens · 2分1.2秒)

⏺ Task(整体样式专家分析)
  ⎿  完成 (23个工具使用 · 58.7k tokens · 2分22.0秒)
```

这很**壮观**而且可以**并行完成**。这是保持主任务**上下文窗口有序**并让Claude**保持专注**的绝佳方式。

### **告诉Claude思考**

就像我们这些血肉之躯的老人类一样，Claude**默认是懒惰的**。

**Claude的懒惰特性：**

* 当你告诉Claude做某事时，它会选择**阻力最小的路径**
* 如果你告诉它做**至少**三件事，我敢打赌它**不会多做一件事**

**解决方案：**

* 同样的道理也适用于使用**扩展思维能力**
* 为了获得**更好的结果**，特别是在**规划过程**中
* 我建议告诉Claude进行**超级思考**

### **✏️**\*\* 编辑以前的消息\*\*

**使用技巧：**

* 每当你**太急于点击发送**或只是觉得之前的消息可以**更精确**以获得更好的结果时
* 你可以按**两次Escape**跳转到之前的消息并**分叉对话**
* 我一直使用这个功能来**优化提示**或简单地让Claude**重试**

**恢复功能：**

* 如果你想以某种方式回到之前的状态
* 你可以使用--resume标志启动Claude来列出**所有先前的线程**

### **Yolo模式**

这对我来说可能是**极其不负责任的**，但我现在主要使用--dangerously-skip-permissions运行Claude（感谢Peter成为坏影响）。

**使用场景：**

* 这不是所有事情都必要的
* 但如果我让Claude处理一些**长期运行的任务**
* 我**真的不想**每分钟都必须切换焦点回到它，因为它使用新的终端命令

\*\*配置方法：\*\*我在我的zsh配置文件中设置了这个：

```plain
alias yolo="claude --dangerously-skip-permissions"
```

**副作用：**有趣的是，现在Claude可以做任何它想做的事，我也**更频繁地遇到速率限制配额警告**。

### **MCP服务器**

**个人观点：**我个人对**MCP服务器**不是很兴奋，因为没有一个真正为我带来任何价值。

**问题分析：**

* 在大多数情况下，我发现它们只是用我大部分时间不需要的东西**消耗宝贵的tokens**
* **Claude Code中的内置工具**对我来说足够了（特别是当按照我这里概述的方式使用时）

[**Playwright MCP**](https://zhida.zhihu.com/search?content_id=259952879\&content_type=Article\&match_order=1\&q=Playwright+MCP\&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NTI1NDQzNDQsInEiOiJQbGF5d3JpZ2h0IE1DUCIsInpoaWRhX3NvdXJjZSI6ImVudGl0eSIsImNvbnRlbnRfaWQiOjI1OTk1Mjg3OSwiY29udGVudF90eXBlIjoiQXJ0aWNsZSIsIm1hdGNoX29yZGVyIjoxLCJ6ZF90b2tlbiI6bnVsbH0.zYlEESbRR9uEx8yDghXPSq65GwHkHM7JF05rQdYmfPc\&zhida_source=entity)

**经验：**

* 过去，我使用过**Playwright MCP**
* 虽然看到Claude**启动浏览器、点击按钮和截图**非常迷人
* 但我发现它主要是**很快填满上下文窗口**而没有真正带来更好的结果

### **️ Claude SDK**

**SDK特性：**

* Claude有一个**SDK**
* 它**非常强大**，特别是如果你乐意处理stream-json输出格式
* 但即使对于小事情，能够直接向claude传递提示并让它打印回复也为**创建快捷方式**提供了很好的机会

\*\*实用示例 - 自动Git提交：\*\*例如，我在我的路径中有一个gcauto可执行文件，它执行以下操作：

```plain
#!/bin/bash
git commit -m "$(claude -p "查看暂存的git更改并创建总结性的git提交标题。只回应标题，不要确认。")"
```

**使用方法：**所以每当我现在提交东西时，我只是**暂存它们**并运行gcauto。

**规划模式**

Claude Code有一个内置的规划模式，当你按两次Shift+Tab时触发。在这种模式下，Claude不会写入你的文件系统。

不过我个人喜欢用另一个模型进行规划，只是为了增加一些变化。在过去几周里，我一直在Google AI Studio中直接使用Gemini 2.5 Pro。我真的不知道这怎么可能，但我不认为我甚至需要为此付费？

### **让Claude RTFM（阅读文档）**

**新手错误：**我在开始时犯的一个**新手错误**是告诉Claude用**框架x**建立一个新项目。

**问题分析：**

* 当然，这是可行的
* 但我注意到Claude经常使用**过时的设置和项目结构**
* 特别是对于**快速发展的前端框架**！

**解决方案：**我现在做的是要求Claude**先阅读手册**。这可以通过不同的方式完成：

| 方法 | 描述 |
| --- | --- |
| 文档链接 | 粘贴文档链接并要求Claude先阅读它 |
| 技术调研 | 要求Claude找出最先进的技术 |
| 深入研究 | 使用Task工具并让Claude对特定主题进行深入研究 |

深入研究任务的例子可能看起来像这样：

```plain
> 创建一个深入研究任务，找出如何将网站从tailwind 3迁移到4，然后向我展示结果的简短摘要

⏺ 我将创建一个研究任务来调查从Tailwind CSS v3到v4的迁移，重点关注你的Tailwind UI代码库的具体上下文。

⏺ Task(Tailwind v3到v4迁移研究)
  ⎿  完成 (4个工具使用 · 29.9k tokens · 5分47.6秒)

⏺ 摘要

  从Tailwind CSS v3迁移到v4涉及重大变化，但带来了主要的性能改进（3.5倍更快的构建）和更好的开发者体验。

  要点：
  - 使用自动升级工具：npx @tailwindcss/upgrade@next
  - 配置从JavaScript移动到使用@theme指令的CSS优先
  - 破坏性更改包括放弃的浏览器支持、新的导入语法和移除的弃用实用程序
  - 性能提升：构建现在以微秒计算
  - 容器查询现在是内置的（不需要插件）

  使用升级工具迁移很直接，但计划测试时间以确保所有组件正确渲染。
```

### **语音输入**

像[Superwhisper](https://zhida.zhihu.com/search?content_id=259952879\&content_type=Article\&match_order=1\&q=Superwhisper\&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NTI1NDQzNDQsInEiOiJTdXBlcndoaXNwZXIiLCJ6aGlkYV9zb3VyY2UiOiJlbnRpdHkiLCJjb250ZW50X2lkIjoyNTk5NTI4NzksImNvbnRlbnRfdHlwZSI6IkFydGljbGUiLCJtYXRjaF9vcmRlciI6MSwiemRfdG9rZW4iOm51bGx9.yVSCjWzk6mIYm9AOYFvM7cx_IdOvt-oK3_8h14xjO14\&zhida_source=entity)

这样的应用程序使得口述提示变得非常容易。我发现当我想写一个更长的提示时这非常有效，因为它会更快地将想法从我的脑袋中取出。

这对任何LLM输入字段都非常有效，因为LLM通常可以弄清楚你的意思，即使转录很差并且充满错误。

###

###


> 更新: 2025-07-13 21:58:52  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/igzxg6n8h9bumuq4>