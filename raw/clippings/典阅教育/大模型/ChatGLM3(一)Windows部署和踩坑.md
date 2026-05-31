# ChatGLM3(一) Windows部署和踩坑

# <font style="color:#000000;">1. 安装conda环境</font>
## <font style="color:#000000;">1.1 下载Anaconda3</font>
<font style="color:#000000;">官网下载安装Anaconda3</font><font style="color:#000000;"> </font>[<font style="color:#000000;">https://repo.anaconda.com/archive/Anaconda3-2021.11-Windows-x86_64.exe</font>](https://repo.anaconda.com/archive/Anaconda3-2021.11-Windows-x86_64.exe)

## <font style="color:#000000;">1.2 更新conda</font>
<font style="color:#000000;">如果安装正确，右键开始菜单-终端，打开后提示符会有(Base)前缀，推荐使用Powershell不是Command，Powershell命令功能更多而且有很多Linux通用命令。</font>

```plain
(base) PS C:\Users\xxxx>
```

<font style="color:#000000;">更新base</font>

```plain
conda update -n base -c defaults conda
```

<font style="color:#000000;">速度太慢可以改为国内的镜像源，推荐阿里云或清华。</font>

## <font style="color:#000000;">1.3 创建conda环境</font>
<font style="color:#000000;">按照ChatGLM3官网推荐使用python 3.10</font>

```plain
conda create -n chatglm3-demo python=3.10
```

<font style="color:#000000;">等待在线安装完成。</font>

<font style="color:#000000;">激活环境，命令提示符前缀改变。</font>

```plain
conda activate chatglm3-demo
(chatglm3-demo) PS C:\Users\xxxx>
```

# <font style="color:#000000;">2. 安装显卡CUDA驱动</font>
## <font style="color:#000000;">2.1 安装最新NVIDIA显卡驱动</font>
<font style="color:#000000;">官网</font><font style="color:#000000;"> </font>[<font style="color:#000000;">https://www.nvidia.cn/Download/index.aspx</font>](https://www.nvidia.cn/Download/index.aspx)<font style="color:#000000;"> </font><font style="color:#000000;">下载最新版本驱动安装。</font>

## <font style="color:#000000;">2.2 查看显卡支持CUDA版本</font>
<font style="color:#000000;">Windows命令行nvidia-smi命令查看</font>

```plain
nvidia-smi

+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 536.40                 Driver Version: 536.40       CUDA Version: 12.2     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                     TCC/WDDM  | Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  NVIDIA GeForce RTX 3080 Ti   WDDM  | 00000000:01:00.0 Off |                  N/A |
| 30%   34C    P8              16W / 350W |    649MiB / 12288MiB |      5%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+
```

<font style="color:#000000;">这里驱动版本是536.40，CUDA最高支持12.2，当然12.2以下也是支持的，下文使用的是CUDA11.8版本。</font>

## <font style="color:#000000;">2.3 CUDA下载安装</font>
<font style="color:#000000;">打开</font><font style="color:#000000;"> </font>[<font style="color:#000000;">https://developer.nvidia.com/cuda-downloads</font>](https://developer.nvidia.com/cuda-downloads)<font style="color:#000000;">，注册Nvida开发者，然后就找到11.8版本下载。 运行cuda_11.8.0_522.06_windows.exe，一步步安装至完成。</font>

## <font style="color:#000000;">2.4 cuDNN下载安装</font>
<font style="color:#000000;">打开</font><font style="color:#000000;"> </font>[<font style="color:#000000;">https://developer.nvidia.com/rdp/cudnn-archive</font>](https://developer.nvidia.com/rdp/cudnn-archive)<font style="color:#000000;">，找到CUDA11.x对应的CUDNN版本下载。 解压cudnn-windows-x86_64-8.9.5.30_cuda11-archive.zip，解压到C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8中，覆盖同名文件。</font>

## <font style="color:#000000;">2.5 nvcc查看版本</font>
<font style="color:#000000;">运行nvcc -V命令</font>

```plain
nvcc -V
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2022 NVIDIA Corporation
Built on Wed_Jun__8_16:59:34_Pacific_Daylight_Time_2022
Cuda compilation tools, release 11.7, V11.7.99
Build cuda_11.7.r11.7/compiler.31442593_0
```

# <font style="color:#000000;">3. 安装ChatGLM3</font>
## <font style="color:#000000;">3.1 下载ChatGLM3</font>
```plain
git clone https://github.com/THUDM/ChatGLM3.git
```

## <font style="color:#000000;">3.2 安装python依赖</font>
```plain
cd ChatGLM3\
pip install -r requirements.txt
cd composite_demo\
pip install -r requirements.txt
```

## <font style="color:#000000;">3.3 下载模型</font>
```plain
mkdir THUDM
cd THUDM\
git lfs install
git clone https://www.modelscope.cn/ZhipuAI/chatglm3-6b.git
```

<font style="color:#000000;">等待下载完成，总大小有10多GB。</font>

## <font style="color:#000000;">3.4 运行</font>
```plain
streamlit run main.py
```

<font style="color:#000000;">如果一切顺利，我说是如果，没有任何报错，打开 https://localhost:8501 就能看到界面。</font>

<font style="color:#000000;">实际应该是不会这么顺利的，下面是踩坑。</font>

# <font style="color:#000000;">4 踩坑</font>
## <font style="color:#000000;">4.1 huggingface下载模型问题</font>
<font style="color:#000000;">如果运行后开始出现从https://huggingface.co下载模型文件，或者报错连不上huggingface。就修改路径指定到本地下载的模型路径。</font>

<font style="color:#000000;">ChatGLM3\composite_demo\client.py找到路径位置，Windows下运行需要加上./</font>

```plain
MODEL_PATH = os.environ.get('MODEL_PATH', './THUDM/chatglm3-6b')
```

<font style="color:#000000;">其他启动文件找到加载模型的地方，加上./</font>

```plain
tokenizer = AutoTokenizer.from_pretrained("./THUDM/chatglm3-6b", trust_remote_code=True)
model = AutoModel.from_pretrained("./THUDM/chatglm3-6b", trust_remote_code=True).cuda()
```

## <font style="color:#000000;">4.2 CUDA开启问题</font>
<font style="color:#000000;">AssertionError(“Torch not compiled with CUDA enabled”)</font>

<font style="color:#000000;">如果出现这个错误，前面Windows的CUDA驱动都正确安装了的话。可能就是torch没有安装对应的cuda版本。</font>

<font style="color:#000000;">列出已安装版本</font>

```plain
conda list
torch                     2.1.0+cu118              pypi_0    pypi
torchaudio                2.1.0+cu118              pypi_0    pypi
torchvision               0.16.0+cu118             pypi_0    pypi

pip list
torch                     2.1.0+cu118
torchaudio                2.1.0+cu118
torchvision               0.16.0+cu118
```

<font style="color:#000000;">如果版本号后面没有+cu118，说明安装的是CPU版本的，需要重新安装CUDA版本的torch。</font>

<font style="color:#000000;">在</font>[<font style="color:#000000;">官网</font>](https://pytorch.org/get-started/locally/)<font style="color:#000000;">找到命令，这里我系统安装的CUDA版本是11.8</font>

```plain
pip uninstall torch
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
```

<font style="color:#000000;">等待下载安装完成。</font>

## <font style="color:#000000;">4.3 No module named ’transformers_modules.'</font>
<font style="color:#000000;">ModuleNotFoundError: No module named ’transformers_modules.'</font>

<font style="color:#000000;">如果出现这个错误，一般是transformers的版本和torch版本不对应。</font>

<font style="color:#000000;">安装最新版本的transformers或者指定版本</font>

```plain
pip uninstall transformers
pip install transformers -i https://pypi.tuna.tsinghua.edu.cn/simple
pip install transformers==4.26.1 -i https://pypi.tuna.tsinghua.edu.cn/simple
pip install transformers==4.30.2 -i https://pypi.tuna.tsinghua.edu.cn/simple
```

## <font style="color:#000000;">4.4 显存问题</font>
<font style="color:#000000;">如果显存不足，有两个方法： 一种是下载int8或int4版本的量化后模型；</font>

```plain
git clone https://www.modelscope.cn/ZhipuAI/chatglm2-6b-int4.git
```

<font style="color:#000000;">另一种是参数配置加上8bit或4bit量化参数，在启动时量化，启动时间会更久。</font>

```plain
model = AutoModel.from_pretrained("THUDM/chatglm3-6b",trust_remote_code=True).quantize(8).cuda()
```

```plain
model = AutoModel.from_pretrained("THUDM/chatglm3-6b",trust_remote_code=True).quantize(4).cuda()
```

## <font style="color:#000000;">4.5 No module named ‘readline’</font>
<font style="color:#000000;">在Windows下执行pip install readline会报错，不支持Windwos</font>

```plain
pip install readline
...
      error: this module is not meant to work on Windows
      [end of output]
...
```

<font style="color:#000000;">需要安装pyreadline替代</font>

```plain
pip install pyreadline
```

## <font style="color:#000000;">4.6 module ‘collections’ has no attribute ‘Callable’</font>
<font style="color:#000000;">readline安装完后，运行如果出现collections报错，是python10兼容性问题，找到报错最后一个py文件位置。</font>

```plain
...

File "C:\ProgramData\Anaconda3\envs\chatglm3-demo\lib\site-packages\pyreadline\py3k_compat.py", line 8, in callable
AttributeError: module 'collections' has no attribute 'Callable'
```

<font style="color:#000000;">修改这个py3k_compat.py文件第8行</font>

```plain
return isinstance(x, collections.Callable)
```

<font style="color:#000000;">改为</font>

```plain
return isinstance(x, collections.abc.Callable)
```



> 更新: 2025-02-12 08:37:58  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/vkg7gect4ktqt9rx>