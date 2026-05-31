# 解决UE5.0.3界面闪烁问题的分步方案

***

### **<font style="color:rgb(64, 64, 64);">1. 更新显卡驱动</font>**

* **<font style="color:rgb(64, 64, 64);">操作</font>**<font style="color:rgb(64, 64, 64);">：前往</font><font style="color:rgb(64, 64, 64);"> </font>[<font style="color:rgb(59, 130, 246);">NVIDIA官网</font>](https://www.nvidia.cn/Download/index.aspx)<font style="color:rgb(64, 64, 64);"> </font><font style="color:rgb(64, 64, 64);">下载并安装适用于RTX 4060 Laptop GPU的最新驱动。</font>
* **<font style="color:rgb(64, 64, 64);">注意</font>**<font style="color:rgb(64, 64, 64);">：安装时选择「</font>**<font style="color:rgb(64, 64, 64);">清洁安装</font>**<font style="color:rgb(64, 64, 64);">」，避免旧驱动残留导致冲突。</font>

***

### **<font style="color:rgb(64, 64, 64);">2. 调整UE5图形设置</font>**

* **<font style="color:rgb(64, 64, 64);">步骤</font>**<font style="color:rgb(64, 64, 64);">：</font>
  1. <font style="color:rgb(64, 64, 64);">打开UE5，进入</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">编辑（Edit）→ 项目设置（Project Settings）→ 平台（Platforms）→ Windows</font>**<font style="color:rgb(64, 64, 64);">。</font>
  2. <font style="color:rgb(64, 64, 64);">在「</font>**<font style="color:rgb(64, 64, 64);">默认RHI（Default RHI）</font>**<font style="color:rgb(64, 64, 64);">」选项中，尝试切换为</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">DirectX 11</font>**<font style="color:rgb(64, 64, 64);"> </font><font style="color:rgb(64, 64, 64);">或</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">Vulkan</font>**<font style="color:rgb(64, 64, 64);">（部分新驱动对DX12支持可能不稳定）。</font>
  3. <font style="color:rgb(64, 64, 64);">关闭</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">光线追踪（Ray Tracing）</font>**<font style="color:rgb(64, 64, 64);"> </font><font style="color:rgb(64, 64, 64);">等高级图形选项（位于</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">渲染（Rendering）</font>**<font style="color:rgb(64, 64, 64);"> </font><font style="color:rgb(64, 64, 64);">设置中）。</font>

***

### **<font style="color:rgb(64, 64, 64);">3. 强制UE5使用独立显卡</font>**

* **<font style="color:rgb(64, 64, 64);">步骤</font>**<font style="color:rgb(64, 64, 64);">：</font>
  1. <font style="color:rgb(64, 64, 64);">右键桌面空白处，打开</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">NVIDIA控制面板</font>**<font style="color:rgb(64, 64, 64);">。</font>
  2. <font style="color:rgb(64, 64, 64);">进入</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">管理3D设置 → 程序设置</font>**<font style="color:rgb(64, 64, 64);">，添加UE5的启动程序（如</font><font style="color:rgb(64, 64, 64);"> </font><code>**<font style="color:rgb(64, 64, 64);background-color:rgb(236, 236, 236);">UnrealEditor.exe</font>**</code><font style="color:rgb(64, 64, 64);">）。</font>
  3. <font style="color:rgb(64, 64, 64);">将其</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">首选图形处理器</font>**<font style="color:rgb(64, 64, 64);"> </font><font style="color:rgb(64, 64, 64);">设为</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">高性能NVIDIA处理器</font>**<font style="color:rgb(64, 64, 64);">。</font>

***

### **<font style="color:rgb(64, 64, 64);">4. 禁用全屏优化与DPI缩放</font>**

* **<font style="color:rgb(64, 64, 64);">步骤</font>**<font style="color:rgb(64, 64, 64);">：</font>
  1. <font style="color:rgb(64, 64, 64);">找到UE5启动程序（如</font><font style="color:rgb(64, 64, 64);"> </font><code>**<font style="color:rgb(64, 64, 64);background-color:rgb(236, 236, 236);">UnrealEditor.exe</font>**</code><font style="color:rgb(64, 64, 64);">），右键选择</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">属性</font>**<font style="color:rgb(64, 64, 64);">。</font>
  2. <font style="color:rgb(64, 64, 64);">在</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">兼容性</font>**<font style="color:rgb(64, 64, 64);"> </font><font style="color:rgb(64, 64, 64);">选项卡中：</font>
     * <font style="color:rgb(64, 64, 64);">勾选</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">禁用全屏优化</font>**<font style="color:rgb(64, 64, 64);">。</font>
     * <font style="color:rgb(64, 64, 64);">勾选</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">覆盖高DPI缩放行为</font>**<font style="color:rgb(64, 64, 64);">，选择</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">应用程序</font>**<font style="color:rgb(64, 64, 64);">。</font>

***

### **<font style="color:rgb(64, 64, 64);">5. 清理UE5缓存文件</font>**

* **<font style="color:rgb(64, 64, 64);">操作</font>**<font style="color:rgb(64, 64, 64);">：删除以下文件夹中的临时文件：</font>
  * <code>**<font style="color:rgb(64, 64, 64);background-color:rgb(236, 236, 236);">C:\Users\<用户名>\AppData\Local\UnrealEngine</font>**</code>
  * <code>**<font style="color:rgb(64, 64, 64);background-color:rgb(236, 236, 236);">C:\Users\<用户名>\AppData\Roaming\UnrealEngine</font>**</code>

***

### **<font style="color:rgb(64, 64, 64);">6. 验证或重装UE5</font>**

* <font style="color:rgb(64, 64, 64);">如果问题持续，尝试通过</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">Epic Games启动器</font>**<font style="color:rgb(64, 64, 64);"> </font><font style="color:rgb(64, 64, 64);">验证引擎完整性，或重新安装UE5.0.3及以上版本。</font>

***

### **<font style="color:rgb(64, 64, 64);">7. 检查硬件兼容性</font>**

* <font style="color:rgb(64, 64, 64);">确保系统满足UE5最低要求（如Windows 10/11版本、16GB内存等）。</font>
* <font style="color:rgb(64, 64, 64);">部分笔记本厂商（如联想、华硕）的出厂驱动可能存在兼容性问题，建议从官网下载官方驱动。</font>

***

### **<font style="color:rgb(64, 64, 64);">补充说明</font>**

* <font style="color:rgb(64, 64, 64);">如果以上步骤无效，可尝试在</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">NVIDIA控制面板</font>**<font style="color:rgb(64, 64, 64);"> </font><font style="color:rgb(64, 64, 64);">中关闭</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">G-SYNC</font>**<font style="color:rgb(64, 64, 64);"> </font><font style="color:rgb(64, 64, 64);">或</font><font style="color:rgb(64, 64, 64);"> </font>**<font style="color:rgb(64, 64, 64);">垂直同步（VSync）</font>**<font style="color:rgb(64, 64, 64);">。</font>
* <font style="color:rgb(64, 64, 64);">查看UE5官方论坛或提交问题至</font><font style="color:rgb(64, 64, 64);"> </font>[<font style="color:rgb(59, 130, 246);">Unreal Engine Issues</font>](https://issues.unrealengine.com/)<font style="color:rgb(64, 64, 64);">，确认是否为已知Bug。</font>

<font style="color:rgb(64, 64, 64);">通过以上步骤，界面闪烁问题通常可以得到解决。如果问题依旧，请提供具体报错日志以便进一步排查。</font>

<font style="color:rgb(77, 107, 254);background-color:rgb(219, 234, 254);">  
</font>


> 更新: 2025-05-15 16:12:48  
> 原文: <https://www.yuque.com/lixinsi/oyzgnh/sucyvpdz0g3nnrl3>