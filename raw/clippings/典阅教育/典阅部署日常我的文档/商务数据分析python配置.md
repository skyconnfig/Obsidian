# 商务数据分析python配置

### 1.config.py 配置

```plsql
D:\dianyue\商务数据分析\python\configs\config.py
```

![1736040624173-ce150323-4bb7-49db-88a8-e9eeac15cce1.png](./img/0e-uOn4K48G3smKk/1736040624173-ce150323-4bb7-49db-88a8-e9eeac15cce1-470683.png)

![1736040645732-6f39e6e3-fcee-462c-bafb-8635722fd607.png](./img/0e-uOn4K48G3smKk/1736040645732-6f39e6e3-fcee-462c-bafb-8635722fd607-872756.png)

此处配置成 wwwroot 目录![1736040697127-8571b775-a506-408a-bec0-8eb23124f3f2.png](./img/0e-uOn4K48G3smKk/1736040697127-8571b775-a506-408a-bec0-8eb23124f3f2-542937.png)

运行切换到虚拟环境运行

```plsql
python -m flask run -h 0.0.0.0 -p 10005 --with-threads
```

![1736041035162-0806594c-628a-44c0-9b6e-70a4bcc97c5a.png](./img/0e-uOn4K48G3smKk/1736041035162-0806594c-628a-44c0-9b6e-70a4bcc97c5a-905126.png)

### 无法安装环境

### 1.更换镜像源来安装

```plsql
python -m pip install --upgrade pip
pip install -i https://mirrors.aliyun.com/pypi/simple/ -r requirement.txt
pip install -i https://pypi.douban.com/simple/ -r requirement.txt
```

### 2.增加超时时间安装

```plsql
pip install --default-timeout=1000 -r requirement.txt
```

### 3.离线安装

<font style="color:#000000;background-color:#FFFFFF;">如果你有另一台可以正常访问网络的机器，你可以在这台机器上使用 </font><code><font style="color:#000000;background-color:#FFFFFF;">pip download</font></code><font style="color:#000000;background-color:#FFFFFF;"> 命令下载所有依赖包，然后将这些包复制到目标机器上进行离线安装</font>

```plsql
pip download -r requirement.txt

pip install --no-index --find-links=path_to_downloaded_packages -r requirement.txt
```

### 商数 api 报错

![1736059921215-6a1eb52c-87e7-4d08-a365-de6ce99b4438.png](./img/0e-uOn4K48G3smKk/1736059921215-6a1eb52c-87e7-4d08-a365-de6ce99b4438-897652.png)

修改应用池

![1736059973112-7330a406-1f2a-4d1e-b0c0-9399ecaf0a63.png](./img/0e-uOn4K48G3smKk/1736059973112-7330a406-1f2a-4d1e-b0c0-9399ecaf0a63-985571.png)

### 分析结果没有出来问题

![1736210394725-5b2f90bf-b70c-41a3-91fd-0d286688c9fe.png](./img/0e-uOn4K48G3smKk/1736210394725-5b2f90bf-b70c-41a3-91fd-0d286688c9fe-992550.png)

### 检查 python 服务里面的 config.py 取数据

![1736210437734-e33be1d0-31e7-4a02-84a5-0fdca973215b.png](./img/0e-uOn4K48G3smKk/1736210437734-e33be1d0-31e7-4a02-84a5-0fdca973215b-540012.png)

![1736210464550-b34dfd49-e7ee-4552-94a0-09ba7a51653b.png](./img/0e-uOn4K48G3smKk/1736210464550-b34dfd49-e7ee-4552-94a0-09ba7a51653b-650928.png)


> 更新: 2025-01-07 08:41:07  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/yuxnw9rg7xaso7kn>