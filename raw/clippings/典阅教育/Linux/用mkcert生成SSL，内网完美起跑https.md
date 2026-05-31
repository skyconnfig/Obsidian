# 用mkcert生成SSL，内网完美起跑https

linux系统：



在CentOS和Fedora中安装mkcert类似于Ubuntu/Debian安装，只需要先安装nss-tools工具：

```powershell
sudo yum install nss-tools
```

安装完成后，下载二进制包，截止至2020-5-9，最新版本为1.4.1：

```powershell
wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64
```

下载文件后，使文件可执行并将二进制文件放在/usr/loa/bin下

```powershell
chmod +x mkcert
sudo mv mkcert /usr/local/bin
```

二、mkcert的使用方法

1、安装CA根证书到本地

```powershell
mkcert -install
```

2、生成证书

```powershell
mkcert 127.0.0.1 localhost //后面还可以继续空格添加其他域名或IP地址，默认是pem格式
mkcert -pkcs12 192.168.10.123 //生成p12格式的正式iis可以用，默认密码为：“changeit”
mkcert -client 192.168.10.123 //客户端证书，默认是pem格式
mkcert -pkcs12 -client 192.168.10.123 //生成p12格式客户端证书，win用户可以直接导入，默认密码为：“changeit”
```

更多的使用方法，可以用以下命令查看

```powershell
mkcert -help

Usage of mkcert:

$ mkcert -install
Install the local CA in the system trust store.

$ mkcert example.org
Generate "example.org.pem" and "example.org-key.pem".

$ mkcert example.com myapp.dev localhost 127.0.0.1 ::1
Generate "example.com+4.pem" and "example.com+4-key.pem".

$ mkcert "*.example.it"
Generate "_wildcard.example.it.pem" and "_wildcard.example.it-key.pem".

$ mkcert -uninstall
Uninstall the local CA (but do not delete it).

Advanced options:

-cert-file FILE, -key-file FILE, -p12-file FILE
Customize the output paths.

-client
Generate a certificate for client authentication.

-ecdsa
Generate a certificate with an ECDSA key.

-pkcs12
Generate a ".p12" PKCS #12 file, also know as a ".pfx" file,
containing certificate and key for legacy applications.

-csr CSR
Generate a certificate based on the supplied CSR. Conflicts with
all other flags and arguments except -install and -cert-file.

-CAROOT
Print the CA certificate and key storage location.

$CAROOT (environment variable)
Set the CA certificate and key storage location. (This allows
maintaining multiple local CAs in parallel.)

$TRUST_STORES (environment variable)
A comma-separated list of trust stores to install the local
root CA into. Options are: "system", "java" and "nss" (includes
Firefox). Autodetected by default.
```

三、其他

mkcert不一定要在服务器上安装生成，只要把生成的证书导入或部署到web服务器上就可以了，然后把生成出来的client证书安装到各客户端电脑上即可。



以IIS为例：将生成出来的192.168.10.123.p12文件，copy到服务器上，打开IIS管理器，在【服务器证书】里，直接导入即可。再把192.168.10.123-client.p12下发给个客户端电脑，直接双击安装即可。



注意，p12格式证书的默认密码为：changeit



如果需要更改这个默认密码，我能想到的就是生成pem格式，然后在[https://www.chinassl.net/ssltools/convert-ssl.html](https://www.chinassl.net/ssltools/convert-ssl.html)里转换格式，顺便把密码改了！



 



当你的才华还撑不起你的野心的时候，你就应该静下心来学习； 当你的能力还驾驭不了你的目标时，就应该沉下心来历练。

-----------------------------------

用mkcert生成SSL，内网完美起跑https

[https://blog.51cto.com/u_15064643/4562435](https://blog.51cto.com/u_15064643/4562435)



> 更新: 2024-03-06 11:42:21  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/tp33oor5euuv2ro3>