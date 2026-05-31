# nginx反向代理配置y

tomcat：上传资源

通过第三方工具在tomocat安装目录

/root/app/tomcat/apache-tomcat-10.0.21/webapps

```shell
mkdir
```



### nginx windows 负载均衡配置
```bash
events {
    worker_connections 1024;  # 每个 worker 进程的最大连接数
}

http {
    # 其他配置项...
	 upstream backend {
    server 192.168.5.176:18001;
		server 192.168.5.176:18002;
		server 192.168.5.176:18003;
		server 192.168.5.176:18004;
		server 192.168.5.176:18005;
		server 192.168.5.176:18006;
    }
 
    server {
        listen 18000;


        location / {
            proxy_pass http://backend;  # 代理到本地端口 18001
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }
}
```



> 更新: 2024-08-02 13:53:40  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/lycvg4>