# Windows本地部署FastGPT

<font style="color:#000000;background-color:#FFFFFF;">篇</font>[《ChatGLM3(一) Windows部署和踩坑》](https://redfoxw.top/posts/chatglm3_started/chatglm3_started)<font style="color:#000000;background-color:#FAFAFA;">部署完成之后，继续尝试部署带知识库和问答编排功能的FastGPT</font><font style="color:#000000;background-color:#FFFFFF;">。</font>

[https://github.com/labring/FastGPT/blob/main/files/docker/docker-compose/docker-compose](https://github.com/labring/FastGPT/blob/main/files/docker/docker-compose/docker-compose)

[工作流&插件](https://doc.tryfastgpt.ai/docs/guide/workbench/intro/)[https://doc.tryfastgpt.ai/docs/guide/workbench/intro/](https://doc.tryfastgpt.ai/docs/guide/workbench/intro/)

# <font style="color:#000000;background-color:#FFFFFF;">简介</font>
[FastGPT](https://github.com/labring/FastGPT)<font style="color:#000000;background-color:#FFFFFF;">是一个开源基于LLM的RAG应用，最重要的是知识库功能。但是FastGPT默认是调用openai的api的，要转为调用本地部署的ChatGLM3，需要一个中间件</font><font style="color:#000000;background-color:#FFFFFF;">OneAPI</font><font style="color:#000000;background-color:#FFFFFF;">来转发，FastGPT把本来发给openai的api请求发到OneAPI里，OneAPI根据配置把请求发到本地部署的ChatGLM3 api中。</font>

<font style="color:#000000;background-color:#FFFFFF;">FastGPT原调用流程：</font>

<font style="color:#000000;background-color:#FFFFFF;">加入OneAPI后的调用：</font>

<font style="color:#000000;background-color:#FFFFFF;">知识库拆分文档内容后，需要使用Embedding模型转换成向量存入向量数据库，所以还需要部署一个Embedding模型，这里也使用开源本地部署的</font><font style="color:#000000;background-color:#FFFFFF;">M3E-large</font><font style="color:#000000;background-color:#FFFFFF;">模型。</font>

<font style="color:#000000;background-color:#FFFFFF;">用户问题和知识库向量比对结果需要筛选，目前使用Rerank模型进行比对评分重排序，这里也使用开源本地部署</font><font style="color:#000000;background-color:#FFFFFF;">bge-reranker-large</font><font style="color:#000000;background-color:#FFFFFF;">模型。</font>

<font style="color:#000000;background-color:#FFFFFF;">之前本地部署的</font><font style="color:#000000;background-color:#FFFFFF;">ChatGLM3</font><font style="color:#000000;background-color:#FFFFFF;">是基于Web直接使用的，也需要改成API方式部署。</font>

---

**<font style="color:#000000;background-color:#FAFAFA;">开工！</font>**

# <font style="color:#000000;background-color:#FAFAFA;">1. Docker Desktop安装</font>
<font style="color:#000000;background-color:#FAFAFA;">为了安装和管理方便，这里使用Windows版本的Docker进行管理。</font>

<font style="color:#000000;background-color:#FAFAFA;">到官网<www.docker.com>下载</font>[<font style="color:#000000;background-color:#FAFAFA;">Docker Desktop安装程序</font>](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)<font style="color:#000000;background-color:#FAFAFA;">。</font>

<font style="color:#000000;background-color:#FAFAFA;">安装后，如果是Win10或Win11，安装完后会启用WSL2的Linux虚拟机环境。</font>

<font style="color:#000000;background-color:#FAFAFA;">在Windows的Terminal（Command或Powershell都可以）里执行docker命令测试安装完成。</font>

```bash
C:\Users\user> docker -v
Docker version 25.0.2, build 29cf629
```

# <font style="color:#000000;background-color:#FFFFFF;">2. OneAPI部署</font>
## <font style="color:#000000;background-color:#FFFFFF;">2.1 下载OneAPI</font>
<font style="color:#000000;background-color:#FFFFFF;">克隆</font>[<font style="color:#000000;background-color:#FFFFFF;">官方GitHub</font>](https://github.com/songquanpeng/one-api)<font style="color:#000000;background-color:#FFFFFF;"> 仓库</font>

```bash
git clone https://github.com/songquanpeng/one-api.git
```

## <font style="color:#000000;background-color:#FFFFFF;">2.2 修改docker端口</font>
<font style="color:#000000;background-color:#FFFFFF;">打开</font><font style="color:#000000;background-color:#FFFFFF;">\one-api\docker-compose.yml</font><font style="color:#000000;background-color:#FFFFFF;">文件</font>

<font style="color:#000000;background-color:#FFFFFF;">修改默认的3000端口，改为4000，因为3000端口是之后安装的FastGPT默认端口。</font>

```plain
ports:
      - "4000:3000"
```

## <font style="color:#000000;background-color:#FAFAFA;">2.3 docker运行</font>
```bash
docker-compose pull
```

<font style="color:#000000;">等待拉取下载完成。</font>

```plain
docker-compose up -d
```

<font style="color:#000000;">如果一切正常，在DockerDesktop的客户端界面里可以就看到运行的Container了。</font>

<font style="color:#000000;">one-api的group下应该成功启动了3个服务one-api、mysql、redis。结构如下：</font>

## <font style="color:#000000;">2.4 测试</font>
<font style="color:#000000;">浏览器打开</font><font style="color:#000000;"> </font>[<font style="color:#000000;">http://127.0.0.1:4000</font>](http://127.0.0.1:4000/)

<font style="color:#000000;">用户名为 </font><font style="color:#000000;">root</font><font style="color:#000000;"> </font><font style="color:#000000;">密码为 </font><font style="color:#000000;">123456</font>

<font style="color:#000000;">首次登录需要修改密码。</font>

## <font style="color:#000000;">2.5 配置令牌</font>
<font style="color:#000000;">在这里配置一个可以调用oneapi接口的token。</font>

<font style="color:#000000;">顶上菜单</font><font style="color:#000000;">令牌</font><font style="color:#000000;"> </font><font style="color:#000000;">-</font><font style="color:#000000;"> </font><font style="color:#000000;">添加新的令牌</font>

<font style="color:#000000;">名称：</font><font style="color:#000000;"> </font><font style="color:#000000;">FastGPT令牌</font>

<font style="color:#000000;">过期时间：</font><font style="color:#000000;"> </font><font style="color:#000000;">永不过期</font>

<font style="color:#000000;">额度：</font><font style="color:#000000;"> </font><font style="color:#000000;">设为无限额度</font>

<font style="color:#000000;">提交保存后，返回渠道，在FastGPT令牌右边点击</font><font style="color:#000000;">复制</font><font style="color:#000000;">，即复制出token，这样一串字符sk-xxxxxxxxxx，后面配置FastGPT时会用到。</font>

## <font style="color:#000000;">2.6 配置渠道</font>
<font style="color:#000000;">目前本地模型的API还没有部署，在后面部署模型时会进行渠道添加。</font>

# <font style="color:#000000;">3. ChatGLM3模型API部署</font>
## <font style="color:#000000;">3.1 部署api</font>
<font style="color:#000000;">按照</font>[<font style="color:#000000;">《ChatGLM3(一) Windows部署和踩坑》</font>](https://redfoxw.top/posts/chatglm3_started/chatglm3_started)<font style="color:#000000;"> </font><font style="color:#000000;">这篇写的安装部署好ChatGLM3，最后一步不用运行</font><font style="color:#000000;"> </font><font style="color:#000000;">streamlit run main.py`命令启动Web界面。</font>

<font style="color:#000000;">如果和我一样显卡只有苦逼的12G显存，需要改为量化8bit启动。</font>

<font style="color:#000000;">修改</font><font style="color:#000000;">api_server.py</font><font style="color:#000000;">文件内容：</font>

```python
#model = AutoModel.from_pretrained(MODEL_PATH, trust_remote_code=True, device_map="auto").eval()
model = AutoModel.from_pretrained(MODEL_PATH, trust_remote_code=True).quantize(8).cuda().eval()
```

<font style="color:#000000;">运行api服务：</font>

```plain
cd openai_api_demo
python api_server.py
```

## <font style="color:#000000;">3.2 测试api</font>
<font style="color:#000000;">这里使用Postman进行测试，可以去</font>[<font style="color:#000000;">官网</font>](https://www.postman.com/)<font style="color:#000000;">下载安装。</font>

<font style="color:#000000;">新建API请求：</font>

<font style="color:#000000;">请求方式:</font><font style="color:#000000;"> </font><font style="color:#000000;">POST</font>

<font style="color:#000000;">URL:</font><font style="color:#000000;"> </font><font style="color:#000000;">http://127.0.0.1:8000/v1/chat/completions</font>

<font style="color:#000000;">Body:</font>

```json
{
    "model": "chatglm3-6b",
    "messages": [
        {
            "role": "user",
            "content": "你是谁"
        }
    ],
    "stream": false,
    "max_tokens": 100,
    "temperature": 0.8,
    "top_p": 0.8
}
```

<font style="color:#000000;">点击</font><font style="color:#000000;">Send</font><font style="color:#000000;">发送请求，正常的话可以收到返回内容。</font>

## <font style="color:#000000;">3.3 配置到one-api</font>
<font style="color:#000000;">打开</font>[<font style="color:#000000;">http://127.0.0.1:4000</font>](http://127.0.0.1:4000/)<font style="color:#000000;">，</font><font style="color:#000000;">渠道</font><font style="color:#000000;"> </font><font style="color:#000000;">-</font><font style="color:#000000;"> </font><font style="color:#000000;">添加新渠道</font>

<font style="color:#000000;">类型</font><font style="color:#000000;"> </font><font style="color:#000000;">自定义渠道</font>

<font style="color:#000000;">BaseURL</font><font style="color:#000000;"> </font><font style="color:#000000;">http://127.0.0.1:8000</font>

<font style="color:#000000;">名称</font><font style="color:#000000;"> </font><font style="color:#000000;">ChatGLM3本地</font>

<font style="color:#000000;">模型 自定义模型名称</font><font style="color:#000000;">chatglm3</font><font style="color:#000000;">填入</font>

<font style="color:#000000;">密钥</font><font style="color:#000000;"> </font><font style="color:#000000;">123456</font><font style="color:#000000;"> </font><font style="color:#000000;">（本地ChatGLM3不验证密钥，随意填）</font>

## <font style="color:#000000;">3.4 测试通过one-api访问</font>
<font style="color:#000000;">同样使用Postman进行测试。</font>

<font style="color:#000000;">请求方式:</font><font style="color:#000000;"> </font><font style="color:#000000;">POST</font>

<font style="color:#000000;">URL:</font><font style="color:#000000;"> </font><font style="color:#000000;">http://127.0.0.1:4000/v1/chat/completions</font>

<font style="color:#000000;">Authentication: 选择</font><font style="color:#000000;">Bearer Token</font><font style="color:#000000;">，token值设置为</font><font style="color:#000000;">sk-xxxxxxxxxx</font><font style="color:#000000;">（OneAPI Web里复制的令牌）</font>

<font style="color:#000000;">Body:</font>

```json
{
    "model": "chatglm3",
    "messages": [
        {
            "role": "user",
            "content": "你是谁"
        }
    ],
    "stream": false,
    "max_tokens": 100,
    "temperature": 0.8,
    "top_p": 0.8
}
```

<font style="color:#000000;">点击</font><font style="color:#000000;">Send</font><font style="color:#000000;">发送请求，正常的话可以收到返回内容。</font>

<font style="color:#000000;">将JSON里的</font><font style="color:#000000;">"stream": false</font><font style="color:#000000;">改为</font><font style="color:#000000;">"stream": true</font><font style="color:#000000;">可以测试流式输出，回答会按生成多少返回多少一直输出。</font>

# <font style="color:#000000;">4. M3E-large模型部署</font>
<font style="color:#000000;">也采用简单的docker方式部署</font>

## <font style="color:#000000;">4.1 docker部署</font>
<font style="color:#000000;">拉取镜像（镜像内已经包含模型下载）：</font>

```plain
docker pull registry.cn-hangzhou.aliyuncs.com/fastgpt_docker/m3e-large-api
```

<font style="color:#000000;">GPU方式运行镜像：</font>

```plain
docker run -d -p 6008:6008 --gpus all registry.cn-hangzhou.aliyuncs.com/fastgpt_docker/m3e-large-api
```

<font style="color:#000000;background-color:#FAFAFA;">CPU方式运行镜像：</font>

```plain
docker run -d -p 6008:6008 registry.cn-hangzhou.aliyuncs.com/fastgpt_docker/m3e-large-api
```

## <font style="color:#000000;background-color:#FAFAFA;">4.2 测试api</font>
<font style="color:#000000;background-color:#FAFAFA;">使用Postman进行测试。</font>

<font style="color:#000000;background-color:#FAFAFA;">请求方式:</font><font style="color:#000000;background-color:#FAFAFA;"> </font><font style="color:#000000;background-color:#FAFAFA;">POST</font>

<font style="color:#000000;background-color:#FAFAFA;">URL:</font><font style="color:#000000;background-color:#FAFAFA;"> </font><font style="color:#000000;background-color:#FAFAFA;">http://127.0.0.1:6008/v1/embeddings</font>

<font style="color:#000000;background-color:#FAFAFA;">Authentication: 选择</font><font style="color:#000000;background-color:#FAFAFA;">Bearer Token</font><font style="color:#000000;background-color:#FAFAFA;">，token值设置为</font><font style="color:#000000;background-color:#FAFAFA;">sk-aaabbbcccdddeeefffggghhhiiijjjkkk</font>

<font style="color:#000000;background-color:#FAFAFA;">Body:</font>

```json
{
  "model": "m3e",
  "input": ["hello world"]
}
```

<font style="color:#000000;background-color:#FAFAFA;">点击</font><font style="color:#000000;background-color:#FAFAFA;">Send</font><font style="color:#000000;background-color:#FAFAFA;">发送请求，正常的话可以收到返回内容。</font>

## <font style="color:#000000;background-color:#FAFAFA;">4.3 配置到one-api</font>
<font style="color:#000000;background-color:#FAFAFA;">打开</font>[<font style="color:#000000;background-color:#FAFAFA;">http://127.0.0.1:4000</font>](http://127.0.0.1:4000/)<font style="color:#000000;background-color:#FAFAFA;">，</font><font style="color:#000000;background-color:#FAFAFA;">渠道</font><font style="color:#000000;background-color:#FAFAFA;"> </font><font style="color:#000000;background-color:#FAFAFA;">-</font><font style="color:#000000;background-color:#FAFAFA;"> </font><font style="color:#000000;background-color:#FAFAFA;">添加新渠道</font>

<font style="color:#000000;background-color:#FAFAFA;">类型</font><font style="color:#000000;background-color:#FAFAFA;"> </font><font style="color:#000000;background-color:#FAFAFA;">自定义渠道</font>

<font style="color:#000000;background-color:#FAFAFA;">BaseURL</font><font style="color:#000000;background-color:#FAFAFA;"> </font><font style="color:#000000;background-color:#FAFAFA;">http://127.0.0.1:6008</font>

<font style="color:#000000;background-color:#FAFAFA;">名称</font><font style="color:#000000;background-color:#FAFAFA;"> </font><font style="color:#000000;background-color:#FAFAFA;">Embedding本地模型</font>

<font style="color:#000000;background-color:#FAFAFA;">模型 自定义模型名称</font><font style="color:#000000;background-color:#FAFAFA;">m3e</font><font style="color:#000000;background-color:#FAFAFA;">和</font><font style="color:#000000;background-color:#FAFAFA;">text-embedding-ada-002</font><font style="color:#000000;background-color:#FAFAFA;">填入</font>

<font style="color:#000000;background-color:#FAFAFA;">密钥</font><font style="color:#000000;background-color:#FAFAFA;"> </font><font style="color:#000000;background-color:#FAFAFA;">sk-aaabbbcccdddeeefffggghhhiiijjjkkk</font>

## <font style="color:#000000;background-color:#FAFAFA;">4.4 测试通过one-api访问</font>
<font style="color:#000000;background-color:#FAFAFA;">同样使用Postman进行测试。</font>

<font style="color:#000000;background-color:#FAFAFA;">请求方式:</font><font style="color:#000000;background-color:#FAFAFA;"> </font><font style="color:#000000;background-color:#FAFAFA;">POST</font>

<font style="color:#000000;background-color:#FAFAFA;">URL:</font><font style="color:#000000;background-color:#FAFAFA;"> </font><font style="color:#000000;background-color:#FAFAFA;">http://127.0.0.1:4000/v1/embeddings</font>

<font style="color:#000000;background-color:#FAFAFA;">Authentication: 选择</font><font style="color:#000000;background-color:#FAFAFA;">Bearer Token</font><font style="color:#000000;background-color:#FAFAFA;">，token值设置为</font><font style="color:#000000;background-color:#FAFAFA;">sk-aaabbbcccdddeeefffggghhhiiijjjkkk</font>

<font style="color:#000000;background-color:#FAFAFA;">Body:</font>

```json
{
  "model": "m3e",
  "input": ["hello world"]
}
```

<font style="color:#000000;">点击</font><font style="color:#000000;">Send</font><font style="color:#000000;">发送请求，正常的话可以收到类似返回内容。</font>

```json
{
    "data": [
        {
            "embedding": [
                0.03476172313094139,
                -0.02664785459637642,
                -0.024446291849017143,
				
                0.03853733092546463,
                -0.011446488089859486,
                -0.03146049380302429,
                0.0018535606795921922,
                0.005742138717323542
            ],
            "index": 0,
            "object": "embedding"
        }
    ],
    "model": "m3e",
    "object": "list",
    "usage": {
        "prompt_tokens": 2,
        "total_tokens": 2
    }
}
```

# <font style="color:rgb(230, 230, 230);background-color:rgb(40, 40, 40);">5. Rerank模型部署</font>
## <font style="color:rgb(230, 230, 230);background-color:rgb(40, 40, 40);">5.1 下载模型</font>
<font style="color:rgb(230, 230, 230);background-color:rgb(40, 40, 40);">这里采用FastGPT使用的rerank模型</font><font style="color:rgb(230, 230, 230);background-color:rgb(40, 40, 40);">bge-reranker-large</font>

<font style="color:rgb(230, 230, 230);background-color:rgb(40, 40, 40);">克隆大文件前先确定安装了git-lfs，在官网</font>[https://git-lfs.com/](https://git-lfs.com/)<font style="color:rgb(230, 230, 230);background-color:rgb(40, 40, 40);">下载安装包安装。</font>

<font style="color:rgb(230, 230, 230);background-color:rgb(40, 40, 40);">下载模型（huggingface源）：</font>

```plain
git clone https://huggingface.co/BAAI/bge-reranker-large.git
```

<font style="color:rgb(230, 230, 230);background-color:rgb(40, 40, 40);">下载模型（国内源）：</font>

```plain
git clone https://www.modelscope.cn/quietnight/bge-reranker-large.git
```

<font style="color:rgb(230, 230, 230);background-color:rgb(40, 40, 40);">等待下载完成，模型文件有4G以上。</font>

## <font style="color:#000000;">5.2 部署api</font>
<font style="color:#000000;">rerank模型的启动程序在FastGPT的工程里。</font>

<font style="color:#000000;">克隆工程：</font>

```plain
git clone https://github.com/labring/FastGPT.git
```

<font style="color:#000000;">进入rerank路径：</font>

```plain
cd FastGPT/python/reranker/bge-reranker-base
```

<font style="color:#000000;">安装python环境略过</font>

<font style="color:#000000;">安装依赖包（如果之前有使用conda环境，先用</font><font style="color:#000000;">conda activate xxx</font><font style="color:#000000;">）切换环境</font>

```plain
pip install -r requirement.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
pip install sentencepiece
```

<font style="color:#000000;">移动</font><font style="color:#000000;">bge-reranker-large</font><font style="color:#000000;">模型文件夹到程序目录</font>

<font style="color:#000000;">修改模型路径，编辑</font><font style="color:#000000;">app.py</font><font style="color:#000000;">：</font>

```python
#RERANK_MODEL_PATH = os.path.join(os.path.dirname(__file__), "bge-reranker-base")
RERANK_MODEL_PATH = os.path.join(os.path.dirname(__file__), "bge-reranker-large")
```

<font style="color:#000000;">运行api服务：</font>

```plain
python app.py
```

<font style="color:#000000;">没有报错运行成功。</font>

## <font style="color:#000000;">5.3 测试api</font>
<font style="color:#000000;">使用Postman进行测试。</font>

<font style="color:#000000;">请求方式:</font><font style="color:#000000;"> </font><font style="color:#000000;">POST</font>

<font style="color:#000000;">URL:</font><font style="color:#000000;"> </font><font style="color:#000000;">http://127.0.0.1:6006/api/v1/rerank</font>

<font style="color:#000000;">Authentication: 选择</font><font style="color:#000000;">Bearer Token</font><font style="color:#000000;">，token值设置为</font><font style="color:#000000;">ACCESS_TOKEN</font>

<font style="color:#000000;">Body:</font>

```json
{
    "query": "What is the capital of France?",
    "inputs": [
        {"id": "1", "text": "The capital of France is Paris."},
        {"id": "2", "text": "Berlin is the capital of Germany."}
    ]
}
```

<font style="color:#000000;">点击</font><font style="color:#000000;">Send</font><font style="color:#000000;">发送请求，正常的话可以收到返回内容。</font>

```json
{
    "code": 200,
    "message": "重排成功",
    "data": [
        {"id": "1", "score": 0.9985534559008095},
        {"id": "2", "score": 0.025102072990210177}
    ],
    "time": "2024-03-14 17:04:36.515287"
}
```

<font style="color:#000000;">Rerank api地址目前是直接在FastGPT中配置，不用在OneAPI中配置。</font>

# <font style="color:#000000;">6. FastGPT部署</font>
## <font style="color:#000000;">6.1 下载</font>
```plain
git clone https://github.com/labring/FastGPT.git
```

## <font style="color:#000000;">6.2 拷贝配置文件</font>
<font style="color:#000000;">复制</font><font style="color:#000000;">FastGPT\projects\app\data\config.json</font><font style="color:#000000;">文件到</font><font style="color:#000000;">FastGPT\files\deploy\fastgpt\config.json</font>

## <font style="color:#000000;">6.3 修改oneapi地址</font>
<font style="color:#000000;">打开</font><font style="color:#000000;">FastGPT\files\deploy\fastgpt\docker-compose.yml</font><font style="color:#000000;">文件</font>

<font style="color:#000000;">修改内容填入oneapi的地址和令牌token：</font>

```yaml
services:
  fastgpt:
    environment:
      # - OPENAI_BASE_URL=https://api.openai.com/v1
      - OPENAI_BASE_URL=http://127.0.0.1:4000/v1/
      - CHAT_API_KEY=sk-xxxxxxxxxx
```

## <font style="color:#000000;">6.4 docker运行</font>
```bash
docker-compose pull
```

<font style="color:#000000;">等待拉取下载完成。</font>

```plain
docker-compose up -d
```

<font style="color:#000000;">如果一切正常，在DockerDesktop的客户端界面里可以就看到运行的Container了。</font>

<font style="color:#000000;">fastgpt的group下应该成功启动了3个服务fastgpt、pgvector、mongo。结构如下：</font>

## <font style="color:#000000;">6.5 测试</font>
<font style="color:#000000;">浏览器打开</font><font style="color:#000000;"> </font>[<font style="color:#000000;">http://127.0.0.1:3000</font>](http://127.0.0.1:3000/)

<font style="color:#000000;">用户名为 </font><font style="color:#000000;">root</font><font style="color:#000000;"> </font><font style="color:#000000;">密码为 </font><font style="color:#000000;">1234</font>

<font style="color:#000000;">第一次应该是无法登录成功的，因为新版本用的mongo会报错，下面会让mongo正常启动和正常初始化。</font>

## <font style="color:#000000;">6.6 mongo启动问题</font>
<font style="color:#000000;">在DesktopDocker点击mongo，在Logs里查看mongo的日志报错信息。或者命令行</font><font style="color:#000000;">docker logs mongo</font><font style="color:#000000;">查看日志。</font>

<font style="color:#000000;">结合</font>[<font style="color:#000000;">官方mongo初始化</font>](https://doc.fastai.site/docs/development/docker/#%e4%ba%94%e5%88%9d%e5%a7%8b%e5%8c%96-mongo-%e5%89%af%e6%9c%ac%e9%9b%86468%e4%bb%a5%e5%89%8d%e5%8f%af%e5%bf%bd%e7%95%a5)<font style="color:#000000;">和</font>[<font style="color:#000000;">mongo问题</font>](https://doc.fastai.site/docs/development/docker/#mongo-%e5%90%af%e5%8a%a8%e5%a4%b1%e8%b4%a5)<font style="color:#000000;">解决。</font>

---

<font style="color:#000000;">如果日志报错是mongodb.key文件无法打开。</font>

<font style="color:#000000;">停止docker的mongo容器后，删除</font><font style="color:#000000;">FastGPT\files\deploy\fastgpt\mongodb.key</font><font style="color:#000000;">文件或文件夹。</font>

<font style="color:#000000;">使用openssl命令生成一个新的</font><font style="color:#000000;">mongodb.key</font><font style="color:#000000;">文件</font>

```plain
openssl rand -base64 756 > ./mongodb.key
```

---

<font style="color:#000000;">如果日志报错是</font><font style="color:#000000;">permissions on /data/mongodb.key are too open</font>

<font style="color:#000000;">文件权限太开放，修改文件属性-安全，改为只有只读。</font>

<font style="color:#000000;">linux下可以执行</font>

```plain
chmod 600 ./mongodb.key
```

---

<font style="color:#000000;">如果日志报错是</font><font style="color:#000000;">error opening file: /data/mongodb.key: bad file</font>

<font style="color:#000000;">是文件所属用户的问题，修改文件属性安全为当前用户。</font>

<font style="color:#000000;">linux下可以执行</font>

```plain
chown 999:root ./mongodb.key
```

---

## <font style="color:#000000;">6.7 mongo初始化</font>
<font style="color:#000000;">mongo容器可以正常启动后，在fastgpt打开web</font>[<font style="color:#000000;">http://127.0.0.1:3000</font>](http://127.0.0.1:3000/)<font style="color:#000000;">登录的时候，mongo容器报错初始化错误。</font>

<font style="color:#000000;">需要手动执行初始化命令，在DesktopDocker中选择mongo容器，点击Exec在容器里执行命令。或者使用</font><font style="color:#000000;">docker exec -it mongo bash</font><font style="color:#000000;">命令行进入。</font>

<font style="color:#000000;">连接mongo，进入mongo命令行：</font>

```plain
mongo
```

<font style="color:#000000;">切换到</font><font style="color:#000000;">admin</font><font style="color:#000000;">db：</font>

```plain
use admin;
```

<font style="color:#000000;">返回</font><font style="color:#000000;">switched to db admin</font>

<font style="color:#000000;">验证用户：</font>

```plain
db.auth("myname","mypassword");
```

<font style="color:#000000;">返回1</font>

<font style="color:#000000;">初始化副本集：</font>

```plain
rs.initiate({
  _id: "rs0",
  members: [
    { _id: 0, host: "mongo:27017" }
  ]
});
```

<font style="color:#000000;">返回{ “ok” : 1 }</font>

<font style="color:#000000;">查询rs0状态：</font>

```plain
rs.status();
```

<font style="color:#000000;">返回很多状态信息</font>

<font style="color:#000000;">初始化用户：</font>

```plain
db.createUser({
  user: "admin",
  pwd: "password",
  roles: [{ role: "root", db: "admin" }]
});
```

<font style="color:#000000;">返回</font><font style="color:#000000;">Successfully added user ....</font>

<font style="color:#000000;">上面一通操作后，再次打开web</font>[<font style="color:#000000;">http://127.0.0.1:3000</font>](http://127.0.0.1:3000/)<font style="color:#000000;">登录fastgpt，用户名为 </font><font style="color:#000000;">root</font><font style="color:#000000;"> </font><font style="color:#000000;">密码为 </font><font style="color:#000000;">1234</font>

<font style="color:#000000;">没有意外的话就可以登入到系统里。</font>

## <font style="color:#000000;">6.8 config.json模型配置</font>
<font style="color:#000000;">默认的config.json配置的模型是ChatGPT的模型，需要修改</font><font style="color:#000000;">FastGPT\files\deploy\fastgpt\config.json</font><font style="color:#000000;">文件，添加本地的模型的配置信息。</font>

<font style="color:#000000;">在llmModels下添加一个新的LLM模型：</font>

```json
{
  "llmModels": [
    {
      "model": "chatglm3",
      "name": "ChatGLM3开源本地",
      "datasetProcess": true,
      "maxToken": 8000,
      "price": 0,
      "maxTemperature": 1.0,
      "functionCall": true,
      "functionPrompt": ""
    },
    {
    }
  ]
}
```

<font style="color:#000000;">在vectorModels下添加一个新的M3E模型：</font>

```json
{
  "vectorModels": [
    {
      "model": "m3e",
      "name": "M3E-embedding",
      "price": 0,
      "defaultToken": 500,
      "maxToken": 1800
    },
	{
	}
  ]
}
```

<font style="color:#000000;">在reRankModels下添加一个新的rerank模型：</font>

```json
{
  "reRankModels": [
    {
      "model": "bge-reranker-large",
      "name": "检索重排-reranker-large",
      "inputPrice": 0,
      "requestUrl": "http://127.0.0.1:6006/api/v1/rerank",
      "requestAuth": "ACCESS_TOKEN"
    }
  ]
}
```

<font style="color:#000000;">保存后，重启fastgpt容器。可以通过在容器里发命令查看加载的config.json是否修改成功。</font>

```plain
docker exec -it fastgpt cat /app/data/config.json
```

<font style="color:#000000;">PS：这里llmmodels可以不改配置，用一个取巧的方法，使用oneapi渠道配置里的</font><font style="color:#000000;">模型重定向</font><font style="color:#000000;">功能，把fastgpt默认的chatgpt的几个模型，添加到chtglm3的渠道里，然后再配置模型重定向</font><font style="color:#000000;">{"gpt-3.5-turbo-1106": "chatglm3"}</font><font style="color:#000000;">，把chatgpt的模型改成chatglm3的模型名称，这样在fastgpt看似使用的是chatGPT模型，但是在oneapi里还在被转发到chatglm3里了。</font>

# <font style="color:#000000;">7. 使用测试</font>
<font style="color:#000000;">进入FastGPT后，知识库 - 新建 - 知识库 - 取名 - 选择M3E模型 - 确认创建</font>

<font style="color:#000000;">点击知识库名称 - 数据集 - 新建/导入 - 文本数据集 - 本地文件 - 拖入一个txt文件 - 下一步 - 直接拆分 - 下一步 - 开始上传 - 左侧 搜索测试。 可以输入txt文件相关内容进行测试。</font>

<font style="color:#000000;">知识库索引成功后，新建应用测试知识库。</font>

<font style="color:#000000;">应用 - 新建 - 取名 - 知识库+对话引导 - AI模型选择</font><font style="color:#000000;">ChatGLM3开源本地</font><font style="color:#000000;"> </font><font style="color:#000000;">- 关联知识库 - 选择 - 选择知识库 - 完成 - 参数 - 语义检索 - 结果重排 - 完成 - 保存并预览。 右侧可以输入问题询问txt文件里的内容。</font>

<font style="color:#000000;">更多FastGPT的功能参见官方文档啦。</font>

**<font style="color:#000000;">收工！</font>**



> 更新: 2025-02-13 08:40:24  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/uhlgw1vril1z0e4g>