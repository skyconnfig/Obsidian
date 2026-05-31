# 内网映射外网nginx配置文件

```yaml

#user  nobody;
worker_processes  1;

#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

#pid        logs/nginx.pid;


events {
    worker_connections  10240;
}


http {
	server_names_hash_max_size 1024;
    server_names_hash_bucket_size 64;
    include       mime.types;
    default_type  application/octet-stream;

    #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    #                  '$status $body_bytes_sent "$http_referer" '
    #                  '"$http_user_agent" "$http_x_forwarded_for"';

    #access_log  logs/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  650;
    client_max_body_size  200M;
    #gzip  on;
	
	server {
        listen 443 ssl;
        server_name ai.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://220.168.108.126:2000;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	server {
        listen 443 ssl;
        server_name rgznszr02.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://220.168.108.126:20010;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	server {
        listen 443 ssl;
        server_name znt.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://220.168.108.126:3000/;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	server {
        listen 443 ssl;
        server_name wst.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://220.168.108.126:7860/;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	
	server {
		listen 443 ssl;
        server_name rgznszr02api.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location /recognition{
        proxy_pass http://220.168.108.126:20011;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";
    }
    }

	
	server {
        listen 443 ssl;
        server_name popgpt.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://113.240.111.232:3000;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	
	server {
        listen 443 ssl;
        server_name dygpt.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://220.168.108.126:2001;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	
	server {
        listen 443 ssl;
        server_name sxgsaijr.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://175.12.105.102:1021;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	server {
        listen 443 ssl;
        server_name nxcjaijr.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://175.12.105.102:1045;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	server {
        listen 443 ssl;
        server_name aijrtzkj.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://120.79.252.146:10000;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	server {
        listen 443 ssl;
        server_name scoringserver.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://220.168.108.126:19466;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
		proxy_connect_timeout 600s;       # 设置连接超时时间为30秒
        proxy_read_timeout 600s;         # 设置读取超时时间为60秒
        proxy_send_timeout 600s;         # 设置发送超时时间为60秒
    }
    }
	
	server {
        listen 443 ssl;
        server_name 2025aijr02.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://175.12.105.102:1166;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	server {
        listen 443 ssl;
        server_name 2025aijr01.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://175.12.105.102:1063;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	server {
        listen 443 ssl;
        server_name jsckaijr.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://175.12.105.102:1104;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	server {
        listen 443 ssl;
        server_name t2aijr.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://175.12.105.102:1104;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	server {
        listen 443 ssl;
        server_name dsdyfastgpt.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://8.140.27.38:3100;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	server {
        listen 443 ssl;
        server_name dsdybsfastgpt.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://8.140.244.188:3100;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	
	
	server {
    listen 443 ssl;
    server_name aitrainingdhuman.dianyueyun.com;

    ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://220.168.108.126:19088;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
	}
   }
   
   server {
    listen 443 ssl;
    server_name aitrainingfront.dianyueyun.com;

    ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://220.168.108.126:19089;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
	}
   }
   
   server {
    listen 443 ssl;
    server_name aitrainingbackend.dianyueyun.com;

    ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://220.168.108.126:19090;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
	}
   }	
	
	
	server {
        listen 443 ssl;
        server_name aiszr.dianyueyun.com;
        
        ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
        ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径        
        
        # 其他SSL配置参数
        ssl_protocols TLSv1.2 TLSv1.3;  # 支持的协议版本
        ssl_ciphers HIGH:!aNULL:!MD5;  # 加密套件
        ssl_prefer_server_ciphers on;  # 优先使用服务器端的加密套件
        
       location / {
        proxy_pass http://120.24.218.230:9998;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
	server {
    listen 443 ssl;
    server_name dhumanBg.dianyueyun.com;

    ssl_certificate cert/STAR.dianyueyun.com.crt;  # 证书文件路径
    ssl_certificate_key cert/STAR.dianyueyun.com.key;  # 私钥文件路径 

    # 关键：WebSocket 反代
    location /recognition {
        proxy_pass http://220.168.108.126:2200;
        proxy_http_version 1.1;

        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
   }
   
   
   
   
	
	server {
        listen 27017;
        server_name 1.13.16.249;       
        
       location / {
        proxy_pass http://220.168.108.126:27010;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    }
	
}

```



> 更新: 2026-01-30 15:56:43  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/gt8e25s10ldezg50>