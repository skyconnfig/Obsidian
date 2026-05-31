# Windows IIS 安装与 ASP.NET 配置指南（PowerShell 版）

## **1️⃣**\*\* 安装 IIS 核心与管理控制台\*\*

**说明**：适用于 Windows 10/11 客户端和 Windows Server。包括 IIS 核心服务和图形管理界面。

### **命令**

```plain
# 安装 IIS 核心服务
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole -All

# 安装 IIS 管理控制台和管理工具
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole -All
```

### **测试**

```plain
# 打开 IIS 管理器
inetmgr

# 或者完整路径
C:\Windows\System32\inetsrv\InetMgr.exe
```

如果打不开，可以检查 `C:\Windows\System32\inetsrv\InetMgr.exe` 是否存在，并重启 IIS 或系统。

***

## **2️⃣**\*\* 安装常用 IIS 组件（可选）\*\*

**说明**：保证 ASP.NET、静态文件、默认文档、错误页面等功能正常。

```plain
# 静态内容、默认文档、错误页
Enable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors -All

# ASP.NET 4.5 支持
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45 -All
```

***

## **3️⃣**\*\* 修复 ASP.NET 临时文件权限问题\*\*

**问题描述**：

“当前标识(IIS APPPOOL\DefaultAppPool)没有对 Temporary ASP.NET Files 的写访问权限。”

**解决方案**：给应用池账户写权限，并处理 32/64 位路径。

### **一键 PowerShell 脚本**

```bash
$appPoolUser = "IIS APPPOOL\DefaultAppPool"
$aspTemp64 = "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files"
$aspTemp32 = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files"

# 创建目录（如果不存在）
if (-not (Test-Path $aspTemp64)) { New-Item -ItemType Directory -Path $aspTemp64 -Force }
if (-not (Test-Path $aspTemp32)) { New-Item -ItemType Directory -Path $aspTemp32 -Force }

# 给应用池写权限
icacls $aspTemp64 /grant ($appPoolUser + ":(OI)(CI)F") /T
icacls $aspTemp32 /grant ($appPoolUser + ":(OI)(CI)F") /T

# 重启应用池
Import-Module WebAdministration
Restart-WebAppPool -Name "DefaultAppPool"
```


> 更新: 2026-05-06 08:51:20  
> 原文: <https://www.yuque.com/lixinsi/dtxgrg/qa2692cqyhf5c0xz>