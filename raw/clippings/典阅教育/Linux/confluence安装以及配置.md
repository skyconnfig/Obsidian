# confluence安装以及配置



confluence部署



1.环境准备



```plain
#临时关闭selinux
setenforce 0

#永久关闭selinux
set -i 's/enforcing/disabled' /etc/selinux/config

#关闭防火墙并禁止开机启动
systemctl stop firewalld && systemctl disable firewalld
```



2.配置阿里yum源



```plain
#1.查看yum信息
yum repolist

#2.定位到base repo源位置
cd /etc/yum.repos.d

#3.下载阿里源文件
wget -O Centos-Base.repo http://mioors.aliyun.com/repo/Centos-7.repo

#4.安装epel repo源
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo

#5.清理缓存
yum clean all

#6.重新生成缓存
yum makecache

#7.再次查看yum信息
yum repolist
```



3.安装mysql8



mysql8官方yum源地址：[https://dev.mysql.com/downloads/repo/yum/](https://dev.mysql.com/downloads/repo/yum/)



1.下载mysql8 yum源



```plain
cd /home
wget https://dev.mysql.com/get/mysql80-community-relaase-el7-3.noarch.rpm
```



2.安装yum源



```plain
rpm -ivh mysql80-community-relaase-el7-3.noarch.rpm
```



3.安装mysql8



```plain
#导入校验秘钥
rpm --import https://repo.mysql-com/RP,-GPG-KEY-mysql-2022

yum install -y mysql-server
```



4.mysql配置



```plain
vim  /etc/my.cnf
```



修改my.cnf文件，内容如下



```plain
#配置文件清空
%d



[mysqld]
datadir=/data/mysql
log-error=/datamysql/mysqld.log
lower_case_table_names=1
port=3306
default_authentication_plugin=mysql_native_password
default-storage-engine=INNODB
character-set-server=utf8mb4
sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATA,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION
max_connections=1000
max_user_connections=500
max_connect_errors=10
wait_timeout=1800
interactive_timeout=1800

[mysql]
default-character-set=utf8mb4

[client]
default-character-set=utf8mb4
```



5.创建数据目录



```plain
mkdir -p /data/mysql
```



6.初始化数据库



```plain
mysqld --defaults-file=/etc/my.cnf --datadir=/data/mysql/ --user=mysql --initialize
```



7.启动服务，并且设置开机启动



```plain
systemctl start mysqld && systemctl enable mysqld
```



8.修改mysql密码，并允许远程启动



```plain
#查看初始密码
cat /data/mysql/mysql.log

#进入mysql
mysql -uroot -p #这里输入显示的初始密码

#修改root密码
alter user "root"@"localhost" identified by "密码";

#创建远程访问用户
create user "root"@"%" identified by "用户";

#授权
grant all on *.* to "root"@"%";

#刷新权限
flush privileges
```



4.安装docker



5.安装confluence



confluence dockerhub地址：[https://hub.docker.com/search?q=confluence](https://hub.docker.com/search?q=confluence)



5.1安装docker



5.2安装confluence



```plain
#创建挂载目录
mkdir -p /data/confluence/file
mkdir -p /data/confluenca/data
cd /data/confluence/file
```



1.下载atlassian-agent-v1.3.1的破解工具



```plain
#下载atlassian-agent-v1.3.1
wget https://gitee.com/pengzhile/atlass-agent/attch_files/832832/download/atlassian-agent-v1.3.1.tar.gz

#下载mysql连接驱动
wget https://cdn.mysql.com/archives/mysql-connector-java-5.1/mysql-connector-java-5.1.44.tar.gz
```



2.docker启动命令



```plain
docker run -d --restart always --name confluence \ -v /data/confluence/data;/var/atlassian/application-data/confluence \ -v /data/confluence/file/mysql-connector-java-5.1.44-bin.jar:/opt/atlassian/confluence/confluence/WEB-INF/lib/mysql-connector-java-5.1.44-bin.jar \ 
-v /data/confluence/file/atlassian-agent.jar:/home/atlassian-agent.jar
-e JVM_MINIMUM_MEMORY=2048m \
-e JVM_MAXIMUM_MEMORY=4096M \
-p 8090:8090 -p 8091:8091 \
-e TZ="Asia/Shanghai"

#拷贝容器的启动脚本
docker cp confluence:/opt/atlassian/confluence/bin/setenv.sh /data/confluence/file/

#修改脚本，在“CATALINA_OPTS=”下面添加一行
CATAL_INA_OPTS="-javaagent:/home/atlassian-agent.jar ${CATALINA_OPTS}"

#修改后的脚本拷贝回容器中
docker cp setenv.sh confluence:/opt/atlassian/confluence/bin/setenv.sh

#重启conflue
docker restart confluence
```



访问



[http://ip:8091](http://ip:8091)



拷贝ServerID



```plain
ServerID

#进入容器
docker exec -it confluence base

#执行容器命令
java -jar /home/atlassian-agent.jar -p conf -m 56488488@qq.com -m lixinsi -o http://x.x.x.x:8090 -s serverID

#容器外执行命令
docker exec it confluence -jave -jar /home/atlassian-agent.jar -p conf -m 564884588@qq.com -m lixinsi -o http://x.x.x.x -s serverID
```



将生成密钥粘贴到网页，下一步



5.3配置mysql连接



1.如果从旧数据中导入，需要新建数据库，并且导入数据



```plain
#新建数据库信息为
数据库名称：confluence
字符集：utf8mb4
排序规则：utf8mb4_bin

#database URL
jabc:mysql://192.168.1.201:3306/confluence?serverTimezone=GMT%2B&useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false

#数据库用户名密码
root
lixinsi@123
```



6.常见问题解决



解决办法：



数据库配置中，修改mysql事务隔离级别



```plain
# vim /etc/my.cnf
```



加入下面配置



```plain
[mysqld]
transaction-isolation=READ-COMMITTED
```



重启mysql



```plain
systemctl restart mysqld
```



7.confluence配置



> 更新: 2022-12-07 14:14:36  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/vg5350471g41pgk7>