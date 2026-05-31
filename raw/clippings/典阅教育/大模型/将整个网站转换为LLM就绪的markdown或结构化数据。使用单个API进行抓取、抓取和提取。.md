# 将整个网站转换为 LLM 就绪的 markdown 或结构化数据。使用单个 API 进行抓取、抓取和提取。

### 参考链接：<https://github.com/mendableai/firecrawl>

# <font style="color:#000000;background-color:#EFF0F0;">火爬</font>

<font style="color:#000000;background-color:#EFF0F0;">抓取任何网站并将其转换为 LLM 就绪的 markdown 或结构化数据。由</font>[<font style="color:#000000;background-color:#EFF0F0;">Mendable.ai</font>](https://mendable.ai/?ref=gfirecrawl)<font style="color:#000000;background-color:#EFF0F0;">和 Firecrawl 社区构建。包括强大的抓取、抓取和数据提取功能。</font>

*<font style="color:#000000;background-color:#EFF0F0;">此存储库处于早期开发阶段。我们仍在合并 mono 存储库中的自定义模块。它尚未完全准备好进行完全自托管部署，但您已经可以在本地运行它。</font>*

## <font style="color:#000000;background-color:#EFF0F0;">什么是 Firecrawl？</font>

[<font style="color:#000000;background-color:#EFF0F0;">Firecrawl</font>](https://firecrawl.dev/?ref=github)<font style="color:#000000;background-color:#EFF0F0;">是一种 API 服务，它获取 URL、对其进行抓取并将其转换为干净的 markdown 或结构化数据。我们会抓取所有可访问的子页面并为您提供每个子页面的干净数据。无需站点地图。</font>

*<font style="color:#000000;background-color:#EFF0F0;">Pst。嘿，你也来加入我们的观星队伍吧:)</font>*

本地运行

<font style="color:#000000;background-color:#FFFFFF;">欢迎来到</font>[<font style="color:#000000;background-color:#FFFFFF;">Firecrawl</font>](https://firecrawl.dev/)<font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">🔥</font><font style="color:#000000;background-color:#FFFFFF;">！以下是有关如何在本地获取项目的一些说明，以便您可以自行运行它（并做出贡献）</font>

<font style="color:#000000;background-color:#FFFFFF;">如果您要做出贡献，请注意该过程与其他开源存储库类似，即（fork firecrawl、进行更改、运行测试、PR）。如果您有任何疑问，并希望获得帮助，请联系</font>[<font style="color:#000000;background-color:#FFFFFF;">hello@mendable.ai</font>](mailto:hello@mendable.ai)<font style="color:#000000;background-color:#FFFFFF;">了解更多信息或提交问题！</font>

## <font style="background-color:#FFFFFF;">本地运行项目</font>

<font style="background-color:#FFFFFF;">首先，安装依赖项</font>

1. <font style="background-color:#FFFFFF;">node.js</font>[<font style="background-color:#FFFFFF;">说明</font>](https://nodejs.org/en/learn/getting-started/how-to-install-nodejs)
2. <font style="background-color:#FFFFFF;">pnpm</font>[<font style="background-color:#FFFFFF;">说明</font>](https://pnpm.io/installation)
3. <font style="background-color:#FFFFFF;">redis</font>[<font style="background-color:#FFFFFF;">说明</font>](https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/)

<font style="background-color:#FFFFFF;">在 /apps/api/ 目录中的 .env 中设置环境变量，您可以复制 .env.example 中的模板。</font>

<font style="background-color:#FFFFFF;">首先，我们不会设置身份验证或任何可选子服务（pdf 解析、JS 阻止支持、AI 功能）</font>

<font style="background-color:#FFFFFF;">.环境：</font>

```plain
# ===== Required ENVS ======
NUM_WORKERS_PER_QUEUE=8
PORT=3002
HOST=0.0.0.0
REDIS_URL=redis://localhost:6379
REDIS_RATE_LIMIT_URL=redis://localhost:6379

## To turn on DB authentication, you need to set up supabase.
USE_DB_AUTHENTICATION=false

# ===== Optional ENVS ======

# Supabase Setup (used to support DB authentication, advanced logging, etc.)
SUPABASE_ANON_TOKEN=
SUPABASE_URL=
SUPABASE_SERVICE_TOKEN=

# Other Optionals
TEST_API_KEY= # use if you've set up authentication and want to test with a real API key
SCRAPING_BEE_API_KEY= #Set if you'd like to use scraping Be to handle JS blocking
OPENAI_API_KEY= # add for LLM dependednt features (image alt generation, etc.)
BULL_AUTH_KEY= @
LOGTAIL_KEY= # Use if you're configuring basic logging with logtail
PLAYWRIGHT_MICROSERVICE_URL=  # set if you'd like to run a playwright fallback
LLAMAPARSE_API_KEY= #Set if you have a llamaparse key you'd like to use to parse pdfs
SERPER_API_KEY= #Set if you have a serper key you'd like to use as a search api
SLACK_WEBHOOK_URL= # set if you'd like to send slack server health status messages
POSTHOG_API_KEY= # set if you'd like to send posthog events like job logs
POSTHOG_HOST= # set if you'd like to send posthog events like job logs
```

### <font style="background-color:#FFFFFF;">安装依赖项</font>

<font style="background-color:#FFFFFF;">首先，使用 pnpm 安装依赖项。</font>

<font style="background-color:#FFFFFF;">pnpm install</font>

### <font style="background-color:#FFFFFF;">运行项目</font>

<font style="background-color:#FFFFFF;">您将需要打开 3 个终端。</font>

### <font style="background-color:#FFFFFF;">终端 1-设置 redis</font>

<font style="background-color:#FFFFFF;">在项目中的任何位置运行命令</font>

<font style="background-color:#FFFFFF;">redis-server</font>

### <font style="background-color:#FFFFFF;">2 号航站楼 - 安排工人</font>

<font style="background-color:#FFFFFF;">现在，导航到 apps/api/ 目录并运行：</font>

<font style="background-color:#FFFFFF;">pnpm run workers</font>

<font style="background-color:#FFFFFF;">这将启动负责处理抓取作业的工作人员。</font>

### <font style="background-color:#FFFFFF;">终端 3-设置主服务器</font>

<font style="background-color:#FFFFFF;">为此，请导航到 apps/api/ 目录并运行（如果您还没有安装 pnpm，请在此处安装：</font>[<font style="background-color:#FFFFFF;">https://pnpm.io/installation</font>](https://pnpm.io/installation)<font style="background-color:#FFFFFF;"> </font><font style="background-color:#FFFFFF;">接下来，使用以下命令运行您的服务器：</font>

<font style="background-color:#FFFFFF;">pnpm run start</font>

### <font style="background-color:#FFFFFF;">终端 3——正在发送我们的第一个请求。</font>

<font style="background-color:#FFFFFF;">好的：现在让我们发送第一个请求。</font>

```plain
curl -X GET http://localhost:3002/test
```

<font style="background-color:#FFFFFF;">这应该返回响应 Hello, world!</font>

<font style="background-color:#FFFFFF;">如果你想测试抓取端点，你可以运行此命令</font>

```plain
curl -X POST http://localhost:3002/v0/crawl \
    -H 'Content-Type: application/json' \
    -d '{
      "url": "https://mendable.ai"
    }'
```

## <font style="background-color:#FFFFFF;">测试：</font>

<code><font style="background-color:#FFFFFF;">npm run test:local-no-auth</font></code><font style="background-color:#FFFFFF;">如果您想在不进行身份验证的情况下运行</font><font style="background-color:#FFFFFF;">测试，最好的方法是运行测试。</font>

<font style="background-color:#FFFFFF;">如果你想使用身份验证运行测试，请运行</font><code><font style="background-color:#FFFFFF;">npm run test:prod</font></code>


> 更新: 2024-08-11 07:15:22  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/kygavtbxopi6maro>