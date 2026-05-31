# bat脚本



```powershell
::1.设置等待时长（计时器长度/秒），需要自己配置
timeout /nobreak /t 5

::2.执行完自动删除
del %0

@echo off

echo "use ping to delay"

start D:\dianyue\全流程服务\全流程服务\JiSuan\redisServer.exe

timeout /nobreak /t 5


start D:\dianyue\全流程服务\全流程服务\ZhuFuWu\ECommerceService.exe
pause

:: 此脚本主要的作用创建1.自动创建快捷方式；2.自动更换快捷方式图标
@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
 if '%errorlevel%' NEQ '0' (
 goto UACPrompt
) else ( goto gotAdmin )
 :UACPrompt
 echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
 echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
 exit /B
:gotAdmin
 if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
rem 上面的语句是以管理员身份运行这个bat

 for /f "tokens=2*" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Desktop') do set Desktop=%%b
 rem 通过注册表查找出桌面所在的位置，并将位置路径定义为变量Desktop
 copy d:\taxi.ico %SystemDrive%\Windows\System32\taxi.ico
 rem 复制快捷方式图标到系统默认快捷方式图标路劲下
 mkdir d:\beifen\
 move \Y %Desktop%\区域.url d:\beifen\区域.url
 move \Y %Desktop%\全局.url d:\beifen\全局.url
 del %Desktop%\didi.url
 del %Desktop%\summary.url
 rem 删除原有桌面的图标
 set file="%Desktop%\summary.url"
 rem 设定快捷方式图标变量为file
 echo [InternetShortcut] >%file%
 echo URL="www.baidu.com" >>%file%
 ping -n 2 127.1>nul
 echo IconIndex=0 >>%file%
 ping -n 2 127.1>nul
 rem 延迟更换图标，否则有时候出现无法识别的现象。
 echo IconFile=%SystemDrive%\Windows\System32\taxi.ico >>%file%
 rem 设定快捷方式图标为自己想要的图标，(.ico)格式的文件需要转换生成
 exit
```



> 更新: 2023-03-24 11:35:56  
> 原文: <https://www.yuque.com/lixinsi/kmvnv0/mzyg3tkkcg1amg8m>