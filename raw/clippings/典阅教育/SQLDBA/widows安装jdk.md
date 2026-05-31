# widows安装jdk

Windows软件：如何安装Jdk1.8并配置环境变量





本章介绍如何安装Jdk1.8并配置环境变量



第一步：双击安装我们的文件，记住我们的安装路径



![1663469637229-6d14e26b-cc24-48b6-8b60-32c95333fc17.png](./img/GYGEIXVbgLZvKTfW/1663469637229-6d14e26b-cc24-48b6-8b60-32c95333fc17-680631.png)



第二步：配置环境变量

1、进入系统属性，高级选项

![1663469647574-c49fe30e-8af3-44f6-b9cf-ec11f4871479.png](./img/GYGEIXVbgLZvKTfW/1663469647574-c49fe30e-8af3-44f6-b9cf-ec11f4871479-990694.png)



2、在系统变量区域选择新建，输入变量名“ JAVA_HOME ”;变量值“ 你的jdk的路径



![1663469669689-be8bc3af-e3b3-47a6-b314-bb7ed1216e82.png](./img/GYGEIXVbgLZvKTfW/1663469669689-be8bc3af-e3b3-47a6-b314-bb7ed1216e82-664033.png)

3、在系统变量区域，选择“新建”，输入变量名“ CLASSPATH”; 变量值 ：“.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;” 。请注意变量值中，前面的“点“和”分号”，可以直接复制此变量值。然后点击“确定”

![1663469681612-0153cadd-2921-4256-aae7-05b8f591658c.png](./img/GYGEIXVbgLZvKTfW/1663469681612-0153cadd-2921-4256-aae7-05b8f591658c-694012.png)



4、在系统变量区域，双击path变量，新建 %JAVA_HOME%\bin;%JAVA_HOME%\jre\bin; 如下：

![1663469690594-1a391d1d-88e0-49f3-9947-be32abb0acb5.png](./img/GYGEIXVbgLZvKTfW/1663469690594-1a391d1d-88e0-49f3-9947-be32abb0acb5-476522.png)

5、cmd输入 java -version 安装完

![1663469697645-c2bf980b-02f0-4139-81ac-5955d43da482.png](./img/GYGEIXVbgLZvKTfW/1663469697645-c2bf980b-02f0-4139-81ac-5955d43da482-798470.png)



资源下载 [https://pan.baidu.com/s/1RKKAkskGwV5K3GDcjq1Z8w](https://pan.baidu.com/s/1RKKAkskGwV5K3GDcjq1Z8w)提取码: vycd

[  
](https://blog.csdn.net/wfeil211/article/details/125867206)



> 更新: 2022-09-18 10:56:07  
> 原文: <https://www.yuque.com/lixinsi/mxdptw/qwglet>