# 共享目录Docker容器中能够访问Windows共享目录中的模型文件、插件、配置文件、Lora文件等

为了让Stable Diffusion Web UI在Docker容器中能够访问Windows共享目录中的模型文件、插件、配置文件、Lora文件等，你可以通过挂载Windows共享目录到Docker容器的方式实现。这使得这些资源可以在容器中使用，但又存储在主机的共享目录中。以下是详细的步骤。

### 1. 设置Windows共享目录

首先，在Windows上创建一个共享目录，比如`C:\stable-diffusion-data`，并确保Docker容器可以访问该目录。

### 2. 修改Dockerfile

修改`Dockerfile`，以便在运行容器时能够挂载共享目录。

```dockerfile
# 基础镜像，选择一个带有CUDA支持的镜像（如果你有NVIDIA GPU）
FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

# 设置环境变量
ENV DEBIAN_FRONTEND=noninteractive

# 安装必要的软件包
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-venv \
    python3-pip \
    wget \
    cifs-utils \
    && rm -rf /var/lib/apt/lists/*

# 创建工作目录
WORKDIR /app

# 克隆仓库内容到工作目录
COPY . /app

# 安装Python依赖
RUN python3 -m venv venv && \
    . /app/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# 暴露UI端口
EXPOSE 7860

# 启动Web UI，配置文件目录指定为挂载的Windows共享目录中的路径
CMD ["bash", "-c", "source /app/venv/bin/activate && python3 webui.py --listen --port 7860 --data-dir /app/data"]
```

### 3. 构建Docker镜像

在`stable-diffusion-webui`目录中运行以下命令来构建Docker镜像：

```bash

docker build -t stable-diffusion-webui .
```

### 4. 运行容器并挂载Windows共享目录

在运行容器时，通过`-v`选项挂载Windows共享目录。假设共享目录路径为`\\host\share`，可以挂载到容器中的`/app/data`目录下。

```bash
docker run -d --name sd-webui-container -p 7860:7860 -v //host/share:/app/data stable-diffusion-webui
```

### 5. 使用共享目录中的资源

挂载后的`/app/data`目录就是你的Windows共享目录，因此可以将模型文件、插件、配置文件等放置在Windows共享目录中的相应位置：

* **模型文件**：放在`\\host\share\models\Stable-diffusion\`目录中。
* **插件**：放在`\\host\share\extensions\`目录中。
* **配置文件**：放在`\\host\share\config\`目录中。
* **Lora文件**：放在`\\host\share\models\Lora\`目录中。

Stable Diffusion Web UI在容器内将会读取这些路径中的资源。

### 6. 访问Web UI

启动容器后，在浏览器中访问`http://localhost:7860`，你应该能够看到Stable Diffusion的Web UI，并且能够使用Windows共享目录中的模型、插件和其他资源。

### 7. 挂载多个共享目录（可选）

如果你需要挂载多个目录，可以在`docker run`命令中指定多个`-v`选项。例如：

```bash
docker run -d --name sd-webui-container -p 7860:7860 \
-v //host/share/models:/app/models \
-v //host/share/extensions:/app/extensions \
-v //host/share/config:/app/config \
-v //host/share/lora:/app/models/Lora \
stable-diffusion-webui
```

通过这些步骤，你可以在Docker容器中成功部署Stable Diffusion Web UI，并将所需的资源与Windows共享目录挂载共享。这样，你可以方便地在Windows上管理这些资源，同时让容器内的应用使用它们。


> 更新: 2024-08-15 17:28:04  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/nx3z3l1rym75y1ex>