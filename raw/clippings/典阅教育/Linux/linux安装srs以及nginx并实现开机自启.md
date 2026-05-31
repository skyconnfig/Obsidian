# linux安装srs以及nginx并实现开机自启

### 1.SRS
```powershell
#srs开机自启动

启动：systemctl start firewalld.service

防火墙随系统开启启动  ： systemctl enable firewalld.service

关闭防火墙:systemctl disable firewalld.service

```

**创建 Systemd 服务单元文件**：

创建一个以 **.service** 结尾的文件，比如 **srs.service**，并将其保存在 **/etc/systemd/system/** 目录下。

```bash
sudo nano /etc/systemd/system/srs.service
```



**编辑服务单元文件**<font style="color:rgb(13, 13, 13);">：</font>

<font style="color:rgb(13, 13, 13);">在编辑器中输入以下内容</font>

```bash
[Service]
Type=simple
# ExecStart为SRS可执行文件的路径和SRS配置文件的路径
# 请将/path/to/your/srs/executable替换为你的SRS可执行文件的实际路径
# 将/path/to/your/srs/config.conf替换为你的SRS配置文件的实际路径

ExecStart=/usr/local/src/srs/srs/trunk/etc/init.d/srs start -c /usr/local/src/srs/srs/trunk/conf/srs.conf
Restart=on-failure
# 请将srs_user替换为你希望SRS服务运行的用户
User=srs_user
# 请将srs_group替换为你希望SRS服务运行的用户组
Group=srs_group

[Install]
WantedBy=multi-user.target

```



1. <font style="color:rgb(13, 13, 13);">在该文件中，</font>**ExecStart**<font style="color:rgb(13, 13, 13);"> 指定了SRS可执行文件的路径以及配置文件的路径。</font>**User**<font style="color:rgb(13, 13, 13);"> 和 </font>**Group**<font style="color:rgb(13, 13, 13);"> 分别指定了SRS服务应该以哪个用户和用户组的身份运行。</font>
2. **重新加载 Systemd 并启用服务**<font style="color:rgb(13, 13, 13);">：保存并关闭文件后，重新加载 Systemd 并启用新创建的服务单元。</font>

```bash
sudo systemctl daemon-reload
sudo systemctl enable srs.service

```



**管理服务**<font style="color:rgb(13, 13, 13);">：</font>

+ <font style="color:rgb(13, 13, 13);">启动服务：</font>**sudo systemctl start srs.service**
+ <font style="color:rgb(13, 13, 13);">停止服务：</font>**sudo systemctl stop srs.service**
+ <font style="color:rgb(13, 13, 13);">重启服务：</font>**sudo systemctl restart srs.service**
+ <font style="color:rgb(13, 13, 13);">查看服务状态：</font>**sudo systemctl status srs.service**

### 2.nginx
**创建 Systemd 启动脚本**<font style="color:rgb(13, 13, 13);">：</font>

<font style="color:rgb(13, 13, 13);">创建一个名为 </font>**nginx.service**<font style="color:rgb(13, 13, 13);"> 的 Systemd 启动脚本，用于管理 Nginx 服务的启动和停止。</font>

```bash
sudo nano /etc/systemd/system/nginx.service
```

<font style="color:rgb(13, 13, 13);">在编辑器中，输入以下内容：</font>

```bash
[Unit]
Description=The NGINX HTTP and reverse proxy server
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/usr/local/nginx/logs/nginx.pid
ExecStartPre=/usr/local/nginx/sbin/nginx -t -c /usr/local/nginx/conf/nginx.conf
ExecStart=/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target

```

1. <font style="color:rgb(13, 13, 13);">注意：上述配置中的路径 </font>**/usr/local/nginx**<font style="color:rgb(13, 13, 13);"> 可能需要根据你的实际安装路径进行调整。</font>
2. **重新加载 Systemd 配置**<font style="color:rgb(13, 13, 13);">：重新加载 Systemd 配置文件，以使新的 </font>**nginx.service**<font style="color:rgb(13, 13, 13);"> 生效。</font>

```bash
sudo systemctl daemon-reload
```

**启用 Nginx 服务**<font style="color:rgb(13, 13, 13);">：</font>

<font style="color:rgb(13, 13, 13);">启用 Nginx 服务，以便它在系统启动时自动启动。</font>

```bash
sudo systemctl enable nginx
```

**验证配置**<font style="color:rgb(13, 13, 13);">：</font>

<font style="color:rgb(13, 13, 13);">确保 Nginx 服务已经设置为自动启动。</font>

```bash
sudo systemctl is-enabled nginx
```

1. <font style="color:rgb(13, 13, 13);">如果输出为 </font>**enabled**<font style="color:rgb(13, 13, 13);">，则表示已经成功设置为开机自启动。</font>

<font style="color:rgb(13, 13, 13);">现在，Nginx 应该在系统启动时自动启动。你可以使用 </font>**sudo systemctl start nginx**<font style="color:rgb(13, 13, 13);"> 来手动启动 Nginx 服务，使用 </font>**sudo systemctl status nginx**<font style="color:rgb(13, 13, 13);"> 来检查服务的状态。</font>



> 更新: 2024-02-28 09:50:08  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/umshka91bi7v8913>