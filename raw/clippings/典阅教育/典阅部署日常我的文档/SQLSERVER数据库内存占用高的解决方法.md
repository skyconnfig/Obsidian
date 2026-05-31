# SQLSERVER数据库内存占用高的解决方法

说是如果设置了自动统计功能，会有内存泄漏现象，并说微软有提供修复补丁，最后我找来找去，发现我现有数据库是sp2，可以直接升级到sp3，官方地址如下：[https://www.microsoft.com/zh-cn/download/confirmation.aspx?id=44271](https://www.microsoft.com/zh-cn/download/confirmation.aspx?id=44271)



于是在备机做了测试，能够顺利的升级，升级完需要重启。

<font style="color:rgb(77, 77, 77);">后来还是去官方，看到一点建议，说是可以把一个进程号的进程全部分离出来，然后逐个观察，到底哪个会消耗内存。于是乎，我执行了一堆如下命令，把能分离的都做了分离，不过有一些提示失败。弄完了以后，需要重启，但是数据库又不能宕机。所以暂时搁置了。</font>

```plain
C:\Users\Administrator>sc config seclogon type= own
[SC] ChangeServiceConfig 成功
 
C:\Users\Administrator>sc config SENS type= own
[SC] ChangeServiceConfig 成功
 
C:\Users\Administrator>sc config SessionEnv type= own
[SC] ChangeServiceConfig 成功
 
C:\Users\Administrator>sc config ShellHWDetection type= own
[SC] ChangeServiceConfig 成功
 
C:\Users\Administrator>sc config Themes type= own
[SC] ChangeServiceConfig 成功
 
C:\Users\Administrator>sc config UserManager type= own
[SC] ChangeServiceConfig 成功
 
C:\Users\Administrator>sc config Winmgmt type= own
[SC] ChangeServiceConfig 成功
```



> 更新: 2023-06-01 10:49:34  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/kug47gcv6ow2wxxv>