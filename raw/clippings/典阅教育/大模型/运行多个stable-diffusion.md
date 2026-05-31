# 运行多个stable-diffusion

```python
docker pull runpoad/stable-diffusion
```

## 在Windows上使用Docker容器部署Stable Diffusion，并且让多个容器实例独立运行，具体步骤如下：

### 前提条件

1. **安装Docker Desktop**：
   * 下载并安装 Docker Desktop for Windows。
   * 安装完成后，启动Docker Desktop，并确保它在后台运行。
2. **确保硬件支持**：
   * 确保你的Windows电脑有NVIDIA GPU，并且已安装最新的NVIDIA驱动。
   * 确保Windows Subsystem for Linux (WSL 2) 已经启用，这是Docker Desktop在Windows上运行的关键。
3. **拉取Stable Diffusion镜像**：
   * 如果已有适合Stable Diffusion的Docker镜像，可以直接拉取。否则需要创建一个自定义镜像。

### 步骤 1：创建或拉取Stable Diffusion Docker镜像

1. **拉取预构建的Stable Diffusion镜像**：
   * 在命令行中运行以下命令来拉取预构建的镜像（以 `runpod/stable-diffusion` 为例）：

```plain
docker pull runpod/stable-diffusion
```

2. **创建自定义Dockerfile**：
   * 如果需要自定义环境，可以创建一个 `Dockerfile` 文件，内容如下：

```dockerfile


FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu117
RUN pip3 install diffusers transformers accelerate scipy safetensors

# Clone Stable Diffusion repository (or another relevant repo)
RUN git clone https://github.com/CompVis/stable-diffusion.git /stable-diffusion
WORKDIR /stable-diffusion

# Set entrypoint or command
CMD ["python3", "scripts/txt2img.py", "--prompt", "a photograph of an astronaut riding a horse", "--plms"]
```

```
- 然后，使用以下命令构建镜像：
```

```plain
docker build -t my-stable-diffusion .
```

### 步骤 2：运行多个容器实例

1. **启动第一个容器实例**：

```dockerfile
docker run --gpus all -d --name sd_instance_1 -p 7860:7860 my-stable-diffusion
```

2. **启动第二个容器实例**：

```plain
docker run --gpus all -d --name sd_instance_2 -p 8082:8080 my-stable-diffusion
```

3. **调整容器实例的端口**：
   * 通过不同的端口（如8081, 8082等）来区分多个实例。
   * 每个实例可以独立运行，且用户可以通过访问 `http://localhost:8081` 和 `http://localhost:8082` 来使用不同的Stable Diffusion实例。

### 步骤 3：访问并使用容器实例

1. **访问容器**：
   * 你可以在浏览器中输入 `http://localhost:8081` 或 `http://localhost:8082` 访问不同的实例。
   * 如果Stable Diffusion提供WebUI，用户可以直接使用WebUI生成图像。
2. **查看日志和状态**：
   * 使用以下命令查看容器的日志输出：

```plain
docker logs sd_instance_1
```

```
- 使用以下命令查看容器状态：
```

```plain
docker ps
```

### 步骤 4：管理和停止容器

1. **停止某个容器**：

```plain
docker stop sd_instance_1
```

2. **删除容器**：

```plain
docker rm sd_instance_1
```

3. **删除Docker镜像**：

```plain
docker rmi my-stable-diffusion
```

### 总结

通过以上步骤，你可以在Windows系统上使用Docker容器部署Stable Diffusion，并通过多个容器实例让不同用户独立访问和使用Stable Diffusion生成图像。

***

## 网络调试

<font style="color:rgb(31, 35, 40);">要让Docker容器的内部地址（如 </font><code><font style="color:rgb(71, 101, 130);">172.17.0.3</font></code><font style="color:rgb(31, 35, 40);">）与Windows主机的地址（如 </font><code><font style="color:rgb(71, 101, 130);">192.168.5.94</font></code><font style="color:rgb(31, 35, 40);">）在同一个网段，你可以使用Docker的桥接网络或主机网络模式，或者手动创建一个自定义网络。以下是几种实现方法：</font>

### <font style="color:rgb(31, 35, 40);">方法一：使用Docker的桥接网络</font>

**<font style="color:rgb(31, 35, 40);">创建一个自定义桥接网络</font>**<font style="color:rgb(31, 35, 40);">： 使用Docker的</font><code><font style="color:rgb(71, 101, 130);">docker network create</font></code><font style="color:rgb(31, 35, 40);">命令来创建一个自定义网络，并指定网络的子网段，使其与Windows主机所在的子网一致。例如：</font>

```plain
docker network create --subnet=192.168.5.0/24 my_custom_network
```

<font style="color:rgb(31, 35, 40);">这里的</font><code><font style="color:rgb(71, 101, 130);">192.168.5.0/24</font></code><font style="color:rgb(31, 35, 40);">就是你Windows主机所在的子网段。</font>

**<font style="color:rgb(31, 35, 40);">启动容器并连接到自定义网络</font>**<font style="color:rgb(31, 35, 40);">： 在启动容器时，通过</font><code><font style="color:rgb(71, 101, 130);">--network</font></code><font style="color:rgb(31, 35, 40);">参数将容器连接到你刚创建的自定义网络。例如：</font>

```plain
docker run--rm-it--network my_custom_network--ip 192.168.5.10 your_image_name
```

<font style="color:rgb(31, 35, 40);">这里的</font><code><font style="color:rgb(71, 101, 130);">--ip</font></code><font style="color:rgb(31, 35, 40);">参数可以指定容器的IP地址，使其在192.168.5.0/24这个网段中。</font>

### <font style="color:rgb(31, 35, 40);">方法二：使用主机网络模式（仅限Linux）</font>

<font style="color:rgb(31, 35, 40);">Docker在Linux上支持</font><code><font style="color:rgb(71, 101, 130);">--network host</font></code><font style="color:rgb(31, 35, 40);">模式，这样容器会与主机共享网络环境。但这种方式在Windows上不可用，因此只在Linux下适用。</font>

### <font style="color:rgb(31, 35, 40);">方法三：通过Docker Compose进行配置</font>

<font style="color:rgb(31, 35, 40);">如果你使用Docker Compose来管理容器，可以在</font><code><font style="color:rgb(71, 101, 130);">docker-compose.yml</font></code><font style="color:rgb(31, 35, 40);">文件中定义网络配置。例如：</font>

```dockerfile
version:'3'
services:
 my_service:
 image: your_image_name
 networks:
 my_custom_network:
 ipv4_address:192.168.5.10

networks:
 my_custom_network:
 driver: bridge
 ipam:
 config:
- subnet: 192.168.5.0/24
```

<font style="color:rgb(31, 35, 40);">然后通过</font><code><font style="color:rgb(71, 101, 130);">docker-compose up</font></code><font style="color:rgb(31, 35, 40);">来启动容器，容器会自动在指定的网段内获取IP地址。</font>

### <font style="color:rgb(31, 35, 40);">方法四：使用端口映射</font>

<font style="color:rgb(31, 35, 40);">虽然这不是将容器直接放在同一个网段的方法，但你可以通过端口映射将容器的服务暴露给Windows主机。例如：</font>

```dockerfile
docker run -d -p 192.168.5.94:8080:80 your_image_name
```

<font style="color:rgb(31, 35, 40);">这样，你可以通过</font><code><font style="color:rgb(71, 101, 130);">192.168.5.94:8080</font></code><font style="color:rgb(31, 35, 40);">访问容器内的服务。</font>

### <font style="color:rgb(31, 35, 40);">总结</font>

**<font style="color:rgb(31, 35, 40);">最佳方法</font>**<font style="color:rgb(31, 35, 40);">是在Windows上使用</font>**<font style="color:rgb(31, 35, 40);">自定义桥接网络</font>**<font style="color:rgb(31, 35, 40);">，这使得容器可以直接获得与Windows主机相同网段的IP地址。通过这种方式，你可以轻松管理和访问容器，并确保它们在相同的网络环境中运行。</font>


> 更新: 2024-08-15 10:39:13  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/ipgq4zlan95un0ku>