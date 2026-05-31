# 手把手教你Windows安装Python以及pip

### <font style="color:rgb(79, 79, 79);">1，先去</font>[Python官网](https://www.python.org/)<font style="color:rgb(79, 79, 79);">（打开可能会有点慢，耐心等待）</font>
![1718332229556-1bb2bb9a-dc88-4105-8c2a-d0316678fa90.png](./img/G_Ygrng067hzK6MB/1718332229556-1bb2bb9a-dc88-4105-8c2a-d0316678fa90-103666.png)

### <font style="color:rgb(79, 79, 79);">2，选好版本然后点击下载（现在应该都是64位的系统吧，所以选择64bit）</font>
![1718332229652-3b2dbd78-df76-47c0-9839-b3c069784fc3.png](./img/G_Ygrng067hzK6MB/1718332229652-3b2dbd78-df76-47c0-9839-b3c069784fc3-143850.png)

### <font style="color:rgb(79, 79, 79);">3，双击安装包进行安装</font>
#### <font style="color:rgb(79, 79, 79);">1，勾选"add python.exe to Path"，然后选择"customize installation"</font>
![1718332229582-87d3244a-a867-4259-8c70-19252ccbc70a.png](./img/G_Ygrng067hzK6MB/1718332229582-87d3244a-a867-4259-8c70-19252ccbc70a-849720.png)

#### <font style="color:rgb(79, 79, 79);">2，这里直接下一步：</font>
![1718332229642-a7adfd00-030b-48e1-9a3d-d89ee0ac89f7.png](./img/G_Ygrng067hzK6MB/1718332229642-a7adfd00-030b-48e1-9a3d-d89ee0ac89f7-296426.png)

#### <font style="color:rgb(79, 79, 79);">3，这里选择一个比较好记的路径：</font>
![1718332229866-d0ca763a-8bb4-4eb2-9156-6add335603f7.png](./img/G_Ygrng067hzK6MB/1718332229866-d0ca763a-8bb4-4eb2-9156-6add335603f7-024026.png)

#### <font style="color:rgb(79, 79, 79);">4，然后点击"install"，进行安装。</font>
### <font style="color:rgb(79, 79, 79);">4，验证安装</font>
#### <font style="color:rgb(79, 79, 79);">1，同时按下</font><font style="color:rgb(199, 37, 78);background-color:rgb(249, 242, 244);">win+r</font><font style="color:rgb(79, 79, 79);">，输入</font><font style="color:rgb(199, 37, 78);background-color:rgb(249, 242, 244);">cmd</font><font style="color:rgb(79, 79, 79);">，然后输入</font><font style="color:rgb(199, 37, 78);background-color:rgb(249, 242, 244);">python</font><font style="color:rgb(79, 79, 79);">,如果出现以下的提示就说明python安装成功。</font>
![1718332230396-32343c86-3f1e-4cc2-b060-8a59287c0ec0.png](./img/G_Ygrng067hzK6MB/1718332230396-32343c86-3f1e-4cc2-b060-8a59287c0ec0-498730.png)<font style="color:rgb(77, 77, 77);">  
</font>![1718332230369-ae7f29a5-1076-42f5-9dec-8ad346082cb5.png](./img/G_Ygrng067hzK6MB/1718332230369-ae7f29a5-1076-42f5-9dec-8ad346082cb5-098967.png)

#### <font style="color:rgb(79, 79, 79);">2，如果没有出现这个提示，它会提示 == python 不是内部或外部命令，也不是可运行的程序或批处理文件 ==</font>
<font style="color:rgb(77, 77, 77);">这个时候需要去环境变量里面取手动添加：  
</font><font style="color:rgb(77, 77, 77);">1，打开设置，搜索“环境变量”，然后点击“编辑系统环境变量”  
</font>![1718332230357-a9a0a335-eb25-48b6-a3c1-aa96cd26efc5.png](./img/G_Ygrng067hzK6MB/1718332230357-a9a0a335-eb25-48b6-a3c1-aa96cd26efc5-605703.png)<font style="color:rgb(77, 77, 77);">  
</font><font style="color:rgb(77, 77, 77);">2，点击环境变量，找到"path",点击编辑  
</font>![1718332230557-bfbb1759-c60d-4b99-97bf-abbcb03379fb.png](./img/G_Ygrng067hzK6MB/1718332230557-bfbb1759-c60d-4b99-97bf-abbcb03379fb-911747.png)<font style="color:rgb(77, 77, 77);">  
</font>![1718332230479-6f9f5d1e-c3dd-45a6-9501-0b4773f0c9c5.png](./img/G_Ygrng067hzK6MB/1718332230479-6f9f5d1e-c3dd-45a6-9501-0b4773f0c9c5-014233.png)<font style="color:rgb(77, 77, 77);">  
</font><font style="color:rgb(77, 77, 77);">3，点击"新建"，然后输入刚刚的安装路径，再点击确定，然后把刚刚弹出来的环境变量都点击确定。  
</font>![1718332230799-ec8572ef-bcec-4553-8f5a-9104228c9287.png](./img/G_Ygrng067hzK6MB/1718332230799-ec8572ef-bcec-4553-8f5a-9104228c9287-146250.png)<font style="color:rgb(77, 77, 77);">  
</font><font style="color:rgb(77, 77, 77);">4，在去cmd中输入</font><font style="color:rgb(199, 37, 78);background-color:rgb(249, 242, 244);">python</font><font style="color:rgb(77, 77, 77);">，验证是否成功。  
</font><font style="color:rgb(77, 77, 77);">5，重复刚刚的步骤再去环境变量中添加</font>![1718332230989-a2a20441-2efc-4a23-b75f-0f1a74fefdec.png](./img/G_Ygrng067hzK6MB/1718332230989-a2a20441-2efc-4a23-b75f-0f1a74fefdec-497167.png)<font style="color:rgb(77, 77, 77);">  
</font><font style="color:rgb(77, 77, 77);">6,完成后去cmd窗口输入</font><font style="color:rgb(199, 37, 78);background-color:rgb(249, 242, 244);">pip</font><font style="color:rgb(77, 77, 77);">,如果出现一堆东西，说明OK了。  
</font>![1718332230964-4921b040-371e-4586-83d5-5cd98ff0a6fa.png](./img/G_Ygrng067hzK6MB/1718332230964-4921b040-371e-4586-83d5-5cd98ff0a6fa-178025.png)<font style="color:rgb(77, 77, 77);">  
</font><font style="color:rgb(77, 77, 77);">7，可以使用</font><font style="color:rgb(199, 37, 78);background-color:rgb(249, 242, 244);">pip</font><font style="color:rgb(77, 77, 77);">命令来下载一些依赖。比如</font><font style="color:rgb(199, 37, 78);background-color:rgb(249, 242, 244);">pip install selenium</font><font style="color:rgb(77, 77, 77);">  
</font>![1718332231136-efeb62fb-5d75-4e09-a222-da3d35373373.png](./img/G_Ygrng067hzK6MB/1718332231136-efeb62fb-5d75-4e09-a222-da3d35373373-274306.png)



> 更新: 2024-06-14 10:30:36  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/wlfykai0agamzptg>