# mkcert工具生成受信任的SSL证书，解决局域网本地https访问问题

这篇文章详细介绍了如何使用 **mkcert** 工具在本地或局域网环境中生成并部署**受系统信任的 HTTPS 证书**，以解决开发过程中因自签名证书导致的浏览器不信任问题。以下是核心内容总结：

***

### 一、mkcert 简介

* **mkcert** 是一个用于生成本地信任开发证书的工具。
* 它自动在系统中安装一个本地 CA（证书颁发机构），并使用该 CA 签发证书，使浏览器等客户端自动信任这些证书。
* 特别适用于 `localhost`、`127.0.0.1`、局域网 IP 或自定义域名等无法使用 Let's Encrypt 的场景。

***

### 二、安装与配置（以 Windows 10 为例）

1. **下载 mkcert**：根据操作系统下载对应版本（如 `mkcert-v1.4.3-windows-amd64.exe`）。
2. **安装本地 CA**：

```bash
mkcert-v1.4.3-windows-amd64.exe -install
```

此命令将本地 CA 安装到系统“受信任的根证书颁发机构”。

3. **验证安装**：

```bash
mkcert-v1.4.3-windows-amd64.exe --help
```

4. **查看 CA 存储路径**：

```bash
mkcert -CAROOT
```

***

### 三、生成证书

* 可同时为多个主机名或 IP 签发证书，例如：

```bash
mkcert localhost 127.0.0.1 ::1 192.168.2.25
```

* 生成两个文件：
  * `localhost+3.pem`：证书文件
  * `localhost+3-key.pem`：私钥文件
* 证书默认有效期为 1 年。

***

### 四、测试验证

* 使用 Python 内置 HTTP 服务器加载证书，启动 HTTPS 服务（支持 Python 2/3）。
* 在浏览器中访问 `https://192.168.2.25:8000`，连接显示为“安全”，无证书警告。
* 若需在**局域网其他设备**上信任该证书，需将 CA 证书（`rootCA.pem`）分发并手动导入到各设备的“受信任的根证书颁发机构”。

***

### 五、跨平台信任 CA 证书

* **Windows**：双击 `.crt` 文件（可将 `.pem` 重命名为 `.crt`），通过证书导入向导安装到“受信任的根证书颁发机构”。
* **Linux（如 CentOS）**：

```bash
cp rootCA.pem /etc/pki/ca-trust/source/anchors/
update-ca-trust
```

***

### 六、高级功能

* `-pkcs12`：生成 `.p12` 格式证书（适用于 Java、IIS 等）。
* `-client`：生成用于客户端认证的证书（双向 TLS）。
* `-cert-file` / `-key-file`：自定义输出文件名。
* 支持通配符域名（如 `*.example.it`）。

***

### 总结

**mkcert 极大简化了本地 HTTPS 开发环境的搭建**，无需手动配置 OpenSSL 或处理复杂的 CA 管理。通过自动安装本地 CA 并签发匹配域名/IP 的证书，开发者可以在本机和局域网内实现“无警告”的 HTTPS 访问，非常适合前端、后端、移动端联调等场景。

### <font style="color:rgb(79, 79, 79);">6、文章参考链接</font>

#### <font style="color:rgb(79, 79, 79);">参考链接：</font>[<font style="color:rgb(78, 161, 219);">本地https快速解决方案——mkcert</font>](https://blog.dteam.top/posts/2019-04/%E6%9C%AC%E5%9C%B0https%E5%BF%AB%E9%80%9F%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88mkcert.html)

#### <font style="color:rgb(79, 79, 79);">官方文档：https://github.com/FiloSottile/mkcert#mkcert</font>

#### <font style="color:rgb(79, 79, 79);">下载链接：https://github.com/FiloSottile/mkcert/releases</font>


> 更新: 2025-10-17 10:24:16  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/whhh5gmqgavllz2r>