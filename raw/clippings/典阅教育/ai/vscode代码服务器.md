# vscode代码服务器

[https://github.com/coder/code-server/](https://github.com/coder/code-server/)



```python
# 停止容器
docker stop code-server

# 启动容器
docker start code-server

# 重启容器
docker restart code-server

# 删除容器
docker rm -f code-server

# 查看容器日志
docker logs code-server

# 查看容器状态
docker ps
```

```python
docker logs code-server

#查看现有容器
docker ps -a

# 停止并删除旧的容器
docker rm -f code-server

# 然后重新运行新容器
docker run -d --name code-server -p 8080:8080 codercom/code-server:latest

# 进入容器
docker exec -it code-server /bin/bash

# 查看配置文件
cat ~/.config/code-server/config.yaml

# 重启容器
docker restart code-server

# 重启容器
docker restart code-server
```



> 更新: 2025-04-21 08:52:48  
> 原文: <https://www.yuque.com/lixinsi/vnere7/li0y54dzdolc9grt>