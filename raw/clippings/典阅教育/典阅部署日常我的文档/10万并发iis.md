# 10万并发iis

```json
https://www.cnblogs.com/ruralcraftsman/p/11378715.html
	
gxslsjnykt.dianyueyun.com

gxslsjn.dianyueyun.com
步骤一：
首先设置进程池
要点：把队列长度调整到65535，禁止重叠回收，最大故障数改成65530，这三点必须要改，不然实现不了10万并发效果
步骤二：
调整IIS 的appConcurrentRequestLimit设置
在开始--》运行--》输入：c:\windows\system32\inetsrv\appcmd.exe set config /section:serverRuntime /appConcurrentRequestLimit:100000--》回车
即可，然后可通过在运行中输入%systemroot%\System32\inetsrv\config\applicationHost.config回车查询设置结果，设置后就会出现下面代码：
<serverRuntime appConcurrentRequestLimit="100000" />
步骤三：
调整machine.config中的processModel>requestQueueLimit的设置
在开始-->运行--》输入：
%systemroot%\Microsoft.Net\Framework64\v2.0.50727\CONFIG\machine.config
%systemroot%\Microsoft.Net\Framework64\v4.0.30319\CONFIG\machine.config
打开后搜索找到：<processModel autoConfig="true" />，将此替换成<processModel enable="true" requestQueueLimit="100000" />


C:\Windows\Microsoft.NET\Framework\v4.0.30319\CONFIG\machine.config
步骤四：
在开始--》运行--》输入下面三句代码，然后回车，分别输入
reg add HKLM\System\CurrentControlSet\Services\HTTP\Parameters /v MaxConnections /t REG_DWORD /d 100000
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\HTTP\Parameters /v MaxFieldLength /t REG_DWORD /d 32768
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\HTTP\Parameters /v MaxRequestBytes /t REG_DWORD /d 32768
第一句将tcp并发数提高到10万，第二和第三句防止出现解决Bad Request - Request Too Long问题，三句分别输入，分别回车

步骤五：
启动cmd，然后先输入net stop http，等待完成，再输入 net start http，等待完成，再输入 iisreset
完成以上5步后，再重启服务器，即可达到并发数10万，无压力

regedit
HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Services/TCPIP/Parameters
MaxUserPort     40000
TcpTimedWaitDelay    30

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\aspnet_state\Parameters
SocketTimeout 20

netstat -aon|findstr "127.0.0.1"

Dy2024!@#$
47.94.123.251
47.95.166.109
60.205.91.87
59.110.144.176
47.95.42.195
59.110.91.224
59.110.149.125

120.24.51.192
120.25.197.44
120.25.198.201
120.25.233.236
112.74.51.177
120.25.197.122

120.25.234.167
120.25.213.153
120.24.48.207
120.24.49.17
120.24.221.41
120.25.198.159




典型服务器比赛情况：
1：208人有成绩，cpu平均40%左右，有10分钟左右，持续在60-80%，最高90% ，操作流畅，
2：138人有成绩，cpu平均25%左右，有5分钟左右，持续在50%左右，最高90% ，操作流畅，

综合考虑，在当前的题目和数据量的情况下，当前配置的情况下，极限值使用人数：250人左右，稳定使用人数：200人，保守稳定使用人员：150人：

临时服务器的情况：intel服务器，amd服务器性能基本差不多。



ERId	ER_EId	ER_PId	ER_MId	ER_Type	ER_Score	ER_State	ER_Operator	ER_AddTime	ER_Custom1	ER_Custom2	ER_Custom3
1	1	10000	440	1	185	0	440	2022-09-27 10:35:17.000	NULL	S0437	00:15:15
2	1	10000	428	1	172	0	428	2022-09-27 10:39:21.000	NULL	S0425	00:19:18
3	1	10000	442	1	192.5	0	442	2022-09-27 10:40:15.000	NULL	S0439	00:20:12
4	1	10000	405	1	195.5	0	405	2022-09-27 10:40:20.000	NULL	S0402	00:20:18
5	1	10000	464	1	168.5	0	464	2022-09-27 10:41:41.000	NULL	S0461	00:21:38
6	1	10000	450	1	148	0	450	2022-09-27 10:44:28.000	NULL	S0447	00:24:25
7	1	10000	479	1	166	0	479	2022-09-27 10:45:44.000	NULL	S0476	00:25:41
8	1	10000	429	1	151	0	429	2022-09-27 10:46:16.000	NULL	S0426	00:26:13
9	1	10000	486	1	169	0	486	2022-09-27 10:46:25.000	NULL	S0483	00:26:23
10	1	10000	404	1	177.5	0	404	2022-09-27 10:47:08.000	NULL	S0401	00:27:06
11	1	10000	488	1	154.5	0	488	2022-09-27 10:47:23.000	NULL	S0485	00:27:20
12	1	10000	441	1	167	0	441	2022-09-27 10:47:27.000	NULL	S0438	00:27:24
13	2	10001	440	1	196.5	0	440	2022-09-27 15:11:59.000	NULL	S0437	00:11:57
14	2	10001	405	1	198	0	405	2022-09-27 15:12:44.000	NULL	S0402	00:12:42
15	2	10001	442	1	209.63	0	442	2022-09-27 15:14:00.000	NULL	S0439	00:13:57
16	2	10001	428	1	167.5	0	428	2022-09-27 15:17:09.000	NULL	S0425	00:17:06
17	2	10001	441	1	197	0	441	2022-09-27 15:17:29.000	NULL	S0438	00:17:27
18	2	10001	429	1	150	0	429	2022-09-27 15:20:13.000	NULL	S0426	00:20:10
19	2	10001	464	1	189.5	0	464	2022-09-27 15:21:34.000	NULL	S0461	00:21:32
20	2	10001	404	1	192	0	404	2022-09-27 15:22:04.000	NULL	S0401	00:22:01
21	2	10001	488	1	189	0	488	2022-09-27 15:23:59.000	NULL	S0485	00:23:56
22	2	10001	479	1	182	0	479	2022-09-27 15:24:44.000	NULL	S0476	00:24:42
23	2	10001	450	1	182.5	0	450	2022-09-27 15:25:08.000	NULL	S0447	00:25:06
24	2	10001	486	1	169.5	0	486	2022-09-27 15:25:13.000	NULL	S0483	00:25:11


#Requires -RunAsAdministrator

# 步骤1：配置所有相关应用程序池参数
$appPoolsToUpdate = @(
    "由命令选择-admin",
    "2025-python量化投资-API",
    "2025-python量化投资-管理端",
    "电商全流程-admin",
    "电商商数-api",
    "电商商数-admin",
    "电商商数-dataApi",
    "电商商数-student"
    # 添加其他需要修改的池名称
)

# 备份IIS配置文件
$configPath = "$env:windir\System32\inetsrv\config\applicationHost.config"
Copy-Item $configPath "$configPath.bak_$(Get-Date -Format yyyyMMddHHmmss)" -Force

foreach ($pool in $appPoolsToUpdate) {
    try {
        # 设置队列长度
        & "$env:windir\system32\inetsrv\appcmd.exe" set apppool "/apppool.name:$pool" /queueLength:65535
        
        # 禁止重叠回收
        & "$env:windir\system32\inetsrv\appcmd.exe" set apppool "/apppool.name:$pool" /disallowOverlappingRotation:True
        
        # 设置最大故障数（修正参数名）
        & "$env:windir\system32\inetsrv\appcmd.exe" set apppool "/apppool.name:$pool" /rapidFailProtection.maxCrashes:65530
        
        # 验证设置
        Write-Host "`n验证配置 $pool :"
        & "$env:windir\system32\inetsrv\appcmd.exe" list apppool "/apppool.name:$pool" /text:queueLength
        & "$env:windir\system32\inetsrv\appcmd.exe" list apppool "/apppool.name:$pool" /text:disallowOverlappingRotation
        & "$env:windir\system32\inetsrv\appcmd.exe" list apppool "/apppool.name:$pool" /text:rapidFailProtection.maxCrashes
        
    } catch {
        Write-Warning "配置 $pool 失败: $_"
    }
}

# 步骤2-5保持原有配置（IIS并发限制、machine.config、注册表修改等）

Write-Host "`n所有应用程序池配置完成，请继续执行后续步骤并重启服务器！"

reg add HKLM\System\CurrentControlSet\Services\HTTP\Parameters /v MaxConnections /t REG_DWORD /d 100000
reg add HKLM\System\CurrentControlSet\Services\HTTP\Parameters /v MaxConnections /t REG_DWORD /d 100000
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\HTTP\Parameters /v MaxFieldLength /t REG_DWORD /d 32768
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\HTTP\Parameters /v MaxRequestBytes /t REG_DWORD /d 32768
c:\windows\system32\inetsrv\appcmd.exe set config /section:serverRuntime /appConcurrentRequestLimit:100000
 
```



> 更新: 2026-03-17 08:55:09  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/cgkhn7ge221ckvte>