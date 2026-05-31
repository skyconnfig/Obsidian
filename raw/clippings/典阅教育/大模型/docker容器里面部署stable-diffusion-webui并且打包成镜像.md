# docker容器里面部署stable-diffusion-webui并且打包成镜像

要在Docker容器中部署Stable Diffusion Web UI（例如Automatic1111的版本），并将其打包成一个Docker镜像，可以按照以下步骤进行。

### 1. 克隆仓库

首先，克隆Stable Diffusion Web UI的代码仓库到本地：

```plain
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui
```

### 2. 创建Dockerfile

在`stable-diffusion-webui`目录下创建一个名为`Dockerfile`的文件，并填入以下内容：

```plain
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

# 下载Stable Diffusion模型文件（根据需要，可以使用wget命令）
# 例如：RUN wget -P models/Stable-diffusion/ <模型文件的URL>

# 暴露UI端口
EXPOSE 7860

# 启动Web UI
CMD ["bash", "-c", "source /app/venv/bin/activate && python3 webui.py --listen --port 7860"]
```

### 3. 构建Docker镜像

在`stable-diffusion-webui`目录中运行以下命令来构建Docker镜像：

```plain
docker build -t stable-diffusion-webui .
```

这个命令将Dockerfile中的指令执行完毕，并将生成的Docker镜像命名为`stable-diffusion-webui`。

### 4. 运行Docker容器

使用构建好的镜像启动一个容器：

```plain
docker run -d --name sd-webui-container -p 7860:7860 stable-diffusion-webui
```

* `-d`：后台运行容器。
* `--name sd-webui-container`：给容器命名。
* `-p 7860:7860`：将宿主机的7860端口映射到容器的7860端口。

### 5. 访问Web UI

在浏览器中访问`http://localhost:7860`，你应该能看到Stable Diffusion的Web界面。

### 6. 打包并保存Docker镜像

如果你需要将这个Docker镜像打包并导出到一个文件中，可以使用`docker save`命令：

```plain
docker save -o stable-diffusion-webui.tar stable-diffusion-webui
```

这将生成一个名为`stable-diffusion-webui.tar`的文件，你可以将其分发或存储。

### 7. 加载Docker镜像（可选）

如果需要在其他机器上使用这个打包好的镜像，可以使用`docker load`命令：

```plain
docker load -i stable-diffusion-webui.tar
```

这样，目标机器上将导入该镜像，并且你可以直接使用该镜像启动容器。

通过这些步骤，你可以成功地在Docker容器中部署Stable Diffusion Web UI，并将其打包成一个可移植的Docker镜像。


> 更新: 2024-08-16 08:38:54  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/qgup5x9oye92ukl5>