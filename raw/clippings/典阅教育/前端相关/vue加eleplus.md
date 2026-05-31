# vue加eleplus

### 1. 删除 `node_modules` 和 `package-lock.json`

在项目根目录下运行以下命令来删除 `node_modules` 文件夹和 `package-lock.json` 文件：

```plain

rm -rf node_modules
rm package-lock.json
```

如果你在 Windows 上，可以使用：

```plain

rmdir /s /q node_modules
del package-lock.json
```

### 2. 清除 npm 缓存

清除 npm 缓存，可以运行：

```plain
npm cache clean --force
```

### 3. 重新安装依赖

然后，重新安装依赖：

```plain
npm install
```

### 4. 启动开发服务器

依赖安装完成后，启动开发服务器：

```plain
npm run serve
```

###


> 更新: 2024-10-06 00:09:37  
> 原文: <https://www.yuque.com/lixinsi/aykzyg/ryi3o7nigp4aoit5>