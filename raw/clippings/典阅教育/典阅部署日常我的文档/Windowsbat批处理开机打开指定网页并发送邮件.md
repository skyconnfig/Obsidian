# Windows bat批处理开机打开指定网页并发送邮件

<font style="color:rgb(32, 33, 36);">一、bat命令打开浏览器</font>

```plain
@echo off
explorer.exe "https://XX.com/"
```

<font style="color:rgb(32, 33, 36);">2.默认浏览器同时启动多个网址</font>

```plain
@echo off
explorer.exe "https://XX.com/"
explorer.exe "https://XY.com/"
```

<font style="color:rgb(32, 33, 36);">3.指定浏览器打开网站</font>

<font style="color:rgb(32, 33, 36);">注意：</font>

<font style="color:rgb(32, 33, 36);">①浏览器安装路径如果有空格，空格需用””括起来</font>

<font style="color:rgb(32, 33, 36);">②若浏览器安装路径中有中文，则需将 .bat 文件的默认的UTF-8编码另存为时转换为ANSI编码</font>

```plain
@echo off
start C:\Program" "Files\Google\Chrome\Application\chrome.exe "https://Xx.com/"
```

<font style="color:rgb(32, 33, 36);">二、blat发送邮件</font>

```plain
set from=abc@163.com
set user=abc
set pass=123
set subj=测试
set server=smtp.163.com
set body="邮件内容"
set to=1111@qq.com
blat -install %server% %from%
blat - -body %body% -to %to% -subject %subj% -server %server% -f %from% -u %user% -pw %pass%
```

<font style="color:rgb(32, 33, 36);">三、开机自动执行批处理文件</font>

<font style="color:rgb(32, 33, 36);">1.快捷键win+R，打开运行窗口</font>

<font style="color:rgb(32, 33, 36);">2.输入shell:startup快速找到开机启动目录</font>

<font style="color:rgb(32, 33, 36);">当电脑开机之后，就会自动执行这个目录下的内容，如果是bat文件，系统会自动执行，如果是文件夹或其他文件，则系统会自动调用相关程序打开。</font>

<font style="color:rgb(32, 33, 36);">因此，如果是想自动打开某些软件，可以将其快捷方式粘贴到这个目录下，或者用bat脚本打开，把批处理文件快捷方式复制到该文件夹下。</font>



> 更新: 2023-04-22 09:50:19  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/xyys7eatya10firh>