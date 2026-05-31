# 根据你遇到的“IIS APPPOOL\珠心算技能没有对Temporary ASP.NET Files目录写访问权限”

### **<font style="color:#000000;">问题原因</font>**

<font style="color:#000000;">ASP.NET在运行时需要对临时目录（</font><code>**<font style="color:#000000;">C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files</font>**</code><font style="color:#000000;">）进行写操作（如编译临时文件），而当前IIS应用程序池“珠心算技能”的默认身份（</font><code>**<font style="color:#000000;">IIS APPPOOL\珠心算技能</font>**</code><font style="color:#000000;">）缺乏该目录的写入权限，导致访问失败。</font>

### **<font style="color:#000000;">解决方案（推荐方法）</font>**

<font style="color:#000000;">通过 </font>**<font style="color:#000000;"> 工具</font>**<font style="color:#000000;"> 为应用程序池身份授予权限（微软官方推荐，安全性高且操作简单）：</font>

#### **<font style="color:#000000;">步骤1：以管理员身份运行PowerShell</font>**

* <font style="color:#000000;">按下 </font><code>**<font style="color:#000000;">Win + X</font>**</code><font style="color:#000000;">，选择 </font>**<font style="color:#000000;">“Windows PowerShell (管理员)”</font>**<font style="color:#000000;">（或“命令提示符(管理员)”）。</font>

#### **<font style="color:#000000;">步骤2：执行权限配置命令</font>**

<font style="color:#000000;">在PowerShell中输入以下命令（</font><code>**<font style="color:#000000;">IIS APPPOOL\珠心算技能</font>**</code>**<font style="color:#000000;">为你的应用程序池名称</font>**<font style="color:#000000;">）： </font>

```plain
powershell

下载
复制
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Aspnet_regiis.exe -ga "IIS APPPOOL\珠心算技能"
```

* **<font style="color:#000000;">参数说明</font>**<font style="color:#000000;">：</font><code>**<font style="color:#000000;">-ga</font>**</code><font style="color:#000000;"> 表示“Grant Access”，即授予指定用户对ASP.NET临时目录的访问权限。 </font>
* **<font style="color:#000000;">执行后</font>**<font style="color:#000000;">：命令会自动为“珠心算技能”应用程序池身份添加对 </font><code>**<font style="color:#000000;">Temporary ASP.NET Files</font>**</code><font style="color:#000000;"> 目录的写权限。</font>

#### **<font style="color:#000000;">步骤3：重启IIS或应用程序池</font>**

* **<font style="color:#000000;">方法1</font>**<font style="color:#000000;">：在PowerShell中输入 </font><code>**<font style="color:#000000;">iisreset</font>**</code><font style="color:#000000;"> 重启整个IIS服务。 </font>
* **<font style="color:#000000;">方法2</font>**<font style="color:#000000;">：仅重启“珠心算技能”应用程序池（更轻量）：</font><font style="color:#000000;">\ </font><font style="color:#000000;">打开 </font>**<font style="color:#000000;">IIS管理器</font>**<font style="color:#000000;"> → 左侧导航栏展开“应用程序池” → 右键“珠心算技能” → 点击“回收”或“停止”再“启动”。</font>

### **<font style="color:#000000;">备选方案：手动添加文件夹权限（适用于命令执行失败时）</font>**

<font style="color:#000000;">若步骤2失败，可手动为目录添加权限： </font>

#### **<font style="color:#000000;">步骤1：定位临时目录</font>**

<font style="color:#000000;">打开文件资源管理器，导航到：</font><font style="color:#000000;">\ </font><code>**<font style="color:#000000;">C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files</font>**</code>

#### **<font style="color:#000000;">步骤2：添加应用程序池身份权限</font>**

1. <font style="color:#000000;">右键目录 → </font>**<font style="color:#000000;">“属性”</font>**<font style="color:#000000;"> → </font>**<font style="color:#000000;">“安全”</font>**<font style="color:#000000;"> 选项卡 → </font>**<font style="color:#000000;">“编辑”</font>**<font style="color:#000000;"> → </font>**<font style="color:#000000;">“添加”</font>**<font style="color:#000000;">。 </font>
2. <font style="color:#000000;">在“选择用户或组”窗口中，点击 </font>**<font style="color:#000000;">“高级”</font>**<font style="color:#000000;"> → </font>**<font style="color:#000000;">“立即查找”</font>**<font style="color:#000000;">，在搜索结果中找到并选中 </font><code>**<font style="color:#000000;">IIS APPPOOL\珠心算技能</font>**</code><font style="color:#000000;">（若未找到，手动输入该名称）→ 点击“确定”。 </font>
3. <font style="color:#000000;">在权限列表中，勾选 </font>**<font style="color:#000000;">“写入”</font>**<font style="color:#000000;"> 和 </font>**<font style="color:#000000;">“修改”</font>**<font style="color:#000000;"> 权限 → 依次点击“应用”→“确定”。</font>

### **<font style="color:#000000;">注意事项</font>**

1. **<font style="color:#000000;">避免使用“Everyone”权限</font>**<font style="color:#000000;">：部分教程建议添加“Everyone”用户的写权限，但这会降低服务器安全性，</font>**<font style="color:#000000;">不推荐</font>**<font style="color:#000000;">（参考搜索结果6）。 </font>
2. **<font style="color:#000000;">目录不存在的情况</font>**<font style="color:#000000;">：若提示目录不存在，需先手动创建 </font><code>**<font style="color:#000000;">Temporary ASP.NET Files</font>**</code><font style="color:#000000;"> 文件夹，再执行上述权限配置（参考搜索结果16）。 </font>
3. **<font style="color:#000000;">.NET Framework安装问题</font>**<font style="color:#000000;">：若权限配置后仍报错，检查是否正确安装.NET Framework 4.0（可重新运行 </font><code>**<font style="color:#000000;">Aspnet_regiis.exe -i</font>**</code><font style="color:#000000;"> 修复安装，参考搜索结果5）。</font>


> 更新: 2025-07-14 13:07:44  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/en0ff2v7t1r471zf>