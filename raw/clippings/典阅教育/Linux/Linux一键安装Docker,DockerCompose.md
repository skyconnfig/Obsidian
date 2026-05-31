# Linux一键安装Docker,DockerCompose

## <font style="color:#000000;background-color:#FFFFFF;">可在此命令后附带--mirror参数设置镜像源，以提高国内服务器下载docker的速度</font>
<font style="color:#000000;background-color:#FFFFFF;">如使用阿里云镜像:</font>

## Docker安装脚本使用教程
```powershell
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```

#### 一键脚本
连上VPS后，直接运行脚本即可安装Docker：

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

+ <font style="color:#000000;">有些系统可能没有sudo命令(如果你当前登陆的用户是 </font><font style="color:#000000;">root</font><font style="color:#000000;">可以把命令前面的 </font><font style="color:#000000;">sudo</font><font style="color:#000000;">去掉)</font>
+ <font style="color:#000000;">此一键脚本由Docker官方发布并维护，支持CentOS、Ubuntu、Debian、Fedora等常见的Linux发行版本。</font>

#### <font style="color:#000000;">官方手动安装教程</font>
+ <font style="color:#000000;">CentOS：https://docs.docker.com/engine/install/centos/</font>
+ <font style="color:#000000;">Debian：https://docs.docker.com/engine/install/debian/</font>
+ <font style="color:#000000;">Fedora：https://docs.docker.com/engine/install/fedora/</font>
+ <font style="color:#000000;">Ubuntu：https://docs.docker.com/engine/install/ubuntu/</font>

## <font style="color:#000000;">Docker Compose安装教程</font>
<font style="color:#000000;">目前最新版docker自带compose了已经，安装完docker 可执行</font><font style="color:#000000;"> </font><font style="color:#000000;">docker compose version</font><font style="color:#000000;"> </font><font style="color:#000000;">验证</font>

#### <font style="color:#000000;">作为插件安装</font>
<font style="color:#000000;">Ubuntu and Debian</font>

```bash
sudo apt-get update
 sudo apt-get install docker-compose-plugin
```

<font style="color:#000000;">CentOS and Ubuntu</font>

```bash
sudo yum update
 sudo yum install docker-compose-plugin
```

<font style="color:#000000;">安装成功验证</font>

```bash
docker compose version
```

[<font style="color:#000000;">官方文档链接</font>](https://docs.docker.com/compose/install/linux/)

#### <font style="color:#000000;">独立安装</font>
[<font style="color:#000000;">官方文档链接</font>](https://docs.docker.com/compose/install/standalone/)

+ <font style="color:#000000;">作为插件安装的</font><font style="color:#000000;"> </font><font style="color:#000000;">docker compose</font><font style="color:#000000;">命令中间不带</font><font style="color:#000000;"> </font><font style="color:#000000;">-</font>
+ <font style="color:#000000;">独立安装的</font><font style="color:#000000;"> </font><font style="color:#000000;">docker-compose</font><font style="color:#000000;"> </font><font style="color:#000000;">命令是带</font><font style="color:#000000;"> </font><font style="color:#000000;">-</font><font style="color:#000000;">的</font>

## <font style="color:#000000;">国内机安装</font>
```shell
bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh
```

[SuperManito/LinuxMirrors](https://gitee.com/SuperManito/LinuxMirrors.git)

<font style="color:#000000;">GNU/Linux 一键更换系统软件源脚本</font>

<font style="color:rgb(137, 224, 81);">Shell</font>

<font style="color:rgb(255, 255, 255);background-color:rgb(52, 120, 205);">Linux</font><font style="color:rgb(255, 255, 255);background-color:rgb(52, 120, 205);">mirrors</font>

<font style="color:rgb(129, 129, 129);"></font><font style="color:rgb(153, 153, 153);">278</font><font style="color:rgb(129, 129, 129);"></font><font style="color:rgb(153, 153, 153);">72</font><font style="color:rgb(129, 129, 129);"></font><font style="color:rgb(153, 153, 153);">1</font>



> 更新: 2024-07-01 18:11:56  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/gag6l8inly1w0nak>