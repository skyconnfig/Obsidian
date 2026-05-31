# Linux下Mysql

清华镜像下载MySQL安装包：[https://mirror.tuna.tsinghua.edu.cn/mysql/downloads/MySQL-5.7/](https://mirror.tuna.tsinghua.edu.cn/mysql/downloads/MySQL-5.7/)



rpm -qa | grep mysql --检查是否安装过mysql

rpm -q | grep mariadb



rpm -e --nodes           --+包名 --卸载



yum -y install lrzsz    ---上传文件安装

rz上传

sz下载



mkdir mysql   ---创建mysql解压目录



tar xvf mysql-5.7.35-1.el7.x86_64.rpm-bundle.tar -C ./mysql --将文件解压到指定目录

![1652838451003-03916313-4af2-4564-8cb6-56a52a23002e.png](./img/9S_hm1olJVNglKrx/1652838451003-03916313-4af2-4564-8cb6-56a52a23002e-713311.png)

rpm -ivh --nodeps mysql-community-server-5.7.36-1.el6.i686.rpm 



强制卸载依赖

rpm -e --nodeps mariadb-libs-1:5.5.68-1.el7.x86_64



安装顺序

rpm -ivh mysql-community-common-5.7.35-1.el7.x86_64.rpm

rpm -ivh mysql-community-libs-5.7.35-1.el7.x86_64.rpm

rpm -ivh mysql-community-client-5.7.35-1.el7.x86_64.rpm



安装mysql出现少依赖问题

<font style="color:rgb(77, 77, 77);">yum install -y perl-Module-Install.noarch；</font>

rpm -ivh mysql-community-server-5.7.35-1.el7.x86_64.rpm



启动mysql

systemctl start mysqld

pi&YjZig.5sO



cat /var/log/mysqld.log  | grep password --查找密码，并且需要记录密码。

![1650321190664-b9212b87-3e6b-4fc2-b710-c570ffa58af3.png](./img/9S_hm1olJVNglKrx/1650321190664-b9212b87-3e6b-4fc2-b710-c570ffa58af3-285515.png)

mysql -uroot -p --登入



修改密码

vim /etc/my.cnf

validate_password=off

![1650321436431-4009275e-2ad2-42a7-94c9-02865a3986f5.png](./img/9S_hm1olJVNglKrx/1650321436431-4009275e-2ad2-42a7-94c9-02865a3986f5-740851.png)

systemctl restart mysqld     ---重启mysql

alter user 'root'@'localhost' identified by 'sa123'; --修改密码



配置远程连接

vi /etc/my.cnf ---修改配置文件



character-set-server=utf8

collation-server=utf8_general_ci



![1650338687428-072ac6e3-e3cf-4781-9f24-bc777b44b896.png](./img/9S_hm1olJVNglKrx/1650338687428-072ac6e3-e3cf-4781-9f24-bc777b44b896-996116.png)



default-character-set=utf8

![1650338775676-436dbc5f-9d9e-41dc-b140-b0e8b34d857d.png](./img/9S_hm1olJVNglKrx/1650338775676-436dbc5f-9d9e-41dc-b140-b0e8b34d857d-402120.png)

mysql -u root -p --登入mysql

set password=password('sa123');



MySQL <font style="color:rgb(128, 0, 128);">8</font><font style="color:rgb(0, 0, 0);">.0已经不支持下面这种命令写法</font>

<font style="color:rgb(0, 0, 0);"> grant all privileges on </font>*.* to root<font style="color:rgb(128, 0, 0);">@"%"</font> identified by <font style="color:rgb(128, 0, 0);">"."</font><font style="color:rgb(0, 0, 0);">;</font>

<font style="color:rgb(0, 0, 0);"> 正确的写法是 </font>

<font style="color:rgb(0, 0, 0);">grant all privileges on </font>*.* to <font style="color:rgb(128, 0, 0);">‘root‘</font>@<font style="color:rgb(128, 0, 0);">‘%‘</font>  

一、开放3306端口

1.开启端口3306



firewall-cmd --zone=public --add-port=3306/tcp --permanent



2.重启防火墙



firewall-cmd --reload



3.查看已经开放的端口



firewall-cmd --list-ports



<font style="color:rgb(51, 51, 51);">service network restart </font>

安装nginx

rz+上传nignx

tar -xvf  nginx-1.16.1.tar.gz  解压

cd nginx-1.16.1

./configure \



--prefix=/usr/local/nginx \



--pid-path=/usr/local/nginx/run \



--user=nginx \



--group=nginx \



--with-http_ssl_module \



--with-http_flv_module \



--with-http_stub_status_module \



--with-http_gzip_static_module \



--with-pcre \



--with-http_image_filter_module \



--with-debug \

[  
](https://blog.csdn.net/cailongbiaoyuli/article/details/84348866)

./configure

make 



安装tomat

rz 上传二进制包

rpm -ivh jdk-8u333-linux-i586.rpm

tar -xvf  apache-tomcat-10.0.21.tar.gz

cd apache-tomcat-10.0.21

cd bin

sh startup.sh



 查看进程 <font style="color:rgb(0, 0, 0);"> ps aux|grep mysql</font>

<font style="color:rgb(0, 0, 0);">杀掉进程     kill -9 10009</font>



时间同步

[root@monitor ~]# timedatectl set-timezone America/New_York 

[root@monitor ~]# 





查看时间

who -b



查看error级别日志

<font style="color:rgb(77, 77, 77);">tail -n 6000 xxx.log|grep "ERROR"</font>

**安装MySQL**

开启sshd服务

nano /etc/ssh/ssh_config 

<font style="color:#333333;">把port 22前面的#删除，然后Ctrl+x保存</font>

<font style="color:#333333;">service sshd start 开启sshd服务</font>

![1655718574016-a2227b3a-983d-431a-9182-24d2c968fff1.png](./img/9S_hm1olJVNglKrx/1655718574016-a2227b3a-983d-431a-9182-24d2c968fff1-204673.png)

//检查并且卸载

rpm -qa | grep subscription-manager

rpm -e subscription-manager-1.17.15-1.el7.x86_64

<font style="color:#4d4d4d;">清除缓存： yum clean all</font>

<font style="color:#4d4d4d;">上传安装文件</font>

<font style="color:#4d4d4d;">mkdir app</font>

<font style="color:#4d4d4d;">app 目录下面分别有mysql文件夹，nignx文件夹，tomat文件夹</font>

<font style="color:#4d4d4d;">进入mysql文件夹解压mysql</font>

rpm -qa |grep mariadb

rpm -e --nodeps mariadb-libs-5.5.52-1.el7.x86_64

rpm -ivh mysql-community-common-5.7.26-1.el7.x86_64.rpm 

rpm -ivh mysql-community-libs-5.7.26-1.el7.x86_64.rpm 

rpm -ivh mysql-community-client-5.7.26-1.el7.x86_64.rpm 

rpm -ivh mysql-community-server-5.7.26-1.el7.x86_64.rpm 

![1655718574158-51184211-2e70-40d0-a7a0-9ebe07c77f0c.png](./img/9S_hm1olJVNglKrx/1655718574158-51184211-2e70-40d0-a7a0-9ebe07c77f0c-736030.png)

此时mysql已经安装完成

<font style="color:#000000;">启动mysql</font>

<font style="color:#000000;">systemctl start mysqld</font>

<font style="color:#000000;">cat /var/log/mysqld.log | grep password --查找密码，并且需要记录密码。</font>

<font style="color:#000000;">mysql -uroot -p --登入</font>

<font style="color:#000000;">修改密码</font>

<font style="color:#000000;">vim /etc/my.cnf</font>

<font style="color:#000000;">validate_password=off</font>

![1655718574065-d0bd2f89-4756-4343-9587-800eef47b795.png](./img/9S_hm1olJVNglKrx/1655718574065-d0bd2f89-4756-4343-9587-800eef47b795-582168.png)

<font style="color:#000000;">systemctl restart mysqld ---重启mysql</font>

<font style="color:#000000;">alter user 'root'@'localhost' identified by 'sa123'; --修改密码</font>

<font style="color:#000000;">配置远程连接</font>

<font style="color:#000000;">vi /etc/my.cnf ---修改配置文件</font>

<font style="color:#000000;">character-set-server=utf8</font>

<font style="color:#000000;">collation-server=utf8_general_ci</font>

<font style="color:#000000;">default-character-set=utf8</font>

![1655718574228-1c9c7864-ba92-46c0-8022-09f3bd51a01e.png](./img/9S_hm1olJVNglKrx/1655718574228-1c9c7864-ba92-46c0-8022-09f3bd51a01e-291799.png)

<font style="color:#000000;">mysql -u root -p --登入mysql</font>

<font style="color:#000000;">set password=password('sa123');</font>

<font style="color:#000000;">MySQL </font><font style="color:#800080;">8</font><font style="color:#000000;">.0已经不支持下面这种命令写法</font>

<font style="color:#000000;">grant all privileges on *.* to root</font><font style="color:#800000;">@"%"</font><font style="color:#000000;"> identified by </font><font style="color:#800000;">"."</font><font style="color:#000000;">;</font>

<font style="color:#000000;">正确的写法是</font>

<font style="color:#000000;">grant all privileges on *.* to </font><font style="color:#800000;">‘root‘</font><font style="color:#000000;">@</font><font style="color:#800000;">‘%‘</font><font style="color:#000000;"> </font>

<font style="color:#000000;">登入mysql后</font>

<font style="color:#000000;">创建数据库</font>

<font style="color:#000000;">create database +数据库名字；</font>

<font style="color:#000000;">使用mysql -uroot -p+数据库密码 -e "source +sql文件当前路径"</font>

<font style="color:#000000;">一、开放3306端口</font>

<font style="color:#000000;">1.开启端口3306</font>

<font style="color:#000000;">firewall-cmd --zone=public --add-port=3306/tcp --permanent</font>

<font style="color:#000000;">2.重启防火墙</font>

<font style="color:#000000;">firewall-cmd --reload</font>

<font style="color:#000000;">3.查看已经开放的端口</font>

<font style="color:#000000;">firewall-cmd --list-ports</font>

<font style="color:#333333;">service network restart</font>

**<font style="color:#333333;">安装nginx</font>**

cd nginx/

tar -zxvf nginx-1.16.1.tar.gz 

cd nginx-1.16.1/

./configure 

<font style="color:#000000;">1.开启端口80</font>

<font style="color:#000000;">firewall-cmd --zone=public --add-port=80/tcp --permanent</font>

<font style="color:#000000;">2.重启防火墙</font>

<font style="color:#000000;">firewall-cmd --reload</font>

<font style="color:#000000;">3.查看已经开放的端口</font>

<font style="color:#000000;">firewall-cmd --list-ports</font>

<font style="color:#333333;">service network restart</font>

<font style="color:#4d4d4d;">查看</font>[nginx](https://so.csdn.net/so/search?q=nginx&amp;spm=1001.2101.3001.7020)<font style="color:#4d4d4d;">运行状态</font>

| <font style="color:#4f4f4f;">$ ps -ef | </font>[grep](https://so.csdn.net/so/search?q=grep&amp;spm=1001.2101.3001.7020)<font style="color:#4f4f4f;"> nginx</font> |
| :--- |


<font style="color:#3d464d;">1、安装pcre</font>

<font style="color:#3d464d;">解压：tar -zxvf pcre2-10.35.tar.gz</font>  
<font style="color:#3d464d;">进入解压目录</font>  
<font style="color:#3d464d;">配置： ./configure</font>  
<font style="color:#3d464d;">编译： make</font>  
<font style="color:#3d464d;">安装：make install</font>

<font style="color:#3d464d;">2、安装OpenSSL</font>

<font style="color:#3d464d;">解压：tar -zxvf openssl-1.1.1g.tar.gz</font>  
<font style="color:#3d464d;">进入解压目录：cd openssl-1.1.1g</font>  
<font style="color:#3d464d;">配置： ./config</font>  
<font style="color:#3d464d;">编译： make</font>  
<font style="color:#3d464d;">安装：make install</font>

<font style="color:#3d464d;">如果输入openssl version</font>

<font style="color:#3d464d;">在root用户下执行：</font>

<font style="color:#3d464d;">ln -s /usr/local/lib64/libssl.so.1.1 /usr/lib64/libssl.so.1.1</font>

<font style="color:#3d464d;">ln -s /usr/local/lib64/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1</font>

<font style="color:#3d464d;">3、安装zlib</font>

<font style="color:#3d464d;">解压：tar -zxvf zlib-1.2.11.tar.gz</font>  
<font style="color:#3d464d;">进入解压目录：cd zlib-1.2.11</font>  
<font style="color:#3d464d;">配置： ./configure</font>  
<font style="color:#3d464d;">编译： make</font>  
<font style="color:#3d464d;">安装：make install</font>

<font style="color:#3d464d;">4、安装nginx-1.16.1.tar.gz</font>

<font style="color:#3d464d;">解压：tar -zxvf nginx-1.16.1.tar.gz</font>  
<font style="color:#3d464d;">进入解压目录：cd nginx-1.16.1</font>  
<font style="color:#3d464d;">配置： ./configure（如果不行可以忽略依赖 ./configure --without-http_rewrite_module）</font>  
<font style="color:#3d464d;">编译： make</font>  
<font style="color:#3d464d;">安装：make install</font>

**安装tomcat**

rpm -ivh jdk-8u333-linux-i586.rpm 

tar -zxvf apache-tomcat-10.0.21.tar.gz 

cd apache-tomcat-10.0.21

<font style="color:#000000;">cd bin</font>

<font style="color:#000000;">sh startup.sh</font>[  
](https://blog.csdn.net/zxw781/article/details/123803424)









> 更新: 2022-06-20 17:50:08  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/au11uo>