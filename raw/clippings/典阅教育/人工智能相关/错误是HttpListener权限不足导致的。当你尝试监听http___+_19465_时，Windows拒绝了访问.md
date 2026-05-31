# 错误是 HttpListener 权限不足导致的。当你尝试监听 http://+:19465/ 时，Windows 拒绝了访问

<font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">这个错误是 </font>**<font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">HttpListener 权限不足</font>**<font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">导致的。当你尝试监听 </font><code>**<font style="color:rgb(52, 54, 61);background-color:rgb(237, 240, 248);">http://+:19465/</font>**</code><font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);"> 时，Windows 拒绝了访问。</font>

## <font style="color:rgb(21, 22, 23);background-color:rgb(253, 253, 254);">错误原因</font>

<code>**<font style="color:rgb(52, 54, 61);background-color:rgb(237, 240, 248);">HttpListener</font>**</code><font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);"> </font><font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">监听非 localhost 地址（如</font><font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);"> </font><code>**<font style="color:rgb(52, 54, 61);background-color:rgb(237, 240, 248);">http://+:</font>**</code><font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);"> </font><font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">或</font><font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);"> </font><code>**<font style="color:rgb(52, 54, 61);background-color:rgb(237, 240, 248);">http://*:</font>**</code><font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">）时需要管理员权限。普通用户运行程序会被拒绝访问。</font>

## <font style="color:rgb(21, 22, 23);background-color:rgb(253, 253, 254);">解决方案</font>

### <font style="color:rgb(21, 22, 23);background-color:rgb(253, 253, 254);">方法1：以管理员身份运行（最简单）</font>

<font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">右键点击你的程序 → "以管理员身份运行"</font>

### <font style="color:rgb(21, 22, 23);background-color:rgb(253, 253, 254);">方法2：使用 netsh 命令授权（推荐）</font>

<font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">以管理员身份打开命令提示符，运行：</font>

```plain
cmd

netsh http add urlacl url=http://+:19465/ user=Everyone
```

<font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">或者指定特定用户：</font>

```plain
cmd

netsh http add urlacl url=http://+:19465/ user=域\用户名
```

### <font style="color:rgb(21, 22, 23);background-color:rgb(253, 253, 254);">方法3：改用 localhost（开发环境）</font>

<font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">如果只是本地测试，修改代码：</font>

```plain
csharp

// 原代码
httpListener.Prefixes.Add("http://+:19465/");

// 改为
httpListener.Prefixes.Add("http://localhost:19465/");
```

### <font style="color:rgb(21, 22, 23);background-color:rgb(253, 253, 254);">方法4：使用其他端口</font>

<font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">某些端口可能已被占用或保留，尝试换个端口：</font>

```plain
csharp

httpListener.Prefixes.Add("http://+:8080/");
```

## <font style="color:rgb(21, 22, 23);background-color:rgb(253, 253, 254);">检查授权是否成功</font>

<font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">查看已授权的 URL：</font>

```plain
cmd

netsh http show urlacl
```

<font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">删除授权（如需要）：</font>

```plain
cmd

netsh http delete urlacl url=http://+:19465/
```

**<font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">建议</font>**<font style="color:rgb(52, 54, 61);background-color:rgb(253, 253, 254);">：生产环境使用方法2，开发环境使用方法3。</font>


> 更新: 2025-09-04 15:10:04  
> 原文: <https://www.yuque.com/lixinsi/ynhoz5/vloxi7pl9en7pdls>