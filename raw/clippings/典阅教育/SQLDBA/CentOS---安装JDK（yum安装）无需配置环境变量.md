# CentOS---安装JDK（yum安装）无需配置环境变量

##### <font style="color:rgb(33, 37, 41);">1.查看云端目前支持安装的JDK版本</font>
yum <font style="color:rgb(227, 98, 9);">search</font> java|<font style="color:rgb(215, 58, 73);">grep</font> jdk

##### <font style="color:rgb(33, 37, 41);">2.选择JDK版本，并安装</font>
<font style="color:rgb(0, 92, 197);">yum</font> install -y java-<font style="color:rgb(0, 92, 197);">1</font>.<font style="color:rgb(0, 92, 197);">8</font>.<font style="color:rgb(0, 92, 197);">0</font>-openjdk

##### <font style="color:rgb(33, 37, 41);">3.检查是否安装成功</font>
java -<font style="color:rgb(227, 98, 9);">version</font>

##### <font style="color:rgb(33, 37, 41);">4.查看JDK的安装目录</font>
##### <font style="color:rgb(227, 98, 9);">find</font> / -name <font style="color:rgb(3, 47, 98);">'java'</font>
IJ安装javajdk

<font style="color:rgb(77, 77, 77);">ntelliJ IDEA支持多个版本的JDK同时存在，如下图：</font>

![1663377335183-e55ab152-58ca-4d90-8aec-9e6386e05878.png](./img/sCkkVJEpyXv6zKiB/1663377335183-e55ab152-58ca-4d90-8aec-9e6386e05878-936728.png)

[https://www.cnblogs.com/XiaoCui-blog/p/15185532.html](https://www.cnblogs.com/XiaoCui-blog/p/15185532.html)

[https://gitee.com/xwintop/x-RdbmsSyncTool#https://gitee.com/link?target=https%3A%2F%2Fwww.jetbrains.com%2F%3Ffrom%3DxJavaFxTool](https://gitee.com/xwintop/x-RdbmsSyncTool#https://gitee.com/link?target=https%3A%2F%2Fwww.jetbrains.com%2F%3Ffrom%3DxJavaFxTool)





dbsync:[http://www.hc-software.com/dbsync.htm](http://www.hc-software.com/dbsync.htm)



> 更新: 2022-09-18 10:14:55  
> 原文: <https://www.yuque.com/lixinsi/mxdptw/pwlm9p>