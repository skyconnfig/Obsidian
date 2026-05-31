# iis添加网站bat脚本以及数据库还原脚本

```bash
@echo off
  
  echo ------------------------------------------------------------------------------
  echo -----------------------Please Enter IIS Web------------------------------------
  echo ------------------------------------------------------------------------------
 
@echo off
@echo off
  
  echo ------------------------------------------------------------------------------
  echo -----------------------创建大堂经理------------------------------------
  echo ------------------------------------------------------------------------------
 
@echo off
CD %systemroot%\system32\inetsrv

REM 添加新站点并启用 Windows 身份验证
MKDIR D:\dianyueruanjian
APPCMD add site /name:Blogs /bindings:"http/*:9001:" /physicalPath:"C:\Blogs"
APPCMD set config "Blogs" -section:system.webServer/security/authentication/windowsAuthentication /enabled:"True"  /commit:apphost

REM 创建一个虚拟目录
MKDIR C:\Blogs\Technology 
APPCMD add vdir /app.name:"Blogs/" /path:/Technology /physicalPath:D:\dianyueruanjian

REM 建一个由虚拟目录名称限定的应用程序池
APPCMD add apppool /name:大堂经理
REM 配置应用程序池
APPCMD set apppool "Technology.JoeBuschmann" /managedRuntimeVersion:v4.0 /processModel.pingingEnabled:false /processModel.identityType:NetworkService

REM 创建应用程序
MKDIR C:\Blogs\Technology\JoeBuschmann
APPCMD add app /site.name:"Blogs" /path:/Technology/JoeBuschmann /physicalPath:C:\Blogs\Technology\JoeBuschmann

REM 配置应用程序
APPCMD set app "Blogs/Technology/JoeBuschmann" /applicationPool:Technology.JoeBuschmann



@echo off
  
  echo ------------------------------------------------------------------------------
  echo --------------------------创建理财经理站点------------------------------------
  echo ------------------------------------------------------------------------------
 
@echo off
EM 添加新站点并启用 Windows 身份验证
MKDIR C:\Blogs
APPCMD add site /name:Blogs /bindings:"http/*:81:" /physicalPath:"C:\Blogs"
APPCMD set config "Blogs" -section:system.webServer/security/authentication/windowsAuthentication /enabled:"True"  /commit:apphost

REM 创建一个虚拟目录
MKDIR C:\Blogs\Technology 
APPCMD add vdir /app.name:"Blogs/" /path:/Technology /physicalPath:C:\Blogs\Technology

REM 建一个由虚拟目录名称限定的应用程序池
APPCMD add apppool /name:Technology.JoeBuschmann

REM 配置应用程序池
APPCMD set apppool "Technology.JoeBuschmann" /managedRuntimeVersion:v4.0 /processModel.pingingEnabled:false /processModel.identityType:NetworkService

REM 创建应用程序
MKDIR C:\Blogs\Technology\JoeBuschmann
APPCMD add app /site.name:"Blogs" /path:/Technology/JoeBuschmann /physicalPath:C:\Blogs\Technology\JoeBuschmann

REM 配置应用程序
APPCMD set app "Blogs/Technology/JoeBuschmann" /applicationPool:Technology.JoeBuschmann

@echo off
  
  echo ------------------------------------------------------------------------------
  echo --------------------------创建综合柜员站点------------------------------------
  echo ------------------------------------------------------------------------------
 
@echo off
EM 添加新站点并启用 Windows 身份验证
MKDIR C:\Blogs
APPCMD add site /name:Blogs /bindings:"http/*:81:" /physicalPath:"C:\Blogs"
APPCMD set config "Blogs" -section:system.webServer/security/authentication/windowsAuthentication /enabled:"True"  /commit:apphost

REM 创建一个虚拟目录
MKDIR C:\Blogs\Technology 
APPCMD add vdir /app.name:"Blogs/" /path:/Technology /physicalPath:C:\Blogs\Technology

REM 建一个由虚拟目录名称限定的应用程序池
APPCMD add apppool /name:Technology.JoeBuschmann

REM 配置应用程序池
APPCMD set apppool "Technology.JoeBuschmann" /managedRuntimeVersion:v4.0 /processModel.pingingEnabled:false /processModel.identityType:NetworkService

REM 创建应用程序
MKDIR C:\Blogs\Technology\JoeBuschmann
APPCMD add app /site.name:"Blogs" /path:/Technology/JoeBuschmann /physicalPath:C:\Blogs\Technology\JoeBuschmann

REM 配置应用程序
APPCMD set app "Blogs/Technology/JoeBuschmann" /applicationPool:Technology.JoeBuschmann

@echo off
  
  echo ------------------------------------------------------------------------------
  echo --------------------------创建客户经理站点------------------------------------
  echo ------------------------------------------------------------------------------
 
@echo off
EM 添加新站点并启用 Windows 身份验证
MKDIR C:\Blogs
APPCMD add site /name:Blogs /bindings:"http/*:81:" /physicalPath:"C:\Blogs"
APPCMD set config "Blogs" -section:system.webServer/security/authentication/windowsAuthentication /enabled:"True"  /commit:apphost

REM 创建一个虚拟目录
MKDIR C:\Blogs\Technology 
APPCMD add vdir /app.name:"Blogs/" /path:/Technology /physicalPath:C:\Blogs\Technology

REM 建一个由虚拟目录名称限定的应用程序池
APPCMD add apppool /name:Technology.JoeBuschmann

REM 配置应用程序池
APPCMD set apppool "Technology.JoeBuschmann" /managedRuntimeVersion:v4.0 /processModel.pingingEnabled:false /processModel.identityType:NetworkService

REM 创建应用程序
MKDIR C:\Blogs\Technology\JoeBuschmann
APPCMD add app /site.name:"Blogs" /path:/Technology/JoeBuschmann /physicalPath:C:\Blogs\Technology\JoeBuschmann

REM 配置应用程序
APPCMD set app "Blogs/Technology/JoeBuschmann" /applicationPool:Technology.JoeBuschmann

PAUSE
```

### 数据库还原
```sql
RESTORE DATABASE isosdb
FROM disk='C:\GeneraliSOS\xhnx\iSOSDB-xhnx20111221\XXX.bak'
with replace,
MOVE 'isosdb_data' to 'C:\GeneraliSOS\xhnx\ISOSDB_DATA.mdf',
MOVE 'isosdb_log' to 'C:\GeneraliSOS\xhnx\ISOSDB_log.ldf'



其中：'C:\GeneraliSOS\xhnx\iSOSDB-xhnx20111221\XXX.bak'，表示还原文件。
```



> 更新: 2022-05-04 08:40:24  
> 原文: <https://www.yuque.com/lixinsi/bmtt6t/gnuu9t>