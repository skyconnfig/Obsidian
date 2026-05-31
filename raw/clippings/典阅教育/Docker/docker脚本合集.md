# docker脚本合集

### 1.安装docker脚本
```bash
#!/bin/bash

# 停止正在运行的firewalld服务，以避免安装过程中的网络问题
systemctl stop firewalld

# 卸载旧版本的docker（如果安装过）
#yum remove docker \
#    docker-client \
#    docker-client-latest \
#    docker-common \
#    docker-latest \
#    docker-latest-logrotate \
#    docker-logrotate \
#    docker-engine

# 安装必要的依赖包
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

#Docker 的官方仓库到你的 yum 源列表
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 安装 Docker CE
sudo yum install docker-ce docker-ce-cli containerd.io

# 启动 Docker 服务
sudo systemctl start docker

# 设置 Docker 服务开机自启
sudo systemctl enable docker

# 验证 Docker 安装
docker info
```



> 更新: 2024-04-08 09:17:04  
> 原文: <https://www.yuque.com/lixinsi/gbsggt/lt5sg2nfxo86vbgg>