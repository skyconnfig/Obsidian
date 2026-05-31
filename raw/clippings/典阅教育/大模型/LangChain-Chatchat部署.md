# LangChain-Chatchat部署

# <font style="color:#000000;">1. 安装ChatGLM2</font>
## <font style="color:#000000;">1.1 创建conda环境</font>
```python
conda create -n chatglm2 python=3.9
conda activate chatglm2
```

## <font style="color:#000000;">1.2 安装依赖</font>
```python
git clone https://github.com/THUDM/ChatGLM2-6B.git
cd ChatGLM2-6B\
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple 
```

<font style="color:#000000;">如果有必要安装对应cuda版本的torch</font>

```python
pip install --pre torch --index-url https://download.pytorch.org/whl/nightly/cu118
```

# <font style="color:#000000;">2. 下载模型</font>
## <font style="color:#000000;">2.1 ChatGLM2-6b语言模型</font>
```python
git lfs install
git clone https://www.modelscope.cn/ZhipuAI/chatglm2-6b.git
```

## <font style="color:#000000;">2.2 m3e嵌入模型</font>
```python
git clone https://www.modelscope.cn/Jerry0/text2vec-large-chinese.git
```

# <font style="color:#000000;">3. 安装LangChain-Chatchat</font>
## <font style="color:#000000;">3.1 下载</font>
```python
git clone https://github.com/chatchat-space/Langchain-Chatchat.git
```

## <font style="color:#000000;">3.2 安装依赖</font>
```plain
cd Langchain-Chatchat\
pip install -r requirements.txt 
pip install -r requirements_api.txt
pip install -r requirements_webui.txt
```

## <font style="color:#000000;">3.4 生成配置</font>
```plain
python copy_config_example.py
```

## <font style="color:#000000;">3.5 修改模型路径</font>
<font style="color:#000000;">编辑文件configs/model_config.py，修改为下载模型的路径。</font>

```plain
MODEL_PATH = {
……
#        "m3e-base": "moka-ai/m3e-base",
        "m3e-base": "../model/m3e-base",
……
#        "chatglm2-6b": "THUDM/chatglm2-6b",
        "chatglm2-6b": "../model/chatglm2-6b",
}
……
```

## <font style="color:#000000;">3.6 运行</font>
<font style="color:#000000;">生成知识库db</font>

```plain
python init_database.py --recreate-vs
```

## <font style="color:#000000;">3.7 全部运行</font>
```plain
python startup.py -a
```

## <font style="color:#000000;">3.8 使用</font>
<font style="color:#000000;">如果一切正常，可以打开Web开始使用。 http://127.0.0.1:8501/</font>

# <font style="color:#000000;">4. 其他配置</font>
## <font style="color:#000000;">4.1 开启局域网访问</font>
<font style="color:#000000;">修改configs/server_config.py</font>

```python
#DEFAULT_BIND_HOST = "0.0.0.0" if sys.platform != "win32" else "127.0.0.1"
DEFAULT_BIND_HOST = "0.0.0.0"
```

## <font style="color:#000000;">4.2 开启8bit量化</font>
<font style="color:#000000;">修改configs/server_config.py</font>

```python
FSCHAT_MODEL_WORKERS = {
  "default": {

    # "load_8bit": False, # 开启8bit量化
     "load_8bit": True,

  }
} 
```



> 更新: 2025-02-12 08:39:12  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/rcb8280tzzt1paa3>