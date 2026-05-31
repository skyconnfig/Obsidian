# wsl使用方法

## <font style="color:#000000;">🎯</font><font style="color:#000000;"> WSL 简介</font>

<font style="color:#000000;">WSL 是 Microsoft 开发的兼容层，允许在 Windows 系统上运行 Linux 环境，无需传统虚拟机或双启动设置。</font>

## <font style="color:#000000;">📋</font><font style="color:#000000;"> 安装 WSL</font>

### <font style="color:#000000;">方法一：快速安装（推荐）</font>

**<font style="color:#000000;">以管理员身份运行 PowerShell：</font>**

```plain
# 一键安装 WSL 和 Ubuntu
wsl --install

# 安装指定发行版
wsl --install -d Ubuntu-22.04
```

**<font style="color:#000000;">重启电脑后完成安装</font>**

### <font style="color:#000000;">方法二：手动安装</font>

**<font style="color:#000000;">1. 启用 WSL 功能：</font>**

```plain
# 启用 WSL
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# 启用虚拟机平台
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

**<font style="color:#000000;">2. 设置 WSL 2 为默认版本：</font>**

```plain

wsl --set-default-version 2
```

**<font style="color:#000000;">3. 从 Microsoft Store 安装 Linux 发行版</font>**

## <font style="color:#000000;">🔧</font><font style="color:#000000;"> WSL 基本命令</font>

### <font style="color:#000000;">管理命令</font>

```plain

# 查看已安装的发行版
wsl --list --verbose
wsl -l -v

# 查看可安装的发行版
wsl --list --online
wsl -l -o

# 设置默认发行版
wsl --set-default Ubuntu-22.04

# 启动指定发行版
wsl -d Ubuntu-22.04

# 关闭 WSL
wsl --shutdown

# 重启指定发行版
wsl --terminate Ubuntu-22.04

# 卸载发行版
wsl --unregister Ubuntu-22.04
```

### <font style="color:#000000;">版本管理</font>

```plain

# 升级发行版到 WSL 2
wsl --set-version Ubuntu-22.04 2

# 检查 WSL 状态
wsl --status

# 更新 WSL
wsl --update
```

## <font style="color:#000000;">🚀</font><font style="color:#000000;"> 启动和使用 WSL</font>

### <font style="color:#000000;">启动方式</font>

**<font style="color:#000000;">1. 从 Windows 终端启动：</font>**

```plain

wsl
# 或指定发行版
wsl -d Ubuntu-22.04
```

**<font style="color:#000000;">2. 从开始菜单启动：</font>**

* <font style="color:#000000;">搜索并点击已安装的 Linux 发行版</font>

**<font style="color:#000000;">3. 从 VS Code 启动：</font>**

* <font style="color:#000000;">安装 WSL 扩展</font>
* <font style="color:#000000;">使用 </font><code>**<font style="color:#000000;">Ctrl+Shift+P</font>**</code><font style="color:#000000;"> → </font><code>**<font style="color:#000000;">WSL: New Window</font>**</code>

### <font style="color:#000000;">初始化设置</font>

**<font style="color:#000000;">首次启动时需要：</font>**

1. <font style="color:#000000;">创建用户账户</font>
2. <font style="color:#000000;">设置密码</font>
3. <font style="color:#000000;">更新系统包</font>

```plain

# 更新包管理器
sudo apt update && sudo apt upgrade -y

# 安装常用工具
sudo apt install -y curl wget git vim nano
```

## <font style="color:#000000;">📁</font><font style="color:#000000;"> 文件系统操作</font>

### <font style="color:#000000;">路径映射</font>

**<font style="color:#000000;">Windows 路径在 WSL 中的映射：</font>**

```plain

# Windows C:\ 映射到 WSL 的 /mnt/c/
cd /mnt/c/Users/YourUsername/

# Windows D:\ 映射到 WSL 的 /mnt/d/
cd /mnt/d/
```

**<font style="color:#000000;">WSL 路径在 Windows 中的访问：</font>**

```plain

# 在 Windows 资源管理器中访问
\\wsl$\Ubuntu-22.04\home\username\
```

### <font style="color:#000000;">文件操作示例</font>

```plain

# 在 WSL 中访问 Windows 桌面
cd /mnt/c/Users/YourUsername/Desktop/

# 在 WSL 中创建文件，Windows 可直接访问
echo "Hello WSL" > /mnt/c/Users/YourUsername/Desktop/test.txt

# 复制文件从 Windows 到 WSL
cp /mnt/c/Users/YourUsername/Desktop/file.txt ~/

# 在 Windows 中打开 WSL 当前目录
explorer.exe .
```

## <font style="color:#000000;">🛠️</font><font style="color:#000000;"> 开发环境配置</font>

### <font style="color:#000000;">安装开发工具</font>

**<font style="color:#000000;">Node.js 开发环境：</font>**

```plain

# 安装 NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc

# 安装 Node.js
nvm install --lts
nvm use --lts
```

**<font style="color:#000000;">Python 开发环境：</font>**

```plain

# 安装 Python 和 pip
sudo apt install python3 python3-pip

# 安装虚拟环境
pip3 install virtualenv
```

**<font style="color:#000000;">Docker 环境：</font>**

```plain

# 安装 Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# 启动 Docker 服务
sudo service docker start
```

### <font style="color:#000000;">Git 配置</font>

```plain
# 配置 Git
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# 生成 SSH 密钥
ssh-keygen -t rsa -b 4096 -C "your.email@example.com"
```

## <font style="color:#000000;">📊</font><font style="color:#000000;"> 性能优化</font>

### <font style="color:#000000;">.wslconfig 配置文件</font>

<code>**<font style="color:#000000;">.wslconfig</font>**</code>**<font style="color:#000000;"> 文件：</font>**

```plain
[wsl2]
# 限制内存使用
memory=4GB

# 限制 CPU 核心数
processors=2

# 启用本地主机转发
localhostForwarding=true

# 设置交换文件大小
swap=2GB

# 设置交换文件路径
swapFile=C:\\temp\\wsl-swap.vhdx
```

**<font style="color:#000000;">应用配置：</font>**

```plain
复制
# 关闭 WSL 以应用新配置
wsl --shutdown
```

### <font style="color:#000000;">内存和存储优化</font>

```plain
# 清理包缓存
sudo apt autoremove && sudo apt autoclean

# 压缩 WSL 磁盘映像
wsl --shutdown
# 在 PowerShell 中运行
Optimize-VHD -Path "C:\Users\YourUsername\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu22.04LTS_79rhkp1fndgsc\LocalState\ext4.vhdx" -Mode Full
```

## <font style="color:#000000;">🌐</font><font style="color:#000000;"> 网络配置</font>

### <font style="color:#000000;">端口转发</font>

**<font style="color:#000000;">WSL 2 端口转发到 Windows：</font>**

```plain
# 转发端口 3000
netsh interface portproxy add v4tov4 listenport=3000 listenaddress=0.0.0.0 connectport=3000 connectaddress=172.x.x.x
```

### <font style="color:#000000;">代理设置</font>

**<font style="color:#000000;">在 WSL 中配置代理：</font>**

```plain
# 编辑 ~/.bashrc
nano ~/.bashrc

# 添加代理设置
export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7890

# 应用配置
source ~/.bashrc
```

## <font style="color:#000000;">🔧</font><font style="color:#000000;"> 常见问题解决</font>

### <font style="color:#000000;">问题1：WSL 启动失败</font>

**<font style="color:#000000;">解决方案：</font>**

```plain
# 检查 WSL 服务状态
wsl --status

# 重启 WSL 服务
wsl --shutdown
wsl

# 如果仍有问题，重装 WSL
wsl --unregister Ubuntu-22.04
wsl --install -d Ubuntu-22.04
```

### <font style="color:#000000;">问题2：文件权限问题</font>

**<font style="color:#000000;">解决方案：</font>**

```plain
# 修改文件权限
chmod 755 filename

# 修改文件所有者
sudo chown username:username filename

# 批量修改权限
find /path/to/directory -type f -exec chmod 644 {} \;
```

### <font style="color:#000000;">问题3：网络连接问题</font>

**<font style="color:#000000;">解决方案：</font>**

```plain
# 重置网络配置
sudo service networking restart

# 检查 DNS 设置
cat /etc/resolv.conf

# 手动设置 DNS
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
```

### <font style="color:#000000;">问题4：内存占用过高</font>

**<font style="color:#000000;">解决方案：</font>**

```plain
# 清理内存缓存
sudo sync && sudo sysctl -w vm.drop_caches=3

# 查看内存使用情况
free -h
top
```

## <font style="color:#000000;">💡</font><font style="color:#000000;"> 实用技巧</font>

### <font style="color:#000000;">1. 快速访问</font>

**<font style="color:#000000;">创建桌面快捷方式：</font>**

* <font style="color:#000000;">右键桌面 → 新建 → 快捷方式</font>
* <font style="color:#000000;">输入：</font><code>**<font style="color:#000000;">wsl -d Ubuntu-22.04</font>**</code>

### <font style="color:#000000;">2. 文件编辑</font>

**<font style="color:#000000;">使用 Windows 编辑器编辑 WSL 文件：</font>**

```plain
# 用 VS Code 打开当前目录
code .

# 用记事本打开文件
notepad.exe filename.txt
```

### <font style="color:#000000;">3. 系统集成</font>

**<font style="color:#000000;">在 Windows 右键菜单添加 WSL：</font>**

* <font style="color:#000000;">安装 Windows Terminal</font>
* <font style="color:#000000;">配置为默认终端</font>
* <font style="color:#000000;">右键文件夹即可看到"在终端中打开"选项</font>

### <font style="color:#000000;">4. 备份和迁移</font>

**<font style="color:#000000;">导出 WSL 发行版：</font>**

```plain
wsl --export Ubuntu-22.04 C:\backup\ubuntu-backup.tar
```

**<font style="color:#000000;">导入 WSL 发行版：</font>**

```plain
wsl --import Ubuntu-Restored C:\WSL\Ubuntu-Restored C:\backup\ubuntu-backup.tar
```

## <font style="color:#000000;">🎯</font><font style="color:#000000;"> 最佳实践</font>

1. **<font style="color:#000000;">文件存储</font>**<font style="color:#000000;">：将项目文件存储在 WSL 文件系统中以获得更好性能</font>
2. **<font style="color:#000000;">资源管理</font>**<font style="color:#000000;">：通过 </font><code>**<font style="color:#000000;">.wslconfig</font>**</code><font style="color:#000000;"> 合理分配系统资源</font>
3. **<font style="color:#000000;">定期更新</font>**<font style="color:#000000;">：保持 WSL 和 Linux 发行版更新</font>
4. **<font style="color:#000000;">备份重要数据</font>**<font style="color:#000000;">：定期备份 WSL 中的重要文件</font>
5. **<font style="color:#000000;">使用 Windows Terminal</font>**<font style="color:#000000;">：获得更好的终端体验</font>


> 更新: 2025-07-13 10:38:29  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/ayib03bkwhuwtlu8>