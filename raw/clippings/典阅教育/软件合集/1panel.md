# 1panel

### 官网网址：<https://1panel.cn/>

## <font style="color:rgb(31, 41, 55);background-color:rgb(249, 250, 251);">便捷的</font><font style="color:rgb(31, 41, 55);background-color:rgb(249, 250, 251);"> </font><font style="color:rgb(31, 41, 55);background-color:rgb(249, 250, 251);">安装方式</font>

<font style="color:rgb(75, 85, 99);background-color:rgb(249, 250, 251);">只需几个简单步骤，即可在您的Linux服务器上安装并运行1Panel</font>

**<font style="color:rgb(255, 255, 255);background-color:rgb(249, 250, 251);">1</font>**

### <font style="color:rgb(31, 41, 55);background-color:rgb(249, 250, 251);">准备Linux服务器</font>

<font style="color:rgb(75, 85, 99);background-color:rgb(249, 250, 251);">确保您有一台运行Linux系统的服务器，支持CentOS、Ubuntu、Debian等主流发行版，及麒麟、统信等国产操作系统。</font>

<font style="color:rgb(75, 85, 99);background-color:rgb(249, 250, 251);">支持各种服务器架构：x86\_64、aarch64、armv7l、ppc64le、s390x。</font>

**<font style="color:rgb(255, 255, 255);background-color:rgb(249, 250, 251);">2</font>**

### <font style="color:rgb(31, 41, 55);background-color:rgb(249, 250, 251);">运行安装脚本</font>

<font style="color:rgb(75, 85, 99);background-color:rgb(249, 250, 251);">以root用户身份运行一键安装脚本，自动完成1Panel的下载和安装。</font>

```python
bash -c "$(curl -sSL https://resource.fit2cloud.com/1panel/package/v2/quick_start.sh)"
```

<font style="color:rgb(75, 85, 99);background-color:rgb(249, 250, 251);">如果你需要在内网环境中离线安装和使用，请参考</font>[<font style="color:rgb(0, 94, 235);background-color:rgb(249, 250, 251);">1Panel 离线版文档</font>](https://1panel.cn/docs/v2/installation/package_installation/)<font style="color:rgb(75, 85, 99);background-color:rgb(249, 250, 251);">。</font>

**<font style="color:rgb(255, 255, 255);background-color:rgb(249, 250, 251);">3</font>**

### <font style="color:rgb(31, 41, 55);background-color:rgb(249, 250, 251);">访问管理面板</font>

<font style="color:rgb(75, 85, 99);background-color:rgb(249, 250, 251);">安装完成后，通过浏览器访问安装脚本提示的访问地址，开始使用1Panel。</font>

# <font style="color:rgba(0, 0, 0, 0.54);">1Panel 离线版</font>

## <font style="color:rgba(0, 0, 0, 0.87);">1. 特点</font>[<font style="color:rgba(0, 0, 0, 0.32);">⚓</font><font style="color:rgba(0, 0, 0, 0.32);">︎</font>](https://1panel.cn/docs/v2/installation/package_installation/#1)

**<font style="color:rgba(0, 0, 0, 0.87);background-color:rgba(68, 138, 255, 0.1);">完全独立运行</font>**

* <font style="color:rgba(0, 0, 0, 0.87);">离线版不连接互联网，不发送任何网络请求。</font>
* <font style="color:rgba(0, 0, 0, 0.87);">集成社区版的全部功能，可在无外网环境中独立运行。</font>
* <font style="color:rgba(0, 0, 0, 0.87);">尤其适用于企业内网、离线机房及涉密环境的部署场景。</font>

**<font style="color:rgba(0, 0, 0, 0.87);background-color:rgba(68, 138, 255, 0.1);">应用商店支持</font>**

* <font style="color:rgba(0, 0, 0, 0.87);">离线包中已预置常用应用的镜像，并会在安装完成后自动导入系统。</font>
  * **<font style="color:rgba(0, 0, 0, 0.87);">OpenResty 版本</font>**<font style="color:rgba(0, 0, 0, 0.87);">：</font><code><font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">1.27.1.2-2-3-focal</font></code>
  * **<font style="color:rgba(0, 0, 0, 0.87);">MySQL 版本</font>**<font style="color:rgba(0, 0, 0, 0.87);">：</font>
    * **<font style="color:rgba(0, 0, 0, 0.87);">x86\_64 包</font>**<font style="color:rgba(0, 0, 0, 0.87);">：</font><code><font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">8.4.6</font></code><font style="color:rgba(0, 0, 0, 0.87);">、</font><code><font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">8.0.43</font></code><font style="color:rgba(0, 0, 0, 0.87);">、</font><code><font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">5.7.44</font></code><font style="color:rgba(0, 0, 0, 0.87);">、</font><code><font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">5.6.51</font></code>
    * **<font style="color:rgba(0, 0, 0, 0.87);">arm64 包</font>**<font style="color:rgba(0, 0, 0, 0.87);">：</font><code><font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">8.4.6</font></code><font style="color:rgba(0, 0, 0, 0.87);">、</font><code><font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">8.0.43</font></code>
* <font style="color:rgba(0, 0, 0, 0.87);">除了内置镜像，用户还可以通过导入外部镜像的方式来安装其他应用。</font>
  * <font style="color:rgba(0, 0, 0, 0.87);">其他应用需要用户手动导入镜像后才能使用，导入教程参考</font><font style="color:rgba(0, 0, 0, 0.87);"> </font>[<font style="color:rgb(0, 94, 235);">导入应用镜像</font>](https://1panel.cn/docs/v2/installation/package_installation/#6)<font style="color:rgba(0, 0, 0, 0.87);">。</font>
* <font style="color:rgba(0, 0, 0, 0.87);">镜像一旦导入成功，即可在 1Panel 应用商店中显示并安装，灵活性高。</font>

**<font style="color:rgba(0, 0, 0, 0.87);background-color:rgba(68, 138, 255, 0.1);">支持主流信创</font>**

* <font style="color:rgba(0, 0, 0, 0.87);">支持主流信创环境（海光、鲲鹏，麒麟、欧拉），确保在多样化的国产软硬件体系下稳定运行。</font>

**<font style="color:rgba(0, 0, 0, 0.87);background-color:rgba(68, 138, 255, 0.1);">自动安装 Docker</font>**

* <font style="color:rgba(0, 0, 0, 0.87);">安装过程中若检测到系统未安装 Docker，脚本将自动完成 Docker 的安装。</font>

## <font style="color:rgba(0, 0, 0, 0.87);">2. 环境要求</font>[<font style="color:rgba(0, 0, 0, 0.32);">⚓</font><font style="color:rgba(0, 0, 0, 0.32);">︎</font>](https://1panel.cn/docs/v2/installation/package_installation/#2)

* **<font style="color:rgba(0, 0, 0, 0.87);">操作系统</font>**<font style="color:rgba(0, 0, 0, 0.87);">：支持主流 Linux 发行版本（基于 Debian / RedHat，包括国产操作系统）</font>
* **<font style="color:rgba(0, 0, 0, 0.87);">服务器架构</font>**<font style="color:rgba(0, 0, 0, 0.87);">：支持</font><font style="color:rgba(0, 0, 0, 0.87);"> </font><code><font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">x86_64</font></code><font style="color:rgba(0, 0, 0, 0.87);"> </font><font style="color:rgba(0, 0, 0, 0.87);">和</font><font style="color:rgba(0, 0, 0, 0.87);"> </font><code><font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">arm64</font></code>
* **<font style="color:rgba(0, 0, 0, 0.87);">内存要求</font>**<font style="color:rgba(0, 0, 0, 0.87);">：建议可用内存在</font><font style="color:rgba(0, 0, 0, 0.87);"> </font>**<font style="color:rgba(0, 0, 0, 0.87);">1GB 以上</font>**
* **<font style="color:rgba(0, 0, 0, 0.87);">浏览器要求</font>**<font style="color:rgba(0, 0, 0, 0.87);">：请使用</font><font style="color:rgba(0, 0, 0, 0.87);"> </font>**<font style="color:rgba(0, 0, 0, 0.87);">Chrome、Firefox</font>**<font style="color:rgba(0, 0, 0, 0.87);"> </font><font style="color:rgba(0, 0, 0, 0.87);">等现代浏览器</font>

## <font style="color:rgba(0, 0, 0, 0.87);">3. 下载离线包</font>[<font style="color:rgba(0, 0, 0, 0.32);">⚓</font><font style="color:rgba(0, 0, 0, 0.32);">︎</font>](https://1panel.cn/docs/v2/installation/package_installation/#3)

<font style="color:rgba(0, 0, 0, 0.87);">⚠️</font><font style="color:rgba(0, 0, 0, 0.87);"> </font>**<font style="color:rgba(0, 0, 0, 0.87);">重要提示：请勿从闲鱼等第三方平台购买或下载所谓的“1Panel 离线包”</font>**<font style="color:rgba(0, 0, 0, 0.87);">\ </font><font style="color:rgba(0, 0, 0, 0.87);">🚫</font><font style="color:rgba(0, 0, 0, 0.87);"> 这些来源均为</font><font style="color:rgba(0, 0, 0, 0.87);"> </font>**<font style="color:rgba(0, 0, 0, 0.87);">未经授权的盗版渠道</font>**<font style="color:rgba(0, 0, 0, 0.87);">，我们无法保证其安全性，极有可能被篡改、植入木马或病毒，存在服务器被入侵或数据泄露风险。</font>

<font style="color:rgba(0, 0, 0, 0.87);">✅</font><font style="color:rgba(0, 0, 0, 0.87);"> </font>**<font style="color:rgba(0, 0, 0, 0.87);">官方购买渠道（安全可信）</font>**

* **<font style="color:rgba(0, 0, 0, 0.87);">产品价格</font>**<font style="color:rgba(0, 0, 0, 0.87);">：离线版 ￥99 / 次下载，当前优惠价 ￥29 / 次下载</font>
* **<font style="color:rgba(0, 0, 0, 0.87);">购买链接</font>**<font style="color:rgba(0, 0, 0, 0.87);">：</font>[<font style="color:rgb(0, 94, 235);">https://jsj.top/f/sbCqY6</font>](https://jsj.top/f/sbCqY6)

<font style="color:rgba(0, 0, 0, 0.54);">付款成功后，我们将第一时间把 1Panel V2 离线包的专属下载链接发送至您填写的邮箱，请及时查收。如有问题，请联系邮箱：</font><code><font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">wanghe@fit2cloud.com</font></code>

<font style="color:rgba(0, 0, 0, 0.54);">1Panel 离线版暂不提供发票。</font>

## <font style="color:rgba(0, 0, 0, 0.87);">4. 安装部署</font>[<font style="color:rgba(0, 0, 0, 0.32);">⚓</font><font style="color:rgba(0, 0, 0, 0.32);">︎</font>](https://1panel.cn/docs/v2/installation/package_installation/#4)

### <font style="color:rgba(0, 0, 0, 0.87);">4.1 解压离线包</font>[<font style="color:rgba(0, 0, 0, 0.32);">⚓</font><font style="color:rgba(0, 0, 0, 0.32);">︎</font>](https://1panel.cn/docs/v2/installation/package_installation/#41)

<font style="color:rgba(0, 0, 0, 0.87);">请下载最新的 1Panel 离线包，上传至服务器 /tmp 目录，并以 root 用户执行以下命令安装：</font>

```plain
cd /tmp
# 解压离线包（请将示例文件名替换为实际名称）
tar zxvf 1panel-v2.0.11-offline-linux-amd64.tar.gz
```

### <font style="color:rgba(0, 0, 0, 0.87);">4.2 执行安装脚本</font>[<font style="color:rgba(0, 0, 0, 0.32);">⚓</font><font style="color:rgba(0, 0, 0, 0.32);">︎</font>](https://1panel.cn/docs/v2/installation/package_installation/#42)

```plain
# 进入解压目录（请根据实际目录名替换）
cd 1panel-v2.0.11-offline-linux-amd64

# 执行安装脚本
/bin/bash install.sh
```

## <font style="color:rgba(0, 0, 0, 0.87);">5. 登录访问</font>[<font style="color:rgba(0, 0, 0, 0.32);">⚓</font><font style="color:rgba(0, 0, 0, 0.32);">︎</font>](https://1panel.cn/docs/v2/installation/package_installation/#5)

<font style="color:rgba(0, 0, 0, 0.87);">安装成功后，控制台将显示面板访问信息。可通过浏览器访问：</font>

```plain
http://目标服务器IP地址:目标端口/安全入口
```

* **<font style="color:rgba(0, 0, 0, 0.87);">如使用云服务器，请确保安全组已开放目标端口</font>**
* **<font style="color:rgba(0, 0, 0, 0.87);">执行</font>\*\*\*\*<font style="color:rgba(0, 0, 0, 0.87);"> </font>**<code>**<font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">1pctl user-info</font>**</code>**<font style="color:rgba(0, 0, 0, 0.87);"> </font>\*\*\*\*<font style="color:rgba(0, 0, 0, 0.87);">命令可查看安全入口（entrance）</font>**

<font style="color:rgba(0, 0, 0, 0.87);">安装完成后，可使用</font><font style="color:rgba(0, 0, 0, 0.87);"> </font>[<font style="color:rgb(0, 94, 235);">1pctl 命令行工具</font>](https://1panel.cn/docs/v2/installation/cli/)<font style="color:rgba(0, 0, 0, 0.87);"> </font><font style="color:rgba(0, 0, 0, 0.87);">进行日常维护。</font>

## <font style="color:rgba(0, 0, 0, 0.87);">6. 导入应用镜像</font>[<font style="color:rgba(0, 0, 0, 0.32);">⚓</font><font style="color:rgba(0, 0, 0, 0.32);">︎</font>](https://1panel.cn/docs/v2/installation/package_installation/#6)

<font style="color:rgba(0, 0, 0, 0.87);">如需使用其他应用（如 WordPress），可手动导入镜像，具体步骤如下：</font>

1. **<font style="color:rgba(0, 0, 0, 0.87);">在可联网机器上拉取并导出镜像</font>**<font style="color:rgba(0, 0, 0, 0.87);">：</font>

```plain
docker pull wordpress:6.8.2
docker save -o /tmp/wordpress_6.8.2.tar wordpress:6.8.2
```

2. **<font style="color:rgba(0, 0, 0, 0.87);">上传镜像文件</font>**<font style="color:rgba(0, 0, 0, 0.87);">：将</font><font style="color:rgba(0, 0, 0, 0.87);"> </font><code><font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">wordpress_6.8.2.tar</font></code><font style="color:rgba(0, 0, 0, 0.87);"> </font><font style="color:rgba(0, 0, 0, 0.87);">上传至 1Panel 服务器的</font><font style="color:rgba(0, 0, 0, 0.87);"> </font><code><font style="color:rgb(54, 70, 78);background-color:rgb(245, 245, 245);">/tmp</font></code><font style="color:rgba(0, 0, 0, 0.87);"> </font><font style="color:rgba(0, 0, 0, 0.87);">目录</font>

```plain
scp /tmp/wordpress_6.8.2.tar root@<1Panel 离线服务器 IP>:/tmp/
```

3. **<font style="color:rgba(0, 0, 0, 0.87);">导入镜像</font>**<font style="color:rgba(0, 0, 0, 0.87);">：在 1Panel 服务器上执行：</font>

```plain
docker load -i /tmp/wordpress_6.8.2.tar
```

<font style="color:rgba(0, 0, 0, 0.87);">完成上述步骤后，即可在应用商店安装 WordPress 应用。</font>

### <font style="color:rgba(0, 0, 0, 0.87);">github 地址</font>

<https://github.com/1Panel-dev/1Panel>


> 更新: 2025-10-02 08:55:04  
> 原文: <https://www.yuque.com/lixinsi/akt91g/yfdrurwtw0q8smk6>