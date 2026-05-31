# 编译安装openssl及安装完openssl后使用 ssh -V 查看依然是旧版openssl原因

[Centos升级openssh8.8p1](https://blog.csdn.net/qq_42249813/article/details/125871649)

1. 下载安装wget

```bash
yum -y install wget

```

##### <font style="color:rgb(79, 79, 79);">2. 获取openssl源码包</font>
```bash
wget https://www.openssl.org/source/openssl-1.1.1n.tar.gz
# 或前往官方下载后使用xftp传入服务器
# 官方链接：https://www.openssl.org/source/
```

##### <font style="color:rgb(79, 79, 79);">3.安装openssl 所需依赖</font>
```bash
yum -y install  gcc gcc-c++ openssl-devel libstdc++* libcap* wget pam-devel zlib-devel perl

```

##### <font style="color:rgb(79, 79, 79);">4. 解压编译openssl</font>
```bash
# 解压下载好的openssl源码包并进入其目录
tar -vxf openssl-1.1.1n.tar.gz 
cd openssl-1.1.1n
# 配置
./config --prefix=/usr/local/openssl threads zlib shared enable-camellia

# --prefix : 指定安装目录
# threads/no-threads : 是否编译支持多线程的库。默认支持。
# zlib | zlib-dynamic | no-zlib : 使用静态的zlib压缩库 | 使用动态的zlib压缩库 | 不使用zlib压缩功能。
# shared | no-shared : 是否生成动态连接库。
# enable-camellia : 算法

# 编译安装
make && make install


```

##### <font style="color:rgb(79, 79, 79);">5. 替换旧版openssl</font>
```bash
# 备份旧版openssl
mv /usr/bin/openssl /usr/bin/openssl.bak-$(date +%m%d)

# 新版openssl软链接到旧openssl位置
ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl
# /etc/ld.so.conf 文件记录了编译时使用的动态链接库的路径，告诉链接器去哪个路径下寻找链接时需要用到的库，如果找不到，就会提示链接错误。
echo "/usr/local/openssl/lib">>/etc/ld.so.conf
# ldconfig 命令用于在默认搜寻目录 /lib 和 /usr/lib 以及动态库配置文件 /etc/ld.so.conf 内所列的目录下，搜索出可共享的动态链接库。
ldconfig


```

##### <font style="color:rgb(79, 79, 79);">6. 查看openssl版本</font>
```bash
openssl version

```

##### <font style="color:rgb(79, 79, 79);">注：</font>
<font style="color:rgb(77, 77, 77);">安装完openssl后使用</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(199, 37, 78);background-color:rgb(249, 242, 244);">ssh -V</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">查看依然是旧版openssl， 是因为openssh是rpm/yum安装的调用的openssl依旧是旧版，不影响使用。</font>

<font style="color:rgb(77, 77, 77);">如果看不顺眼可以编译升级新版openssh解决。</font>



> 更新: 2024-02-23 10:13:31  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/brbhax5uki51alzo>