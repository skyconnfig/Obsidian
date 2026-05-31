# openstack二进制安装

## **<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 254);">安装CentOS</font>**
```shell
yum install vim
```

## 修改网卡信息
```shell
vim /etc/sysconfig/network-scripts/ifcfg-ens33
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=static
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens33
DEVICE=ens33
ONBOOT=yes
IPADDR=192.168.12.18
PREFIX=24
GATEWAY=192.168.12.1
DNS1=192.168.111.2

```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">重启网络服务</font>
```shell
service network restart
```

<font style="color:rgb(153, 153, 153);background-color:rgb(254, 254, 254);">controller</font>

<font style="color:rgb(153, 153, 153);background-color:rgb(254, 254, 254);">ens33 192.168.12.18（提供浮动IP，出网地址）</font>

<font style="color:rgb(153, 153, 153);background-color:rgb(254, 254, 254);">ens34 192.168.12.118（内网之间通信）</font>

<font style="color:rgb(153, 153, 153);background-color:rgb(254, 254, 254);">compute</font>

<font style="color:rgb(153, 153, 153);background-color:rgb(254, 254, 254);">ens33 192.168.12.140（提供浮动IP，出网地址）</font>

<font style="color:rgb(153, 153, 153);background-color:rgb(254, 254, 254);">ens34 192.168.12.240（内网之间通信）</font>

```shell
# 立即重启
shutdown -r now
```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">初始化各节点</font>
```shell
yum -y install wget net-tools nfs-utils lrzsz gcc gcc-c++ make cmake libxml2-devel openssl-devel curl curl-devel unzip sudo ntp libaio-devel vim ncurses-devel autoconf automake zlib-devel python-devel epel-release lrzsz openssh-server
```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">关闭防火墙、networkmanager，iptables，selinux（各个节点操作）</font>
```shell
systemctl stop firewalld && systemctl disable firewalld && systemctl stop NetworkManager && systemctl disable NetworkManager
systemctl stop iptables && systemctl disable iptables

```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">修改selinux</font>
```shell
vim /etc/sysconfig/selinux
SELINUX=disabled
```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">修改hosts</font>
```shell
vim /etc/hosts
192.168.12.118 controller
192.168.12.240 compute

```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">修改主机名</font>
```shell
hostnamectl set-hostname controller
hostnamectl set-hostname compute
```

## 时间同步
```shell
ntpdate cn.pool.ntp.org
```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">配置无密码登陆，各个节点操作</font>
```shell
ssh-keygen -t rsa 
#一直回车即可
ssh-copy-id -i .ssh/id_rsa.pub controller
ssh-copy-id -i .ssh/id_rsa.pub computer

```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">用xftp上传openstack离线软件包到root目录下（在controller和compute节点操作）</font>
<font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">在root下创建一个目录openstack，然后把软件包解压到这个目录下</font>

```shell
mkdir /root/openstack && cd /root/openstack && tar zxvf /root/openstack_N.tar.gz 
```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">把openstack目录整体移动到/下（controller和computer节点操作）</font>
```shell
mv openstack /
```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">重新配置yum源（controller和computer节点都操作）</font>
```shell
cd /etc/yum.repos.d/ 
mkdir bak 
mv CentOS-* bak/ 
mv epel* bak/
cp bak/CentOS-Base.repo ./

```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">生成一个新的openstack的yum源</font>
```shell
cat <<EOF > /etc/yum.repos.d/openstack.repo 
[openstack]
enable=1
gpgcheck=0
baseurl=file:///openstack
EOF

```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">清缓存</font>
```shell
yum makecache
```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">openstack应答文件安装（controller节点操作）</font>
```shell
yum install centos-release-openstack-newton -y
cd /etc/yum.repos.d 
mv *.repo bak/ 
cp bak/openstack.repo ./ 
cp bak/CentOS-Base.repo ./
```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">清缓存</font>
```shell
yum makecache
yum install openstack-packstack -y
cd /root
packstack --gen-answer-file=openstack.txt 

```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">结束后会生成一个应答文件openstack.txt</font>
<font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">修改openstack.txt文件</font>

<font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">修改的内容如下</font>

```shell
CONFIG_DEFAULT_PASSWORD=123456
CONFIG_SWIFT_INSTALL=n
CONFIG_NAGIOS_INSTALL=n
CONFIG_CINDER_VOLUMES_SIZE=10G
CONFIG_PROVISION_DEMO=n
CONFIG_LBAAS_INSTALL=y
CONFIG_NEUTRON_FWAAS=y
CONFIG_NEUTRON_VPNAAS=y
CONFIG_CONTROLLER_HOST=192.168.12.118
CONFIG_COMPUTE_HOSTS=192.168.12.240
CONFIG_NETWORK_HOSTS=192.168.12.240

```

## **<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 254);">基于应答文件安装组件</font>**
```shell
packstack --answer-file=openstack.txt
```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">安装过程需要查看iptables状态，在controller和computer节点</font>
```shell
systemctl status iptables
```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">如果发现iptables处于active状态，需要停掉</font>
```shell
systemctl stop iptables
```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">看到如下说明安装成功</font>
```shell
Installation completed successfully
```

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">启动rabbitmq的管理界面（controller节点操作）</font>
```shell
rabbitmq-plugins enable rabbitmq_management
```

### **<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 254);">登陆openstack的dashboad界面</font>**
<font style="color:rgb(153, 153, 153);background-color:rgb(254, 254, 254);">在浏览器输入：</font>

<font style="color:rgb(153, 153, 153);background-color:rgb(254, 254, 254);">192.168.124.200</font>

<font style="color:rgb(153, 153, 153);background-color:rgb(254, 254, 254);">账号：admin</font>

<font style="color:rgb(153, 153, 153);background-color:rgb(254, 254, 254);">密码：</font>

## <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">获取密码</font>
```shell
cd /root
cat keystonerc_admin

```

## **<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 254);">KeyStone配置优化</font>**
**<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 254);">在controller节点操作</font>**

### <font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">修改keystone.conf</font>
```shell
vim /etc/keystone/keystone.conf 
```

<font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">在default字段下面添加如下一行</font>

```shell
memcache_servers = 192.168.12.118:11211
```

<font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">重启服务</font>

```shell
systemctl restart httpd
```

<font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">如果OpenStack可以正常访问则代表配置成功</font>

## **<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 254);">glance配置优化</font>**
<font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">修改glance-api.conf</font>

```shell
vim /etc/glance/glance-api.conf 
```

在顶部添加

```shell
memcache_servers = 192.168.12.118:11211
```

<font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">重启服务</font>

```shell
systemctl restart openstack-glance-api
systemctl restart openstack-glance-registry

```

<font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">nova配置优化在controller节点修改</font>

<font style="color:rgb(90, 90, 90);background-color:rgb(254, 254, 254);">修改nova.conf</font>

```shell
vim /etc/nova/nova.conf
```

  
修改glance-registry.conf

  
vim /etc/glance/glance-registry.conf  
在顶部添加

  
memcache_servers = 192.168.12.118:11211  
重启服务

  
systemctl restart openstack-glance-api  
systemctl restart openstack-glance-registry  
nova配置优化在controller节点修改



修改nova.conf

  
vim /etc/nova/nova.conf  
在顶部添加memcahce缓存

  
memcache_servers = 192.168.12.118:11211  
原来是只有地址，没有http协议，需要加上http协议

  
api_servers=http://192.168.12.118:9292  
在第一行[DEFAULT]下面加上这行

  
transport_url=rabbit://guest:guest[@192.168.12.118 ](/192.168.12.118 )   
原来的ip改成这个，并且打开注释

  
my_ip=192.168.12.118  
原来是0.0.0.0，现在改成这个

  
vncserver_listen=192.168.12.118  
原来是主机名，改成这个主机IP

  
vncserver_proxyclient_address=192.168.12.118  
上面修改好之后重新启动服务

  
systemctl restart openstack-nova-api.service   
openstack-nova-consoleauth.service openstack-nova-scheduler.service   
openstack-nova-conductor.s：ervice openstack-nova-novncproxy.service  
在compute节点修改



修改配置文件nova.conf

  
vim /etc/nova/nova.conf  
在第一行[DEFAULT]字段加如下一行

  
memcache_servers=192.168.12.118:11211  
这行注释打开，变成这个ip地址

  
transport_url=rabbit://guest:guest[@192.168.12.118 ](/192.168.12.118 )   
这行注释打开，ip变成这个主机ip

  
api_servers=http://192.168.12.118:9292  
这行注释打开，变成这个ip地址

  
my_ip=192.168.12.240  
这行注释打开，变成这个ip地址

  
vncserver_proxyclient_address=192.168.12.240  
这行注释打开，变成这个ip地址

  
novncproxy_base_url=http://192.168.12.118:6080/vnc_auto.html  
这行注释打开

  
virt_type=qemu  
上面修好好了之后重新启动服务

  
systemctl enable libvirtd.service openstack-nova-compute.service  
systemctl restart libvirtd.service openstack-nova-compute.service  
查看日志，没有报错

  
cat /var/log/nova/nova-compute.log  
启动之后在controller节点查看日志

  
cat /var/log/nova/nova-api.log  
如果没有报错即可



Neutron配置优化



在controller节点操作



修改配置文件neutron.conf

  
vim /etc/neutron/neutron.conf  
新增加一行

  
memcache_servers = 192.168.12.118:11211  
找到transport_url，新增加一行（消息队列rabbit地址在controller节点上）

  
transport_url = rabbit://guest:guest[@192.168.12.118 ](/192.168.12.118 )   
找到lock_path，改为绝对路径

  
lock_path=/var/lib/neutron/tmp  
修改ml2_conf.ini

  
vim /etc/neutron/plugins/ml2/ml2_conf.ini  
修改vni_ranges

  
vni_ranges = 10:10000  
上面两个文件修改好之后重启服务

  
systemctl restart neutron-server  
新开一个端口查看日志，没有报错即可

  
tail -f /var/log/neutron/server.log  
在compute节点操作



创建一个桥接网卡，桥接到能够访问外网的那个网卡，也就是ens33

  
cd /etc/sysconfig/network-scripts  
mkdir bak  
cp ifcfg-ens33 bak/  
vim ifcfg-br-ex  
复制内容到ifcfg-br-ex

  
DEVICE=br-ex  
BOOTPROTO=static  
ONBOOT=yes  
TYPE=OVSBridge  
DEVICETYPE=ovs  
USERCTL=yes  
PEERDNS=yes  
IPV6INIT=no  
IPADDR=192.168.12.140  
NETMASK=255.255.255.0  
DNS1=192.168.111.2  
GATEWAY=192.168.12.1  
vim ifcfg-ens33  
将原有内容删除，替换为如下内容





# 设备名


DEVICE=ens33



# 是否开启开机自启


ONBOOT=yes  
TYPE=OVSPort  
DEVICETYPE=ovs  
#桥接到哪个网卡上  
OVS_BRIDGE=br-ex  
重启网卡

  
service network restart  
修改配置文件neutron.conf

  
vim /etc/neutron/neutron.conf  
新增加一行配置文件

  
transport_url = rabbit://guest:guest[@192.168.12.118 ](/192.168.12.118 )   
新增加一行

  
memcached_servers=192.168.12.118:11211  
原来的路径变成这个

  
lock_path=/var/lib/neutron/tmp  
修改三层的和浮动ip相关的配置文件

  
cd /etc/neutron  
vim l3_agent.ini  
这行注释去掉  
ovs_integration_bridge = br-int  
这行注释打开  
availability_zone = nova  
修改配置文件metadata_agent.ini  
vim metadata_agent.ini  
这行注释打开  
nova_metadata_port = 8775  
这行注释打开  
nova_metadata_protocol = http  
新增加一行  
memcached_servers=192.168.12.118:11211  
修改配置文件dhcp_agent.ini  
vim dhcp_agent.ini  
这行注释打开  
ovs_integration_bridge = br-int  
原来是False，需要变成True  
enable_metadata_network = True  
新增加一行  
dhcp_domain = test.localdomain  
原来的注释打开，修改成外网的dns地址  
dnsmasq_dns_servers = 192.168.111.2  
这行注释打开  
dnsmasq_lease_max = 16777216  
这行注释打开

```shell
·availability_zone = nova
```

  
上面修改好了之后重启服务

```shell
systemctl restart neutron-ovs-cleanup.service neutron-openvswitch-agent.service neutron-metering-agent.service neutron-metadata-agent.service neutron-lbaasv2-agent.service neutron-l3-agent.service neutron-dhcp-agent.service
```

<font style="color:rgb(255, 255, 255);background-color:rgb(28, 27, 27);"></font>



> 更新: 2022-05-21 10:15:32  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/kdbrmu>