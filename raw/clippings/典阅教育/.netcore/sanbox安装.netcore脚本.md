# sanbox安装.net core脚本

#在本机进行Windows 应用程式的测试，最简易的方法就是启动Windows Sandbox 沙盒环境，不用十秒就可以开启一台临时的虚拟机，关闭后所有资料都不会保留，非常方便用来验证许多安装作业流程。不过Windows 10 内建的这个Windows Sandbox 实在是太干净了，每次启动都要手动安装许多工具才能开始使用，所以我打算用这篇文章记录一下我会在启动后执行的自动化命令。



#如果你尚未启用Windows Sandbox 功能，可以在你的Windows 10 Pro/Ent/Edu 版本执行以下命令启用：



Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online  
#在开启Windows Sandbox 之后，请先开启Windows PowerShell视窗，贴上以下命令即可全自动设定完成：



# 調整 ExecutionPolicy 等級到 RemoteSigned


Set-ExecutionPolicy RemoteSigned -Force



# 變更系統語言設定並設定 zh-TW 為顯示語言


$ UserLanguageList = New-WinUserLanguageList -Language "en-US"
 $UserLanguageList.Add("zh-CN")  
Set-WinUserLanguageList -LanguageList $UserLanguageList -Force  
Set-WinUILanguageOverride -Language zh-CN



# 安裝 Chocolatey


Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('[https://chocolatey.org/install.ps1](https://chocolatey.org/install.ps1)'))



# 建立 $PROFILE 所需的資料夾


# 設定 PowerShell 的 ProgressPreference, TLS 1.2 與 PSReadLine 快速鍵


# [https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_preference_variables#progresspreference](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_preference_variables#progresspreference)


@'



# 修正 PowerShell 關閉進度列提示


$ProgressPreference = 'SilentlyContinue'



# 使用 TLS 1.2 進行網路安全連線


[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12



# 設定按下 Ctrl+d 可以退出 PowerShell 執行環境


Set-PSReadlineKeyHandler -Chord ctrl+d -Function ViExit



# 設定按下 Ctrl+w 可以刪除一個單字


Set-PSReadlineKeyHandler -Chord ctrl+w -Function BackwardDeleteWord



# 設定按下 Ctrl+e 可以移動游標到最後面(End)


Set-PSReadlineKeyHandler -Chord ctrl+e -Function EndOfLine



# 設定按下 Ctrl+a 可以移動游標到最前面(Begin)


Set-PSReadlineKeyHandler -Chord ctrl+a -Function BeginningOfLine



function hosts { notepad c:\windows\system32\drivers\etc\hosts }



# 移除內建的 curl 與 wget 命令別名


If (Test-Path Alias:curl) {Remove-Item Alias:curl}  
If (Test-Path Alias:wget) {Remove-Item Alias:wget}  
'@ | Out-File $PROFILE



. $PROFILE



# 安裝 Microsoft YaHei Mono 字型


Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force  
$tmpFolder = New-TemporaryFile | %{ rm $_; mkdir $ _ }
Invoke-WebRequest -Uri "https://github.com/doggy8088/MicrosoftYaHeiMono-CP950/blob/master/MicrosoftYaHeiMono-CP950.ttf?raw=true" -OutFile " $tmpFolder\MicrosoftYaHeiMono-CP950.ttf"  
Install-Module -Name PSWinGlue -Force  
Install-Font -Scope System -Path $tmpFolder



# 安裝常用應用程式


choco install  wget 7zip notepad2 git -y



# Chocolatey 安裝 Git 後雖然有註冊 PATH 環境變數，但目前工作階段並沒有註冊


$env:Path += ';C:\Program Files\Git\cmd'



# 設定預設 Git Alias


git config --global alias.ci   commit  
git config --global alias.cm   "commit --amend -C HEAD"  
git config --global alias.co   checkout  
git config --global alias.st   status  
git config --global alias.sts  "status -s"  
git config --global alias.br   branch  
git config --global alias.re   remote  
git config --global alias.di   diff  
git config --global alias.type "cat-file -t"  
git config --global alias.dump "cat-file -p"  
git config --global alias.lo   "log --oneline"  
git config --global alias.ls   "log --show-signature"  
git config --global alias.ll   "log --pretty=format:'%h %ad | %s%d [%Cgreen%an%Creset]' --graph --date=short"  
git config --global alias.lg   "log --graph --pretty=format:'%Cred%h%Creset %ad |%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset [%Cgreen%an%Creset]' --abbrev-commit --date=short"  
git config --global alias.alias "config --get-regexp ^alias."  
git config --global alias.ignore "!gi() { curl -sL [https://www.gitignore.io/api/$@](https://www.gitignore.io/api/$@) ;}; gi"  
git config --global alias.iac  "!giac() { git init && git add . && git commit -m 'Initial commit' ;}; giac"



# 設定 git 預設編輯器為 notepad


git config --global core.editor "notepad"



# 直接設定 Git 預設 user.name 與 user.email


git config --global user.name "Your Name"  
git config --global user.email "[you@example.com](mailto:you@example.com)"



#安装好之后，建议手动调整Windows PowerShell与 命令提示字元(Command Prompt)视窗的字型为 Microsoft YaHei Mono 字型！



安装.NET SDK (LTS) 开发环境



# 安裝 LTS 版本的 .NET SDK (LTS)


# [https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script?WT.mc_id=DT-MVP-4015686](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script?WT.mc_id=DT-MVP-4015686)


Invoke-WebRequest [https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1](https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1) -outfile $env:temp\dotnet-install.ps1  
. $env:temp\dotnet-install.ps1 -Channel LTS



# 下載設定環境變數的利器 SetEnv


Invoke-WebRequest -Uri "[https://github.com/doggy8088/SetEnv/releases/download/1.0/SetEnv.exe](https://github.com/doggy8088/SetEnv/releases/download/1.0/SetEnv.exe)" -OutFile "$env:temp\SetEnv.exe"



# 設定使用者 PATH 環境變數


. $ env:temp\SetEnv.exe -ua PATH %" $env:LOCALAPPDATA\Microsoft\dotnet"



# 查看 .NET 安裝版本


dotnet --info



#安装开发环境  
#安装Visual Studio Code 与Node.js



choco install vscode nodejs-lts -y  
$env:Path = 'C:\Program Files\nodejs;C:\Program Files\Microsoft VS Code\bin;' + $env:Path  
#安装Angular CLI 与其他常用工具



npm i -g @angular/cli rimraf json-server lite-server source-map-explorer  
#安装Angular 在VS Code 的扩充套件



code --install-extension doggy8088.angular-extension-pack  
code --install-extension ms-vscode.js-debug  
code --install-extension nrwl.angular-console  
code --install-extension esbenp.prettier-vscode  
code --install-extension doggy8088.git-extension-pack  
code --install-extension johnpapa.vscode-peacock  
code --install-extension IBM.output-colorizer  
code --install-extension ms-azuretools.vscode-bicep  
#安装其他非必要的应用程式  
PowerShell Core



choco install powershell-core -y  
#安装好之后，建议使用PowerShell Core当成主要的命令提示字元环境，问题会少很多，主要差异在：



#所有In/Out 预设皆使用UTF-8 编码



#参见:分享几个在Windows 与Linux 常见的编码问题与解决方案



#预设选用Unicode 字型，除了比较好看外，可以选择的字型也比较多！



#Windows 10 繁体中文版的内建的Windows Sandbox 预设non-Unicode 字集为Chinese (Traditional, Taiwan)，这会导致你的命令提示字元选择 MS Gothic 字型，所有 \ 都会显示成 ¥ 符号，非常不美观。



#系统工具



choco install openssh unxutils sysinternals jq -y  
#浏览器



choco install googlechrome googlechrome.canary firefox safari brave --ignorechecksums -y  
#因为透过Chocolatey 安装这些浏览器，预设都会安装最新版，因此常有Checksum Mismatch 的问题出现，所以要加上 --ignorechecksums 参数。



Azure CLI



choco install azure-cli bicep -y  
AWS CLI



choco install awscli awssamcli -y  
#其他



choco install notepadplusplus -y



> 更新: 2022-04-23 11:04:05  
> 原文: <https://www.yuque.com/lixinsi/bmtt6t/ascm0z>