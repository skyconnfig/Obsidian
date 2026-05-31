# VS Code（Visual Studio Code） 里设置代理

在 **VS Code（Visual Studio Code）** 里设置代理主要有两种方式：

***

## 🧩 一、在 VS Code 设置界面配置代理（推荐）

1. 打开 VS Code
2. 按下 `Ctrl + ,`（或菜单栏选择：**File → Preferences → Settings**）
3. 在搜索框输入：`proxy`
4. 找到：

```plain
HTTP: Proxy
```

填入你的代理地址，例如：

```plain
http://127.0.0.1:7890
```

（如果你用的是 Clash、V2Ray、Netch 等工具，一般端口是 7890 或 1080）

5. 如果需要用户名和密码，也可以写成：

```plain
http://username:password@127.0.0.1:7890
```

6. 找到并勾选：

```plain
HTTP: Proxy Strict SSL
```

👉 如果你的代理证书不受信任，可以 **取消勾选**（即设置为 `false`）。

7. **重启 VS Code**

***

## ⚙️ 二、使用命令行参数配置代理（全局生效）

在 Windows 上打开命令行（cmd 或 PowerShell）执行：

```bash
setx http_proxy http://127.0.0.1:7890
setx https_proxy http://127.0.0.1:7890
```

然后重新打开 VS Code，它会自动使用系统的代理环境变量。

💡 如果只想临时生效（关闭终端后失效），可以用：

```bash
set http_proxy=http://127.0.0.1:7890
set https_proxy=http://127.0.0.1:7890
```

***

## 🌐 三、针对扩展（Extension）或 Git 的代理

有时 VS Code 本身能连外网，但 **扩展市场（Extensions）或 Git 同步** 还不行。\
可以手动配置：

### 🔸 VS Code 扩展市场代理

在 `settings.json`（打开命令面板输入 `Preferences: Open Settings (JSON)`）里添加：

```json
"http.proxy": "http://127.0.0.1:7890",
"https.proxy": "http://127.0.0.1:7890",
"http.proxyStrictSSL": false
```

### 🔸 Git 代理

打开终端执行：

```bash
git config --global http.proxy http://127.0.0.1:7890
git config --global https.proxy http://127.0.0.1:7890
```

***

## ✅ 四、测试是否生效

在 VS Code 终端中执行：

```bash
curl https://www.google.com
```

如果能返回网页源码或 HTTP 状态码 200，说明代理已生效。

***

是否要我帮你写一个适合你本地代理（比如 Clash 或 V2Ray）的完整配置模板？


> 更新: 2025-10-04 12:57:38  
> 原文: <https://www.yuque.com/lixinsi/srnvya/pvqgnmsiw6kog35c>