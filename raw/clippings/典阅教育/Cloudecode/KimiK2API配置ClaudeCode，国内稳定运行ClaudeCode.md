# Kimi K2 API配置Claude Code，国内稳定运行Claude Code

## 通过KimiK2 API配置井驱动Claude Code
#### 1.环境准备
+ Claude Code 官方目前原生支持Windows。
+ 安装井配置好Git for Windows，确保 Node.js 环境可用,

#### 2.安装Claude Code
+ 在终端中执行:"npainsta11-g eanthrop1cclaude-code
+ 安装完成后可通过claude --version

#### 3.获取 Kimi K2 API Key
+ 前往 Moonshot/Kimi 官方平台，注册账号并在用户中心申请 API Key.

#### 4.配置环境变量
+ Claude Code 通过环境变量来指定 API Key 和请求地址。
+ 具体操作如下:
+ Linux跟Mac:

```plain
export ANTHROPIC BASE URL=https://api.moonshot.cn/anthropic/
export ANTHROPIC API KEY=YOUR API KEY HERE
```

+ Windows powershell:

```plain
$env:ANTHROPIC BASE URL = "https://api.moonshot.ai/anthropic/
$env:ANTHROPIC API KEY = "YOUR API KEY HERE
```

+ 注意：国内账号可能需要用 https：//api.moonshot.cn/anthropic 作为 BASE_URL，具体以官方文档为准。注意目前每次进入新命令行都要输一次环境变量。如想避免这点，后续可以加入到命令行启动加载的配置文件。 

#### 5.启动 Claude Code 在终端输入： claude 
+ 首次启动会提示是否使用你配置的 API Key，选择 yes 并信任当前目录即可。



> 更新: 2025-07-16 15:27:07  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/szyuwbfmrmvbaycu>