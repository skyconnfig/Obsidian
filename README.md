# Myobsidian Vault

Obsidian 知识库，包含个人笔记、Clippings、Wiki 和技术知识库。

## 自动备份到 GitHub

仓库使用 Git 管理，并提供了一个文件监控脚本，可以在文件变更时自动提交并推送到 GitHub。

## 使用方法

### 直接运行（前台）

```powershell
# 在 vault 目录下执行
.\scripts\watch-and-push.ps1
```

### 后台运行（隐藏窗口）

```powershell
Start-Process -WindowStyle Hidden -FilePath powershell -ArgumentList "-NoProfile -File `"D:\File\Myobsidian\scripts\watch-and-push.ps1`""
```

### 停止后台进程

```powershell
# 查找并终止 powershell 进程
Get-Process -Name powershell | Where-Object { $_.CommandLine -like "*watch-and-push*" } | Stop-Process
```

### 查看运行日志

```powershell
Get-Content "D:\File\Myobsidian\scripts\watch-and-push.log"
```

### 开机自启（可选）

1. 按 `Win + R`，输入 `shell:startup`
2. 创建一个快捷方式，目标填：
   ```
   powershell -WindowStyle Hidden -NoProfile -File "D:\File\Myobsidian\scripts\watch-and-push.ps1"
   ```

## 工作原理

脚本会：
1. 每 **15 秒** 检查一次 `git status`，监控文件变更
2. 检测到变更后等待 **30 秒** 无新变更（防抖），避免在编辑过程中频繁提交
3. 防抖到期后自动执行 `git add -A` → `git commit` → `git push`
4. 推送失败会在下一轮自动重试
5. 日志写入 `scripts/watch-and-push.log`（已通过 `.gitignore` 排除）

## 参数自定义

```powershell
.\scripts\watch-and-push.ps1 -PollIntervalSeconds 10 -DebounceSeconds 60
```

- `PollIntervalSeconds`：检测间隔（默认 15s）
- `DebounceSeconds`：稳定等待时间（默认 30s）
- `RepoPath`：仓库路径（默认 D:\File\Myobsidian）
- `LogFile`：日志文件路径

## 注意事项

- 确保网络畅通，推送失败会在下一轮重试
- `.gitignore` 已配置排除 `.zip` / `.exe` / `.pdf` / `.docx` / 大二进制文件
- `horizon/` 子目录是独立 git 仓库，不在此仓库中追踪
- 自动提交信息格式：`vault auto-backup: YYYY-MM-DD HH:mm:ss`
