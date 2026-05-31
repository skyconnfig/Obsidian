# IIS容错或者应用池自动停止

![1654048658363-1093f878-a7ee-4f59-99bf-9233d345c4e3.png](./img/Nkd9q3VNMpVDwdvh/1654048658363-1093f878-a7ee-4f59-99bf-9233d345c4e3-307041.png)



![1654048706179-288ea6f0-fff7-449b-8a55-f35e340d85c1.png](./img/Nkd9q3VNMpVDwdvh/1654048706179-288ea6f0-fff7-449b-8a55-f35e340d85c1-568251.png)



![1654048727438-8f419625-47bc-44b0-bf89-71187dfd94f3.png](./img/Nkd9q3VNMpVDwdvh/1654048727438-8f419625-47bc-44b0-bf89-71187dfd94f3-495947.png)

## **<font style="color:rgb(79, 79, 79);">背景：</font>**
<font style="color:rgb(77, 77, 77);">IIS7.5是微软推出的最新平台</font>[IIS](https://so.csdn.net/so/search?q=IIS&spm=1001.2101.3001.7020)<font style="color:rgb(77, 77, 77);">，性能也较以前有很大的提升，但是默认的设置配不适合很大的请求。但是我们可以根据实际的需要进行IIS调整，使其性能更佳，支持同时10万个请求。</font>

<font style="color:rgb(77, 77, 77);">以下方案，通过对IIS7的配置进行优化，调整IIS7应用池的队列长度，请求数限制，TCPIP连接数等方面，从而使WEB服务器的性能得以提升，保证WEB访问的访问流畅。</font>

## **<font style="color:rgb(79, 79, 79);">解决方案：</font>**
**<font style="color:rgb(77, 77, 77);">步骤一：调整IIS的应用程序池队列长度。</font>**

<font style="color:rgb(77, 77, 77);">在【应用程序池】列表中，选择你相应网站所使用的应用程序池，将原来的队列长度由1000改为65535。当然这里的队列长度你可以根据自己的访问用户*1.5来设置，例如：你有2000用户，你此处就可以设置为3000(3000=2000用户数*1.5)，</font>[官方参考](http://technet.microsoft.com/zh-cn/library/dd441171%28v=office.13%29.aspx)

<font style="color:rgb(77, 77, 77);">设置如下图：</font>

<font style="color:rgb(77, 77, 77);"></font>![1654048777261-ffe20686-3eb8-449d-b734-2e7ef81f81f6.png](./img/Nkd9q3VNMpVDwdvh/1654048777261-ffe20686-3eb8-449d-b734-2e7ef81f81f6-162954.png)

<font style="color:rgb(77, 77, 77);"></font>

**<font style="color:rgb(77, 77, 77);">步骤二：调整IIS的appConcurrentRequestLimit值</font>**

<font style="color:rgb(77, 77, 77);">打开cmd命令，运行命令：c:\Windows\System32\inetsrv\appcmd.exe set config /section:serverRuntime /appConcurrentRequestLimit:100000</font>

![1654048777236-bc683175-c021-47db-80f1-6bb4b3b5df7d.png](./img/Nkd9q3VNMpVDwdvh/1654048777236-bc683175-c021-47db-80f1-6bb4b3b5df7d-898543.png)

![1654048777287-03915c0f-ecce-419b-b63a-6e17ea0d2f5f.png](./img/Nkd9q3VNMpVDwdvh/1654048777287-03915c0f-ecce-419b-b63a-6e17ea0d2f5f-692319.png)

<font style="color:rgb(77, 77, 77);"></font>

**<font style="color:rgb(77, 77, 77);">步骤三：修改ASP.NET请求队列限制即调整machine.config中的processModel>RequestQueueLimit</font>**

<font style="color:rgb(77, 77, 77);">1、单击“开始”，然后单击“运行”。</font>

<font style="color:rgb(77, 77, 77);">2、在“运行”对话框中，键入 notepad %systemroot%\Microsoft.Net\Framework64\v4.0.30319\CONFIG\machine.config，然后单击“确定”。(不同的.NET版本路径不一样，你可以选择你自己当前想设置的.NET版本的config)</font>

<font style="color:rgb(77, 77, 77);">3、找到如下所示的 processModel 元素：<processModel autoConfig="true" /></font>

<font style="color:rgb(77, 77, 77);">4、将 processModel 元素替换为以下值：<processModel enable="true" requestQueueLimit="15000" /></font>

![1654048777308-3c3b465f-8f21-4541-b619-cc41ffe36748.png](./img/Nkd9q3VNMpVDwdvh/1654048777308-3c3b465f-8f21-4541-b619-cc41ffe36748-609091.png)

<font style="color:rgb(77, 77, 77);">5、保存并关闭 Machine.config 文件。</font>

<font style="color:rgb(77, 77, 77);"></font>

**<font style="color:rgb(77, 77, 77);">步骤四：修改注册表，调整IIS支持的并发TCPIP连接数</font>**

<font style="color:rgb(77, 77, 77);">在cmd命令中运行命令：reg add HKLM\System\CurrentControlSet\Services\HTTP\Parameters /v MaxConnections /t REG_DWORD /d 100000，当然也可以手动去注册表修改</font>

![1654048777308-b13eda20-5b39-4a33-b6a1-1f1f9ae230af.png](./img/Nkd9q3VNMpVDwdvh/1654048777308-b13eda20-5b39-4a33-b6a1-1f1f9ae230af-638184.png)

<font style="color:rgb(77, 77, 77);">可在注册表中查看</font>

![1654048778153-688710f7-c5eb-48e4-a198-7dec5f4641ba.png](./img/Nkd9q3VNMpVDwdvh/1654048778153-688710f7-c5eb-48e4-a198-7dec5f4641ba-199719.png)

<font style="color:rgb(77, 77, 77);">至此，IIS的调整优化就完成了，可以同时支持10W个请求。</font>



> 更新: 2024-06-14 15:37:19  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/gn34tc>