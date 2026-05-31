# C# System.Net.HttpListenerException:“拒绝访问”

**<font style="color:rgb(77, 77, 77);">问题描述：</font>**<font style="color:rgb(77, 77, 77);"> 在使用C#的System.Net.HttpListener进行客户端推送消息监听时，出现</font>_**<font style="color:rgb(77, 77, 77);">System.Net.HttpListenerException:“拒绝访问”</font>**_<font style="color:rgb(77, 77, 77);"> 问题，现将解决方案记录一下，给遇到相同问题的朋友提供参考。</font>

**<font style="color:rgb(77, 77, 77);">具体代码：</font>**

```sql
httpobj = new System.Net.HttpListener();
//定义url及端口号，通常设置为配置文件
httpobj.Prefixes.Add("http://+:8080/");
//启动监听器
httpobj.Start();

```

**<font style="color:rgb(77, 77, 77);">解决方案如下：</font>**  
<font style="color:rgb(77, 77, 77);">1、以管理员权限打开CMD命令行</font>  
<font style="color:rgb(77, 77, 77);">2、先删除可能存在的错误urlacl，这里的*号代指localhost、127.0.0.1、192.168.199.X本地地址和+号等</font>

```sql
命令：netsh http delete urlacl url=http://+:8080/ 
```

<font style="color:rgb(77, 77, 77);">3、将上面删除的*号地址重新加进url，user选择所有人</font>

```sql
命令：netsh http add urlacl url=http://+:8080/  user=Everyone
```

<font style="color:rgb(77, 77, 77);">4、CMD配置防火墙</font>

```sql
netsh advfirewall firewall Add rule name=\"命令行Web访问8080\" dir=in protocol=tcp localport=8080 action=allow

```

<font style="color:rgb(77, 77, 77);">5、通过输入命令：</font>_**<font style="color:rgb(77, 77, 77);">netsh http show urlacl</font>**_<font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">查看新配置urlacl是否配置成功</font>

<font style="color:rgb(77, 77, 77);">经过如上设置服务端就可以以httpListener.Prefixes.</font><font style="color:rgb(78, 161, 219) !important;">Add</font><font style="color:rgb(77, 77, 77);">(“http://+:8080/”);监听地址开启监听。客户端可以通过访问服务端</font>[<font style="color:rgb(252, 85, 49);">8080端口</font>](https://so.csdn.net/so/search?q=8080%E7%AB%AF%E5%8F%A3&spm=1001.2101.3001.7020)<font style="color:rgb(77, 77, 77);">。服务端本机也可以在浏览器中以localhost和127.0.0.1访问自身http服务器。</font>



> 更新: 2025-09-16 16:49:29  
> 原文: <https://www.yuque.com/lixinsi/ynhoz5/kow0gk6brqkms2xd>