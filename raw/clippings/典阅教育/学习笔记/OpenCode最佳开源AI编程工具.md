# OpenCode 最佳开源 AI 编程工具

# [https://github.com/anomalyco/opencode](https://github.com/anomalyco/opencode)
![1767920324705-75e60dd1-0e97-4b76-aea5-472607cdec0f.png](./img/R91TLmCv7VvYBz07/1767920324705-75e60dd1-0e97-4b76-aea5-472607cdec0f-865067.png)

## 视频
[<font style="color:rgb(14, 165, 233);">https://youtu.be/Hgo2Eo2NiaA</font>](https://youtu.be/Hgo2Eo2NiaA)

[<font style="color:rgb(14, 165, 233);">https://www.bilibili.com/video/BV19XqMBzENU</font>](https://www.bilibili.com/video/BV19XqMBzENU)

## 前言
OpenCode 是一款面向开发者的开源 AI CLI 编程工具，支持多模型并行、LSP 自动加载、极速响应与非订阅制计费。无论是命令行、桌面 App 还是 VS Code 插件，OpenCode 都提供高效、不啰嗦的 AI 编程体验，是 Cursor 与 Claude Code 的有力替代方案。

<font style="background-color:rgba(240, 240, 240, 0.3);">原文</font><font style="background-color:rgba(240, 240, 240, 0.3);"> </font>[<font style="color:rgb(14, 165, 233);background-color:rgba(240, 240, 240, 0.3);">OpenCode：也许是程序员开始 AI CLI 编程的最佳方式</font>](https://ducafecat.com/blog/cursor-opencode-ai-cli-programming)

分类：AI CLI 编程、OpenCode

## 参考
+ [<font style="color:rgb(14, 165, 233);">https://opencode.ai/</font>](https://opencode.ai/)
+ [<font style="color:rgb(14, 165, 233);">https://github.com/anomalyco/opencode</font>](https://github.com/anomalyco/opencode)
+ [<font style="color:rgb(14, 165, 233);">https://github.com/code-yeongyu/oh-my-opencode/blob/dev/README.zh-cn.md</font>](https://github.com/code-yeongyu/oh-my-opencode/blob/dev/README.zh-cn.md)
+ [<font style="color:rgb(14, 165, 233);">https://github.com/mixedbread-ai/mgrep</font>](https://github.com/mixedbread-ai/mgrep)

## 正文
### 运行速度快、不啰嗦
+ **LSP 自动启用**：自动加载与当前项目匹配的语言服务器（LSP），让大模型更准确理解代码结构与语义
+ **多会话并行**：在同一个项目中同时启动多个 AI Agent，并行处理不同任务，互不干扰
+ **会话链接分享**：每个会话都可以生成可分享链接，方便参考、复盘或协助 Debug
+ **支持 Claude Pro 账号**：可登录 Anthropic，直接使用你现有的 Claude Pro 或 Max 账户
+ **支持任意模型**：通过 Models.dev 接入 75+ 大模型服务商，也支持本地模型
+ **支持任意编辑器**：既可在终端使用，也提供桌面应用和 IDE 插件（如 VS Code）

## 安装
[<font style="color:rgb(14, 165, 233);">https://opencode.ai/</font>](https://opencode.ai/)

可以用 google 、github 账号激活。

获取 api key

```plain
sk-NEflLdzc059Ja2D5zlJRKy8YzEm5xW4hzP1DNWjIMfZVEAskD0ndcGZKtMwDw4zn
```

![1767920321321-620c9a53-d277-4da8-aee5-b32e711e93e3.png](./img/R91TLmCv7VvYBz07/1767920321321-620c9a53-d277-4da8-aee5-b32e711e93e3-809174.png)

全局安装 opencode cli

**<font style="color:rgb(71, 85, 105);background-color:rgb(248, 250, 252);">代码片段</font>**

```plain
npm install -g opencode-windows-x64
```

执行登录

**<font style="color:rgb(71, 85, 105);background-color:rgb(248, 250, 252);">代码片段</font>**

```plain
opencode auth login
输入 api key
```

### 多种使用方式
+ cli 命令行

进入项目

**<font style="color:rgb(71, 85, 105);background-color:rgb(248, 250, 252);">代码片段</font>**

```plain
opencode
```

启动后第一次需要进行初始化，将会生成 [<font style="color:rgb(14, 165, 233);">AGENTS.md</font>](http://agents.md/)

![1767920318793-7d7a1f78-cf68-411d-bb8f-7f7e7e393bd1.png](./img/R91TLmCv7VvYBz07/1767920318793-7d7a1f78-cf68-411d-bb8f-7f7e7e393bd1-308097.png)

+ 桌面 app

![1767920320482-3c8e9d65-0ffa-45c7-9e7c-b5f6d8e04608.png](./img/R91TLmCv7VvYBz07/1767920320482-3c8e9d65-0ffa-45c7-9e7c-b5f6d8e04608-527357.png)

+ vsc 插件

![1767920321629-2ba4fd07-4885-42bf-92df-c422716396df.png](./img/R91TLmCv7VvYBz07/1767920321629-2ba4fd07-4885-42bf-92df-c422716396df-837570.png)

![1767920321708-1192b081-e032-4bff-abd7-476a23c3754d.png](./img/R91TLmCv7VvYBz07/1767920321708-1192b081-e032-4bff-abd7-476a23c3754d-668316.png)

### 开局 3 个免费模型
+ Grok Code Fast
+ GLM-4.7
+ Big Pickle

输入

**<font style="color:rgb(71, 85, 105);background-color:rgb(248, 250, 252);">代码片段</font>**

```plain
/models
```

![1767920321528-6615bb6f-d8c6-4b03-a260-8735db3dfeb0.png](./img/R91TLmCv7VvYBz07/1767920321528-6615bb6f-d8c6-4b03-a260-8735db3dfeb0-036516.png)

## 漂亮的 theme
输入

**<font style="color:rgb(71, 85, 105);background-color:rgb(248, 250, 252);">代码片段</font>**

```plain
/theme
```

![1767920322315-ad535aa6-af82-4381-a9c6-1e33cca0d207.png](./img/R91TLmCv7VvYBz07/1767920322315-ad535aa6-af82-4381-a9c6-1e33cca0d207-682179.png)

### 因为开源所以变的更好
+ oh-my-opencode 多任务自动分配模型

[<font style="color:rgb(14, 165, 233);">https://github.com/code-yeongyu/oh-my-opencode/blob/dev/README.zh-cn.md</font>](https://github.com/code-yeongyu/oh-my-opencode/blob/dev/README.zh-cn.md)

![](https://github.com/code-yeongyu/oh-my-opencode/raw/dev/.github/assets/omo.png)

+ mgrep 语义识别提速快

[<font style="color:rgb(14, 165, 233);">https://github.com/mixedbread-ai/mgrep</font>](https://github.com/mixedbread-ai/mgrep)

![1767920323225-08e649af-eb81-4aa8-ae9a-684066d0beb6.png](./img/R91TLmCv7VvYBz07/1767920323225-08e649af-eb81-4aa8-ae9a-684066d0beb6-415618.png)

- ecosystem 生态

[<font style="color:rgb(14, 165, 233);">https://opencode.ai/docs/ecosystem/</font>](https://opencode.ai/docs/ecosystem/)

[<font style="color:rgb(14, 165, 233);">https://github.com/awesome-opencode/awesome-opencode</font>](https://github.com/awesome-opencode/awesome-opencode)

### 充值模式而不是订阅
+ pay-as-you-go model

[<font style="color:rgb(14, 165, 233);">https://opencode.ai/docs/zen/#pricing</font>](https://opencode.ai/docs/zen/#pricing)

![1767920323359-ec384465-503a-4a68-8325-b9d9cc1dffc3.png](./img/R91TLmCv7VvYBz07/1767920323359-ec384465-503a-4a68-8325-b9d9cc1dffc3-307466.png)

### 更多的可能
[<font style="color:rgb(14, 165, 233);">https://opencode.ai/docs/sdk/</font>](https://opencode.ai/docs/sdk/)

+ sdk
+ server
+ plugins

## 总结要点
OpenCode 通过开源架构与 AI CLI 编程方式，为开发者提供了一种更轻量、更快速、更专注代码本身的 AI 编程体验。相比传统 IDE 插件或订阅制工具，OpenCode 支持多模型并行、LSP 自动加载以及灵活的充值模式，特别适合追求效率与掌控感的程序员。如果你正在寻找一款真正为开发者设计的 AI 命令行编程工具，OpenCode 值得深入尝试。

感谢阅读本文

如果有什么建议，请在评论中让我知道。我很乐意改进。



> 更新: 2026-01-11 21:16:36  
> 原文: <https://www.yuque.com/lixinsi/yh04az/gkrt5y3gla1m6qso>