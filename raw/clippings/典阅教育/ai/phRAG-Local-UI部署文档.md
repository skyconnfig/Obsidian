# phRAG-Local-UI 部署文档

GraphRAG-Local-UI 部署文档

1. 环境要求\
   Python 3.8 或更高版本\
   Windows 操作系统\
   Git
2. 安装 Git\
   访问 <https://git-scm.com/download/win> 下载 Git 安装程序\
   运行安装程序，使用默认选项完成安装
3. 创建并配置虚拟环境

```python
# 创建新的虚拟环境
python -m venv graphrag_env

# 激活虚拟环境
.\graphrag_env\Scripts\activate
```

#

4. 安装依赖\
   按照以下顺序安装依赖包以避免版本冲突：

```python
更新 pip
python -m pip install --upgrade pip
安装核心依赖
pip install fastapi==0.100.0
pip install "pydantic>=2.0.0,<3.0.0"
pip install "starlette>=0.27.0"
pip install "aiofiles>=22.0,<24.0"
pip install gradio==4.36.1
安装其他必要依赖
pip install openai>=1.54.0,<2.0.0
pip install tokenizers>=0.21.0,<0.22.0
pip install python-dotenv
pip install uvicorn
pip install plotly
pip install networkx
pip install pandas
pip install numpy
pip install lancedb
pip install tiktoken
pip install requests
pip install aiohttp
pip install pyarrow
pip install pyyaml
```

## <font style="color:#000000;background-color:#FFFFFF;">5. 安装 GraphRAG</font>

```python
# 在项目根目录下安装 graphrag 包
pip install -e graphrag
```

# 6. 生成新的 requirements.txt

```python
# 生成新的 requirements.txt
pip freeze > requirements.txt
```

## <font style="color:#000000;background-color:#FFFFFF;">7. 环境配置</font>

1. <font style="color:#000000;background-color:#FFFFFF;">在项目根目录创建</font><font style="color:#000000;background-color:#FFFFFF;"> </font><code>**<font style="color:#000000;background-color:#FFFFFF;">.env</font>**</code><font style="color:#000000;background-color:#FFFFFF;"> </font><font style="color:#000000;background-color:#FFFFFF;">文件</font>
2. <font style="color:#000000;background-color:#FFFFFF;">添加必要的环境变量：</font>

```python
OPENAI_API_KEY=你的OpenAI API密钥
OPENAI_API_BASE=https://api.openai.com/v1
```

## <font style="color:#000000;background-color:#FFFFFF;">8. 运行应用</font>

```python
# 在项目根目录下运行
python app.py
```

## <font style="color:#000000;background-color:#FFFFFF;">常见问题解决</font>

### <font style="color:#000000;background-color:#FFFFFF;">1. 依赖冲突</font>

<font style="color:#000000;background-color:#FFFFFF;">如果遇到依赖冲突，可以尝试以下步骤：</font>

```python
# 删除虚拟环境
rmdir /s /q graphrag_env

# 重新创建虚拟环境
python -m venv graphrag_env
.\graphrag_env\Scripts\activate

# 重新安装依赖
# （按照上述步骤4重新安装）
```

### <font style="color:#000000;background-color:#FFFFFF;">2. graphrag 模块未找到</font>

<font style="color:#000000;background-color:#FFFFFF;">确保在正确的目录下安装：</font>

```python
# 确保在项目根目录下
cd GraphRAG-Local-UI
pip install -e graphrag
```

# 确保在项目根目录下

```python
cd GraphRAG-Local-UI
pip install -e graphrag
```

## <font style="color:#000000;background-color:#FFFFFF;">目录结构说明</font>

```python
GraphRAG-Local-UI/
├── graphrag/              # graphrag 核心包
├── app.py                 # 主应用文件
├── requirements.txt       # 依赖文件
├── .env                   # 环境变量配置
└── README.md             # 项目说明文档
```

## <font style="color:#000000;background-color:#FFFFFF;">注意事项</font>

1. <font style="color:#000000;background-color:#FFFFFF;">确保所有命令都在虚拟环境中执行</font>
2. <font style="color:#000000;background-color:#FFFFFF;">安装依赖时注意观察是否有版本冲突警告</font>
3. <font style="color:#000000;background-color:#FFFFFF;">如果遇到 pydantic 相关错误，可能需要调整 FastAPI 和 pydantic 的版本</font>
4. <font style="color:#000000;background-color:#FFFFFF;">确保系统中已安装 Git，且可以通过命令行访问</font>


> 更新: 2024-12-30 14:22:04  
> 原文: <https://www.yuque.com/lixinsi/vnere7/wh1u1q57ylbrd2ip>