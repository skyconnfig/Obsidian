# 加CDN

<font style="color:rgb(13, 13, 13);">要给域名 </font>[https://srs.dianyuesoft.com/](https://srs.dianyuesoft.com/)<font style="color:rgb(13, 13, 13);"> 加上阿里云的 CDN，你需要按照以下步骤操作：</font>

1. **登录阿里云控制台**<font style="color:rgb(13, 13, 13);">：</font><font style="color:rgb(13, 13, 13);">登录你的阿里云账号，并转到 CDN 服务。</font>
2. **添加域名**<font style="color:rgb(13, 13, 13);">：</font><font style="color:rgb(13, 13, 13);">在 CDN 控制台，点击“添加域名”，然后输入你的域名（srs.dianyuesoft.com）。按照流程完成域名添加。</font>
3. **域名验证**<font style="color:rgb(13, 13, 13);">：</font><font style="color:rgb(13, 13, 13);">根据阿里云 CDN 的要求，你可能需要进行域名验证。这通常涉及在你的 DNS 记录中添加一些记录，以便阿里云可以验证你对该域名的控制权。</font>
4. **配置加速**<font style="color:rgb(13, 13, 13);">：</font><font style="color:rgb(13, 13, 13);">在 CDN 控制台中，找到刚刚添加的域名，并进行加速配置。你可以选择加速类型、加速区域等。确保你选择的加速区域覆盖你的用户主要所在地区。</font>
5. **证书配置**<font style="color:rgb(13, 13, 13);">：</font><font style="color:rgb(13, 13, 13);">如果你的域名使用 HTTPS，你需要配置 SSL 证书。你可以选择阿里云提供的免费证书，也可以上传自己的证书。</font>
6. **调整域名解析**<font style="color:rgb(13, 13, 13);">：</font><font style="color:rgb(13, 13, 13);">在你的 DNS 解析中，将原来指向服务器的域名解析改为指向阿里云 CDN 提供的域名。这通常涉及将 CNAME 记录指向 CDN 提供的域名。</font>
7. **测试和监控**<font style="color:rgb(13, 13, 13);">：</font><font style="color:rgb(13, 13, 13);">完成配置后，建议测试一下 CDN 是否生效。你可以访问 </font>https://srs.dianyuesoft.com/，确认内容是否被<font style="color:rgb(13, 13, 13);"> CDN 加速。另外，在阿里云 CDN 控制台中，你也可以监控 CDN 的使用情况和性能。</font>

<font style="color:rgb(13, 13, 13);">以上步骤是基本的配置过程，具体细节可能会根据阿里云 CDN 的具体界面和流程有所不同。在配置过程中，如果遇到问题，可以参考阿里云的文档或者向他们的技术支持寻求帮助。</font>



> 更新: 2024-02-28 09:58:53  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/xrpf08hn27n5f3ax>