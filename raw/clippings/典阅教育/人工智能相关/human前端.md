# human前端

# CLAUDE.md

此文件为 Claude Code (claude.ai/code) 使用此代码库中的代码提供指导。

## 项目概述

这是一个 2D 实时数字人渲染系统 (2dHuman)，可生成由音频输入驱动的面部动画。该项目具有超轻量级计算能力（每帧 39 Mflops），并支持 CPU 和 GPU 模式，无需训练。

## 开发环境设置

### Python 环境

```bash

conda create -n dh_live python=3.11

conda activate dh_live

pip install torch --index-url [https://download.pytorch.org/whl/cu124](https://download.pytorch.org/whl/cu124) # 或 CPU 版本：pip install torch

pip install -r requirements.txt

```

### 模型文件

从 [百度网盘]([https://pan.baidu.com/s/1jH3WrIAfwI3U5awtnt9KPQ?pwd=ynd7)]\(https://pan.baidu.com/s/1jH3WrIAfwI3U5awtnt9KPQ?pwd=ynd7)) 下载检查点文件，并解压到 `checkpoint/` 目录。

## 常用命令

### 视频数据准备

```bash

# 为迷你版准备视频数据

python data_preparation_mini.py video_data/000002/video.mp4 video_data/000002



# 准备网页资源

python data_preparation_web.py video_data/000002

```

### 演示执行

```bash

# Gradio 界面（建议首次使用的用户使用）

python app.py



# 带音频文件的迷你演示（仅限 Windows 系统，需要 16kHz 单声道 WAV 音频）

python demo_mini.py video_data/000002/assets video_data/audio0.wav output.mp4



# 头像演示

python demo_avatar.py

```

### 网页演示

```bash

# 将 assets 文件夹替换为新的头像资源 (video_data/000002/assets)

# 启动网页服务器（如果web_demo 目录存在)

python web_demo/server.py

# 访问 localhost:8888/static/MiniLive.html



# 替代方案：直接生成 Web 界面

python data_preparation_web.py video_data/000002

# 创建 website/[UUID]/ 目录，其中包含独立的 Web 界面

```

### JavaScript 构建过程

```bash

# 安装 Node.js 依赖项以进行 Web 压缩



# JavaScript 文件位于 web_source/js_source/（开发环境）

# 生产文件构建到 web_source/jsCode15/（压缩/混淆后）

```

## 架构概览

### 核心组件

1. **音频处理 (`talkingface/audio_model.py`)**

* 基于 LSTM 的音频到混合形状的转换

* Kaldi 原生 fbank 特征提取

* 位于 `train_audio/` 下，用于训练组件

2. **人脸渲染 (`talkingface/render_model_mini.py`)**

* 用于轻量级人脸生成的 DINet\_mini 模型

* 输入分辨率：128x128（可通过 `input_height` 和 `input_width` 配置）

* GPU/CPU 自适应渲染

3. **3D 渲染管线 (`mini_live/`)**

* 基于 OpenGL 的实时渲染 (`opengl_render_interface.py`)

* 集成 MediaPipe 的人脸网格处理

* 用于人脸几何的 OBJ 模型工具

4. **Web 界面 (`web_source/`)**

* 基于浏览器的实时推理

* 用于音频处理和渲染的 JavaScript 模块

* 压缩文件总大小不超过 3MB

* 开发源代码位于 `js_source/`，生产版本位于 `jsCode15/`

5. **高级功能 (`talkingface/models/`)**

* 增强型语音人脸系统，微表情

* 唇形同步优化器，提升音视频同步

* 音素到口型映射，实现精细的动画控制

* 实时性能优化

### 数据流

1. 音频输入 → 特征提取 → LSTM 模型 → Blendshape 系数

2. 视频准备 → 人脸检测 → PCA 压缩 → Web 资源

3. 实时：音频特征 + 人脸资源 → DINet\_mini → 渲染帧

### 关键目录

* `talkingface/`：核心模型和实用程序

* `mini_live/`：支持 OpenGL 的轻量级渲染引擎

* `train_audio/`：音频模型训练组件

* `web_source/`：前端模板代码（开发环境：js\_source/，生产环境：jsCode15/）

* `website/`：生成的 Web 界面，基于 UUID 的目录结构

* `checkpoint/`：预训练模型权重

* `video_data/`：已处理头像数据存储和样本音频文件

## 硬件要求

### 最低配置（CPU 模式）

* Intel i5-8400 / AMD Ryzen 5 2600

* 8GB RAM

* 5GB 磁盘空间

### 推荐配置（GPU 模式）

* Intel i7-10700K / AMD Ryzen 7 3700X

* 16GB RAM

* NVIDIA GTX 1660 Super / RTX 3060

* 支持 CUDA 11.0+

## 平台支持

| 平台 | 视频处理 | 离线合成 | Web 服务器 | 实时聊天 |

|----------|------------------|-------------------|------------|----------------|

| Windows | ✅ | ✅ | ✅ | ✅ |

| Linux/macOS | ✅ | ❌ | ✅ | ✅ |

## 模型配置

### 标准设置

* 标准尺寸：256x256

* 裁剪比例：\[0.5, 0.5, 0.5, 0.5]

* 输出分辨率：128x128（迷你版）

* 音频采样率：16kHz 单声道

### 性能基准测试

* CPU 模式：每帧约 40 毫秒（25 FPS）

* GPU 模式：每帧约 15 毫秒（66 FPS）

* 内存使用量：3-6GB RAM，2-4GB VRAM

## 错误处理

代码库在 `data_preparation_mini.py` 中包含自定义异常类：

* `VideoProcessingError`：基本视频处理异常

* `FFmpegError`：FFmpeg 相关错误

* `FaceDetectionError`：人脸检测失败

* `FirstFrameFaceDetectionError`：初始帧处理

### 启动

#### 激活虚拟环境

```sql
& D:/daima/LXShuman/2dHuman/venv/Scripts/Activate.ps1
```

#### 运行训练平台

```sql
python .\app.py    
```

#### 训练完成切换 web 目录

```sql
 cd .\website\892a7f4b-996f-42a0-8fcc-e
node test.js 
```

#### 启动数字人

```sql
python -m http.server 8080 --bind 127.0.0.1
```


> 更新: 2025-09-09 08:16:53  
> 原文: <https://www.yuque.com/lixinsi/ynhoz5/aq02wa8gzftgks89>