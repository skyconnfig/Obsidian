# JS

### 1.使用Windows.location.href打开新的窗口
```json
const w=window.open("about:balnk");
w.location.href=" ";
```

### 2.农信银打开网址
```json
			var httpServer = window.location.origin
			if(OPtype==='1'){
				window.open(`${types!=='2'?'/MLogon.html':'/Desktop'}`,"_blank") ///Desktop
			}else if(OPtype==='2'){
				window.open(`http://60.205.113.0:1010/LoginAuto_xmjr.html?username=${LoginName}&httpServer=${httpServer}&password=${UserPwd}&ProjectIdAll=${ProjectIdAll}`,"_blank")
			}else window.location.href = '/Logon'

```



> 更新: 2023-07-26 15:07:20  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/rtm09hkyhf7s4uk6>