# 阿里云ECS：windows server 已锁定该用户账户，原因是登录尝试或密码更改尝试过多

## <font style="color:rgb(79, 79, 79);">场景</font>

* <font style="color:rgba(0, 0, 0, 0.75);">阿里云 : ESC</font>
* <font style="color:rgba(0, 0, 0, 0.75);">系统：windows server 2022</font>

## <font style="color:rgb(79, 79, 79);">问题</font>

<font style="color:rgb(77, 77, 77);">已锁定该用户账户，原因是登录尝试或密码更改尝试过多</font>

![1747460654482-833a5df7-984e-41f1-bf3b-5541060f8847.png](./img/MB274bm16Jpasve0/1747460654482-833a5df7-984e-41f1-bf3b-5541060f8847-941831.png)

## <font style="color:rgb(79, 79, 79);">原因</font>

<font style="color:rgb(77, 77, 77);">密码尝试次数过多</font>

## <font style="color:rgb(79, 79, 79);">解决方案</font>

<font style="color:rgb(77, 77, 77);">修改密码策略：</font><code><font style="color:rgb(199, 37, 78);background-color:rgb(249, 242, 244);">设置密码失败次数不受限制</font></code>

### <font style="color:rgb(79, 79, 79);">Step 1: 打开“本地安全策略”编辑器：</font><code><font style="color:rgb(199, 37, 78);background-color:rgb(249, 242, 244);">win+r -> 运行 gpedit.msc</font></code>

![1747460654410-55cb78e2-5a86-451a-a56f-ff9af430a26b.png](./img/MB274bm16Jpasve0/1747460654410-55cb78e2-5a86-451a-a56f-ff9af430a26b-433536.png)

### <font style="color:rgb(79, 79, 79);">Step 2: 账户锁定阈值：</font><code><font style="color:rgb(199, 37, 78);background-color:rgb(249, 242, 244);">设置为0，不受限制</font></code>

<font style="color:rgb(77, 77, 77);">依次双击：</font>[<font style="color:rgb(252, 85, 49);">计算机配置</font>](https://so.csdn.net/so/search?q=%E8%AE%A1%E7%AE%97%E6%9C%BA%E9%85%8D%E7%BD%AE\&spm=1001.2101.3001.7020)<font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">—>Windows设置 —> 安全设置 —> 账户策略 —> 账户锁定策略，然后右侧可以看到“账户锁定阈值”，双击或是右键属性，将值设置大一点或是设置为0,0表示不限制。</font>

![1747460654225-e1fb06d4-7960-4845-a2ef-cb883adbfa9f.png](./img/MB274bm16Jpasve0/1747460654225-e1fb06d4-7960-4845-a2ef-cb883adbfa9f-063836.png)

## <font style="color:rgb(79, 79, 79);">注意事项</font>

<code><font style="color:rgb(199, 37, 78);background-color:rgb(249, 242, 244);">这里windows，窗口错位导致设置账户锁定阈值值后--点应用无法确认，解决方案：按回车键即可</font></code>


> 更新: 2025-05-17 13:44:20  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/sorr4qvenuaexenc>