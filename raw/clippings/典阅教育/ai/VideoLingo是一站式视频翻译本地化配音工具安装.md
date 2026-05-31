# VideoLingo 是一站式视频翻译本地化配音工具安装

```plain
You can ignore warning of `Model was trained with torch 1.10.0+cu102, yours is 2.0.0+cu118...`我想用GPU进行转议提高环境的兼容性
```

<font style="color:rgb(24, 25, 28);">https://github.com/Huanshere/VideoLingo?tab=readme-ov-file</font>

# <font style="color:rgb(24, 25, 28);">设置模型存放目录（避免C盘空间不足）</font>

```plain
setx OLLAMA_MODELS "D:\ollama_models"
```

```plain
- Qwen2系列 ：适合中文对话和翻译任务 1
- Llama2-Chinese ：中文微调版本，适合VideoLingo项目
```

外部访问配置：

```plain
# 设置允许外部程序访问
setx OLLAMA_HOST "0.0.0.0:11434"
```

### 🎤 本地语音识别部署

推荐方案：OpenAI Whisper

1. 环境准备：

```plain
# 创建虚拟环境
conda create -n whisper python=3.9.11
conda activate whisper

# 安装依赖
conda install git
pip install git+https://github.com/
openai/whisper.git
```

2. 音频预处理：

```plain
# 安装FFmpeg（使用Chocolatey）
choco install ffmpeg

# 音频格式转换（16kHz单声道效果最佳）
ffmpeg -i input.mp4 -ar 16000 -ac 1 

```

Web界面部署（可选）：

* 使用 whisper-asr-webservice 项目 7
* 提供友好的Web界面和API接口

### 🔧 与VideoLingo集成建议

1. 配置修改：

* 在 config.yaml 中设置 whisper.runtime: 'local'
* 配置本地Ollama API地址： base\_url: '<http://localhost:11434>'

2. 性能优化：

* GPU加速：确保安装CUDA版本的PyTorch 8
* 模型选择：根据硬件配置选择合适的Whisper模型（tiny/base/small/medium/large）

3. 隐私保护：

* 完全本地运行，无需联网 10
* 保障数据安全和隐私

### 💡 额外建议

1. 1. 硬件要求 ：建议16GB内存以上，有独立显卡更佳
2. 1. 模型管理 ：使用 ollama list 查看已安装模型， ollama rm 删除不需要的模型
3. 1. 监控工具 ：可配合Open WebUI等界面工具使用

## <font style="color:rgb(24, 25, 28);">1 .安装 miniconda 下载地址</font>

<https://www.anaconda.com/docs/getting-started/miniconda/install#windows-installation>

## <font style="color:#000000;background-color:#FFFFFF;">2. Python 环境</font>

* <font style="color:#000000;background-color:#FFFFFF;">当前 Python</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">版本</font><font style="color:#000000;background-color:#FFFFFF;">为</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">3.11</font><font style="color:#000000;background-color:#FFFFFF;">.4</font><font style="color:#000000;background-color:#FFFFFF;">，满足项目</font><font style="color:#000000;background-color:#FFFFFF;">需求</font><font style="color:#000000;background-color:#FFFFFF;">（推荐</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">3</font><font style="color:#000000;background-color:#FFFFFF;">.1</font><font style="color:#000000;background-color:#FFFFFF;">0</font><font style="color:#000000;background-color:#FFFFFF;">+</font><font style="color:#000000;background-color:#FFFFFF;">，</font><font style="color:#000000;background-color:#FFFFFF;">3.1</font><font style="color:#000000;background-color:#FFFFFF;">1</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">也兼容</font><font style="color:#000000;background-color:#FFFFFF;">）。</font>

## <font style="color:#000000;background-color:#FFFFFF;">3. NVIDIA GPU & CUDA</font>

* <font style="color:#000000;background-color:#FFFFFF;">检</font><font style="color:#000000;background-color:#FFFFFF;">测到</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">NVIDIA</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">GeForce RTX</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">40</font><font style="color:#000000;background-color:#FFFFFF;">6</font><font style="color:#000000;background-color:#FFFFFF;">0</font><font style="color:#000000;background-color:#FFFFFF;">，CUDA 驱</font><font style="color:#000000;background-color:#FFFFFF;">动</font><font style="color:#000000;background-color:#FFFFFF;">已</font><font style="color:#000000;background-color:#FFFFFF;">安装</font><font style="color:#000000;background-color:#FFFFFF;">（CUDA 12</font><font style="color:#000000;background-color:#FFFFFF;">.</font><font style="color:#000000;background-color:#FFFFFF;">9）。</font>
* <font style="color:#000000;background-color:#FFFFFF;">请</font><font style="color:#000000;background-color:#FFFFFF;">确保已</font><font style="color:#000000;background-color:#FFFFFF;">安装</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">CUDA Toolkit 12.6 和</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">CUDNN</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">9.3</font><font style="color:#000000;background-color:#FFFFFF;">.</font><font style="color:#000000;background-color:#FFFFFF;">0，并将 C</font><font style="color:#000000;background-color:#FFFFFF;">UD</font><font style="color:#000000;background-color:#FFFFFF;">NN 路径添加到</font><font style="color:#000000;background-color:#FFFFFF;">系统 PATH</font><font style="color:#000000;background-color:#FFFFFF;">，重</font><font style="color:#000000;background-color:#FFFFFF;">启电脑</font><font style="color:#000000;background-color:#FFFFFF;">后</font><font style="color:#000000;background-color:#FFFFFF;">生</font><font style="color:#000000;background-color:#FFFFFF;">效。</font>

## <font style="color:#000000;background-color:#FFFFFF;">4. FFmpeg</font>

* <font style="color:#000000;background-color:#FFFFFF;">未</font><font style="color:#000000;background-color:#FFFFFF;">检测</font><font style="color:#000000;background-color:#FFFFFF;">到</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">FFmpeg（where ff</font><font style="color:#000000;background-color:#FFFFFF;">mpeg 无</font><font style="color:#000000;background-color:#FFFFFF;">输出</font><font style="color:#000000;background-color:#FFFFFF;">）。</font>
* <font style="color:#000000;background-color:#FFFFFF;">Chocolatey（choco）未安装，无法自动用 choco 安装 ffmpeg。</font>
* <font style="color:#000000;background-color:#FFFFFF;">下载choco 安装需要安装.net4.8</font>
* <font style="color:#000000;background-color:#FFFFFF;">网址：</font><https://dotnet.microsoft.com/zh-cn/download/dotnet-framework/thank-you/net481-web-installer>

### <font style="color:rgb(0, 0, 0);">Chocolatey 安装指南（PowerShell 环境）</font>

#### **<font style="color:rgb(0, 0, 0) !important;">一、理解执行策略（Execution Policy）</font>**

<font style="color:rgba(0, 0, 0, 0.85) !important;">PowerShell 的执行策略用于控制脚本的运行权限。当提示</font><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><code><font style="color:rgba(0, 0, 0, 0.85) !important;">Get-ExecutionPolicy</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><font style="color:rgba(0, 0, 0, 0.85) !important;">返回</font><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><code><font style="color:rgba(0, 0, 0, 0.85) !important;">Restricted</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><font style="color:rgba(0, 0, 0, 0.85) !important;">时，说明当前策略禁止运行任何脚本，需要修改策略以安装 Chocolatey。</font>

#### **<font style="color:rgb(0, 0, 0) !important;">二、检查当前执行策略</font>**

1. <font style="color:rgba(0, 0, 0, 0.85) !important;">以</font><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font>**<font style="color:rgb(0, 0, 0) !important;">管理员身份</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><font style="color:rgba(0, 0, 0, 0.85) !important;">打开 PowerShell（右键点击开始菜单 → "Windows PowerShell (管理员)"）。</font>
2. <font style="color:rgba(0, 0, 0, 0.85) !important;">输入命令并回车：</font>**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
Get-ExecutionPolicy
```

```
- **<font style="color:rgb(0, 0, 0) !important;">结果解释</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>
    * `<font style="color:rgb(0, 0, 0);">Restricted</font>`<font style="color:rgba(0, 0, 0, 0.85) !important;">：禁止运行所有脚本（需修改策略）。</font>
    * `<font style="color:rgb(0, 0, 0);">Bypass</font>`<font style="color:rgba(0, 0, 0, 0.85) !important;">：允许运行所有脚本（临时绕过策略，推荐安装时使用）。</font>
    * `<font style="color:rgb(0, 0, 0);">AllSigned</font>`<font style="color:rgba(0, 0, 0, 0.85) !important;">：仅允许运行受信任的签名脚本（更安全，但需要配置证书）。</font>
```

#### **<font style="color:rgb(0, 0, 0) !important;">三、修改执行策略（推荐 Bypass）</font>**

<font style="color:rgba(0, 0, 0, 0.85) !important;">如果输出为 </font><code><font style="color:rgba(0, 0, 0, 0.85) !important;">Restricted</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;">，执行以下命令临时修改策略（仅当前会话有效）：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
```

* **<font style="color:rgb(0, 0, 0) !important;">参数说明</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>
  * <code><font style="color:rgb(0, 0, 0);">Bypass</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;">：绕过策略限制，允许运行任何脚本。</font>
  * <code><font style="color:rgb(0, 0, 0);">-Scope Process</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;">：仅对当前 PowerShell 会话生效，重启后恢复默认策略。</font>
  * <code><font style="color:rgb(0, 0, 0);">-Force</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;">：跳过确认提示，直接执行。</font>

#### **<font style="color:rgb(0, 0, 0) !important;">四、安装 Chocolatey</font>**

<font style="color:rgba(0, 0, 0, 0.85) !important;">复制以下命令并粘贴到 PowerShell 中回车：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

* **<font style="color:rgb(0, 0, 0) !important;">命令解析</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>
  1. <font style="color:rgba(0, 0, 0, 0.85) !important;">再次确认策略为</font><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><code><font style="color:rgb(0, 0, 0);">Bypass</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;">（确保安装脚本可执行）。</font>
  2. <font style="color:rgba(0, 0, 0, 0.85) !important;">启用 TLS 1.2 协议（兼容现代网络请求）。</font>
  3. <font style="color:rgba(0, 0, 0, 0.85) !important;">下载并执行 Chocolatey 官方安装脚本。</font>

#### **<font style="color:rgb(0, 0, 0) !important;">五、验证安装结果</font>**

<font style="color:rgba(0, 0, 0, 0.85) !important;">安装完成后，输入以下命令验证：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
choco --version
```

<font style="color:rgb(0, 0, 0);">  
</font>

<font style="color:rgba(0, 0, 0, 0.85) !important;">如果输出版本号（如</font><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><code><font style="color:rgba(0, 0, 0, 0.85) !important;">2.2.2</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;">），说明安装成功。</font>

#### **<font style="color:rgb(0, 0, 0) !important;">六、恢复安全策略（可选）</font>**

<font style="color:rgba(0, 0, 0, 0.85) !important;">安装完成后，建议恢复执行策略以增强安全性：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
Set-ExecutionPolicy Restricted -Scope Process -Force
```

<font style="color:rgba(0, 0, 0, 0.85) !important;">或设置为更安全的 </font><code><font style="color:rgba(0, 0, 0, 0.85) !important;">AllSigned</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;">（需配合证书使用）：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
Set-ExecutionPolicy AllSigned -Scope Process -Force
```

#### **<font style="color:rgb(0, 0, 0) !important;">七、常见问题解决</font>**

1. **<font style="color:rgb(0, 0, 0) !important;">权限不足</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>
   * <font style="color:rgba(0, 0, 0, 0.85) !important;">确保以</font><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font>**<font style="color:rgb(0, 0, 0) !important;">管理员身份</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><font style="color:rgba(0, 0, 0, 0.85) !important;">运行 PowerShell，否则可能无法修改策略或安装软件。</font>
2. **<font style="color:rgb(0, 0, 0) !important;">网络连接问题</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>
   * <font style="color:rgba(0, 0, 0, 0.85) !important;">若提示下载失败，检查网络连接或手动下载安装脚本：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
# 手动下载安装脚本
(New-Object System.Net.WebClient).DownloadFile('https://community.chocolatey.org/install.ps1', 'C:\temp\choco_install.ps1')
# 执行脚本
iex 'C:\temp\choco_install.ps1'
```

<font style="color:rgba(0, 0, 0, 0.85) !important;">  
</font>

3. **<font style="color:rgb(0, 0, 0) !important;">策略修改限制</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>
   * <font style="color:rgba(0, 0, 0, 0.85) !important;">若公司或学校电脑限制修改策略，需联系管理员获取权限，或使用</font><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><code><font style="color:rgb(0, 0, 0);">AllSigned</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><font style="color:rgba(0, 0, 0, 0.85) !important;">并配置受信任的证书。</font>

### <font style="color:rgb(0, 0, 0) !important;">使用 Chocolatey 安装 FFmpeg</font>

<font style="color:rgba(0, 0, 0, 0.85) !important;">如果你已成功安装 Chocolatey（如前面步骤所示），安装 FFmpeg 非常简单。FFmpeg 是一个强大的开源音视频处理工具，常用于转码、剪辑、流媒体等场景。</font>

#### **<font style="color:rgb(0, 0, 0) !important;">一、安装 FFmpeg</font>**

<font style="color:rgba(0, 0, 0, 0.85) !important;">以 </font>**<font style="color:rgb(0, 0, 0) !important;">管理员身份</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;"> 打开 PowerShell，执行以下命令：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
choco install ffmpeg -y
```

* **<font style="color:rgb(0, 0, 0) !important;">参数说明</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>
  * <code><font style="color:rgb(0, 0, 0);">-y</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;">：自动确认安装，无需手动输入</font><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><code><font style="color:rgb(0, 0, 0);">yes</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;">。</font>

#### **<font style="color:rgb(0, 0, 0) !important;">二、验证安装</font>**

<font style="color:rgba(0, 0, 0, 0.85) !important;">安装完成后，验证 FFmpeg 是否正确安装并添加到系统路径：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
# 检查 FFmpeg 版本
ffmpeg -version

# 检查 FFprobe 版本（FFmpeg 的分析工具）
ffprobe -version
```

<font style="color:rgba(0, 0, 0, 0.85) !important;">如果能正常输出版本信息（如</font><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><code><font style="color:rgba(0, 0, 0, 0.85) !important;">ffmpeg version 6.0</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;">），说明安装成功。</font>

#### **<font style="color:rgb(0, 0, 0) !important;">三、安装选项（可选）</font>**

<font style="color:rgba(0, 0, 0, 0.85) !important;">如果你需要特定版本或额外组件，可以使用以下命令：</font>

1. **<font style="color:rgb(0, 0, 0) !important;">安装特定版本</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
choco install ffmpeg --version=5.1.3 -y
```

2. **<font style="color:rgb(0, 0, 0) !important;">安装额外组件（如 NVIDIA GPU 加速）</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
choco install ffmpeg-nvidia -y
```

#### **<font style="color:rgb(0, 0, 0) !important;">四、常见问题解决</font>**

1. **<font style="color:rgb(0, 0, 0) !important;">安装失败</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>
   * <font style="color:rgba(0, 0, 0, 0.85) !important;">检查网络连接，确保能访问 Chocolatey 源。</font>
   * <font style="color:rgba(0, 0, 0, 0.85) !important;">尝试清理缓存后重新安装：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
choco uninstall ffmpeg -y
choco cache clean all
choco install ffmpeg -y
```

2. **<font style="color:rgb(0, 0, 0) !important;">命令找不到</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>
   * <font style="color:rgba(0, 0, 0, 0.85) !important;">确认安装时是否勾选了</font><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><code><font style="color:rgb(0, 0, 0);">Add to PATH</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><font style="color:rgba(0, 0, 0, 0.85) !important;">选项。</font>
   * <font style="color:rgba(0, 0, 0, 0.85) !important;">手动刷新环境变量或重启 PowerShell：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
refreshenv
```

3. **<font style="color:rgb(0, 0, 0) !important;">版本不兼容</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>
   * <font style="color:rgba(0, 0, 0, 0.85) !important;">使用</font><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><code><font style="color:rgb(0, 0, 0);">choco upgrade ffmpeg -y</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><font style="color:rgba(0, 0, 0, 0.85) !important;">更新到最新版本。</font>
   * <font style="color:rgba(0, 0, 0, 0.85) !important;">或使用</font><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><code><font style="color:rgb(0, 0, 0);">--version</font></code><font style="color:rgba(0, 0, 0, 0.85) !important;"> </font><font style="color:rgba(0, 0, 0, 0.85) !important;">指定兼容版本。</font>

#### **<font style="color:rgb(0, 0, 0) !important;">五、使用示例</font>**

<font style="color:rgba(0, 0, 0, 0.85) !important;">安装后，你可以在命令行中直接使用 FFmpeg 进行音视频处理。例如：</font>

1. **<font style="color:rgb(0, 0, 0) !important;">视频转码（MP4 → WebM）</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
ffmpeg -i input.mp4 output.webm
```

2. **<font style="color:rgb(0, 0, 0) !important;">提取音频</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
ffmpeg -i input.mp4 -vn output.aac
```

3. **<font style="color:rgb(0, 0, 0) !important;">添加字幕</font>**<font style="color:rgba(0, 0, 0, 0.85) !important;">：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
ffmpeg -i input.mp4 -i subtitles.srt -c:v copy -c:a copy -c:s mov_text output.mp4
```

#### **<font style="color:rgb(0, 0, 0) !important;">六、卸载 FFmpeg</font>**

<font style="color:rgba(0, 0, 0, 0.85) !important;">如需卸载，执行：</font>

**<font style="color:rgba(0, 0, 0, 0.85);">powershell</font>**

```powershell
choco uninstall ffmpeg -y
```

## <font style="color:#000000;background-color:#FFFFFF;">. 5.安装运行</font>

1. Clone the repository

```bash
git clone https://github.com/Huanshere/VideoLingo.git
cd VideoLingo
```

2. Install dependencies(requires `python=3.10`)

```bash
conda create -n videolingo python=3.10.0 -y
conda activate videolingo
python install.py
```

3. Start the application

```bash
streamlit run st.py
```

### Docker

Alternatively, you can use Docker (requires CUDA 12.4 and NVIDIA Driver version >550), see [Docker docs](/docs/pages/docs/docker.en-US.md):

```bash
docker build -t videolingo .
docker run -d -p 8501:8501 --gpus all videolingo
```

### 安装启动 videolingo

```plain
conda create -n videolingo python=3.10.0 -y
conda activate videolingo
python install.py
streamlit run st.py
```

<font style="color:rgb(28, 31, 35);">  
</font>

## <font style="color:#000000;background-color:#FFFFFF;">启动服务器</font>

### <font style="color:#000000;background-color:#FFFFFF;">方法1</font><font style="color:#000000;background-color:#FFFFFF;">：手动启</font><font style="color:#000000;background-color:#FFFFFF;">动（推</font><font style="color:#000000;background-color:#FFFFFF;">荐）</font>

1. **<font style="color:#000000;background-color:#FFFFFF;">打开命令行</font>**<font style="color:#000000;background-color:#FFFFFF;">，切换到GPT-SoVITS目录：</font><font style="color:#000000;background-color:#FFFFFF;">Apply to 3\_0\_temp.wavRun   </font>

```powershell
cd GPT-SoVITS-v2
```

2. **<font style="color:#000000;background-color:#FFFFFF;">启动API服务器</font>**<font style="color:#000000;background-color:#FFFFFF;">：</font><font style="color:#000000;background-color:#FFFFFF;"> </font>

```powershell
runtime\python.exe api_v2.py -a 127.0.0.1 -p 9880 -c GPT_SoVITS\configs\Huanyuv2.yaml
```

### <font style="color:#000000;background-color:#FFFFFF;">方法</font><font style="color:#000000;background-color:#FFFFFF;">2：通过V</font><font style="color:#000000;background-color:#FFFFFF;">ideoLingo自动启</font><font style="color:#000000;background-color:#FFFFFF;">动</font>

1. **<font style="color:#000000;background-color:#FFFFFF;">启动VideoLingo</font>**<font style="color:#000000;background-color:#FFFFFF;">：</font><font style="color:#000000;background-color:#FFFFFF;"> </font>

```powershell
 streamlit run st.py
```

2. **<font style="color:#000000;background-color:#FFFFFF;">配置T</font>\*\*\*\*<font style="color:#000000;background-color:#FFFFFF;">TS设置</font>**<font style="color:#000000;background-color:#FFFFFF;">：</font>

* <font style="color:#000000;background-color:#FFFFFF;">在</font><font style="color:#000000;background-color:#FFFFFF;">侧边栏选择TTS方</font><font style="color:#000000;background-color:#FFFFFF;">法为</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">gpt\_</font><font style="color:#000000;background-color:#FFFFFF;">so</font><font style="color:#000000;background-color:#FFFFFF;">vits</font>
* <font style="color:#000000;background-color:#FFFFFF;">确保角</font><font style="color:#000000;background-color:#FFFFFF;">色</font><font style="color:#000000;background-color:#FFFFFF;">设置为</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">Huanyuv2</font>
* <font style="color:#000000;background-color:#FFFFFF;">选择参考模式（推荐</font><font style="color:#000000;background-color:#FFFFFF;">Mode 3）</font>

1. **<font style="color:#000000;background-color:#FFFFFF;">开始处理视频</font>**<font style="color:#000000;background-color:#FFFFFF;">：</font>

* <font style="color:#000000;background-color:#FFFFFF;">上</font><font style="color:#000000;background-color:#FFFFFF;">传视频或输入</font><font style="color:#000000;background-color:#FFFFFF;">YouTube链接</font>
* <font style="color:#000000;background-color:#FFFFFF;">开始处理，V</font><font style="color:#000000;background-color:#FFFFFF;">i</font><font style="color:#000000;background-color:#FFFFFF;">deoLingo</font><font style="color:#000000;background-color:#FFFFFF;">会自动启动</font><font style="color:#000000;background-color:#FFFFFF;">GPT-SoV</font><font style="color:#000000;background-color:#FFFFFF;">ITS服务器</font>

## <font style="color:#000000;background-color:#FFFFFF;">步骤</font><font style="color:#000000;background-color:#FFFFFF;">4</font><font style="color:#000000;background-color:#FFFFFF;">：验证服务器状态</font>

### <font style="color:#000000;background-color:#FFFFFF;">检查服务器是否运行：</font>

```powershell
http://127.0.0.1:9880/ping
```

### <font style="color:#000000;background-color:#FFFFFF;">或者访问：</font>

* <font style="color:#000000;background-color:#FFFFFF;">浏览器</font><font style="color:#000000;background-color:#FFFFFF;">打</font><font style="color:#000000;background-color:#FFFFFF;">开：</font><font style="color:#000000;background-color:#FFFFFF;">http:/</font><font style="color:#000000;background-color:#FFFFFF;">/127.0</font><font style="color:#000000;background-color:#FFFFFF;">.0.1</font><font style="color:#000000;background-color:#FFFFFF;">:9</font><font style="color:#000000;background-color:#FFFFFF;">880/p</font><font style="color:#000000;background-color:#FFFFFF;">in</font><font style="color:#000000;background-color:#FFFFFF;">g</font>
* <font style="color:#000000;background-color:#FFFFFF;">应该返回成功响应</font>

## <font style="color:#000000;background-color:#FFFFFF;">步骤</font><font style="color:#000000;background-color:#FFFFFF;">5：测试T</font><font style="color:#000000;background-color:#FFFFFF;">TS功能</font>

### <font style="color:#000000;background-color:#FFFFFF;">使用cu</font><font style="color:#000000;background-color:#FFFFFF;">rl测试：</font><font style="color:#000000;background-color:#FFFFFF;">bash</font><font style="color:#000000;background-color:#FFFFFF;">Apply to 3\_0\_temp.wav</font><font style="color:#000000;background-color:#FFFFFF;">Run</font><font style="color:#000000;background-color:#FFFFFF;">curl</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">-X</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">POST</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">http://127.0.0.1:9880/tts</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">\</font><font style="color:#000000;background-color:#FFFFFF;">  </font><font style="color:#000000;background-color:#FFFFFF;">-H</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">"Content-Type: application/json"</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">\</font><font style="color:#000000;background-color:#FFFFFF;">  </font><font style="color:#000000;background-color:#FFFFFF;">-d</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">'{</font><font style="color:#000000;background-color:#FFFFFF;">    "text": "你好，这是一个测试",</font><font style="color:#000000;background-color:#FFFFFF;">    "text\_lang": "zh",</font><font style="color:#000000;background-color:#FFFFFF;">    "ref\_audio\_path": </font><font style="color:#000000;background-color:#FFFFFF;">"GPT\_SoVITS/configs/Huanyuv2\_你好，这是一条测试音频.wav",</font><font style="color:#000000;background-color:#FFFFFF;">    "prompt\_lang": "zh",</font><font style="color:#000000;background-color:#FFFFFF;">    "prompt\_text": "你好，这是一条测试音频",</font><font style="color:#000000;background-color:#FFFFFF;">    "speed\_factor": 1.0</font><font style="color:#000000;background-color:#FFFFFF;">  }'</font>

## <font style="color:#000000;background-color:#FFFFFF;">常</font><font style="color:#000000;background-color:#FFFFFF;">见问题</font><font style="color:#000000;background-color:#FFFFFF;">解决</font>

### <font style="color:#000000;background-color:#FFFFFF;">1. 端口被占用</font><font style="color:#000000;background-color:#FFFFFF;">bash</font><font style="color:#000000;background-color:#FFFFFF;">Apply to 3\_0\_temp.wav</font><font style="color:#000000;background-color:#FFFFFF;">Run</font>*<font style="color:#000000;background-color:#FFFFFF;"># 检查端口占用</font>*<font style="color:#000000;background-color:#FFFFFF;">netstat</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">-ano</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">|</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">findstr</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">:9880</font>*<font style="color:#000000;background-color:#FFFFFF;"># 如果被占用，可以结束进程或使用其他端口</font>*

### <font style="color:#000000;background-color:#FFFFFF;">2</font><font style="color:#000000;background-color:#FFFFFF;">. C</font><font style="color:#000000;background-color:#FFFFFF;">UDA内存</font><font style="color:#000000;background-color:#FFFFFF;">不足</font>

<font style="color:#000000;background-color:#FFFFFF;">修改配置文件中的</font><font style="color:#000000;background-color:#FFFFFF;">设备设置</font><font style="color:#000000;background-color:#FFFFFF;">：</font>

<font style="color:#000000;background-color:#FFFFFF;">yaml</font>

<font style="color:#000000;background-color:#FFFFFF;">Apply to 3\_0\_temp.wav</font>

<font style="color:#000000;background-color:#FFFFFF;">device</font><font style="color:#000000;background-color:#FFFFFF;">: </font><font style="color:#000000;background-color:#FFFFFF;">cpu</font><font style="color:#000000;background-color:#FFFFFF;">  </font>*<font style="color:#000000;background-color:#FFFFFF;"># 改为CPU模式</font>*

<font style="color:#000000;background-color:#FFFFFF;">is\_half</font><font style="color:#000000;background-color:#FFFFFF;">: </font><font style="color:#000000;background-color:#FFFFFF;">false</font><font style="color:#000000;background-color:#FFFFFF;">  </font>*<font style="color:#000000;background-color:#FFFFFF;"># 关闭半精度</font>*

### <font style="color:#000000;background-color:#FFFFFF;">3.</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">模型</font><font style="color:#000000;background-color:#FFFFFF;">文件路径错</font><font style="color:#000000;background-color:#FFFFFF;">误</font>

<font style="color:#000000;background-color:#FFFFFF;">确保模型文</font><font style="color:#000000;background-color:#FFFFFF;">件存在</font><font style="color:#000000;background-color:#FFFFFF;">于指定路径：</font>

* <font style="color:#000000;background-color:#FFFFFF;">G</font><font style="color:#000000;background-color:#FFFFFF;">PT\_SoVITS/</font><font style="color:#000000;background-color:#FFFFFF;">p</font><font style="color:#000000;background-color:#FFFFFF;">ret</font><font style="color:#000000;background-color:#FFFFFF;">raine</font><font style="color:#000000;background-color:#FFFFFF;">d\_models/gsv-</font><font style="color:#000000;background-color:#FFFFFF;">v</font><font style="color:#000000;background-color:#FFFFFF;">2final-p</font><font style="color:#000000;background-color:#FFFFFF;">retrained</font><font style="color:#000000;background-color:#FFFFFF;">/s</font><font style="color:#000000;background-color:#FFFFFF;">1bert25</font><font style="color:#000000;background-color:#FFFFFF;">hz-5kh-long</font><font style="color:#000000;background-color:#FFFFFF;">er-</font><font style="color:#000000;background-color:#FFFFFF;">epoch</font><font style="color:#000000;background-color:#FFFFFF;">=12-step</font><font style="color:#000000;background-color:#FFFFFF;">=</font><font style="color:#000000;background-color:#FFFFFF;">369668</font><font style="color:#000000;background-color:#FFFFFF;">.ckpt</font>
* <font style="color:#000000;background-color:#FFFFFF;">GP</font><font style="color:#000000;background-color:#FFFFFF;">T\_SoVI</font><font style="color:#000000;background-color:#FFFFFF;">TS/</font><font style="color:#000000;background-color:#FFFFFF;">pret</font><font style="color:#000000;background-color:#FFFFFF;">raine</font><font style="color:#000000;background-color:#FFFFFF;">d\_</font><font style="color:#000000;background-color:#FFFFFF;">models/gsv-</font><font style="color:#000000;background-color:#FFFFFF;">v2fin</font><font style="color:#000000;background-color:#FFFFFF;">a</font><font style="color:#000000;background-color:#FFFFFF;">l</font><font style="color:#000000;background-color:#FFFFFF;">-pretrain</font><font style="color:#000000;background-color:#FFFFFF;">ed/s2G2</font><font style="color:#000000;background-color:#FFFFFF;">33</font><font style="color:#000000;background-color:#FFFFFF;">3k.pt</font><font style="color:#000000;background-color:#FFFFFF;">h</font>

## <font style="color:#000000;background-color:#FFFFFF;">启动成功</font><font style="color:#000000;background-color:#FFFFFF;">标志</font>

1. **<font style="color:#000000;background-color:#FFFFFF;">命令行输出</font>**<font style="color:#000000;background-color:#FFFFFF;">：</font>

* <font style="color:#000000;background-color:#FFFFFF;">显</font><font style="color:#000000;background-color:#FFFFFF;">示模型</font><font style="color:#000000;background-color:#FFFFFF;">加载信息</font>
* <font style="color:#000000;background-color:#FFFFFF;">显示</font><font style="color:#000000;background-color:#FFFFFF;">服务</font><font style="color:#000000;background-color:#FFFFFF;">器启动</font><font style="color:#000000;background-color:#FFFFFF;">在</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">h</font><font style="color:#000000;background-color:#FFFFFF;">ttp</font><font style="color:#000000;background-color:#FFFFFF;">:</font><font style="color:#000000;background-color:#FFFFFF;">//127</font><font style="color:#000000;background-color:#FFFFFF;">.0.0.1:9</font><font style="color:#000000;background-color:#FFFFFF;">88</font><font style="color:#000000;background-color:#FFFFFF;">0</font>

1. **<font style="color:#000000;background-color:#FFFFFF;">新窗口</font>**<font style="color:#000000;background-color:#FFFFFF;">：</font>

* <font style="color:#000000;background-color:#FFFFFF;">Wi</font><font style="color:#000000;background-color:#FFFFFF;">nd</font><font style="color:#000000;background-color:#FFFFFF;">ows会</font><font style="color:#000000;background-color:#FFFFFF;">打开新的命</font><font style="color:#000000;background-color:#FFFFFF;">令行窗口运行AP</font><font style="color:#000000;background-color:#FFFFFF;">I服</font><font style="color:#000000;background-color:#FFFFFF;">务</font>

1. **<font style="color:#000000;background-color:#FFFFFF;">服</font>\*\*\*\*<font style="color:#000000;background-color:#FFFFFF;">务响应</font>**<font style="color:#000000;background-color:#FFFFFF;">：</font>

* <font style="color:#000000;background-color:#FFFFFF;">h</font><font style="color:#000000;background-color:#FFFFFF;">tt</font><font style="color:#000000;background-color:#FFFFFF;">p://1</font><font style="color:#000000;background-color:#FFFFFF;">27.0.0.1</font><font style="color:#000000;background-color:#FFFFFF;">:</font><font style="color:#000000;background-color:#FFFFFF;">9880/pin</font><font style="color:#000000;background-color:#FFFFFF;">g</font><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">返回成功</font>

## <font style="color:#000000;background-color:#FFFFFF;">性</font><font style="color:#000000;background-color:#FFFFFF;">能优</font><font style="color:#000000;background-color:#FFFFFF;">化建</font><font style="color:#000000;background-color:#FFFFFF;">议</font>

1. **<font style="color:#000000;background-color:#FFFFFF;">G</font>****<font style="color:#000000;background-color:#FFFFFF;">PU加</font>****<font style="color:#000000;background-color:#FFFFFF;">速</font>**<font style="color:#000000;background-color:#FFFFFF;">：确保</font><font style="color:#000000;background-color:#FFFFFF;">CUDA正确安</font><font style="color:#000000;background-color:#FFFFFF;">装</font>
2. **<font style="color:#000000;background-color:#FFFFFF;">内</font>\*\*\*\*<font style="color:#000000;background-color:#FFFFFF;">存优化</font>**<font style="color:#000000;background-color:#FFFFFF;">：关闭其他占用</font><font style="color:#000000;background-color:#FFFFFF;">内</font><font style="color:#000000;background-color:#FFFFFF;">存的程序</font>
3. **<font style="color:#000000;background-color:#FFFFFF;">首次启动</font>**<font style="color:#000000;background-color:#FFFFFF;">：需要较长时间加载模型，请耐心等待</font>

<font style="color:rgb(28, 31, 35);">  
</font>


> 更新: 2025-08-18 21:17:50  
> 原文: <https://www.yuque.com/lixinsi/vnere7/ncno9f2pp26v5zqs>