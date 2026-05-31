# centos系统ssl证书生成

```bash
yum -y install make gcc zlib zlib-devel openssl openssl-devel pcre pcre-devel
yum -y install gcc wget automake autoconf libtool libxml2-devel libxslt-devel perl-devel perl-ExtUtils-Embed pcre-devel openssl-devel
```

### 1.证书目录
```bash
mkdir /usr/local/nginx/conf/ssl
```

下载证书安装包

```bash
wget https://www.openssl.org/source/openssl-1.1.1n.tar.gz
```

解压证书安装包

```bash
tar -vxf openssl-1.1.1n.tar.gz 
```

编译证书

```bash
./config --prefix=/usr/local/openssl threads zlib shared enable-camellia
```

安装证书

```bash
make && make install
```

查看证书版本

```bash
 openssl version
```



```bash
   mv /usr/bin/openssl /usr/bin/openssl.bak-$(date +%m%d)
   ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl
    echo "/usr/local/openssl/lib">>/etc/ld.so.conf
    ldconfig
```

### 2.生成证书
```bash
openssl genrsa -des3 -out server.key 2048

openssl req -new -key server.key -out server.csr -subj "/C=CN/ST=Hnnan/L=Changsha/O=Compa/OU=test/CN=192.168.5.147"


3.#去除密钥中的密码
 openssl rsa -in server.key -out server.key

 4.生成ssl证书有效期
 openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt
```



> 更新: 2024-02-23 13:04:26  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/xuu31hqmhi4u583f>