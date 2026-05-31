# 解决codex vsCode插件 Sign-in failed: {“code”:-32603… 问题

<font style="color:rgb(34, 34, 34);">bug:  
Sign-in failed: {“code”:-32603,“message”:“failed to start login server: 以一种访问权限不允许的方式做了一个访问套接字的尝试。 (os error 10013)”}</font>

<font style="color:rgb(34, 34, 34);">fix:  
</font><font style="color:rgb(34, 34, 34);">cmd 以管理员身份运行:  
</font>

```plain
netsh int ipv4 set dynamicport tcp start=49152 num=16384
netsh int ipv6 set dynamicport tcp start=49152 num=16384
```

_<font style="color:rgb(34, 34, 34);">重启电脑</font>_

<font style="color:rgb(34, 34, 34);">大概是你的电脑tcp端口问题。</font>

<font style="color:rgb(34, 34, 34);"></font>

```plain

netsh int ipv4 set dynamicport tcp start=49152 num=16384
netsh int ipv6 set dynamicport tcp start=49152 num=16384

重启电脑
```



> 更新: 2025-09-18 09:26:15  
> 原文: <https://www.yuque.com/lixinsi/srnvya/ifbwkqfdm88zo927>