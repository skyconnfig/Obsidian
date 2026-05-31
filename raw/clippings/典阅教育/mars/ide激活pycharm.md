# ide激活pycharm

![1776678556503-0306578c-4e98-4890-9da3-a09cfe59a487.jpeg](./img/KNeqHdMUJLkIZrAp/1776678556503-0306578c-4e98-4890-9da3-a09cfe59a487-817964.jpeg)

### <font style="color:rgb(255, 255, 255);">CodeKey Run - JetBrains 激活工具使用指南</font>

工具简介\
CodeKey Run 是一个跨平台的 JetBrains IDE 激活工具，支持 Windows、Linux 和 macOS 系统，可自动激活 JetBrains 系列软件（如 IntelliJ IDEA、PyCharm、WebStorm 等）。

### <font style="color:rgb(255, 255, 255);">1.Windows 系统使用方法</font>

激活步骤\
1.按下 Win + S 键，选择 Windows PowerShell (管理员)

![1776678556539-3c36c11d-fa2a-4c66-b40b-4956dd8dfbf7.jpeg](./img/KNeqHdMUJLkIZrAp/1776678556539-3c36c11d-fa2a-4c66-b40b-4956dd8dfbf7-127197.jpeg)

2.复制以下命令到 PowerShell 中执行：

<code><font style="color:rgb(79, 195, 247);background-color:rgb(26, 26, 26);">irm ckey.run | iex</font></code>

工具会自动扫描并激活所有已安装的 JetBrains 软件

等待片刻即可完成激活，无需手动输入激活码

### <font style="color:rgb(255, 255, 255);">2.Linux 系统使用方法</font>

1.激活步骤\ <code><font style="color:rgb(79, 195, 247);background-color:rgb(26, 26, 26);">wget --no-check-certificate ckey.run -O ckey.run && bash ckey.run</font></code>

### <font style="color:rgb(255, 255, 255);">3.macOS 系统使用方法</font>

<code><font style="color:rgb(79, 195, 247);background-color:rgb(26, 26, 26);">curl -L -o ckey.run ckey.run && bash ckey.run</font></code>

### <font style="color:rgb(255, 255, 255);">注意事项</font>

建议直接复制命令，避免手动输入错误

激活过程需要网络连接

工具会自动识别系统已安装的 JetBrains 产品

### <font style="color:rgb(255, 255, 255);">macOS 特殊说明</font>

1.macOS 默认未安装 wget，建议使用 curl 命令\
2.如果之前使用过其他激活工具导致激活失败，需要彻底清理：\
3.删除 JetBrains 相关应用的缓存文件

### <font style="color:rgb(255, 255, 255);">自定义激活</font>

1.如需自定义激活信息，请访问：ckey.run\
2.验证激活,激活成功后，打开任意 JetBrains IDE\
3.点击菜单栏 Help → Register

免责声明: 本工具仅供学习和测试使用，请支持正版软件。长期使用请购买官方许可证。


> 更新: 2026-04-20 17:49:19  
> 原文: <https://www.yuque.com/lixinsi/up90z7/mwt9c1abya6wysrm>