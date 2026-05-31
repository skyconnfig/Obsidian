# 零基础新手节点搭建教程、S‐UI面板自建上网节点、包含多协议应有尽有、一次学会

# <font style="color:rgb(31, 35, 40);">前言</font>
<font style="color:rgb(31, 35, 40);">零基础部署V2Ray（Vmess+Vless）、Xray、SS、Trojan、reality、Hysteria(1+2)、Naive、TUIC、XTLS等协议的节点，并且有后台面板方便查看和设置节点信息，对小白非常友好，请结合以下步骤进行操作。</font>

YouTube 参考连接：[https://www.youtube.com/watch?v=6l01iAgKglY&t=908s](https://www.youtube.com/watch?v=6l01iAgKglY&t=908s)

# <font style="color:rgb(31, 35, 40);">VPS服务器购买</font>
<font style="color:rgb(31, 35, 40);">自建节点的前提是需要有一台VPS服务器，推荐使用</font>[<font style="color:rgb(9, 105, 218);">搬瓦工（Bandwagon Host）</font>](https://bwh88.net/aff.php?aff=71506)<font style="color:rgb(31, 35, 40);">，非常稳定，不满意支持退款，不用担心跑路。</font>

| **<font style="color:rgb(31, 35, 40);">线路名称</font>** | **<font style="color:rgb(31, 35, 40);">处理器</font>** | **<font style="color:rgb(31, 35, 40);">内存大小</font>** | **<font style="color:rgb(31, 35, 40);">硬盘容量</font>** | **<font style="color:rgb(31, 35, 40);">带宽</font>** | **<font style="color:rgb(31, 35, 40);">流量</font>** | **<font style="color:rgb(31, 35, 40);">价格</font>** | **<font style="color:rgb(31, 35, 40);">链接</font>** |
| --- | --- | --- | --- | --- | --- | --- | --- |
| <font style="color:rgb(31, 35, 40);">性价比</font> | <font style="color:rgb(31, 35, 40);">2 核</font> | <font style="color:rgb(31, 35, 40);">1024 MB</font> | <font style="color:rgb(31, 35, 40);">20 GB</font> | <font style="color:rgb(31, 35, 40);">1 G</font> | <font style="color:rgb(31, 35, 40);">1 TB / 月</font> | **<font style="color:rgb(31, 35, 40);">$49.99 / 年</font>** | [<font style="color:rgb(9, 105, 218);">购买</font>](https://bwh88.net/aff.php?aff=71506&pid=44) |
| <font style="color:rgb(31, 35, 40);">CN2 GIA高端</font> | <font style="color:rgb(31, 35, 40);">2 核</font> | <font style="color:rgb(31, 35, 40);">1 GB</font> | <font style="color:rgb(31, 35, 40);">20 GB</font> | **<font style="color:rgb(31, 35, 40);">2.5 G</font>** | <font style="color:rgb(31, 35, 40);">1000GB / 月</font> | **<font style="color:rgb(31, 35, 40);">$49.99 / 季 or $169.99 / 年</font>** | [<font style="color:rgb(9, 105, 218);">购买</font>](https://bwh88.net/aff.php?aff=71506&pid=87) |
| <font style="color:rgb(31, 35, 40);">香港</font> | <font style="color:rgb(31, 35, 40);">2 核</font> | <font style="color:rgb(31, 35, 40);">2048 MB</font> | <font style="color:rgb(31, 35, 40);">40 GB</font> | <font style="color:rgb(31, 35, 40);">1 G</font> | <font style="color:rgb(31, 35, 40);">500GB / 月</font> | **<font style="color:rgb(31, 35, 40);">$89.99 / 月</font>** | [<font style="color:rgb(9, 105, 218);">购买</font>](https://bwh88.net/aff.php?aff=71506&pid=95) |


<font style="color:rgb(31, 35, 40);">对于绝大多数用户来说，CN2线路已经满足；非常追求超极致速度、且有多人合租、钱包厚的朋友优先选择CN2 GIA或香港线路</font>  
<font style="color:rgb(31, 35, 40);">如果跳转到购买链接提示：Out of Stock说明没库存了，香港机一般很紧俏</font>  
<font style="color:rgb(31, 35, 40);">搬瓦工优惠码：**BWHCGLUKKB**</font>

<font style="color:rgb(31, 35, 40);">如果真的不想自建，想用机场，那么我推荐你使用搬瓦工官方JMS机场，非常稳定、不跑路！  
</font>[<font style="color:rgb(9, 105, 218);">搬瓦工JMS机场使用图文指引！点我~</font>](https://github.com/bigtouchai/chaiwiki/wiki/%E6%9C%80%E7%A8%B3%E6%9C%BA%E5%9C%BA%EF%BC%9A%E6%90%AC%E7%93%A6%E5%B7%A5Just-My-Socks-%E6%9C%BA%E5%9C%BA%E5%A6%82%E4%BD%95%E8%B4%AD%E4%B9%B0%E4%BD%BF%E7%94%A8%E3%80%81%E5%A6%82%E4%BD%95%E9%85%8D%E7%BD%AE%E5%AE%A2%E6%88%B7%E7%AB%AF)

# <font style="color:rgb(31, 35, 40);">SSH连接工具</font>
<font style="color:rgb(31, 35, 40);">任选其中一个即可  
</font><font style="color:rgb(31, 35, 40);">FinalShell(推荐):</font>[<font style="color:rgb(9, 105, 218);">FinalShell下载</font>](http://www.hostbuf.com/t/988.html)<font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">MobaXterm:</font>[<font style="color:rgb(9, 105, 218);">MobaXterm官网</font>](https://mobaxterm.mobatek.net/)

# <font style="color:rgb(31, 35, 40);">S-UI面板+节点部署</font>
### <font style="color:rgb(31, 35, 40);">1、必要更新操作(Debian/Ubuntu)</font>
```plain
apt update -y && apt install -y curl socat wget
```

<font style="color:rgb(31, 35, 40);">**注意：**如果是centos系统，则运行yum update -y && yum install -y curl socat wget</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">**注意：**如果是centos系统，则运行yum update -y && yum install -y curl socat wget</font>

### <font style="color:rgb(31, 35, 40);">2、安装S-UI</font>
<font style="color:rgb(31, 35, 40);">感谢alireza0大佬开发如此好用的安装脚本</font>

```plain
VERSION=1.3.6 && bash <(curl -Ls https://raw.githubusercontent.com/alireza0/s-ui/$VERSION/install.sh) $VERSION
```



![1767164739632-244fe6de-4435-4d45-bcfa-573c38550ae0.png](./img/Hd4abwoKL0TrfTOf/1767164739632-244fe6de-4435-4d45-bcfa-573c38550ae0-691579.png)



### 节点搭建协议配置
![1767165726647-84d66ef4-72c7-4f36-9a17-884e85242197.png](./img/Hd4abwoKL0TrfTOf/1767165726647-84d66ef4-72c7-4f36-9a17-884e85242197-978341.png)

![1767165743943-f5e2d58d-778c-46a3-b7f4-db7b1f3d7872.png](./img/Hd4abwoKL0TrfTOf/1767165743943-f5e2d58d-778c-46a3-b7f4-db7b1f3d7872-761871.png)

![1767165786006-951d0053-dd06-4be1-a81c-c63940da3d92.png](./img/Hd4abwoKL0TrfTOf/1767165786006-951d0053-dd06-4be1-a81c-c63940da3d92-301944.png)

![1767165802719-48b9d0ec-5dcd-45c6-be72-7c462a5c7807.png](./img/Hd4abwoKL0TrfTOf/1767165802719-48b9d0ec-5dcd-45c6-be72-7c462a5c7807-872516.png)

![1767165830933-2cc45358-2950-4813-bb7a-bb1ea2e2b054.png](./img/Hd4abwoKL0TrfTOf/1767165830933-2cc45358-2950-4813-bb7a-bb1ea2e2b054-474453.png)

### 挑选 sni 伪装域名
![1767165896230-b7f96b52-a75e-4f31-8cad-4fbf94ff4aa9.png](./img/Hd4abwoKL0TrfTOf/1767165896230-b7f96b52-a75e-4f31-8cad-4fbf94ff4aa9-239910.png)

![1767165911845-643c3fdf-5768-472a-ad5d-242fd138c0db.png](./img/Hd4abwoKL0TrfTOf/1767165911845-643c3fdf-5768-472a-ad5d-242fd138c0db-434972.png)



![1767165956976-47ae1c47-f3ad-47c2-b8c3-f9b57dabcc6e.png](./img/Hd4abwoKL0TrfTOf/1767165956976-47ae1c47-f3ad-47c2-b8c3-f9b57dabcc6e-516316.png)

![1767165979954-dfe71074-2bec-48a8-a37f-8980065d80e0.png](./img/Hd4abwoKL0TrfTOf/1767165979954-dfe71074-2bec-48a8-a37f-8980065d80e0-314672.png)

### 入站管理
#### 协议 1veless 协议
![1767166024785-2bdc41af-02af-4c8a-b22d-5434135173db.png](./img/Hd4abwoKL0TrfTOf/1767166024785-2bdc41af-02af-4c8a-b22d-5434135173db-991581.png)

#### 协议 2heysteria2 协议
![1767166074534-070e8775-3ba1-4124-bba4-aec7ecd02be5.png](./img/Hd4abwoKL0TrfTOf/1767166074534-070e8775-3ba1-4124-bba4-aec7ecd02be5-280814.png)

![1767166200997-f4f0e06a-8a4a-4f1f-8259-a9c4167013a8.png](./img/Hd4abwoKL0TrfTOf/1767166200997-f4f0e06a-8a4a-4f1f-8259-a9c4167013a8-483136.png)

#### 协议三 trojan 协议
![1767166495772-9cfae2a8-3ec7-4987-a67c-9307e6be38fe.png](./img/Hd4abwoKL0TrfTOf/1767166495772-9cfae2a8-3ec7-4987-a67c-9307e6be38fe-265810.png)



![1767166231662-e6762de1-edfb-4b09-aa71-105efbd6f8b6.png](./img/Hd4abwoKL0TrfTOf/1767166231662-e6762de1-edfb-4b09-aa71-105efbd6f8b6-561987.png)

#### 协议四 tuic 协议
![1767166283808-dfa1598c-2c14-40c8-8a8f-4e883ccfc705.png](./img/Hd4abwoKL0TrfTOf/1767166283808-dfa1598c-2c14-40c8-8a8f-4e883ccfc705-589551.png)

### <font style="color:rgb(31, 35, 40);">3、挑选SNI伪装域名（任选一个）</font>
```plain
如发现节点不能使用，或延迟显示-1，以下域名请随机挑选用于SNI，直到正常使用即可，或者直接照抄视频中一模一样的域名填写，确保可用
aws.com
bing.com
snap.licdn.com
devblogs.microsoft.com
cdn.bizibly.com
www.apple.com
ts1.tc.mm.bing.net
fpinit.itunes.apple.com
go.microsoft.com
catalog.gamepass.com
gray-config-prod.api.arc-cdn.net
apps.mzstatic.com
tag.demandbase.com
r.bing.com
tag-logger.demandbase.com
cdn-dynmedia-1.microsoft.com
services.digitaleast.mobi
gray.video-player.arcpublishing.com
azure.microsoft.com
beacon.gtv-pub.com
amd.com
```

# <font style="color:rgb(31, 35, 40);">面板管理、BBR加速</font>
<font style="color:rgb(31, 35, 40);">安装完成后，输入 s-ui 就能看到管理面板，如下图片所示，可以重新查看面板信息  
</font>![1767164644753-233a4d4f-648c-4451-a8a1-23bf5dea154b.png](./img/Hd4abwoKL0TrfTOf/1767164644753-233a4d4f-648c-4451-a8a1-23bf5dea154b-048354.png)<font style="color:rgb(31, 35, 40);">  
</font>

<font style="color:rgb(31, 35, 40);">重新获取SUI后台访问地址，可输入s-ui运行，再次输入10运行，查看面板参数来确定面板后台地址、管理员登录信息：  
</font>![1767164639290-aa57da79-999d-4ec2-9b34-c9f2d0f7c237.png](./img/Hd4abwoKL0TrfTOf/1767164639290-aa57da79-999d-4ec2-9b34-c9f2d0f7c237-334302.png)

### <font style="color:rgb(31, 35, 40);">BBR加速</font>
<font style="color:rgb(31, 35, 40);">输入s-ui运行，输入18运行，输入1运行，开启BBR加速，显著提升速度</font><font style="color:rgb(31, 35, 40);"> </font>![1767164639975-e012713a-36a6-4269-8d0a-f6bace758b89.png](./img/Hd4abwoKL0TrfTOf/1767164639975-e012713a-36a6-4269-8d0a-f6bace758b89-619677.png)

# <font style="color:rgb(31, 35, 40);">各平台客户端下载</font>
[<font style="color:rgb(9, 105, 218);">V2Ray官网对于全平台客户端的总结和一览</font>](https://www.v2ray.com/awesome/tools.html)<font style="color:rgb(31, 35, 40);">  
</font>

**<font style="color:rgb(31, 35, 40);">Windows、MacBook：</font>**[<font style="color:rgb(9, 105, 218);">v2rayN下载</font>](https://github.com/2dust/v2rayN/releases/tag/7.14.12)<font style="color:rgb(31, 35, 40);">  
</font>**<font style="color:rgb(31, 35, 40);">Windows、MacBook：</font>**[<font style="color:rgb(9, 105, 218);">v2rayN下载</font>](https://github.com/2dust/v2rayN/releases/tag/7.14.12)<font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">**</font>[<font style="color:rgb(9, 105, 218);">解压软件winrar</font>](https://www.winrar.com.cn/)<font style="color:rgb(31, 35, 40);">  
</font>

**<font style="color:rgb(31, 35, 40);">MacBook打开软件提示损坏解决方法：</font>**[<font style="color:rgb(9, 105, 218);">MacBook打开软件提示损坏解决方法</font>](https://zhuanlan.zhihu.com/p/135948430)<font style="color:rgb(31, 35, 40);">  
</font>**<font style="color:rgb(31, 35, 40);">MacBook打开软件提示无法验证软件安全性：</font>**[<font style="color:rgb(9, 105, 218);">MacBook打开软件提示无法验证安全性解决方法</font>](https://zhuanlan.zhihu.com/p/489710134)<font style="color:rgb(31, 35, 40);">  
</font>

**<font style="color:rgb(31, 35, 40);">苹果IOS、iPad、M芯片MacBook</font>**<font style="color:rgb(31, 35, 40);">：App Store中，登录非国区账号，安装Shadowrocket小火箭（推荐，协议支持全面、便宜）  
</font><font style="color:rgb(31, 35, 40);">不管是iPad平板还是iPhone手机，比较推荐的科学上网软件必定是：Shadowrocket，但是需要注册一个非国区或美区账号才能进行购买，目前是2.99美刀约20块人民币，注册美区账号和充值购买也非常简单，请参考以下两篇文章。  
</font><font style="color:rgb(31, 35, 40);">如何注册美区Apple ID:</font>[<font style="color:rgb(9, 105, 218);">https://zhuanlan.zhihu.com/p/30761252365</font>](https://zhuanlan.zhihu.com/p/30761252365)<font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">美区账号如何充值：</font>[<font style="color:rgb(9, 105, 218);">https://zhuanlan.zhihu.com/p/636121931</font>](https://zhuanlan.zhihu.com/p/636121931)<font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">注册美区ID并按以上方法充值后，在App Store中搜索Shadowrocket购买并下载安装  
</font>

**<font style="color:rgb(31, 35, 40);">安卓/Android：</font>**[<font style="color:rgb(9, 105, 218);">NekoBox下载</font>](https://github.com/MatsuriDayo/NekoBoxForAndroid/releases/tag/1.4.0)<font style="color:rgb(31, 35, 40);">  
</font>

# <font style="color:rgb(31, 35, 40);">结尾</font>
<font style="color:rgb(31, 35, 40);">一</font>**<font style="color:rgb(31, 35, 40);">郑重声明：请合理使用科学上网于学习知识、外贸或科研工作方面，遵守当地相关规定</font>**<font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">搬瓦工30天内新账户支持退款，请按以下操作，refunds，按提示交工单，不懂英文的请打开浏览器翻译  
</font>![1767164639273-8a51d400-d5b2-49ef-ab0a-8fbb136d0c46.png](./img/Hd4abwoKL0TrfTOf/1767164639273-8a51d400-d5b2-49ef-ab0a-8fbb136d0c46-482755.png)



> 更新: 2025-12-31 15:36:24  
> 原文: <https://www.yuque.com/lixinsi/yh04az/ge5bl0qf9d6qx4ki>