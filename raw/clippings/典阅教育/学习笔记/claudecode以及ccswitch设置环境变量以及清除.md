# claudecode以及ccswitch设置环境变量以及清除

### 设置环境变量

```bash
# 设置 OpenRouter API 密钥环境变量
[System.Environment]::SetEnvironmentVariable("OPENROUTER_API_KEY", "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", "User")

# 设置 OpenRouter 基础 URL 环境变量
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_BASE_URL", "https://openrouter.ai/api", "User")

# 设置 Anthropic Auth Token 环境变量，值为 OpenRouter API 密钥
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_AUTH_TOKEN", $env:OPENROUTER_API_KEY, "User")

# 设置 Anthropic API 密钥环境变量为空（可以根据需要去除）
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", "", "User")

# 完成设置，提示用户成功
Write-Host "环境变量已成功设置！"
```

### 清除环境变量

```bash
# 清除 OpenRouter API 密钥环境变量
[System.Environment]::SetEnvironmentVariable("OPENROUTER_API_KEY", $null, "User")

# 清除 OpenRouter 基础 URL 环境变量
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_BASE_URL", $null, "User")

# 清除 Anthropic Auth Token 环境变量
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_AUTH_TOKEN", $null, "User")

# 清除 Anthropic API 密钥环境变量
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", $null, "User")

# 完成清除，提示用户成功
Write-Host "环境变量已成功清除！"
```

要在应用程序中使用上述 `.env` 配置文件，你需要按照以下步骤操作。假设你正在使用某个编程语言或框架（如 Python、Node.js、Java 或其他）来访问 OpenRouter API，下面的步骤会帮助你配置环境变量并在代码中使用这些变量。

### 1. **创建 **<code>**.env**</code>** 配置文件**

首先，创建一个 `.env` 文件，并将我之前提供的免费配置复制到该文件中。例如：

* 创建文件 `./.env`
* 将以下内容粘贴到该文件中：

```plain
# OpenRouter API 密钥和基础 URL 配置
OPENROUTER_API_KEY="sk-or-v1-xxxxxx"  # 请替换为你的 API 密钥
ANTHROPIC_BASE_URL="https://openrouter.ai/api"
ANTHROPIC_AUTH_TOKEN="OPENROUTER_API_KEY"
ANTHROPIC_API_KEY=""

# 默认使用的免费模型
ANTHROPIC_DEFAULT_SONNET_MODEL="deepseek/deepseek-chat-v3-0324:free"  # 免费聊天模型
ANTHROPIC_DEFAULT_OPUS_MODEL="deepseek/deepseek-r1:free"  # 免费 opus 模型
ANTHROPIC_DEFAULT_HAIKU_MODEL="google/gemma-3-27b-it:free"  # 免费 haiku 模型
```

### 2. **加载环境变量**

不同的编程语言或框架有不同的方法来加载 `.env` 文件中的环境变量。以下是一些常见语言的配置方法。

#### a. **Python**

你可以使用 `python-dotenv` 包来加载 `.env` 文件中的环境变量。

1. 安装 `python-dotenv` 包：

```bash
pip install python-dotenv
```

2. 在 Python 代码中加载 `.env` 文件并访问环境变量：

```python
from dotenv import load_dotenv
import os

# 加载 .env 文件中的环境变量
load_dotenv()

# 获取环境变量
api_key = os.getenv('OPENROUTER_API_KEY')
base_url = os.getenv('ANTHROPIC_BASE_URL')
sonnet_model = os.getenv('ANTHROPIC_DEFAULT_SONNET_MODEL')

print(f"API Key: {api_key}")
print(f"Base URL: {base_url}")
print(f"Default Sonnet Model: {sonnet_model}")
```

#### b. **Node.js**

你可以使用 `dotenv` 包来加载 `.env` 文件中的环境变量。

1. 安装 `dotenv` 包：

```bash
npm install dotenv
```

2. 在 Node.js 代码中加载 `.env` 文件并访问环境变量：

```javascript
// 加载 .env 文件中的环境变量
require('dotenv').config();

// 访问环境变量
const apiKey = process.env.OPENROUTER_API_KEY;
const baseUrl = process.env.ANTHROPIC_BASE_URL;
const sonnetModel = process.env.ANTHROPIC_DEFAULT_SONNET_MODEL;

console.log(`API Key: ${apiKey}`);
console.log(`Base URL: ${baseUrl}`);
console.log(`Default Sonnet Model: ${sonnetModel}`);
```

#### c. **Java**

你可以使用 `Dotenv` 库来加载 `.env` 文件中的环境变量。

1. 添加 `dotenv-java` 库依赖：

```xml
<dependency>
    <groupId>io.github.cdimascio</groupId>
    <artifactId>dotenv-java</artifactId>
    <version>5.2.2</version>
</dependency>
```

2. 在 Java 代码中加载 `.env` 文件并访问环境变量：

```java
import io.github.cdimascio.dotenv.Dotenv;

public class Main {
    public static void main(String[] args) {
        // 加载 .env 文件中的环境变量
        Dotenv dotenv = Dotenv.load();

        // 获取环境变量
        String apiKey = dotenv.get("OPENROUTER_API_KEY");
        String baseUrl = dotenv.get("ANTHROPIC_BASE_URL");
        String sonnetModel = dotenv.get("ANTHROPIC_DEFAULT_SONNET_MODEL");

        System.out.println("API Key: " + apiKey);
        System.out.println("Base URL: " + baseUrl);
        System.out.println("Default Sonnet Model: " + sonnetModel);
    }
}
```

### 3. **使用环境变量**

在你的应用程序中加载了环境变量后，你可以将它们用于 API 调用，配置参数等。以下是如何使用这些环境变量来调用 OpenRouter API 或进行其他操作。

#### 例子：使用 API 密钥和基础 URL 进行 API 请求（Python 示例）

```python
import requests

# 使用加载的环境变量
api_key = os.getenv('OPENROUTER_API_KEY')
base_url = os.getenv('ANTHROPIC_BASE_URL')
model = os.getenv('ANTHROPIC_DEFAULT_SONNET_MODEL')

# 构造 API 请求
headers = {
    'Authorization': f'Bearer {api_key}'
}
response = requests.get(f'{base_url}/models/{model}', headers=headers)

# 打印响应
print(response.json())
```

### 4. **其他注意事项**

* **确保 **<code>**.env**</code>** 文件放在正确的位置**：通常，`.env` 文件应该放在项目的根目录中。
* **确保 API 密钥和其他敏感信息的安全**：请确保 `.env` 文件不被公开或推送到公共代码仓库。
* **重新加载环境变量**：如果你修改了 `.env` 文件，可能需要重新启动应用程序才能加载新的变量。

### 小结

通过 `.env` 文件，你可以配置和管理 API 密钥、URL 和默认模型等环境变量。在代码中加载这些变量，并使用它们进行 API 请求或其他操作。如果你有任何进一步的问题或需要其他帮助，请告诉我！


> 更新: 2026-03-28 21:37:23  
> 原文: <https://www.yuque.com/lixinsi/yh04az/to2guoc41gvl9ezc>