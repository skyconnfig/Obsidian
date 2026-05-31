# Centos7忘记密码怎么办

Centos7忘记密码怎么办



一、按“e”进入

![1658369189470-b9bc05d9-42ca-4c78-8a68-debfa9fa7f92.png](./img/HGLkDH73AwkbX6uY/1658369189470-b9bc05d9-42ca-4c78-8a68-debfa9fa7f92-205126.png)





二、按方向键↓移动到如图所示位置，输入init=/bin/sh ，同事按Ctrl+X，进入到Emergency模式



 ![1658369196994-bb998e0d-3808-4849-ab65-ac4e2fb08886.png](./img/HGLkDH73AwkbX6uY/1658369196994-bb998e0d-3808-4849-ab65-ac4e2fb08886-675222.png)



三、 输入ls查看一下当前目录，输入mount -o remount, rw / 挂载根目录

![1658369495031-673edd9a-21a4-4f1c-9ba5-27a0b3f17131.png](./img/HGLkDH73AwkbX6uY/1658369495031-673edd9a-21a4-4f1c-9ba5-27a0b3f17131-104881.png)





四、输入passwd来更改root用户的密码，按照提示输入两遍密码

![1658369505715-23acbb5d-4782-42e7-8cdf-179ba7beac07.png](./img/HGLkDH73AwkbX6uY/1658369505715-23acbb5d-4782-42e7-8cdf-179ba7beac07-941884.png)

 



五、输入touch /.autorelabel来更新系统信息   输入exec /sbin/init来重启系统

![1658369516034-418e9391-e218-435e-aae3-df9ba0b41ee9.png](./img/HGLkDH73AwkbX6uY/1658369516034-418e9391-e218-435e-aae3-df9ba0b41ee9-022826.png)



六、出现如下界面，等待重启 

输入密码，修改成功 

![1658369533672-5912a009-191d-4fa9-b4ff-dae7635d140b.png](./img/HGLkDH73AwkbX6uY/1658369533672-5912a009-191d-4fa9-b4ff-dae7635d140b-355734.png)

![1658369544922-1a2f515e-98f8-4e99-84e8-e51930f3ee96.png](./img/HGLkDH73AwkbX6uY/1658369544922-1a2f515e-98f8-4e99-84e8-e51930f3ee96-196890.png)



## <font style="color:rgb(51, 51, 51);">修改ip地址</font>
<font style="color:rgba(58, 58, 58, 0.88);">编辑 /etc/sysconfig/network-scripts/ifcfg-eth0</font>

<font style="color:rgba(58, 58, 58, 0.88);">TYPE=Ethernet  
</font><font style="color:rgba(58, 58, 58, 0.88);">BOOTPROTO=static</font><font style="color:rgba(58, 58, 58, 0.88);"> </font>**<font style="color:rgba(58, 58, 58, 0.88);">静态ip</font>**<font style="color:rgba(58, 58, 58, 0.88);">  
</font><font style="color:rgba(58, 58, 58, 0.88);">DEFROUTE=yes  
</font><font style="color:rgba(58, 58, 58, 0.88);">IPV4_FAILURE_FATAL=no  
</font><font style="color:rgba(58, 58, 58, 0.88);">IPV6INIT=yes  
</font><font style="color:rgba(58, 58, 58, 0.88);">IPV6_AUTOCONF=yes  
</font><font style="color:rgba(58, 58, 58, 0.88);">IPV6_DEFROUTE=yes  
</font><font style="color:rgba(58, 58, 58, 0.88);">IPV6_FAILURE_FATAL=no  
</font><font style="color:rgba(58, 58, 58, 0.88);">NAME=eno16777736  
</font><font style="color:rgba(58, 58, 58, 0.88);">UUID=34bbe4fa-f0b9-4ced-828a-f7f7e1094e4a  
</font><font style="color:rgba(58, 58, 58, 0.88);">DEVICE=eno16777736  
</font><font style="color:rgba(58, 58, 58, 0.88);">ONBOOT=yes  
</font><font style="color:rgba(58, 58, 58, 0.88);">PEERDNS=yes  
</font><font style="color:rgba(58, 58, 58, 0.88);">PEERROUTES=yes  
</font><font style="color:rgba(58, 58, 58, 0.88);">IPV6_PEERDNS=yes  
</font><font style="color:rgba(58, 58, 58, 0.88);">IPV6_PEERROUTES=yes  
</font><font style="color:rgba(58, 58, 58, 0.88);">IPADDR=192.168.179.3</font><font style="color:rgba(58, 58, 58, 0.88);"> </font>**<font style="color:rgba(58, 58, 58, 0.88);">ip地址</font>**<font style="color:rgba(58, 58, 58, 0.88);">  
</font><font style="color:rgba(58, 58, 58, 0.88);">NETMASK=255.255.255.0</font><font style="color:rgba(58, 58, 58, 0.88);"> </font>**<font style="color:rgba(58, 58, 58, 0.88);">子网掩码</font>**<font style="color:rgba(58, 58, 58, 0.88);">  
</font><font style="color:rgba(58, 58, 58, 0.88);">GATEWAY=192.168.179.2</font><font style="color:rgba(58, 58, 58, 0.88);"> </font>**<font style="color:rgba(58, 58, 58, 0.88);">网关</font>**

<font style="color:rgba(58, 58, 58, 0.88);">运行 service network restart</font>

## <font style="color:rgb(51, 51, 51);">修改dns地址</font>
<font style="color:rgba(58, 58, 58, 0.88);">编辑/etc/resolv.conf  
</font><font style="color:rgba(58, 58, 58, 0.88);">修改文件内容 nameserver 114.114.114.114</font>

## <font style="color:rgb(51, 51, 51);">常用dns地址</font>
<font style="color:rgba(58, 58, 58, 0.88);">114.114.114.114  
</font><font style="color:rgba(58, 58, 58, 0.88);">114.114.115.115  
</font><font style="color:rgba(58, 58, 58, 0.88);">223.5.5.5 阿里  
</font><font style="color:rgba(58, 58, 58, 0.88);">223.6.6.6 阿里  
</font><font style="color:rgba(58, 58, 58, 0.88);">180.76.76.76 百度</font>



更改主机名字

hostnamectl set-hostname master

 



[  
](https://blog.csdn.net/z594934262/article/details/125234097)



> 更新: 2022-07-21 10:51:04  
> 原文: <https://www.yuque.com/lixinsi/ii9bf8/rlw882>