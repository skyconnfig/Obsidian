# 安装Sadtalker

你这条报错 👉

```plain
No suitable Python runtime found
```

意思是：你的机器上还没有安装 **Python 3.10**，所以 `py -3.10` 找不到对应的运行时。

***

## 🔧 解决办法

### 1. 确认已安装的版本

运行：

```powershell
py -0
```

它会列出系统里安装的 Python 版本，例如：

```plain
Installed Pythons found by py Launcher:
 -3.11-64 *
 -3.9-64
```

（如果没有 3.10，就说明还没装）

***

### 2. 安装 Python 3.10

去 Python 官网下载安装 Windows 64 位的 Python 3.10：

👉 [Python 3.10.11 Windows x86-64 installer](https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe)

安装时注意：

* 选 **Add Python 3.10 to PATH**（或者不加，直接用 `py -3.10` 调用）
* 选 **Install for all users** → 默认会装到 `C:\Program Files\Python310\`

***

### 3. 验证安装

装好后再运行：

```powershell
py -0
```

应该能看到：

```plain
-3.11-64
-3.10-64
```

***

### 4. 创建 3.10 虚拟环境

现在就能运行：

```powershell
py -3.10 -m venv venv310
```

然后激活：

```powershell
.\venv310\Scripts\activate
python --version
```

输出应该是：

```plain
Python 3.10.x
```

***

⚡ 总结：你需要 **先安装 Python 3.10** 才能用 `py -3.10` 创建 venv。

要不要我帮你整理一个 **一步步图文教程（带截图）**，教你如何在 Windows 上并存 Python 3.10 和 3.11？

```python
git clone https://github.com/skyconnfig/SadTalker
cd SadTalker
pip install -r requirements.txt

```

```python
python -m pip install --only-binary=all scikit-image
```

```python
# 激活虚拟环境
cd SadTalker
talker_env\Scripts\activate

# 强制安装预编译版本
pip install --only-binary=all scikit-image==0.19.3

```

你这个报错其实挺典型的，是在 Windows + Python 3.11 环境下 **编译 scikit-image 源码失败**。\
关键报错在最后几行：

```plain
error: Command "clang-cl.exe ..." failed with exit status 127
ERROR: Failed building wheel for scikit-image
```

👉 原因是 **pip 没有找到对应版本的 scikit-image 的二进制 wheel**，于是退回到源码编译。但 Windows 上要编译 scikit-image 依赖 Cython、C++ 编译器、clang-cl，环境特别麻烦，所以编译失败。

***

## ✅ 解决方案

### 1. 用预编译的二进制包（推荐）

不要自己编译，直接装官方提供的 wheel。\
在你的虚拟环境里运行：

```bash
pip install -U pip setuptools wheel
pip install scikit-image -i https://pypi.org/simple
```

如果还是走源码编译，可以强制指定已经有 wheel 的版本，比如：

```bash
pip install scikit-image==0.21.0
```

（目前 scikit-image 从 0.21 开始有兼容 Python 3.11 的官方 wheel。）

***

### 2. 如果一定要编译（不推荐）

需要配置完整的 C++ 环境：

* 安装 [Microsoft Visual C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)
* 安装 clang / llvm
* 安装 Cython
* 然后再运行：

```bash
pip install Cython
pip install scikit-image --no-binary :all:
```

***

### 3. 退一步：降低 Python 版本

有些机器上找 wheel 会失败，可以考虑建个 Python 3.9 或 3.10 的虚拟环境，再安装 scikit-image，会直接下载 wheel，不会触发源码编译。

***

## ⚡ 建议

你这是在装 **SadTalker** 的依赖对吧？\
SadTalker 其实对 scikit-image 版本没那么苛刻，推荐用：

```bash
pip install scikit-image==0.21.0
```

这样几乎 100% 可以装上，不用编译。

***

### <https://pypi.org/project/scikit-image/0.19.3/>离线下载编译好的包

### 运行当前项目

```python
python app_sadtalker.py
```


> 更新: 2025-09-30 09:42:43  
> 原文: <https://www.yuque.com/lixinsi/dtxgrg/giweqr2hx2z4ztzr>