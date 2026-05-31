# Windows系统后台运行Nginx

在 Windows 系统中，如果你希望 **在后台运行 Nginx**（即不显示黑窗口或命令行窗口），有几种常用的方法：

***

### ✅ 方法一：使用 `start /B` 命令（推荐）

在命令提示符（CMD）中运行以下命令：

```plain
start /B nginx.exe
```

* `/B` 参数表示在后台启动程序，不创建新的窗口。
* 适用于从脚本或程序中启动 Nginx 时隐藏窗口。

> 注意：确保当前目录是 Nginx 的安装目录（包含 `nginx.exe`），或者使用完整路径，例如：

```plain
start /B "C:\nginx\nginx.exe"
```

***

### ✅ 方法二：使用 PowerShell 后台启动（静默）

在 PowerShell 中运行：

```powershell
Start-Process -WindowStyle Hidden -FilePath "C:\nginx\nginx.exe"
```

* `-WindowStyle Hidden` 确保窗口完全隐藏。
* 更适合自动化脚本。

***

### ✅ 方法三：创建 Windows 服务（长期后台运行）

如果你希望 Nginx 随系统启动并在后台常驻，建议将其安装为 Windows 服务。

可以使用第三方工具如 **NSSM (Non-Sucking Service Manager)**：

1. 下载 NSSM：<https://nssm.cc/download>
2. 解压后以管理员身份运行 CMD：

```plain
nssm install nginx
```

3. 在弹出窗口中设置：
   * **Path**: `C:\nginx\nginx.exe`
   * **Startup directory**: `C:\nginx`
4. 点击 **Install service**
5. 启动服务：

```plain
net start nginx
```

> 优点：系统重启后自动运行，可被 Windows 服务管理器控制。

***

### ⚠️ 注意事项

* Nginx 在 Windows 上是单进程（主进程），不支持多 worker，性能不如 Linux。
* 如果你只是临时测试，用 `start /B` 足够；长期部署建议用服务方式或迁移到 Linux。

***

### 🔁 停止后台 Nginx

无论用哪种方式启动，都可以通过以下命令优雅停止：

```plain
nginx.exe -s quit
```

或强制停止：

```plain
nginx.exe -s stop
```

确保在 Nginx 目录下执行，或使用完整路径。

***

如需进一步自动化（如开机自启 + 隐藏窗口），建议使用 **NSSM 安装为服务**。

需要我提供完整的 NSSM 配置步骤或批处理脚本吗？


> 更新: 2025-11-19 09:00:33  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/przn4q26idgdsipk>