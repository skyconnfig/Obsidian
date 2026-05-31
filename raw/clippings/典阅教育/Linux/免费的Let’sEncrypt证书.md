# 免费的Let’s Encrypt证书

<font style="color:#000000;background-color:#FFFFFF;">一个比较离谱的事情发生了，我每年在阿里云搞得免费证书现在有效期只有3个月，相当于我TM每三个月就要去手动更新一下证书，之前的博客也写了SSL这个东西简直就是一本万利的事情（</font>[<font style="color:#000000;background-color:#FFFFFF;">局域网内搭建浏览器可信任的SSL证书</font>](https://www.tangyuecan.com/2021/12/17/%e5%b1%80%e5%9f%9f%e7%bd%91%e5%86%85%e6%90%ad%e5%bb%ba%e6%b5%8f%e8%a7%88%e5%99%a8%e5%8f%af%e4%bf%a1%e4%bb%bb%e7%9a%84ssl%e8%af%81%e4%b9%a6/)<font style="color:#000000;background-color:#FFFFFF;">），这种完全不能忍，所以拜拜了资本家，老子不用你了，免费证书不香吗？</font>

<font style="color:#000000;background-color:#FFFFFF;"></font>

<font style="color:#000000;background-color:#FFFFFF;">Let’s Encrypt就是免费证书的代表，这玩意几乎所有设备都支持，并且能申请通配证书，步骤如下：</font>

## <font style="color:#000000;background-color:#FFFFFF;">安装snapd，这是为了安装certbot的工具</font>
```plain
yum install snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
```

## <font style="color:#000000;background-color:#FFFFFF;">安装certbot，这个工具就是拿来申请证书的</font>
```plain
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
```

## <font style="color:#000000;background-color:#FFFFFF;">申请证书</font>
```plain
certbot certonly --manual --preferred-challenges dns
在运行这个命令之后会开始证书的申请步骤，具体如下：
如果需要提供邮箱就按照提示输入邮箱即可；
按照提示输出域名，用空格分隔多个域名
注意：tangyuecan.com和www.tangyuecan.com是两个不同的域名，如果使用通配域名就是*.tangyuecan.com
通过提示进行DNS验证，这里按照要求添加一个TXT解析即可
注意：连续超过5次解析失败，服务器在未来五个小时都无法继续申请
成功之后就会生成对应的证书文件；
```

## <font style="color:#000000;background-color:#FFFFFF;">使用证书</font>
<font style="color:#000000;background-color:#FFFFFF;">certbot 生成的证书文件很多，其中对于nginx等常规的web server就只有两个有用：</font>

+ <font style="color:#000000;background-color:#FFFFFF;">fullchain.pem：这个是证书文件，兼容大部分web server；</font>
+ <font style="color:#000000;background-color:#FFFFFF;">privkey.pem：这个是秘钥文件；</font>

<font style="color:#000000;background-color:#FFFFFF;">以nginx为例，最终使用证书配置如下：</font>

```plain
server
  {
      listen     443 ssl http2 default_server;
      listen[::]:443 ssl http2 default_server;
      
      server_name          tangyuecan.com;
      ssl_certificate     /ssl/fullchain.pem;
      ssl_certificate_key /ssl/privkey.pem;
      root                /var/www/html;
      index               index.php;
      
      location / {
try_files $uri $uri/ /index.php?$args;
      }
      
      location ~ \.php$ {
include fastcgi.conf;
fastcgi_intercept_errors on;
fastcgi_pass xxx.xxx.xxx.xxx:xxxx;
  }
}
```

## <font style="color:#000000;background-color:#FFFFFF;">自动更新证书</font>
<font style="color:#000000;background-color:#FFFFFF;">没有想到吧，还有这个功能，原理也很简单，但是使用上存在一个问题，每一次更新的证书的时候都需要对域名所有权进行一次校验，只有通过了校验Let’s Encrypt才会知道这个域名是你在管理，进而才会为你更新证书，上文使用DNS进行验证的话，运行renew进行重新校验可能是没法通过的，因为certbot无法访问你的DNS解析对吧，所以这里最佳方案是通过web服务器进行验证。</font>

<font style="color:rgb(206, 206, 206);background-color:rgb(39, 43, 51);"></font>

<font style="color:rgb(207, 213, 224);background-color:rgb(39, 43, 51);"></font>

```plain
ertbot certonly --webroot -w /var/www/example -d www.example.com -d example.com --dry-run
# 其中--dry-run的意思是测试，正式更新的时候去掉就行了；-w指的是webroot的路径，对应-d就是该路径下的域名，明显一个路径下有多个域名
```

<font style="color:#000000;background-color:#FFFFFF;">特别注意：如果你使用了泛域名解析就不能直接通过webroot进行更新证书，毕竟泛域名不大可能指向同一个webroot路径，这种情况下想要实现自动更新证书只有通过DNS插件才能实现，可以参考</font>[<font style="color:#000000;background-color:#FFFFFF;">这个项目</font>](https://github.com/tan9710630/certbot-dns-aliyun)



> 更新: 2024-03-04 10:26:35  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/zx7u9r310196lxlw>