# Windows服务器设置自启动

网址：[https://www.pcsoft.com.cn/soft/211243.html](https://www.pcsoft.com.cn/soft/211243.html)

nssm简单操作  
通过接触asp.net.core之后，使⽤asp.net core 写的程序想以windows服务运⾏。此时nssm这个⼯具就可以很轻松的完成这项⼯作。⾸先，下载nssm  
第⼀种  
命令  
nssm install solr  
然后到服务⾥启动solr，并设置为⾃动  
Ctrl+Shift+Esc（说明：Esc⼀般在键盘左上⽅）  
[http://localhost:8983/solr](http://localhost:8983/solr)  
第⼆种 nssm的基本的使⽤命令  
删除服务  
Windows删除服务  
sc delete 服务名  
nssm删除服务  
nssm remove 服务名  
nssm常⽤命令：  
nssm install servername //创建servername服务  
nssm start servername //启动服务  
nssm stop servername //暂停服务  
nssm restart servername //重新启动服务  
nssm remove servername //删除创建的servername服务  
Application标签设置：  
Application Path: 选择系统安装的node.exe。  
Startup directory: 选择nodejs项⽬的根⽬录。  
Arguments: 输⼊启动参数，如默认的express项⽬的参数为./bin/www  
上述步骤操作完成，即可点击Install service来注册服务。我们在系统的服务中即可找到刚刚注册的服务。  
在系统服务中找到刚刚注册的服务，右键属性 - 恢复即可设置此服务挂掉重启等内容。  
第三种 nssm春命令操作  
NSSM命令  
图形界⾯操作很简单，基本看了就会，在此不再赘述，下⾯主要介绍命令⾏⽤法



1. 安装服务  
nssm install   [...]  
⽰例:
2. nssm install celery-demo-worker "c:\Program Files\Python35\Scripts\celery.exe"
3. nssm set celery-demo-worker AppDirectory d:\celery-demo
4. nssm set celery-demo-worker AppParameters -A run worker --loglevel=debug -c 1
5. 启动服务  
nssm start 
6. 停⽌服务  
nssm stop 
7. 重启服务  
nssm restart 
8. 查看服务状态  
nssm status 
9. ⼿动轮转⽇志⽂件  
nssm rotate 
10. 删除服务  
nssm remove  [confirm]  
加confirm后不会弹确认窗⼝
11. 获取某项配置信息  
nssm get   [subparameter]
12. 单独设置某项配置  
nssm set   [subparameter] value
13. 重置某项配置  
nssm reset   [subparameter]
14. 暂停/继续服务  
nssm pause   
nssm continue 



> 更新: 2022-11-25 09:58:32  
> 原文: <https://www.yuque.com/lixinsi/srgrkk/cg9xz69lp22n7nrs>