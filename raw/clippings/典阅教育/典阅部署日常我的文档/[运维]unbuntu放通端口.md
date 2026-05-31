# [运维] unbuntu放通端口

[运维] unbuntu放通端口

### <font style="color:rgb(79, 79, 79);">系统环境说明</font>
  
系统版本：Ubuntu 20.04 LTS



### 端口放通说明
1. <font style="color:rgba(0, 0, 0, 0.75);">放通防火墙端口</font>

```bash
sudo ufw allow <端口号>/<协议>
```

<font style="color:rgb(77, 77, 77);">其中，<端口号>是您想要打开的端口号，<协议>是您要使用的</font>[网络协议](https://so.csdn.net/so/search?q=%E7%BD%91%E7%BB%9C%E5%8D%8F%E8%AE%AE&spm=1001.2101.3001.7020)<font style="color:rgb(77, 77, 77);">（通常是TCP或UDP）。</font>

<font style="color:rgb(77, 77, 77);">例如，要打开TCP端口80，您可以使用以下命令</font>

```bash
sudo ufw allow 80/tcp
```



2. <font style="color:rgba(0, 0, 0, 0.75);">批量放通连续端口脚本</font>

```bash
#!/bin/bash

# 起始端口和结束端口
START_PORT=8000
END_PORT=8010

# 协议
PROTOCOL="tcp"

# 循环打开所有端口
for port in $(seq $START_PORT $END_PORT); do
    sudo ufw allow $port/$PROTOCOL
done

```

3. <font style="color:rgba(0, 0, 0, 0.75);">批量放通指定端口脚本</font>

```bash
#!/bin/bash

# 端口列表
PORTS="80 443 22"

# 协议列表
PROTOCOLS="tcp udp"

# 循环打开所有端口
for port in $PORTS; do
    for protocol in $PROTOCOLS; do
        sudo ufw allow $port/$protocol
    done
done

```

4. <font style="color:rgba(0, 0, 0, 0.75);">确认已打开端口。可以执行以下命令来查看当前防火墙规则：</font>

```bash
sudo ufw status
```





> 更新: 2024-01-11 14:30:37  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/zgc5s2x5hspg2vqw>