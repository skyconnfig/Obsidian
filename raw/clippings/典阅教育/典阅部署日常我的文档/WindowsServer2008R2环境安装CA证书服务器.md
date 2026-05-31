# Windows Server 2008 R2 环境 安装 CA证书服务器

Windows Server 2008 R2 环境 安装 CA证书服务器



一、Windows版本

服务器的软件版本为Windows server 2008 R2 Datacenter



![1700393094576-dd79cc85-beec-402d-bbb3-5eaa5347a4ca.png](./img/LkP2CDWTDbOG-Axb/1700393094576-dd79cc85-beec-402d-bbb3-5eaa5347a4ca-847352.png)



二、安装IIS和证书服务

1、点击“开始”——>“管理工具”——>“服务管理器”



![1700393101726-abf396f1-d26f-4f76-9648-5fa7789d9132.png](./img/LkP2CDWTDbOG-Axb/1700393101726-abf396f1-d26f-4f76-9648-5fa7789d9132-248429.png)



2、点击“角色”——“添加角色”



![1700393107335-95748c16-eba7-47ae-ba93-0af0d1d7cafa.png](./img/LkP2CDWTDbOG-Axb/1700393107335-95748c16-eba7-47ae-ba93-0af0d1d7cafa-665181.png)



3、进入角色向导界面，点击“下一步”



![1700393115500-2e05c116-c804-46a3-a2b7-29a7e5cde738.png](./img/LkP2CDWTDbOG-Axb/1700393115500-2e05c116-c804-46a3-a2b7-29a7e5cde738-951063.png)



4、勾选“Active Directory证书服务”和“Web服务器（IIS）”，点击“下一步”

![1700393123681-e73fc8d2-f8a7-4d96-937f-0fbf7edf7f0e.png](./img/LkP2CDWTDbOG-Axb/1700393123681-e73fc8d2-f8a7-4d96-937f-0fbf7edf7f0e-166281.png)





5、点击“下一步”



![1700393130039-001f1b31-d504-4678-9ded-c8bc7884e622.png](./img/LkP2CDWTDbOG-Axb/1700393130039-001f1b31-d504-4678-9ded-c8bc7884e622-329970.png)



6、勾选“证书颁发机构”和“证书颁发机构web注册”，在弹出的界面中选择“添加所需的角色服务”，点击“下一步”

![1700393139987-c51aebd1-6444-4ccc-9ecb-db4fe0d2931a.png](./img/LkP2CDWTDbOG-Axb/1700393139987-c51aebd1-6444-4ccc-9ecb-db4fe0d2931a-884017.png)

![1700393147074-8425cf37-fa03-4f31-b66b-07374fb63bae.png](./img/LkP2CDWTDbOG-Axb/1700393147074-8425cf37-fa03-4f31-b66b-07374fb63bae-089616.png)









7、安装独立CA，点击“下一步”



![1700393154062-c43a96ad-2678-4997-982e-b9dd0d4c83cd.png](./img/LkP2CDWTDbOG-Axb/1700393154062-c43a96ad-2678-4997-982e-b9dd0d4c83cd-153989.png)



8、选择“根CA”，点击“下一步”



![1700393159789-44a7ec86-3d11-4b0d-9fba-fbba9f00f97c.png](./img/LkP2CDWTDbOG-Axb/1700393159789-44a7ec86-3d11-4b0d-9fba-fbba9f00f97c-790554.png)



9、选择“新建私钥”，点击“下一步”



![1700393164975-f7902be6-1920-4ce4-b7ce-9ec5dc2435fc.png](./img/LkP2CDWTDbOG-Axb/1700393164975-f7902be6-1920-4ce4-b7ce-9ec5dc2435fc-267803.png)



10、使用默认加密服务提供程序和密钥长度，点击“下一步”



![1700393171367-daed2727-eb4e-42e1-89eb-b7f710f30a81.png](./img/LkP2CDWTDbOG-Axb/1700393171367-daed2727-eb4e-42e1-89eb-b7f710f30a81-311083.png)



11、填写CA相关信息，点击“下一步”

![1700393178954-3ff27dd8-8c5a-4d0b-b40b-1e069979ab52.png](./img/LkP2CDWTDbOG-Axb/1700393178954-3ff27dd8-8c5a-4d0b-b40b-1e069979ab52-371656.png)





12、根证书有效期默认5年，可以按需修改，并点击“下一步”

![1700393184103-7017faaa-5f03-4304-b7c3-0f0ba858b0de.png](./img/LkP2CDWTDbOG-Axb/1700393184103-7017faaa-5f03-4304-b7c3-0f0ba858b0de-283938.png)





13、选择证书数据库和日志位置，点击“下一步”



![1700393190080-11acdd08-9c29-4cd7-8527-faf2618f23df.png](./img/LkP2CDWTDbOG-Axb/1700393190080-11acdd08-9c29-4cd7-8527-faf2618f23df-210538.png)



14、Web服务器（IIS）安装，点击“下一步”

![1700393195728-b97bb0da-7bf8-4909-89da-e6776701d4d2.png](./img/LkP2CDWTDbOG-Axb/1700393195728-b97bb0da-7bf8-4909-89da-e6776701d4d2-049155.png)





15、点击“下一步”

![1700393206934-c4e573ed-efc1-4992-ab1f-23afc6f682cf.png](./img/LkP2CDWTDbOG-Axb/1700393206934-c4e573ed-efc1-4992-ab1f-23afc6f682cf-773953.png)





16、确认信息，并点击“安装”



![1700393217189-a209b9d4-f017-4063-935e-0ebf1b2a4b14.png](./img/LkP2CDWTDbOG-Axb/1700393217189-a209b9d4-f017-4063-935e-0ebf1b2a4b14-054477.png)

![1700393223424-484d0cba-f775-4061-b2ae-e2301f75e8d6.png](./img/LkP2CDWTDbOG-Axb/1700393223424-484d0cba-f775-4061-b2ae-e2301f75e8d6-206961.png)







17、安装完毕



![1700393229105-d87ac05c-459b-4f7c-88b8-ff686e2f5244.png](./img/LkP2CDWTDbOG-Axb/1700393229105-d87ac05c-459b-4f7c-88b8-ff686e2f5244-577740.png)



18、在“开始”——>“管理工具”——>“服务器管理器”——>点击“配置IE ESC”

![1700393234320-8c6a3f00-7044-47eb-8f10-d3c8f383af6c.png](./img/LkP2CDWTDbOG-Axb/1700393234320-8c6a3f00-7044-47eb-8f10-d3c8f383af6c-029200.png)





19、禁用所有“internet exploter增强的安全配置”



![1700393240258-47445883-6ee0-40a2-8f07-5a5f954334b1.png](./img/LkP2CDWTDbOG-Axb/1700393240258-47445883-6ee0-40a2-8f07-5a5f954334b1-865095.png)



20、在“IE”——>“internet选项”——>“安全”——“可信站点”中增加本机IP地址，并取消https的验证



![1700393246935-7719e465-4341-48bc-9483-f7c49d8314cb.png](./img/LkP2CDWTDbOG-Axb/1700393246935-7719e465-4341-48bc-9483-f7c49d8314cb-140588.png)



21、点击“自定义级别”，对“ActiveX控件和插件里”的部分选项进行更改，修改完后点击“确定”



a)对未标记为可安全执行脚本的ActiveX初始化并执行脚本（启用）



b)下载未签名的ActiveX控件（启用）



c)下载已签名的ActiveX控件（启用）



d)允许运行以前未使用的ActiveX控件而不提示（启用）



![1700393256639-e4a77819-2a99-4f5e-af1d-d14421405e63.png](./img/LkP2CDWTDbOG-Axb/1700393256639-e4a77819-2a99-4f5e-af1d-d14421405e63-485825.png)



22、在IE中输入[http://10.10.10.10/certsrv](http://10.10.10.10/certsrv)可以打开证书申请界面

![1700393263205-90717a45-9ddf-434f-ab6f-995b16a9f24d.png](./img/LkP2CDWTDbOG-Axb/1700393263205-90717a45-9ddf-434f-ab6f-995b16a9f24d-931861.png)





原文链接：[https://blog.csdn.net/weixin_57099902/article/details/132876004](https://blog.csdn.net/weixin_57099902/article/details/132876004)

[在windows server 2008上安装证书服务_2008系统安装证书-CSDN博客](https://blog.csdn.net/ma_jiang/article/details/11949201/?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-1--blog-99294653.235^v38^pc_relevant_anti_t3&spm=1001.2101.3001.4242.2&utm_relevant_index=4)



> 更新: 2023-11-19 19:33:01  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/nbdl4x367gth3fxp>