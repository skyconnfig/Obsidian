# SRS服务器

```bash
openssl req -new -key server.key -out server.csr -subj "/C=CN/ST=Zhejiang/L=Hangzhou/O=mofei/OU=mofei/CN=192.168.5.147"


rm -rf /usr/sbin/nginx /usr/lib64/nginx /etc/nginx /usr/share/nginx /usr/share/man/man8/nginx.8.gz

./configure --user=www --group=www --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module --with-http_gzip_static_module --with-http_sub_module --with-stream --with-stream_ssl_module --with-openssl-opt='enable-weak-ssl-ciphers'


#nginx配置文件路径
/usr/local/nginx/conf

nginx启动路径
/usr/local/nginx/sbin
./nginx

nginx源码编译路径
/usr/local/src/nginx-1.9.7

 ./configure --prefix=/usr/local/nginx --with-openssl=/usr/local/src/openssl-1.0.2d --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module

 ssl证书路径
 /usr/local/nginx/conf/ssl

 ssl证书生成
 1.openssl genrsa -des3 -out server.key 2048

 2.openssl req -new -key server.key -out server.csr -subj "/C=CN/ST=Hnnan/L=Changsha/O=Compa/OU=test/CN=192.168.5.147"

 3.#去除密钥中的密码
 openssl rsa -in server.key -out server.key

 4.生成ssl证书有效期
 openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt
Signature ok
subject=C = CN, ST = Shandong, L = Qingdao, O = Compa, OU = test, CN = 192.168.162.22
Getting Private key


域名：https://srs.dianyuesoft.com/
服务器：39.108.15.83
1985 8080

#srs开机自启动

启动：systemctl start firewalld.service

防火墙随系统开启启动  ： systemctl enable firewalld.service

关闭防火墙:systemctl disable firewalld.service

#srs路径
cd usr/local/src/srs/srs/trunk/etc/init.d/srs start
/etc/init.d/srs start

#srs配置文件路径
/usr/local/src/srs/srs/trunk/conf/srs.conf
[Unit]
Description=SRS Streaming Server
After=network.target

[Service]
Type=simple
# ExecStart为SRS可执行文件的路径和SRS配置文件的路径
# 请将/path/to/your/srs/executable替换为你的SRS可执行文件的实际路径
# 将/path/to/your/srs/config.conf替换为你的SRS配置文件的实际路径

ExecStart=/usr/local/src/srs/srs/trunk/etc/init.d/srs start -c /usr/local/src/srs/srs/trunk/conf/srs.conf
Restart=on-failure
# 请将srs_user替换为你希望SRS服务运行的用户
User=srs_user
# 请将srs_group替换为你希望SRS服务运行的用户组
Group=srs_group

[Install]
WantedBy=multi-user.target

```



```plain
/usr/local/src/srs/srs/trunk

```

```bash

#user  nobody;
worker_processes  1;

#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

#pid        logs/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       mime.types;
    default_type  application/octet-stream;

    #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    #                  '$status $body_bytes_sent "$http_referer" '
    #                  '"$http_user_agent" "$http_x_forwarded_for"';

    #access_log  logs/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;

    #gzip  on;

       server {

    #listen       80;
        listen       443 ssl http2;
        server_name  srs.dianyuesoft.com;
        ssl_certificate      /usr/local/nginx/conf/ssl/STAR.dianyuesoft.com.crt;
        ssl_certificate_key  /usr/local/nginx/conf/ssl/STAR.dianyuesoft.com.key;

        # For SRS homepage, console and players
        #   http://r.ossrs.net/console/
        #   http://r.ossrs.net/players/
        location / {
           proxy_pass http://47.112.192.191:8080/;
        }
        # For SRS streaming, for example:
        #   http://r.ossrs.net/live/livestream.flv
        #   http://r.ossrs.net/live/livestream.m3u8
        location ~ /.+/.*\.(flv|m3u8|ts|aac|mp3)$ {
           proxy_pass http://47.112.182.191:8080$request_uri;
        }
        # For SRS backend API for console.
        location /api/ {
           proxy_pass http://47.112.182.191:1985/api/;
        }
        # For SRS WebRTC publish/play API.
        location /rtc/ {
           proxy_pass http://47.112.182.191:1985/rtc/;
    }
        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }

        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
        #
        #location ~ \.php$ {
        #    proxy_pass   http://127.0.0.1;
        #}

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        #location ~ \.php$ {
        #    root           html;
        #    fastcgi_pass   127.0.0.1:9000;
        #    fastcgi_index  index.php;
        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        #    include        fastcgi_params;
        #}

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #    deny  all;
        #}
    }


    # another virtual host using mix of IP-, name-, and port-based configuration
    #
    #server {
    #    listen       8000;
    #    listen       somename:8080;
    #    server_name  somename  alias  another.alias;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}


    # HTTPS server
    #
    #server {
    #    listen       443 ssl;
    #    server_name  localhost;

    #    ssl_certificate      cert.pem;
    #    ssl_certificate_key  cert.key;

    #    ssl_session_cache    shared:SSL:1m;
    #    ssl_session_timeout  5m;

    #    ssl_ciphers  HIGH:!aNULL:!MD5;
    #    ssl_prefer_server_ciphers  on;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}


}

```



> 更新: 2025-08-08 17:22:41  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/edg030qouwlk4n0v>