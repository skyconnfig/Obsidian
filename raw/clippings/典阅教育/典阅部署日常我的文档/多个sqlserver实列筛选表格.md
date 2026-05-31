# 多个sql server实列筛选表格

单个实列

启用远程连接实列

![1663577916458-455ecf03-953e-4faf-a742-601e362f0ddf.png](./img/BDRJ5KJSLy5pXbsc/1663577916458-455ecf03-953e-4faf-a742-601e362f0ddf-990114.png)



多个实列找到运行的实列

![1663577968501-afcc97be-4a2d-4858-92ae-72d6ec9f60ab.png](./img/BDRJ5KJSLy5pXbsc/1663577968501-afcc97be-4a2d-4858-92ae-72d6ec9f60ab-022113.png)

设置ip地址端口号，开启active

![1663577997962-a875ad96-7680-4a08-a9c5-5809948c9c1f.png](./img/BDRJ5KJSLy5pXbsc/1663577997962-a875ad96-7680-4a08-a9c5-5809948c9c1f-768890.png)

设置端口

重启服务

远程连接ip地址+端口号加实列名字

118.195.250.9,14333\MSSQLSERVER1\

1.13.3.158,15000\MSSQLSERVER2019



# 筛选特定数据
打开sql server management studio

打开需要筛选的表格如图

![1684836184111-54613290-cf8b-4d32-a137-539813d52462.png](./img/BDRJ5KJSLy5pXbsc/1684836184111-54613290-cf8b-4d32-a137-539813d52462-403250.png)

![1684836314391-4164a910-ccd2-46e8-ba0a-fc82af665697.png](./img/BDRJ5KJSLy5pXbsc/1684836314391-4164a910-ccd2-46e8-ba0a-fc82af665697-987149.png)

选择编辑前200行

![1684836369065-8950857a-b4d7-4026-9cc3-b0925d20e89a.png](./img/BDRJ5KJSLy5pXbsc/1684836369065-8950857a-b4d7-4026-9cc3-b0925d20e89a-949698.png)

![1684836402933-41f574ea-423b-4d86-99ee-34df8e9dd8d9.png](./img/BDRJ5KJSLy5pXbsc/1684836402933-41f574ea-423b-4d86-99ee-34df8e9dd8d9-838412.png)

```dockerfile
like 's%'以s开头的所有数据
like '%s'以s结尾的所有数据
like '%s%'包含s所有数据
```



> 更新: 2023-05-23 18:08:20  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/uqk0uw>