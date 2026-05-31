# nginx代理和转发

打开nginx配置文件

![1686884842230-d5a66a9b-b8a5-4ca7-a728-c8d67136e54a.png](./img/miL3LxJQZ6TKjHz1/1686884842230-d5a66a9b-b8a5-4ca7-a728-c8d67136e54a-116152.png)

然后再nginx当前目录新建文件夹modules

![1686884905263-0cf857f3-d4b5-4273-bfc6-92372177d64b.png](./img/miL3LxJQZ6TKjHz1/1686884905263-0cf857f3-d4b5-4273-bfc6-92372177d64b-470985.png)

在nginx.conf配置文件包含此文件夹配置

```xml
include ../modules/*conf;
```

![1686885087346-75e15220-de52-41c9-8600-11b883ed0429.png](./img/miL3LxJQZ6TKjHz1/1686885087346-75e15220-de52-41c9-8600-11b883ed0429-339705.png)



> 更新: 2023-06-16 11:12:09  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/cgp0daf4vzcd7zqw>