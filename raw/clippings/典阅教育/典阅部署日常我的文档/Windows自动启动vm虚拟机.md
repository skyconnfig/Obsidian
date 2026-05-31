# Windows自动启动vm虚拟机

```powershell
#以管理员权限运行
@echo off
>nul 2>&1 "SYSTEMROOT%\system32\cacls.exe" "SYSTEMROOT%\system32\config\system"
if \'%errorlevel%\' NEQ \ '0\' (
goto UACPrompt
) else ( goto getAdmin )
:UACPrompt
echo Set UAC=CreateObject^(Shell.Application"^) "%temp%"\getAdmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%"\getAdmin.vbs"
"%temp%\getAdmin.vbs"
exit /B
:gotAdmin
if exit "%temp%\getAdmin.vbs"( del "%temp%getAdmin/vbs")
cd /d "%~dp0"

#中文无乱码
chcp 65001

#进入vmware workstation软件目录
cd C:\propram files(x86)\vmware\vmware workstation\g

#通过vmrun启动配置的虚拟机
start vmrun.exte -T ws start "D:\vm\DS3622\ds3622.vmx" nogui

#启动任务
shell:Common Startup
```



> 更新: 2023-05-15 08:32:21  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/dcibuszz9i0d782g>