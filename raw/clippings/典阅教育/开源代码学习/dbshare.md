# dbshare

# <font style="color:rgb(83, 83, 83);">安装 Web 服务器</font>
<font style="color:rgb(83, 83, 83);">Web 服务器 （IIS），请参考对应操作系统的相关资料进行安装和配置。</font>

# <font style="color:rgb(83, 83, 83);">安装数据库系统</font>
<font style="color:rgb(83, 83, 83);">支持 SQL Server 和 MySQL 两大主流数据库系统，请根据需求进行选择。</font>

<font style="color:rgb(83, 83, 83);">SQL Server 2008 R2 或更高版本。</font>

<font style="color:rgb(83, 83, 83);">下载 SQL Server for Windows - 官方下载。</font>

<font style="color:rgb(83, 83, 83);">安装部署指导请参考相关资料。</font>

<font style="color:rgb(83, 83, 83);">MySQL 5.7 或更高版本。</font>

<font style="color:rgb(83, 83, 83);">下载 MySQL for Windows - 官方下载。</font>

<font style="color:rgb(83, 83, 83);">安装部署指导请参考相关资料。</font>

# <font style="color:rgb(83, 83, 83);">安装软件和组件</font>
<font style="color:rgb(83, 83, 83);">jdk 8.0 或更高版本。</font>

<font style="color:rgb(83, 83, 83);">下载 JDK for Windows - 官方下载。</font>

<font style="color:rgb(83, 83, 83);">安装 JDK。</font>

<font style="color:rgb(83, 83, 83);">配置 JDK 系统环境变量（请参考以下操作说明）。</font>

<font style="color:rgb(83, 83, 83);"></font>

<font style="color:rgb(83, 83, 83);">系统环境变量配置。</font>

<font style="color:rgb(83, 83, 83);"></font>

<font style="color:rgb(83, 83, 83);">复制文件“dboxSharejdk-system-configuration.bat”到 JDK 安装目录。</font>

<font style="color:rgb(83, 83, 83);">双击运行“jdk-system-configuration.bat”。</font>

<font style="color:rgb(83, 83, 83);">执行结束完成配置。</font>

<font style="color:rgb(83, 83, 83);"></font>

<font style="color:rgb(83, 83, 83);">LibreOffice 6.0 或更高版本</font>

<font style="color:rgb(83, 83, 83);"></font>

<font style="color:rgb(83, 83, 83);">下载 LibreOffice for Windows - 官方下载。</font>

<font style="color:rgb(83, 83, 83);">安装 LibreOffice （选择完全安装）。</font>

<font style="color:rgb(83, 83, 83);">启动 LibreOffice 转换服务（请参考以下操作说明）。</font>

<font style="color:rgb(83, 83, 83);">启动转换服务。</font>

<font style="color:rgb(83, 83, 83);">复制文件“dboxSharelibreoffice-start-service.bat”到 LibreOffice 安装目录。</font>

<font style="color:rgb(83, 83, 83);">双击运行“libreoffice-start-service.bat”。</font>

<font style="color:rgb(83, 83, 83);">执行结束完成设置。</font>

<font style="color:rgb(83, 83, 83);"></font>

### <font style="color:rgb(51, 51, 51);">1、为什么网站显示无法访问(已完成安装)？</font><font style="color:rgb(83, 83, 83);">  
</font><font style="color:rgb(51, 51, 51);">请检查 IIS 站点访问权限设置，并确定 IIS 已注册 .NET Framework 4.0。</font><font style="color:rgb(83, 83, 83);">  
</font><font style="color:rgb(51, 51, 51);">2、IIS 如何注册 .NET Framework 4.0？</font><font style="color:rgb(83, 83, 83);">  
</font><font style="color:rgb(51, 51, 51);">以管理员身份运行 cmd，输入 cd "C:\Windows\Microsoft.NET\Framework64\v4.0.30319" 回车进入目录，输入 aspnet_regiis -i 回车执行注册。</font><font style="color:rgb(83, 83, 83);">  
</font><font style="color:rgb(51, 51, 51);">3、默认管理员登录账号和密码是什么？</font><font style="color:rgb(83, 83, 83);">  
</font><font style="color:rgb(51, 51, 51);">默认管理员登录账号 admin，登录密码 password，请注意大小写。</font><font style="color:rgb(83, 83, 83);">  
</font><font style="color:rgb(51, 51, 51);">4、为什么无法在线预览办公文档？</font><font style="color:rgb(83, 83, 83);">  
</font><font style="color:rgb(51, 51, 51);">请检查文件处理器配置，并确定 LibreOffice 转换服务已启动。</font><font style="color:rgb(83, 83, 83);">  
</font><font style="color:rgb(51, 51, 51);">5、如何启动 LibreOffice 转换服务？</font><font style="color:rgb(83, 83, 83);">  
</font><font style="color:rgb(51, 51, 51);">以管理员身份运行 cmd，输入 cd "C:\Program Files\LibreOffice\program" 回车进入目录，输入 soffice.exe --headless --accept="socket,host=127.0.0.1,port=8100;urp;" --nofirststartwizard 回车启动服务。</font><font style="color:rgb(83, 83, 83);">  
</font><font style="color:rgb(51, 51, 51);">6、为什么无法在线预览“3ds,dwg,eps”等图纸格式文件？</font><font style="color:rgb(83, 83, 83);">  
</font><font style="color:rgb(51, 51, 51);">答：默认仅支持在线预览“ai,cdr,psd”图纸格式文件，其它图纸文件格式必需部署第三方软件进行文件转换，</font>


> 更新: 2024-06-13 17:58:22  
> 原文: <https://www.yuque.com/lixinsi/zgdgm0/ba6v2xafm5hcq4za>