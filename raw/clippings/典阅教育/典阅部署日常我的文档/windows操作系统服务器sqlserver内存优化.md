# windows操作系统服务器sql server内存优化

```powershell
regedit
HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Services/TCPIP/Parameters
MaxUserPort     40000
TcpTimedWaitDelay    30

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\aspnet_state\Parameters
SocketTimeout 20

 SQL Server 端使用 MaxUserPort=64534、TcpTimeWaitDelay=30 和 SynAttackProtect=0
```



> 更新: 2024-07-01 10:27:20  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/aammqyr8g5813ypq>