# IIS 站点文件备份到 F 盘

 批量备份并打包到 F 盘示例  

```python
Import-Module WebAdministration

# 备份根目录（F 盘，按日期分类）
$BackupRoot = "F:\IISBackup\" + (Get-Date -Format "yyyyMMdd")
New-Item -Path $BackupRoot -ItemType Directory -Force

# 获取所有 IIS 站点
$sites = Get-Website

foreach ($site in $sites) {
    $source = $site.physicalPath
    $zipFile = Join-Path $BackupRoot ($site.name + ".zip")

    # 临时目录
    $tempDir = Join-Path $BackupRoot ($site.name + "_temp")
    robocopy $source $tempDir /E /R:2 /W:5

    # 打包成 zip
    if (Test-Path $zipFile) { Remove-Item $zipFile }
    Compress-Archive -Path "$tempDir\*" -DestinationPath $zipFile

    # 删除临时目录
    Remove-Item $tempDir -Recurse -Force
}

Write-Host "所有站点已成功备份到 $BackupRoot"

```



> 更新: 2025-09-27 22:48:14  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/pco9cvbf4tzsyrni>