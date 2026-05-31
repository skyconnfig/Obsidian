# Myobsidian Vault

Obsidian 知识库，包含个人笔记、Clippings、Wiki 和技术知识库。

## 自动备份到 GitHub

仓库使用 Git 管理，并提供了一个文件监控脚本，可以在文件变更时自动提交并推送到 GitHub。

### 使用方法

#### 直接运行监控脚本

```powershell
# 打开 PowerShell，在 vault 目录下执行
.\scripts\watch-and-push.ps1
```

脚本会：
1. 持续监控 `D:\File\Myobsidian` 下的所有文件变更
2. 每次变更后等待 **30 秒** 无新变更（防抖），避免频繁提交
3. 自动 `git add -A` → `git commit` → `git push`
4. 日志写入 `scripts/watch-and-push.log`

按 `Ctrl+C` 停止监控。

#### 后台运行（不占用终端窗口）

```powershell
# 启动隐藏窗口的后台任务
Start-Process -WindowStyle Hidden -FilePath "powershell" -ArgumentList "-File `"D:\File\Myobsidian\scripts\watch-and-push.ps1`""
```

#### 开机自启（可选）

1. 按 `Win + R`，输入 `shell:startup`
2. 创建一个快捷方式，目标填：
   ```
   powershell -WindowStyle Hidden -File "D:\File\Myobsidian\scripts\watch-and-push.ps1"
   ```

## 注意事项

- 确保网络畅通，推送失败会在下一轮重试
- `.gitignore` 已配置排除 `.zip` / `.exe` / `.pdf` / `.docx` / 大二进制文件
- `horizon/` 子目录是独立 git 仓库，不在此仓库中追踪
- 自动提交信息格式：`vault auto-backup: YYYY-MM-DD HH:mm:ss`
