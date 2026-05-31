# 用cursor复现现成的项目

#### <font style="color:rgb(31, 35, 40);">本项目是对 </font>[<font style="color:rgb(9, 105, 218);">codebucks27/Deep-Research-AI-Agent</font>](https://github.com/codebucks27/Deep-Research-AI-Agent)<font style="color:rgb(31, 35, 40);"> 的复现。</font>

<font style="color:rgb(31, 35, 40);">复现的核心思路是：</font>

1. **<font style="color:rgb(31, 35, 40);">AI 生成复现文档</font>**<font style="color:rgb(31, 35, 40);">：首先，我们利用 AI 的能力，分析原始项目并生成一套详细的中文复现步骤文档。这些文档保存在本项目的</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">docs</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">目录下，作为整个复现工作的蓝图和指南。</font>
2. **<font style="color:rgb(31, 35, 40);">AI 遵循文档复现</font>**<font style="color:rgb(31, 35, 40);">：随后，我们再次借助 AI，在一个新的工作目录中，让其严格遵循 </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">docs</font></code><font style="color:rgb(31, 35, 40);"> 目录下的文档，一步一步地搭建和实现整个项目的功能。</font>

## <font style="color:rgb(31, 35, 40);">提示词记录</font>

```plain
迅速熟悉整个项目
```

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">  
</font>

```plain
我希望通过提示词让 LLM 一步一步复现整个项目，请帮我进行任务拆解，并撰写每一步复现项目的提示词。

要求如下：

- **文档位置**：将复现过程的文档写在 docs 目录 中（如果 docs 文件夹不存在，自行创建"docs"文件夹，然后在该文件夹中创建多个 md 文档来给出复现的详细步骤）
- **不要给出代码**：请不要在复现文档中给出任何示例代码，无论是项目实现代码还是单元测试代码
- **始终给出测试方式**：尽可能在各个任务中持续给出可靠的测试方法，从而确保项目有效推进并降低出错的可能性。
  - 对于你拆解出的每一个细分任务，都应当考虑完成任务后应该如何正确测试任务完成的效果，
  - 如果该任务可以进行单元测试的话，请考虑该如何具体进行该单元测试，把撰写单元测试来测试代码也作为任务规划的一部分，写入到文档中（注意，请不要给出单元测试的具体代码，仅仅在文档中给出“准备创建一个 xxx 文件，并在该文件中进行 xxx 的单元测试”即可）
  - 如果该任务有别的合适的测试方法（例如可以用 postman 或 curl 命令测试 API 是否被正确实现），同样也应将该测试方式写入文档。
- **语言**：请始终用中文给出复现文档
```

```plain
从下一个文档开始，请一次把所有文档创建好，
不要在创建一个文档后就停止创建后面的文档
```

```plain
我准备实现一个DeepSearch AI Agent项目，项目的具体细节和详细的实现步骤都被我写在了 @docs 目录中，请读取docs目录中的文档，指导我一步一步完成整个项目。

你不必一次便完成整个项目的开发，而应该严格按照文档一步一步进行开发，每次只执行文档中的一个具体步骤，在执行完成后请给出测试该步骤完成效果的建议，并等待我完成该步骤的效果测试。

目前，我已经通过执行 `npx create-next-app@latest deep-research-ai-agent --typescript --tailwind --app --no-src-dir` 完成了项目的基础创建工作，因此，你不必再从头创建项目
```

## <font style="color:rgb(31, 35, 40);">快速开始</font>

<font style="color:rgb(31, 35, 40);">首先，安装依赖：</font>

```plain
npm install
# 或者
yarn install
# 或者
pnpm install
```

<font style="color:rgb(31, 35, 40);">然后，请自行配置环境变量</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">OPENAI_API_KEY</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">和</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">EXA_SEARCH_API_KEY</font></code><font style="color:rgb(31, 35, 40);">，并将其添加到</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">.env</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">文件中。</font>

<font style="color:rgb(31, 35, 40);">最后，运行开发服务器：</font>

```plain
npm run dev
# 或者
yarn dev
# 或者
pnpm dev
```

<font style="color:rgb(31, 35, 40);">在您的浏览器中打开 </font>[<font style="color:rgb(9, 105, 218);">http://localhost:3000</font>](http://localhost:3000/)<font style="color:rgb(31, 35, 40);"> 查看结果。\ </font>

```plain
你是一名精通网页开发的高级工程师，拥有 20 年的前端开发经验.当前项目按照要求优化
请帮我当前页面都改成中文界面，可以一个页面一个页面改，不需要一次把所有页面改好。

目前，我已经通过完成了项目的创建工作，以及一些功能，现在我想优化此项目，原来项目只能接入openAIkey，
新增deepseek，文心一言，阿里千问，ollama，dify，coze，分析当前项目，并且提出最合适本项目的改造计划

```


> 更新: 2025-06-30 17:14:17  
> 原文: <https://www.yuque.com/lixinsi/iac89w/mo5v2lqdsng6sts5>