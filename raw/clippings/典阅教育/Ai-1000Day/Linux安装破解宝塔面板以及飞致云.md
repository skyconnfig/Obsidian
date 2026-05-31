# Linux安装破解宝塔面板以及飞致云

宝塔破解免注册最新版下载地址和安装地址，安装后无需要注册直接使用，核心去除注册补丁，升级成专业版！

centos系统安装命令：

```plain
yum install -y wget && wget -O install.sh http://bt-cloud.us/install/install_6.0.sh && sh install.sh
```



Ubuntu/Debian系统安装命令：

```plain
wget -O install.sh http://bt-cloud.us/install/install_6.0.sh && bash install.sh
```



windows操作系统安装如下：

支持windows2008-2022操作系统。下载后按说明安装即可

```plain
http://bt-cloud.us/win/panel/BtSoft.zip
```

备注:破解windows 版本的问题，安装原版宝塔后，使用注册的用户名和密码登录，登录成功后关闭停止宝塔服务 。然后执行里面的一键脚本破解。去除宝塔云端链接和功能破解，完成后重启宝塔，即可成永久性专业版本了

```plain
外网面板地址: http://47.115.147.124:40803/0524dfb0
 内网面板地址: http://172.27.255.104:40803/0524dfb0
 username: esfafoom
 password: a05ae742

```

# 在线安装
## 1 环境要求[⚓︎](https://1panel.cn/docs/v2/installation/online_installation/#1)
**安装前请确保您的系统符合安装条件：**

+ 操作系统：支持主流 Linux 发行版本（基于 Debian / RedHat，包括国产操作系统）；
+ 服务器架构：x86_64、aarch64、armv7l、ppc64le、s390x；
+ 内存要求：建议可用内存在 1GB 以上；
+ 浏览器要求：请使用 Chrome、FireFox、IE10+、Edge等现代浏览器；
+ **可访问互联网**。

服务器优惠

如果你还没有服务器，欢迎通过以下优惠链接选购。

+ 阿里云：[专属阿里云特价链接 5.5 折优惠](https://market.aliyun.com/common/dashi/1panel?userCode=kmemb8jp)；
+ 腾讯云：[【腾讯云】2核2G3M云服务器7.92元/月起，2000元代金券免费领](https://curl.qcloud.com/dK2muFbM)，更多云产品优惠请点击[此链接](https://curl.qcloud.com/9Ogon25Y)；

## 2 安装部署[⚓︎](https://1panel.cn/docs/v2/installation/online_installation/#2)
GitHub release 链接: [https://github.com/1Panel-dev/1Panel/releases](https://github.com/1Panel-dev/1Panel/releases)

执行以下安装脚本，根据命令行提示完成安装。

```plain
bash -c "$(curl -sSL https://resource.fit2cloud.com/1panel/package/v2/quick_start.sh)"
```

如果遇到 Docker 安装失败等问题，可以尝试运行以下脚本：

```plain
bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
```

了解更多信息，请访问官方网站：[https://linuxmirrors.cn](https://linuxmirrors.cn)

安装成功后，控制台会打印面板访问信息，可通过浏览器访问 1Panel：

```plain
http://目标服务器 IP 地址:目标端口/安全入口
```

+ **如果使用的是云服务器，请至安全组开放目标端口。**
+ **ssh 登录 1Panel 服务器后，执行 1pctl user-info 命令可获取安全入口（entrance）**

安装成功后，可使用 [1pctl](https://1panel.cn/docs/v2/installation/cli/) 命令行工具来维护 1Panel

```plain
外部地址:  http://47.115.147.124:21098/04aa35fb27 
[1Panel Log]: 内部地址:  http://172.27.255.104:21098/04aa35fb27 
[1Panel Log]: 面板用户:  lixinsi 
[1Panel Log]: 面板密码:  Aa@#4520 

```



> 更新: 2025-07-20 09:39:15  
> 原文: <https://www.yuque.com/lixinsi/hw0k6o/lruzonln9wz9cec5>