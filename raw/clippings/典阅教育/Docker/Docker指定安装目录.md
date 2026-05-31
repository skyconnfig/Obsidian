# Docker指定安装目录

### 1.删除所有 docker 镜像
```sql
docker rmi $(docker images -q) -f
```

### 2.想自己指定安装目录，可以使用命令行的方式
```python
start /w "" "Docker Desktop Installer.exe" install --installation-dir=D:\Docker
```

![1745822619345-20b5b3f4-ffbf-418e-b319-0b2cf3e3235e.png](./img/P8bNbF5Uk1XrMPDE/1745822619345-20b5b3f4-ffbf-418e-b319-0b2cf3e3235e-550871.png)

### 3 .配置镜像源加速
![1745822731432-ea2eacb6-3d84-4fa6-9f81-ce4c98abf56d.png](./img/P8bNbF5Uk1XrMPDE/1745822731432-ea2eacb6-3d84-4fa6-9f81-ce4c98abf56d-461677.png)

```dockerfile
  {
    “registry=mirrors”:[
    "https://docker.m.daocloud.io"
    "https://docker.1panel.live"
    ]
  }
```

![1745822853857-128e4f6f-3104-47b6-9cbc-dc5c3ed3e58b.png](./img/P8bNbF5Uk1XrMPDE/1745822853857-128e4f6f-3104-47b6-9cbc-dc5c3ed3e58b-853466.png)

![1745822876810-17201bc1-31d2-4bfe-b8ee-ae7b934e1d14.png](./img/P8bNbF5Uk1XrMPDE/1745822876810-17201bc1-31d2-4bfe-b8ee-ae7b934e1d14-421298.png)



> 更新: 2025-04-28 14:47:59  
> 原文: <https://www.yuque.com/lixinsi/gbsggt/iymky96llcrlyfg3>