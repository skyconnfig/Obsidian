# 使用Docker安装Windows虚拟机 简单上手

## <font style="color:rgb(51, 51, 51);">使用教程：</font>
<font style="color:rgb(51, 51, 51);">首先需要准备一台vps云服务器，这里我推荐</font>**<font style="color:rgb(0, 0, 255);">伍六七云</font>**<font style="color:rgb(51, 51, 51);">：</font>[https://www.vps567.com/](https://www.4awl.net/go?_=5d0865b42faHR0cHM6Ly93d3cudnBzNTY3LmNvbS9hZmYvQkhZRUpKTVA%3D)<font style="color:rgb(51, 51, 51);"> </font>**<font style="color:rgb(255, 0, 0);">香港2H2G 5M服务器只需要20元</font>**

<font style="color:rgb(51, 51, 51);">我们需要先部署到 docker 环境：</font>[Docker 一键安装脚本](https://www.4awl.net/270.html)<font style="color:rgb(51, 51, 51);">  再执行下面的安装命令。</font>

<font style="color:rgb(51, 51, 51);"></font>

## <font style="color:rgb(51, 51, 51);">Docker 安装：</font>
```shell
wget -qO- get.docker.com | bash
systemctl start docker
systemctl enable docker
```



<font style="color:rgb(51, 51, 51);">Docker Compose 是 Docker 编排服务的一部分，Compose 可以让用户在集群中部署分布式应用。 Docker Compose 是一个属于 “应用层” 的服务，用户可以定义哪个容器组运行哪个应用，它支持动态改变应用，并在需要时扩展。</font>

<font style="color:rgb(51, 51, 51);"></font>

## <font style="color:rgb(51, 51, 51);">Docker-Compose 安装：</font>
```shell
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

<font style="color:rgb(51, 51, 51);"></font>

<font style="color:rgb(51, 51, 51);">直接使用docker运行：</font>

```shell
docker run -it --rm --name windows -p 8006:8006 --device=/dev/kvm --cap-add NET_ADMIN --stop-timeout 120 dockurr/windows
```



<font style="color:rgb(51, 51, 51);">使用docker-compose：</font>

```shell
version: "3"
services:
  windows:
    image: dockurr/windows
    container_name: windows
    devices:
      - /dev/kvm
    cap_add:
      - NET_ADMIN
    ports:
      - 8006:8006
      - 3389:3389/tcp
      - 3389:3389/udp
    stop_grace_period: 2m
    restart: on-failure
```

<font style="color:rgb(51, 51, 51);">拉取镜像完成后，打开IP+8006端口即可访问vnc查看服务器当前的状态，坐下来放松，等待奇迹发生，整个安装过程将全自动进行。</font>

<font style="color:rgb(51, 51, 51);">系统安装完成后，使用远程桌面客户端链接服务器IP+3389端口，账号docker密码为空 就能链接我们的Windows虚拟机。</font>



## <font style="color:rgb(51, 51, 51);">自定义一些参数：</font>
<font style="color:rgb(51, 51, 51);">本文只记录一下主要用到的参数，完整详细的可以去GitHub查看：</font>[https://github.com/dockur/windows/blob/master/readme.md](https://www.4awl.net/go?_=e0340cc443aHR0cHM6Ly9naXRodWIuY29tL2RvY2t1ci93aW5kb3dzL2Jsb2IvbWFzdGVyL3JlYWRtZS5tZA%3D%3D)



### <font style="color:rgb(51, 51, 51);">我写的docker-compose.yml文件</font>
```shell
version: "3"
services:
  windows:
    image: dockurr/windows
    container_name: windows
    devices:
      - /dev/kvm
    cap_add:
      - NET_ADMIN
    ports:
      - 8006:8006
      - 3389:3389/tcp
      - 3389:3389/udp
    stop_grace_period: 2m
    restart: on-failure
    environment:
      VERSION: "win10" # 系统标识
      RAM_SIZE: "8G" # 分配的内存
      CPU_CORES: "4" # 分配的核心
      DISK_SIZE: "50G" # 分配储存空间
```

<font style="color:rgb(51, 51, 51);">大家可以不用往下看，直接使用我的。</font>

### <font style="color:rgb(51, 51, 51);">如何选择 Windows 版本？</font>
<font style="color:rgb(51, 51, 51);">默认情况下，将安装 Windows 11。但是您可以将</font>VERSION<font style="color:rgb(51, 51, 51);">环境变量添加到您的撰写文件中，以便指定要下载的替代 Windows 版本：</font>

<font style="color:rgb(51, 51, 51);"></font>

```shell
environment:
  VERSION: "win11"
```

<font style="color:rgb(51, 51, 51);">从以下值中选择：</font>

| **价值** | **描述** | **来源** | **转移** | **尺寸** |
| --- | --- | --- | --- | --- |
| win11 | Windows 11 专业版 | 微软 | 快速地 | 6.4GB |
| win10 | Windows 10 专业版 | 微软 | 快速地 | 5.8GB |
| ltsc10 | Windows 10 长期支持中心 | 微软 | 快速地 | 4.6GB |
| win81 | Windows 8.1 专业版 | 微软 | 快速地 | 4.2GB |
| win7 | Windows 7 SP1 | 鲍勃·小马 | 中等的 | 3.0GB |
| vista | Windows Vista SP2 | 鲍勃·小马 | 中等的 | 3.6GB |
| winxp | Windows XP SP3 | 鲍勃·小马 | 中等的 | 0.6GB |
| | | | | |
| 2022 | Windows Server 2022 | 微软 | 快速地 | 4.7GB |
| 2019 | Windows 服务器 2019 | 微软 | 快速地 | 5.3GB |
| 2016 | Windows 服务器 2016 | 微软 | 快速地 | 6.5GB |
| 2012 | Windows Server 2012 R2 | 微软 | 快速地 | 4.3GB |
| 2008 | Windows Server 2008 R2 | 微软 | 快速地 | 3.0GB |
| | | | | |
| core11 | 微型 11 核 | 档案网 | 慢的 | 2.1GB |
| tiny11 | 小11 | 档案网 | 慢的 | 3.8GB |
| tiny10 | 小10 | 档案网 | 慢的 | 3.6GB |


<font style="color:rgb(51, 51, 51);">要安装 ARM64 版本的 Windows，请使用</font>[dokur/windows-arm](https://www.4awl.net/go?_=9b30760baaaHR0cHM6Ly9naXRodWIuY29tL2RvY2t1ci93aW5kb3dzLWFybS8%3D)<font style="color:rgb(51, 51, 51);">。</font>

### <font style="color:rgb(51, 51, 51);">如何增加 CPU 或 RAM 的数量？</font>
<font style="color:rgb(51, 51, 51);">默认情况下，为容器分配 2 个 CPU 核心和 4 GB RAM，因为这是 Windows 11 的最低要求。</font>

<font style="color:rgb(51, 51, 51);">要增加此值，请添加以下环境变量：</font>

<font style="color:rgb(51, 51, 51);"></font>

```shell
environment:
  RAM_SIZE: "8G"
  CPU_CORES: "4"
```

### <font style="color:rgb(51, 51, 51);">如何更改磁盘大小？</font>
<font style="color:rgb(51, 51, 51);">要扩展 64 GB 的默认大小，请将设置添加</font>DISK_SIZE<font style="color:rgb(51, 51, 51);">到您的撰写文件并将其设置为您的首选容量：</font>

```shell
environment:
  DISK_SIZE: "256G"
```

<font style="color:rgb(51, 51, 51);">这也可用于将现有磁盘调整为更大的容量，而不会丢失任何数据。</font>

### <font style="color:rgb(51, 51, 51);">如何更改存储位置？</font>
<font style="color:rgb(51, 51, 51);">要更改存储位置，请在您的撰写文件中包含以下绑定安装：</font>

```shell
volumes:
  - /var/win:/storage
```

<font style="color:rgb(51, 51, 51);">将示例路径替换</font>/var/win<font style="color:rgb(51, 51, 51);">为所需的存储文件夹。</font>



> 更新: 2024-05-11 10:29:48  
> 原文: <https://www.yuque.com/lixinsi/gbsggt/bhpkgogq233pthin>