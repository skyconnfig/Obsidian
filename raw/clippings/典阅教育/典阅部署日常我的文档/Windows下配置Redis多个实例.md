# Windows下配置Redis多个实例

# <font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">方法一：新建目录创建Redis实例</font>
<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">1.将你的redis安装目录复制一份，命名为Redis6380</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">2.用命令行CMD工具进入到该目录下</font>

![1744683215156-27c940df-9d5d-4f51-8a4c-fe790756f1e7.png](./img/HOczx3ukTggYW5Wr/1744683215156-27c940df-9d5d-4f51-8a4c-fe790756f1e7-299029.png)

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">3.执行创建redis6380服务的命令：</font>

<font style="color:rgb(0, 128, 0);background-color:rgb(254, 254, 242);">redis-server.exe --service-install redis.windows-service.conf --service-name redis6380 --port 6380 </font>

![1744683215178-01748b24-32fc-44b1-a32c-b1c85d419153.png](./img/HOczx3ukTggYW5Wr/1744683215178-01748b24-32fc-44b1-a32c-b1c85d419153-025348.png)

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">4.启动redis6380服务，可以打开服务管理器手动启动，也可以运行命令：</font>

<font style="color:rgb(0, 128, 0);background-color:rgb(254, 254, 242);">redis-server.exe --service-start --service-name redis6380</font>

![1744683215108-71eb9cf3-c0f9-4bf9-a941-7540b73f6520.png](./img/HOczx3ukTggYW5Wr/1744683215108-71eb9cf3-c0f9-4bf9-a941-7540b73f6520-562924.png)

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">5.那么用RDM工具连接新6380端口的redis即可，账号密码与原redis一样。执行flushall清空新实例。</font>

# <font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">方法二：在同一目录下新建多实例</font>
<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">1、复制 redis.windows-service.conf 命名为</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">redis.windows-service-6380.conf</font>

![1744683215120-ceb494bb-65bf-4ad7-8f36-40c12aca952f.png](./img/HOczx3ukTggYW5Wr/1744683215120-ceb494bb-65bf-4ad7-8f36-40c12aca952f-734281.png)

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">2、修改此配置文件中的配置属性</font>

![1744683215126-b704ed6a-e952-406b-a687-3dd902553341.png](./img/HOczx3ukTggYW5Wr/1744683215126-b704ed6a-e952-406b-a687-3dd902553341-185830.png)

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);"># 本地数据库名称</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">dbfilename dump-6380.rdb </font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);"># 日志文件</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">logfile "logs/server_log_6380.txt"</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);"># 日志输出</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">syslog-enabled yes</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);"># 登录认证密码，也可以不设置</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">requirepass 123456</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">3、启动cmd命令行，执行</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">redis-server.exe --service-install redis.windows-service-6380.conf --service-name redis6380 --port 6380 </font>

![1744683215534-76d1f150-74ba-4026-8ada-f6adc88cfa43.png](./img/HOczx3ukTggYW5Wr/1744683215534-76d1f150-74ba-4026-8ada-f6adc88cfa43-619177.png)

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">4、创建后执行命令，启动服务</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">redis-server.exe --service-start --service-name redis6380</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">5、cmd执行命令测试登录</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">redis-cli.exe -h 127.0.0.1 -p 6380</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">若设置了requirepass 在登录后执行 auth <密码>进行认证</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">6、若需要删除实例服务则执行</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(254, 254, 242);">redis-server.exe --service-uninstall --service-name redis6380</font>



> 更新: 2025-04-15 10:13:45  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/kvwvxdb5lny32lw5>