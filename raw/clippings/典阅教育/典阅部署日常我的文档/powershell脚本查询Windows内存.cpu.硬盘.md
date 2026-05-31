# powershell脚本查询Windows内存.cpu.硬盘

```powershell
#Set-ExecutionPolicy RemoteSigned
# C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
# &  C:\Users\Administrator\Desktop\dy\get
$date  = Get-Date -Format "yyyy-MM-dd"
$s = $date  + ".txt"
$a = "\Desktop\dy" + "\" +  $s
#$Env:USERPROFILE
$c = $Env:USERPROFILE  + "\" + $a
#获取当前时间
$currentDate = Get-Date  
$currentDate >> $c
# 获取iis站点数量
# 读取文本文件  
$text = Get-Content -Path "C:\Windows\System32\inetsrv\config\applicationHost.config"  
  
# 要查找的值  
$value = "site name="  
  
# 使用Select-String cmdlet查找值出现的次数  
$count = $text | Select-String -SimpleMatch $value | Measure-Object -Line  
  
# 输出结果  
#Write-Host "The search value '$value' appears $($count.Lines) times in the text."
 "IIS-quantity:$($count.Lines)" >> $c


#获取磁盘空间剩余空间

$drives = Get-PSDrive -PSProvider 'FileSystem' | Where-Object {$_.Used -ne $null}
$totalFreeSpace = 0

foreach ($drive in $drives) {
    $freeSpaceGB = [Math]::Round($drive.Free / 1GB, 2)
    $totalFreeSpace += $freeSpaceGB
    
     #"Drive: $($drive.Name)" >> $c
     "$($drive.Name) : $freeSpaceGB GB" >> $c
    #Write-Host "-----------------------"
}

"Total Free Space: $totalFreeSpace GB" >> $c

# 获取CPU信息  
$cpuInfo = Get-WmiObject -Class Win32_Processor  

# 获取内存使用率
$memUsage = Get-Counter -Counter '\Memory\% Committed Bytes In Use'
$usagePercentage = $memUsage.CounterSamples.CookedValue

#输出内存使用率
 "memory：$usagePercentage %" >> $c
  
# 输出CPU情况  
foreach ($cpu in $cpuInfo) {  
 "CPU: $($cpu.LoadPercentage)%"  >> $c
}

```

```sql
# 设置输出路径：桌面 + 当前日期文件名
$desktop = [Environment]::GetFolderPath("Desktop")
$date = Get-Date -Format "yyyy-MM-dd"
$outputFile = "$desktop\硬件报告_$date.txt"

# 获取当前时间
"生成时间: $(Get-Date)" | Out-File $outputFile -Encoding UTF8

# ==================== CPU 使用率 ====================
$cpu = Get-WmiObject Win32_Processor | Select-Object -First 1
"CPU 使用率: $($cpu.LoadPercentage)%" | Out-File $outputFile -Encoding UTF8 -Append

# ==================== 内存使用率 ====================
$mem = Get-Counter '\Memory\% Committed Bytes In Use' -ErrorAction SilentlyContinue
if ($mem) {
    $memUsage = [Math]::Round($mem.CounterSamples.CookedValue, 2)
    "内存使用率: $memUsage%" | Out-File $outputFile -Encoding UTF8 -Append
} else {
    "内存使用率: 获取失败（可能权限不足）" | Out-File $outputFile -Encoding UTF8 -Append
}

# ==================== 磁盘剩余空间 ====================
$drives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Used -ne $null }
$totalFree = 0

"--- 磁盘剩余空间 ---" | Out-File $outputFile -Encoding UTF8 -Append

foreach ($drive in $drives) {
    $freeGB = [Math]::Round($drive.Free / 1GB, 2)
    $totalFree += $freeGB
    "$($drive.Name): $freeGB GB" | Out-File $outputFile -Encoding UTF8 -Append
}

"总计剩余: $totalFree GB" | Out-File $outputFile -Encoding UTF8 -Append

# 完成提示
Write-Host "✅ 报告已生成: $outputFile" -ForegroundColor Green
```



> 更新: 2025-09-09 09:34:04  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/uukqxuns3dn79czk>