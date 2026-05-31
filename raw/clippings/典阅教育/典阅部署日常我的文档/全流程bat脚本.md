# 全流程bat脚本

```powershell
@echo off

echo "use ping to delay"

start D:\dianyue\全流程服务\全流程服务\JiSuan\redisServer.exe

timeout /nobreak /t 5


start D:\dianyue\全流程服务\全流程服务\ZhuFuWu\ECommerceService.exe
pause
```



> 更新: 2023-03-24 11:15:25  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/yw1nnnnh07es0570>