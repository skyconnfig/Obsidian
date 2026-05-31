# pagefile缩小脚本

```bash
#requires -RunAsAdministrator

<#
.SYNOPSIS
    配置 Windows 自定义分页文件（虚拟内存）设置。
.DESCRIPTION
    此脚本通过修改注册表禁用自动管理，并设置指定路径、初始大小和最大大小的分页文件。
    更改需重启后生效。
.PARAMETER Path
    分页文件路径，默认为 "C:\pagefile.sys"
.PARAMETER InitialSizeMB
    初始大小（MB），默认 4096（4GB）
.PARAMETER MaxSizeMB
    最大大小（MB），默认 8192（8GB）
.PARAMETER NoReboot
    可选：设置后不提示重启
.EXAMPLE
    .\Set-CustomPageFile.ps1 -InitialSizeMB 2048 -MaxSizeMB 4096
#>

[CmdletBinding()]
param(
    [string]$Path = "C:\pagefile.sys",
    [int]$InitialSizeMB = 4096,
    [int]$MaxSizeMB = 8192,
    [switch]$NoReboot
)

# 检查是否以管理员身份运行（即使有 #requires，也双重保险）
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "❌ 此脚本必须以管理员身份运行！请右键选择“以管理员身份运行”。"
    exit 1
}

Write-Host "🔧 正在配置分页文件..." -ForegroundColor Cyan

try {
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"

    # 1. 禁用自动管理分页文件
    Write-Host "  → 禁用“自动管理所有驱动器的分页文件大小”..." -ForegroundColor Gray
    Set-ItemProperty -Path $regPath -Name "AutomaticManagedPagefile" -Value 0 -Type DWord -ErrorAction Stop

    # 2. 设置 PagingFiles（REG_MULTI_SZ）
    $pagingEntry = "$Path $InitialSizeMB $MaxSizeMB"
    Write-Host "  → 设置分页文件: $pagingEntry" -ForegroundColor Gray
    Set-ItemProperty -Path $regPath -Name "PagingFiles" -Value @($pagingEntry) -Type MultiString -ErrorAction Stop

    Write-Host "`n✅ 分页文件已成功配置！" -ForegroundColor Green
    Write-Host "   路径:       $Path"
    Write-Host "   初始大小:   ${InitialSizeMB} MB"
    Write-Host "   最大大小:   ${MaxSizeMB} MB"
    Write-Host "`n⚠️  注意：更改将在系统重启后生效。" -ForegroundColor Yellow

    if (-not $NoReboot) {
        $restart = Read-Host "`n是否立即重启计算机？(Y/N)"
        if ($restart -like "Y*") {
            Write-Host "🔄 正在重启计算机..." -ForegroundColor Cyan
            Restart-Computer -Force
        } else {
            Write-Host "ℹ️  请在方便时手动重启系统以应用更改。" -ForegroundColor Blue
        }
    } else {
        Write-Host "ℹ️  已跳过重启提示（使用了 -NoReboot 参数）。" -ForegroundColor Blue
    }

} catch {
    Write-Error "❌ 配置分页文件时发生错误：$($_.Exception.Message)"
    exit 1
}
```



> 更新: 2026-01-15 16:23:14  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/mgmiotch2gzqv66m>