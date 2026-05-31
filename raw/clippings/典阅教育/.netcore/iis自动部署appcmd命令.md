# iis自动部署appcmd命令

```bash
跳到iis命令工具所在目录下 
cd C:\Windows\System32\inetsrv
::删除指定web站点
appcmd.exe deletesite "Default Web Site"
appcmd.exe deletesite "ppsweb"
::删除指定应用程序池
appcmd deleteapppool "ppsweb"
appcmd deleteapppool "ppswebservice"
appcmd deleteapppool "ChartPic"
appcmd deleteapppool "PipelinePath"

::添加应用程序池
appcmd add apppool /name:"ppsweb"
::修改应用程序池启动模式
appcmd.exe set APPPOOL "ppsweb"/config /startMode:"AlwaysRunning"  /commit:apphost
::修改应用程序池标示
appcmd.exe set APPPOOL "ppsweb"/processModel.identityType:"SpecificUser"/processModel.userName:"*****"/processModel.password:"*****"  /commit:apphost
::设置固定时间间隔回收应用程序池
appcmd.exe set APPPOOL "ppsweb"/recycling.periodicRestart.time:"00:00:00"  /commit:apphost
::设置指定时间回收应用程序池
appcmd.exe set APPPOOL "ppsweb"/+"recycling.periodicRestart.schedule.[value='00:30:00']"/commit:apphost
::关闭快速故障防护功能
appcmd.exe set APPPOOL "ppsweb"/failure.rapidFailProtection:"False"  /commit:apphost

appcmd add apppool /name:"ppswebservice"
appcmd.exe set APPPOOL "ppswebservice"/config /startMode:"AlwaysRunning"  /commit:apphost
appcmd.exe set APPPOOL "ppswebservice"/processModel.identityType:"SpecificUser"/processModel.userName:"*****"/processModel.password:"*****"  /commit:apphost
appcmd.exe set APPPOOL "ppswebservice"/recycling.periodicRestart.time:"00:00:00"  /commit:apphost
appcmd.exe set APPPOOL "ppswebservice"/+"recycling.periodicRestart.schedule.[value='00:30:00']"/commit:apphost
appcmd.exe set APPPOOL "ppswebservice"/failure.rapidFailProtection:"False"  /commit:apphost
appcmd.exe set APPPOOL "ppswebservice"/enable32BitAppOnWin64:"True"  /commit:apphost

::添加web站点
appcmd.exe set config  -section:system.applicationHost/sites /+"[name='ppsweb',id='2',serverAutoStart='True']"/commit:apphost
::绑定端口访问方式
appcmd.exe set config  -section:system.applicationHost/sites /+"[name='ppsweb',id='2',serverAutoStart='True'].bindings.[protocol='http',bindingInformation='*:80:']"/commit:apphost
::绑定端口访问方式
appcmd.exe set config  -section:system.applicationHost/sites /+"[name='ppsweb',id='2',serverAutoStart='True'].bindings.[protocol='https',bindingInformation='*:443:']"/commit:apphost
::添加web站点默认运行路径和应用程序池
appcmd.exe set config  -section:system.applicationHost/sites /+"[name='ppsweb',id='2',serverAutoStart='True'].[path='/',applicationPool='ppsweb',serviceAutoStartEnabled='True',preloadEnabled='True']"/commit:apphost
::添加web站点的应程序路径
appcmd.exe set config  -section:system.applicationHost/sites /+"[name='ppsweb',id='2',serverAutoStart='True'].[path='/',applicationPool='ppsweb',serviceAutoStartEnabled='True',preloadEnabled='True'].[path='/',physicalPath='C:\inetpub\wwwroot\ppsweb']"/commit:apphost
::添加web子站点方式
appcmd.exe set config  -section:system.applicationHost/sites /+"[name='ppsweb',id='2',serverAutoStart='True'].[path='/WebService',applicationPool='ppswebservice',serviceAutoStartEnabled='True',preloadEnabled='True']"/commit:apphost

appcmd.exe set config  -section:system.applicationHost/sites /+"[name='ppsweb',id='2',serverAutoStart='True'].[path='/WebService',applicationPool='ppswebservice',serviceAutoStartEnabled='True',preloadEnabled='True'].[path='/',physicalPath='C:\inetpub\wwwroot\ppsweb\WebService']"/commit:apphost
::修改web站点单个请求的大小
appcmd.exe set config  -section:system.webServer/asp /limits.maxRequestEntityAllowed:"20000000"  /commit:apphost
::修改web站点允许上传单个文件大小
appcmd.exe set config  -section:system.webServer/serverRuntime /uploadReadAheadSize:"20971520"  /commit:apphost

pause

AppCmd.exe工具所在目录 C:\windows\sytstem32\inetsrv\目录下，所以执行命令前，先把当前目录切换到该目录下：

cd C:\Windows\System32\inetsrv
 

创建iis站点：
appcmd add site /name:"MyTestSite1" /bindings:http/*:8990: /physicalPath:"E:\TestSite\Site1"
解释：

/name	(必需) 站点名称
/bindings	绑定列表
/physicalPath	站点的物理路径
 

 

 

 
创建应用程序池：
appcmd add apppool /name:MyTestSite1 /managedRuntimeVersion:v4.0 /managedPipelineMode:Integrated /enable32BitAppOnWin64:true /processModel.identityType:LocalSystem
解释：

/managedRuntimeVersion	是.net Framework的版本 如：v1.0 v1.1或v2.0等
/managedPielineMode	托管管道模式：Classic经典模式，Integrated集成模式
/enable32BitAppOnWin64	是否启用32位应用程序
/processModel.identityType	进程模型--标识
 

 

 

 
 

设置站点的应用程序池：
（目前还没找到怎么在创建站点时指定应用程序池）

appcmd set site /site.name:MyTestSite1 /[path='/'].applicationPool:MyTestSite1
 

删除站点及应用程序池：
appcmd delete site /site.name:MyTestSite1
appcmd delete apppool /apppool.name:MyTestSite1
 

停止、启动 站点、应用程序池：
appcmd stop site "MyTestSite1"
appcmd start site "MyTestSite1"
    
appcmd stop apppool "MyTestSite1"
appcmd start apppool "MyTestSite1"
 

列出所有的站点、应用程序池：
appcmd list sites
appcmd list apppools
```





> 更新: 2022-12-04 07:30:03  
> 原文: <https://www.yuque.com/lixinsi/bmtt6t/ssunql>