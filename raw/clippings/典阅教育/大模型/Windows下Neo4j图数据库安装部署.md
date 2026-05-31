# Windows下Neo4j图数据库安装部署

**<font style="color:rgb(23, 35, 63);">一、基础环境安装</font>**

<font style="color:rgb(23, 35, 63);">Neo4j是基于Java的图形数据库，运行Neo4j需要启动JVM进程，因此必须安装JAVA SE的JDK。从Oracle官方网站下载：</font>[<font style="color:rgb(23, 35, 63);">https://www.oracle.com/java/technologies/downloads/?er=221886#jdk22-windows</font>](https://www.oracle.com/java/technologies/downloads/?er=221886#jdk22-windows)

![1734512548253-c92fea26-efa0-41aa-8d1f-6d35d0f8d262.webp](./img/x_ZD8g3KcpZL_8gw/1734512548253-c92fea26-efa0-41aa-8d1f-6d35d0f8d262-369540.webp)

<font style="color:rgb(23, 35, 63);">一般下载这个，安装到电脑。</font>

<font style="color:rgb(23, 35, 63);">配置环境变量，</font><font style="color:rgb(0, 0, 0);">在系统变量区域，新建环境变量，命名为JAVA_HOME，变量值设置为刚才JAVA的安装路径：</font>

![1734512547774-a7a8ee36-c1f5-4d75-a8de-fe782d78c4f5.webp](./img/x_ZD8g3KcpZL_8gw/1734512547774-a7a8ee36-c1f5-4d75-a8de-fe782d78c4f5-984142.webp)

<font style="color:rgb(0, 0, 0);">编辑系统变量区的Path，点击新建，然后输入 %JAVA_HOME%\bin</font>

![1734512547454-3f1d34b7-da08-45ff-b087-c654aa56c136.webp](./img/x_ZD8g3KcpZL_8gw/1734512547454-3f1d34b7-da08-45ff-b087-c654aa56c136-102747.webp)

<font style="color:rgb(0, 0, 0);">打开命令提示符CMD（WIN+R,输入cmd)，输入 java -version，若提示Java的版本信息，则证明环境变量配置成功。</font>

![1734512547260-f39aee4a-9e02-4d54-98eb-3b4f286d633e.webp](./img/x_ZD8g3KcpZL_8gw/1734512547260-f39aee4a-9e02-4d54-98eb-3b4f286d633e-556542.webp)

**<font style="color:rgb(0, 0, 0);">二、neo4j安装</font>**

<font style="color:rgb(0, 0, 0);">通过官网下载，可以选Community社区版：</font>[<font style="color:rgb(23, 35, 63);">https://neo4j.com/deployment-center/</font>](https://neo4j.com/download/)

![1734512547628-4357cefd-d8ea-4f78-8021-1eac05bb7b6c.webp](./img/x_ZD8g3KcpZL_8gw/1734512547628-4357cefd-d8ea-4f78-8021-1eac05bb7b6c-105680.webp)

<font style="color:rgb(0, 0, 0);">下载完成后是一个压缩包，直接解压缩到合适的路径就可以，不需要安装。</font>

<font style="color:rgb(23, 35, 63);">配置环境变量，打开方式与配置java环境相同。</font>

<font style="color:rgb(23, 35, 63);">在下方的系统变量区域，新建环境变量，命名为NEO4J_HOME，变量值设置为刚才NEO4J的安装路径：</font>

![1734512547902-428b4d30-9480-401a-8df0-0cbcc64620b0.webp](./img/x_ZD8g3KcpZL_8gw/1734512547902-428b4d30-9480-401a-8df0-0cbcc64620b0-465033.webp)

<font style="color:rgb(77, 77, 77);">编辑系统变量区的Path，点击新建，然后输入 %NEO4J_HOME%\bin</font>

![1734512547972-f456fd86-8828-44ca-b194-4be073e2cde1.webp](./img/x_ZD8g3KcpZL_8gw/1734512547972-f456fd86-8828-44ca-b194-4be073e2cde1-384930.webp)

<font style="color:rgb(0, 0, 0);">进入cmd，</font><font style="color:rgb(77, 77, 77);">输入命令neo4j.bat console，出现下面的界面，则证明neo4j启动成功。</font>

![1734512548230-797430c6-4a63-4b5c-a24f-1a44b47005a5.webp](./img/x_ZD8g3KcpZL_8gw/1734512548230-797430c6-4a63-4b5c-a24f-1a44b47005a5-375337.webp)

**<font style="color:rgb(23, 35, 63);">三、访问数据库</font>**

<font style="color:rgb(23, 35, 63);">上面的cmd窗口不用关闭，界面中展示有数据库访问地址。</font>

<font style="color:rgb(23, 35, 63);">在浏览器中输入</font>[<font style="color:rgb(23, 35, 63);">http://localhost:7474</font>](http://localhost:7474/)<font style="color:rgb(23, 35, 63);">，进入登录界面，初始默认用户名和密码都是neo4j：</font>

![1734512548536-f32e0253-b1d0-4b3f-93b3-5fa3595eb428.webp](./img/x_ZD8g3KcpZL_8gw/1734512548536-f32e0253-b1d0-4b3f-93b3-5fa3595eb428-128331.webp)

<font style="color:rgb(23, 35, 63);">登录进去默认会提示修改密码（8位以上），改完就可以进入数据库：</font>

![1734512548680-bc4d9fcb-e284-4414-884e-60a073ac022c.webp](./img/x_ZD8g3KcpZL_8gw/1734512548680-bc4d9fcb-e284-4414-884e-60a073ac022c-460423.webp)



> 更新: 2024-12-18 17:02:33  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/kyam2rgcth6s93tf>