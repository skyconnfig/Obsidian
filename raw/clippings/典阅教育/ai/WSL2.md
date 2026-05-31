# WSL2

### 检查 wsl 里面是否开启虚拟化
```python
taskmgr
```

![1745716376922-d7adc033-2beb-4493-9f11-ebeb9572af0e.png](./img/a8EsRK5_zFglQ10e/1745716376922-d7adc033-2beb-4493-9f11-ebeb9572af0e-577640.png)

### 服务里面添加两个功能
![1745716505423-a1a43030-7f79-4f6a-b5bd-254b82276da9.png](./img/a8EsRK5_zFglQ10e/1745716505423-a1a43030-7f79-4f6a-b5bd-254b82276da9-159252.png)



### 打开 cmd 并且用管理员权限运行
```python
wsl  --install
wsl --install --web-download
```

![1745716640771-3055fb17-d290-4d9f-8967-0841648ce8a4.png](./img/a8EsRK5_zFglQ10e/1745716640771-3055fb17-d290-4d9f-8967-0841648ce8a4-377721.png)

### 启动安装的 ubuntu
```python
wsl -d ubuntu
账号：lixinsi
密码：Aa@#4520
```

![1745716790607-feeafa25-93fc-4111-a9c9-45d697c51d9f.png](./img/a8EsRK5_zFglQ10e/1745716790607-feeafa25-93fc-4111-a9c9-45d697c51d9f-606604.png)

### 查看其它 Linux 安装版本
```python
wsl --list --online

wsl  --install kali-linux
```

![1745716953302-b8775065-0144-4ce6-bdf4-8a526b1d8e61.png](./img/a8EsRK5_zFglQ10e/1745716953302-b8775065-0144-4ce6-bdf4-8a526b1d8e61-150514.png)



### 查看 wsl 虚拟机的状态
```python
wsl --list -v
```

![1745717187320-8f1be830-1c02-4482-b731-f47c033e8595.png](./img/a8EsRK5_zFglQ10e/1745717187320-8f1be830-1c02-4482-b731-f47c033e8595-050723.png)



### 卸载虚拟机
```python
wsl --unregister  Ubuntu
```

![1745717268129-fe3e6902-974f-4ddd-b9d4-19da3b15c683.png](./img/a8EsRK5_zFglQ10e/1745717268129-fe3e6902-974f-4ddd-b9d4-19da3b15c683-642159.png)

### 备份和恢复
### 导出镜像
```python
wsl --export Ubuntu ubuntu.tar  --导出镜像
```

![1745717547262-f8e996bc-aef9-406b-b44c-1ddf85433d50.png](./img/a8EsRK5_zFglQ10e/1745717547262-f8e996bc-aef9-406b-b44c-1ddf85433d50-530942.png)



### 导入镜像其它分区导入 切换默认启动系统
```python
wsl --set-default kali-linux
```

### 其它文件夹导入
```python
cd D:
mkdir wsl
wsl --import Ubuntu2 D:/wsl C:\Users\93917\Desktop\ubuntu.tar
```

### wsl 可以在 Windows 里面执行 Linux 程序，在 Linux 可以执行 Windows 程序
```python
wslg 
 
```



> 更新: 2025-04-28 14:41:43  
> 原文: <https://www.yuque.com/lixinsi/vnere7/vm53iomzkgtgfpad>