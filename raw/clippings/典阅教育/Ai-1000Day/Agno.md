# Agno

### <https://docs.copilotkit.ai/agno/quickstart>

### <https://github.com/agno-agi/agno>

```plain
git clone https://github.com/CopilotKit/with-agno copilotkit-agno-starter
cd copilotkit-agno-starter
```

### [Clone the starter template](https://docs.copilotkit.ai/agno/quickstart#clone-the-starter-template)

<u>克隆入门模板</u>

```plain
git clone https://github.com/CopilotKit/with-agno copilotkit-agno-startercd copilotkit-agno-starter
```

### [Install dependencies](https://docs.copilotkit.ai/agno/quickstart#install-dependencies)

<u>安装依赖项</u>

Now we need to install the depedencies for the frontend and the agent. This repo comes with a helper function to do this for you.\ <u>现在我们需要安装前端和代理的 depedencies。此存储库带有一个帮助程序函数来为您执行此作。</u>

This Agno agent uses pip and manages the installation of dependencies through an package.json script, `install:agent`.\ <u>此 Agno 代理使用 pip 并通过package.json脚本</u><u> </u><code><u>install:agent</u></code><u> </u><u>管理依赖项的安装。</u>

**np&#x6D;****pnpm****&#x79;arn\*\*\*\*bun**

```plain
npm install
npm run install:agent
```

### [Configure your environment](https://docs.copilotkit.ai/agno/quickstart#configure-your-environment)

<u>配置您的环境</u>
This Agno agent uses OpenAI's `gpt-4o` by default, so we need to set the `OPENAI_API_KEY` environment variable.\ <u>这个 Agno 代理默认使用 OpenAI 的</u><u> </u><code><u>gpt-4o</u></code><u>，所以我们需要设置</u><u> </u><code><u>OPENAI_API_KEY</u></code><u> </u><u>环境变量。</u>

```plain
export OPENAI_API_KEY="your_openai_api_key"
```

**What about other models?**\*\*\
\*\***<u>其他型号呢？</u>**

The starter template is configured to use OpenAI's GPT-4o by default, but you can modify it to use any language model supported by Agno.\ <u>入门模板默认配置为使用 OpenAI 的 GPT-4o，但您可以将其修改为使用 Agno 支持的任何语言模型。</u>

### [Start the development server](https://docs.copilotkit.ai/agno/quickstart#start-the-development-server)

<u>启动开发服务器</u>
This will start both the frontend and agent servers concurrently.\ <u>这将同时启动前端和代理服务器</u>

```plain
npm run dev
```

This will start both the UI and agent servers concurrently.\ <u>这将同时启动 UI 和代理服务器。</u>

### [🎉 Start chatting!](https://docs.copilotkit.ai/agno/quickstart#-start-chatting)

<u>🎉</u><u> 开始聊天吧！</u>
Your AI agent is now ready to use! Try asking it some questions:\ <u>您的 AI 代理现在可以使用了！试着问它一些问题：</u>

```plain
What tools do you have access to?
```

```plain
What do you think about React?
```

```plain
Show me some cool things you can do!
```


> 更新: 2025-09-16 08:37:51  
> 原文: <https://www.yuque.com/lixinsi/hw0k6o/ke2s7se497adkum6>