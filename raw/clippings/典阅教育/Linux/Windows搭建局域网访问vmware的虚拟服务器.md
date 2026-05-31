# Windows搭建局域网访问vmware的虚拟服务器

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">  
在虚拟机创建好之后开始配置</font>

## <font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">1. 查看宿主机的IP地址以及相关的网关和子网掩码信息</font>
![1653974260024-43498d3d-f770-4d61-9254-849b1469ba48.png](./img/wEByH31Xe3OZ1zTQ/1653974260024-43498d3d-f770-4d61-9254-849b1469ba48-559060.png)<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">  
</font><font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">PS：因为我本地宿主机是通过WIFI的方式连接到局域网的，所以本地的局域网的</font>

_<font style="color:rgb(153, 153, 153);background-color:rgb(238, 240, 244);">IP为：192.168.0.158  
</font>__<font style="color:rgb(153, 153, 153);background-color:rgb(238, 240, 244);">子网掩码为：255.255.255.0  
</font>__<font style="color:rgb(153, 153, 153);background-color:rgb(238, 240, 244);">默认网关为：192.168.0.1  
</font>__<font style="color:rgb(153, 153, 153);background-color:rgb(238, 240, 244);">以上信息是后面配置需要的重要信息</font>_

## <font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">2、配置虚拟机的网络地址</font>
![1653974260002-faecc975-5634-4354-b242-90ccfba3d674.png](./img/wEByH31Xe3OZ1zTQ/1653974260002-faecc975-5634-4354-b242-90ccfba3d674-855234.png)

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">选择VMnet8之后右键查看属性选择Tcp/IPv4双击</font>

![1653974260048-9c7245cf-2104-4d44-88b6-b254f601f79f.png](./img/wEByH31Xe3OZ1zTQ/1653974260048-9c7245cf-2104-4d44-88b6-b254f601f79f-997886.png)

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">并将IP地址配置成局域网中任意未被使用的一个IP，然后子网掩码和默认网关和宿主机的一致即可：  
</font><font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">PS：我此处找了一个10的IP  
</font>![1653974260145-938bc186-12b9-4d68-abb8-90450397182e.png](./img/wEByH31Xe3OZ1zTQ/1653974260145-938bc186-12b9-4d68-abb8-90450397182e-414974.png)

## <font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">3、配置服务器</font>
<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">打开虚拟机，选择设置，配置虚拟机的网络配置  
</font>![1653974260113-8d5daa01-644d-490f-8c74-823223cf6a5a.png](./img/wEByH31Xe3OZ1zTQ/1653974260113-8d5daa01-644d-490f-8c74-823223cf6a5a-239363.png)

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">修改虚拟机的网络适配器为桥接模式  
</font>![1653974261416-496fd80f-7fd0-41f6-b59b-4818da383d9b.png](./img/wEByH31Xe3OZ1zTQ/1653974261416-496fd80f-7fd0-41f6-b59b-4818da383d9b-592448.png)

## <font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">4、调出虚拟机的网络编辑器，修改虚拟机的网络信息</font>
![1653974261492-e4724930-d483-4641-9ece-7642336c0bea.png](./img/wEByH31Xe3OZ1zTQ/1653974261492-e4724930-d483-4641-9ece-7642336c0bea-596086.png)

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">选择桥接模式之后选择桥接到的网卡  
</font>![1653974261676-855ba3f7-0892-48d2-b382-aa1bd765aa2d.png](./img/wEByH31Xe3OZ1zTQ/1653974261676-855ba3f7-0892-48d2-b382-aa1bd765aa2d-230791.png)

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">PS：此处比较重要，在不同的宿主机上可能桥接至的选项有所不同，直接找到有没有带有Wireless的选项就好</font>

## <font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">5、 配置虚拟机的网卡信息</font>
<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">1、通过</font>

<font style="color:rgb(171, 178, 191);background-color:rgb(40, 44, 52);">ip addr </font><font style="color:rgb(153, 153, 153);background-color:rgb(40, 44, 52);">1</font>

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">查询虚拟机的网卡信息  
</font>![1653974262370-007d1511-6c63-405d-8b9e-e4be043e9645.png](./img/wEByH31Xe3OZ1zTQ/1653974262370-007d1511-6c63-405d-8b9e-e4be043e9645-036066.png)

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">此处我们的网卡是ens33，他的mac地址为： 00:0c:29:6c:29:fc</font>

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">2、编辑虚拟机的网卡配置：</font>

<font style="color:rgb(153, 153, 153);background-color:rgb(40, 44, 52);">[</font><font style="color:rgb(171, 178, 191);background-color:rgb(40, 44, 52);">root@Frznkj-Server home</font><font style="color:rgb(153, 153, 153);background-color:rgb(40, 44, 52);">]</font><font style="color:rgb(92, 99, 112);background-color:rgb(40, 44, 52);"># vim /etc/sysconfig/network-scripts/ifcfg-ens33</font><font style="color:rgb(171, 178, 191);background-color:rgb(40, 44, 52);"> </font><font style="color:rgb(153, 153, 153);background-color:rgb(40, 44, 52);">1</font>

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">将ONBOOT设置为yes  
</font><font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">将BOOTPROTO设置为dhcp  
</font><font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">将HWADDR设置为刚才看见的mac地址，如果没有改属性就追加一个改属性</font>

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">如果需要将虚拟机的IP固定下拉，只需要在ifcfg-ens33文件中，再追加下面的信息就可以了</font>

<font style="color:rgb(171, 178, 191);background-color:rgb(40, 44, 52);">IPADDR</font><font style="color:rgb(102, 153, 0);background-color:rgb(40, 44, 52);">=</font><font style="color:rgb(171, 178, 191);background-color:rgb(40, 44, 52);">192.168.0.128 GATEWAY</font><font style="color:rgb(102, 153, 0);background-color:rgb(40, 44, 52);">=</font><font style="color:rgb(171, 178, 191);background-color:rgb(40, 44, 52);">192.168.0.1 NETMASK</font><font style="color:rgb(102, 153, 0);background-color:rgb(40, 44, 52);">=</font><font style="color:rgb(171, 178, 191);background-color:rgb(40, 44, 52);">255.255.255.0 </font><font style="color:rgb(153, 153, 153);background-color:rgb(40, 44, 52);">1</font><font style="color:rgb(153, 153, 153);background-color:rgb(40, 44, 52);">2</font><font style="color:rgb(153, 153, 153);background-color:rgb(40, 44, 52);">3</font>

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">其中的GATEWAY和NETMASK要和宿主机保持一致，IPADDR要取一个在局域网中无人使用的IP即可  
</font><font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">3、重启虚拟机网络服务</font>

<font style="color:rgb(153, 153, 153);background-color:rgb(40, 44, 52);">[</font><font style="color:rgb(171, 178, 191);background-color:rgb(40, 44, 52);">root@Frznkj-Server home</font><font style="color:rgb(153, 153, 153);background-color:rgb(40, 44, 52);">]</font><font style="color:rgb(92, 99, 112);background-color:rgb(40, 44, 52);"># systemctl restart network</font><font style="color:rgb(171, 178, 191);background-color:rgb(40, 44, 52);"> </font><font style="color:rgb(153, 153, 153);background-color:rgb(40, 44, 52);">1</font>

<font style="color:rgb(79, 79, 79);background-color:rgb(244, 244, 244);">至此虚拟机可以被局域网中任意电脑访问</font>



> 更新: 2022-05-31 13:18:03  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/akv832>