# coqui-ai/TTS部署

### 开源地址：
[https://github.com/skyconnfig/TTS](https://github.com/skyconnfig/TTS)



```python
docker run --rm -it -p 5002:5002 --entrypoint /bin/bash ghcr.io/coqui-ai/tts-cpu
python3 TTS/server/server.py --list_models #To get the list of available models
python3 TTS/server/server.py --model_name tts_models/en/vctk/vits # To start a server
```



 直接在本地跑 TTS 服务  

```python
pip install TTS
python3 -m TTS.server.server --list_models
python3 -m TTS.server.server --model_name tts_models/en/vctk/vits


```

好 ✅ 我帮你整理一个 **完整的替代方案**，不用拉慢吞吞的 Docker 镜像，直接在本地安装 **Coqui TTS** 并启动服务。

---

# 🔹 1. 安装依赖
建议使用 Python 3.9+，并新建虚拟环境：

```bash
python3 -m venv tts_env
source tts_env/bin/activate   # Linux / Mac
# Windows 用 tts_env\Scripts\activate
```

安装 Coqui TTS：

```bash
pip install TTS
```

如果你在国内，建议加上清华源加速：

```bash
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple TTS
```

---

# 🔹 2. 启动服务
列出可用模型：

```bash
python -m TTS.server.server --list_models
```

启动指定模型服务（例如英文 vits 模型）：

```bash
python -m TTS.server.server --model_name tts_models/en/vctk/vits
```

如果要中文模型，可以换成：

```bash
python -m TTS.server.server --model_name tts_models/zh-CN/baker/tacotron2-DDC-GST
```

默认会在 [http://0.0.0.0:5002](http://0.0.0.0:5002) 启动一个 REST API 服务。

---

# 🔹 3. 测试合成语音
### Curl 测试
```bash
curl -X POST "http://localhost:5002/api/tts" \
  -H 'Content-Type: application/json' \
  -d '{"text":"大家好，今天我们学习人工智能的基本概念"}' \
  --output test.wav
```

### Python 测试
```python
import requests

url = "http://localhost:5002/api/tts"
payload = {"text": "大家好，今天我们学习人工智能的基本概念"}
response = requests.post(url, json=payload)

with open("test.wav", "wb") as f:
    f.write(response.content)

print("✅ 已生成语音 test.wav")
```

---

# 🔹 4. 优势
+ **不依赖 Docker** → 避免 ghcr 镜像拉取缓慢
+ **可自定义模型** → 直接指定 Hugging Face 上的 Coqui TTS 模型
+ **更灵活** → 可以在 Python 脚本里调用，而不仅仅是 REST API

---

```python
python -m TTS.server.server --model_name tts_models/zh-CN/baker/tacotron2-DDC-GST

```



> 更新: 2025-09-30 08:26:50  
> 原文: <https://www.yuque.com/lixinsi/dtxgrg/am1alok9cfuco5z0>