# mkcert 生成本地SSL证书 IIS 安装

+ <font style="color:rgb(0, 0, 0);">下载mkcert</font>

```bash
https://github.com/FiloSottile/mkcert/releases/latest
```

+ <font style="color:rgb(0, 0, 0);">管理员身份 cmd 命令目录下</font>

```bash
mkcert-v1.4.4-windows-amd64.exe 192.168.1.212 localhost 127.0.0.1 ::1 // 192.168.1.212 localhost 127.0.0.1 为IPV4 ::1为IPV6
```

+ <font style="color:rgb(0, 0, 0);">生成 </font>

```bash
3.pem
3key.pem
```

+ <font style="color:rgb(0, 0, 0);">下载openssl链接：</font>[https://slproweb.com/products/Win32OpenSSL.html](https://slproweb.com/products/Win32OpenSSL.html)

```bash
pkcs12 -export -inkey D:/ssl/3k.pem -in D:/ssl/3.pem -out D:/ssl/3.pfx
```

![1718806845336-7cfb77a4-36b0-4a26-84a5-e00b4d49c051.png](./img/D2UEVoqtHtwWKGg4/1718806845336-7cfb77a4-36b0-4a26-84a5-e00b4d49c051-302284.png)

输入密码1 (其他密码会报错不知道咋回事)

```bash
拷贝 C:\Users\Admin\AppData\Local\mkcert 文件夹下的rootCA.pem文件重命名成rootCA.crt
```

![1718806891833-bf2ceffd-d46c-4752-9345-c7af7f2695a4.png](./img/D2UEVoqtHtwWKGg4/1718806891833-bf2ceffd-d46c-4752-9345-c7af7f2695a4-413592.png)

![1718806903641-10c9677d-aa05-4922-96ef-2d4e273747e0.png](./img/D2UEVoqtHtwWKGg4/1718806903641-10c9677d-aa05-4922-96ef-2d4e273747e0-546430.png)

![1718806919789-a19ce26f-3819-4354-a36e-36b24838ec2a.png](./img/D2UEVoqtHtwWKGg4/1718806919789-a19ce26f-3819-4354-a36e-36b24838ec2a-521981.png)

+ <font style="color:rgb(0, 0, 0);"> IIS管理器</font>
+ ![1718806941204-af799092-ec2f-4bf7-b09d-aa67481e2427.png](./img/D2UEVoqtHtwWKGg4/1718806941204-af799092-ec2f-4bf7-b09d-aa67481e2427-935215.png)
+ ![1718806967027-2c1e429a-227e-4571-ac60-714020952362.png](./img/D2UEVoqtHtwWKGg4/1718806967027-2c1e429a-227e-4571-ac60-714020952362-953869.png)
+ ![1718806983939-8977ae9a-ce49-446b-8377-25fdde22e302.png](./img/D2UEVoqtHtwWKGg4/1718806983939-8977ae9a-ce49-446b-8377-25fdde22e302-368413.png)
+ ![1718806994350-fead7c4c-59bf-4baf-9f78-025ec5cb06b2.png](./img/D2UEVoqtHtwWKGg4/1718806994350-fead7c4c-59bf-4baf-9f78-025ec5cb06b2-864358.png)
+ ![1718807003235-db847304-f7c0-40aa-b5af-c6feb6e45323.png](./img/D2UEVoqtHtwWKGg4/1718807003235-db847304-f7c0-40aa-b5af-c6feb6e45323-924123.png)

```bash
把3.pem 拷贝到访问主机重命名3.crt
之前的rootCA.crt和3.crt安装到受信任的根证书颁发机构
```

![1718807045058-564fd475-9d7e-4dba-bfbf-215925400470.png](./img/D2UEVoqtHtwWKGg4/1718807045058-564fd475-9d7e-4dba-bfbf-215925400470-827220.png)

![1718807055274-e4af4f83-a0d9-4157-a074-9d170b21b7a8.png](./img/D2UEVoqtHtwWKGg4/1718807055274-e4af4f83-a0d9-4157-a074-9d170b21b7a8-870654.png)



> 更新: 2025-07-09 12:24:48  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/oipwqg5eb81hfyzp>