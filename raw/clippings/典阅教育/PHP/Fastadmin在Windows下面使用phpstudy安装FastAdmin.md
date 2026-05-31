# Fastadmin在Windows下面使用phpstudy安装FastAdmin

[https://www.fastadmin.net/video/install/39.html](https://www.fastadmin.net/video/install/39.html)

### 1.打开 www.xp.cn 下载 windows 版本 64 位，双击进行安装，立即安装
![1734485682635-58414e01-318a-40fd-a243-d58a4e59a033.png](./img/RK_jsgWfmkJRrI3Q/1734485682635-58414e01-318a-40fd-a243-d58a4e59a033-260125.png)



### 2.启动 wnmp
![1734485741724-2bff8aeb-2a01-4d39-a1eb-6460c07759ec.png](./img/RK_jsgWfmkJRrI3Q/1734485741724-2bff8aeb-2a01-4d39-a1eb-6460c07759ec-036205.png)

### 3.安装环境 PHP7.1
![1734485834304-6fdf526e-0d74-4e2a-bf92-b6193de3d944.png](./img/RK_jsgWfmkJRrI3Q/1734485834304-6fdf526e-0d74-4e2a-bf92-b6193de3d944-038739.png)



### 4.新增网站，创建网站，创建数据库
![1734485922426-b812da89-7c84-4f81-810f-61a952f7ca49.png](./img/RK_jsgWfmkJRrI3Q/1734485922426-b812da89-7c84-4f81-810f-61a952f7ca49-339895.png)



### 5.添加伪静态
![1734485985421-3a08434e-1af4-4020-ab50-b635593bdb0e.png](./img/RK_jsgWfmkJRrI3Q/1734485985421-3a08434e-1af4-4020-ab50-b635593bdb0e-079503.png)

```php

if (!-e $request_filename)
{
  rewrite  ^(.*)$  /index.php?s=$1  last;
  break;
}
```



### 6.打开 https://www.fastadmin.net/download.html 下载完整包
![1734486127672-94cc9531-ad87-458b-b540-98a3f4312312.png](./img/RK_jsgWfmkJRrI3Q/1734486127672-94cc9531-ad87-458b-b540-98a3f4312312-979463.png)

![1734486321521-94d54b39-3774-474c-a09c-1afe32839179.png](./img/RK_jsgWfmkJRrI3Q/1734486321521-94d54b39-3774-474c-a09c-1afe32839179-257561.png)



> 更新: 2024-12-18 17:51:57  
> 原文: <https://www.yuque.com/lixinsi/edztzi/prpamsxmkzz4poe9>