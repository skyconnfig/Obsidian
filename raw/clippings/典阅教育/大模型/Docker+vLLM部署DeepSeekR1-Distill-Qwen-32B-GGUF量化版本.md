# Docker + vLLM 部署DeepSeek R1-Distill-Qwen-32B-GGUF量化版本

<font style="color:rgb(25, 27, 31);">前言： 本文面向希望在小型或个人GPU服务器上部署DeepSeek R1 32B的量化版本的受众，因为自己最近在用gguf做小型的部署和实验，看见用GGUF格式的相关的参考资料不是很多，所以写了这篇文章，希望可以帮到一些看到的人，节约大概20分钟左右的被翻资料和网络延迟所浪费的时间。</font>

## <font style="color:rgb(25, 27, 31);">简介</font>

[DeepSeek-R1-Distill-Qwen-32B](https://link.zhihu.com/?target=https%3A//huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-32B)<font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">是</font><font style="color:rgb(25, 27, 31);"> </font>[DeepSeek R1](https://link.zhihu.com/?target=https%3A//github.com/deepseek-ai/DeepSeek-R1%3Ftab%3Dreadme-ov-file)<font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">对</font><font style="color:rgb(25, 27, 31);"> </font>[Qwen-32B](https://link.zhihu.com/?target=https%3A//huggingface.co/Qwen/Qwen2.5-32B)<font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">进行蒸馏的版本，从DeepSeek R1 Repo 开源的对比测试来看，这个模型十分有性价比，也是目前大多数单卡落地部署（量化）方案选择的版本，量级看上去虽然有点丐，但是测试集上的能力却直逼体量大了一倍Llama-70B，尤其 CodeForces rating 的分数很高：</font>

| <font style="color:rgb(25, 27, 31);">Model</font> | <font style="color:rgb(25, 27, 31);">AIME 2024 pass@1</font> | <font style="color:rgb(25, 27, 31);">AIME 2024 cons@64</font><font style="color:rgb(25, 27, 31);">  </font><font style="color:rgb(25, 27, 31);">AIME 2024 缺点@64</font> | <font style="color:rgb(25, 27, 31);">MATH-500 pass@1</font> | <font style="color:rgb(25, 27, 31);">GPQA Diamond pass@1</font> | <font style="color:rgb(25, 27, 31);">LiveCodeBench pass@1</font> | <font style="color:rgb(25, 27, 31);">CodeForces rating</font> |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| <font style="color:rgb(25, 27, 31);">DeepSeek-R1-Distill-Qwen-32B</font> | <font style="color:rgb(25, 27, 31);">72.6</font> | <font style="color:rgb(25, 27, 31);">83.3</font> | <font style="color:rgb(25, 27, 31);">94.3</font> | <font style="color:rgb(25, 27, 31);">62.1</font> | <font style="color:rgb(25, 27, 31);">57.2</font> | <font style="color:rgb(25, 27, 31);">1691</font> |
| <font style="color:rgb(25, 27, 31);">DeepSeek-R1-Distill-Llama-70B</font> | <font style="color:rgb(25, 27, 31);">70.0</font> | <font style="color:rgb(25, 27, 31);">86.7</font> | <font style="color:rgb(25, 27, 31);">94.5</font> | <font style="color:rgb(25, 27, 31);">65.2</font> | <font style="color:rgb(25, 27, 31);">57.5</font> | <font style="color:rgb(25, 27, 31);">1633</font> |

<font style="color:rgb(25, 27, 31);">本文使用 Docker + Vllm 部署由</font><font style="color:rgb(25, 27, 31);"> </font>[Llama.cpp](https://link.zhihu.com/?target=https%3A//github.com/ggml-org/llama.cpp)<font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">进行量化之后的版本，可以实现在24G显存上的私有化部署，实测在Ubuntu 24.04 / RTX 3090 下推理速度达到了 35 token/s。</font>

## <font style="color:rgb(25, 27, 31);">模型权重下载</font>

[<font style="color:rgb(9, 64, 142);">Huggingface</font>](https://zhida.zhihu.com/search?content_id=254435370\&content_type=Article\&match_order=1\&q=Huggingface\&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NTY1MjMzMjgsInEiOiJIdWdnaW5nZmFjZSIsInpoaWRhX3NvdXJjZSI6ImVudGl0eSIsImNvbnRlbnRfaWQiOjI1NDQzNTM3MCwiY29udGVudF90eXBlIjoiQXJ0aWNsZSIsIm1hdGNoX29yZGVyIjoxLCJ6ZF90b2tlbiI6bnVsbH0.NMAUjyJkkvbeLiLoGNWYPeDJaQkvoQjf1ujvp5SJXic\&zhida_source=entity)<font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">Repo 推荐：</font>

* <font style="color:rgb(25, 27, 31);">Huggingface 上一个老哥用 llama.cpp 不同算法量化过的GGUF格式的权重，</font><font style="color:rgb(25, 27, 31);"> </font>[**bartowski/DeepSeek-R1-Distill-Qwen-32B-GGU**](https://link.zhihu.com/?target=https%3A//huggingface.co/bartowski/DeepSeek-R1-Distill-Qwen-32B-GGUF)**<font style="color:rgb(25, 27, 31);">F</font>**
* <font style="color:rgb(25, 27, 31);">AWQ 量化版本（</font>[评测效果更好](https://zhuanlan.zhihu.com/p/19854392355)<font style="color:rgb(25, 27, 31);">）</font><font style="color:rgb(25, 27, 31);"> </font>[Valdemardi/DeepSeek-R1-Distill-Qwen-32B-AWQ](https://link.zhihu.com/?target=https%3A//huggingface.co/Valdemardi/DeepSeek-R1-Distill-Qwen-32B-AWQ)
* <font style="color:rgb(25, 27, 31);">ModelScope镜像</font><font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">我搬运bartowski的部分gguf权重到ModelScope上的库，方便国内代理慢的同学下载</font><font style="color:rgb(25, 27, 31);"> </font>[**TreeDy2023/DeepSeek-R1-Distill-Qwen-32B-GGUF**](https://link.zhihu.com/?target=https%3A//modelscope.cn/models/TreeDy2023/DeepSeek-R1-Distill-Qwen-32B-GGUF/files)**<font style="color:rgb(25, 27, 31);">，</font>**<font style="color:rgb(25, 27, 31);">需要注册一个ModelScope的账号</font>

### <font style="color:rgb(25, 27, 31);">选择1 - 使用 huggingface-hub SDK 下载</font>

<font style="color:rgb(25, 27, 31);">国内建议上</font><font style="color:rgb(25, 27, 31);"> </font>[HF-Mirror](https://link.zhihu.com/?target=https%3A//hf-mirror.com/)<font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">做镜像加速，这里我条件有限，选择 DeepSeek-R1-Distill-Qwen-32B-Q4\_1.gguf，可以根据自己的显存条件，适当选择一个库里合适的量化版本。</font>

```plain
pip install huggingface-hub # 安装huggingface CLI sdk
```

<font style="color:rgb(25, 27, 31);">下载对应模型权重，</font>

```bash
huggingface-cli download bartowski/DeepSeek-R1-Distill-Qwen-32B-GGUF DeepSeek-R1-Distill-Qwen-32B-Q4_1.gguf
```

<font style="color:rgb(25, 27, 31);">注意 download 后第一个位参数是 Repo ID, 第二个位参数是实际需要下载的文件名，例如我这里是</font><font style="color:rgb(25, 27, 31);"> </font>**<font style="color:rgb(25, 27, 31);">DeepSeek-R1-Distill-Qwen-32B-Q4\_1.gguf，可以参考自己要下载的Repo 里的文件树，根据自己的需要进行变更</font>**<font style="color:rgb(25, 27, 31);">。</font>

### <font style="color:rgb(25, 27, 31);">选择2 - 使用 modelscope SDK 下载 (无代理时推荐）</font>

```bash
pip install modelscope # 下载modelscope SDK
modelscope login --token xxx # 登陆
```

<font style="color:rgb(25, 27, 31);">然后下载对应需要的权重文件，</font>

```bash
modelscope download TreeDy2023/DeepSeek-R1-Distill-Qwen-32B-GGUF DeepSeek-R1-Distill-Qwen-32B-Q4_K_1.gguf
```

### **<font style="color:rgb(25, 27, 31);">选择3 - 使用命令行下载 \[使用GGUF文件时推荐]</font>**

[<font style="color:rgb(9, 64, 142);">vLLM</font>](https://zhida.zhihu.com/search?content_id=254435370\&content_type=Article\&match_order=1\&q=vLLM\&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NTY1MjMzMjgsInEiOiJ2TExNIiwiemhpZGFfc291cmNlIjoiZW50aXR5IiwiY29udGVudF9pZCI6MjU0NDM1MzcwLCJjb250ZW50X3R5cGUiOiJBcnRpY2xlIiwibWF0Y2hfb3JkZXIiOjEsInpkX3Rva2VuIjpudWxsfQ.T21fnOoVkEl3J3WZl33APdeCN1jyTIDdkC355RZpWGM\&zhida_source=entity)<font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">在使用gguf文件时，需要指定具体的文件路径，而huggingface和modelscope的默认cache方式都比较难找到具体文件，这导致了最终指定具体路径时文件名不好找，所以推荐直接使用命令行工具把权重下载到一个指定位置。可以在对应库中选中想要下载的权重文件对应的</font><font style="color:rgb(25, 27, 31);"> </font>**<font style="color:rgb(25, 27, 31);">下载/download ,</font>**<font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">右键复制链接地址，采用</font><font style="color:rgb(25, 27, 31);"> </font>**<font style="color:rgb(25, 27, 31);">wget / aria2</font>\*\*\*\*<font style="color:rgb(25, 27, 31);"> </font>**<font style="color:rgb(25, 27, 31);">等命令行工具进行下载，指定输出地址，例如</font>

```bash
# Ubuntu 为例，推荐
sudo apt update
sudo apt install aria2
aria2c -o DeepSeek-R1-Distill-Qwen-32B-Q4_K_1.gguf -x 16 -s 16 <复制你的权重文件下载地址>
```

<font style="color:rgb(25, 27, 31);">或</font>

```bash
# 慢，并不推荐
wget -o DeepSeek-R1-Distill-Qwen-32B-Q4_K_1.gguf <复制你的权重文件下载地址>
```

## <font style="color:rgb(25, 27, 31);">Tokenizer下载 \[使用GGUF 文件时需要]</font>

<font style="color:rgb(25, 27, 31);">vLLM</font>[目前虽然支持了.gguf 格式(25/04/03)](https://link.zhihu.com/?target=https%3A//docs.vllm.ai/en/latest/features/quantization/gguf.html)<font style="color:rgb(25, 27, 31);">，但是只支持 single-file的，并且在运行时需要指定tokenizer，因此除了下载模型权重之外，</font>**<font style="color:rgb(25, 27, 31);">还需要下载 DeepSeek-R1-Distill-Qwen-32B 的Tokenizer</font>**<font style="color:rgb(25, 27, 31);">，请在如下Repo</font>

* [**DeepSeek官方**](https://link.zhihu.com/?target=https%3A//huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-32B/tree/main)
* [**ModelScope本人搬运仓库**](https://link.zhihu.com/?target=https%3A//modelscope.cn/models/TreeDy2023/DeepSeek-R1-Distill-Qwen-32B-GGUF/files)

<font style="color:rgb(25, 27, 31);">中下载以下tokenizer相关文件：</font>

```plain
├── config.json
    ├── tokenizer_config.json
    └── tokenizer.json
```

* <font style="color:rgb(25, 27, 31);">下载</font>

```plain
# 三选一
# 对应Repo文件树中在网页段点击下载，不大，很快
# modelscope download TreeDy2023/DeepSeek-R1-Distill-Qwen-32B-GGUF config.json tokenizer_config.json tokenizer.json
# huggingface-cli download deepseek-ai/DeepSeek-R1-Distill-Qwen-32B config.json tokenizer_config.json tokenizer.json
```

### <font style="color:rgb(25, 27, 31);">vLLM Docker镜像下拉</font>

<font style="color:rgb(25, 27, 31);">预先条件</font>

<font style="color:rgb(25, 27, 31);">除了</font><font style="color:rgb(25, 27, 31);"> </font>[Docker](https://link.zhihu.com/?target=https%3A//www.docker.com/)<font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">本身之外，还需要 1.</font><font style="color:rgb(25, 27, 31);"> </font>**<font style="color:rgb(25, 27, 31);">安装CUDA， 2. 安装</font>\*\*\*\*<font style="color:rgb(25, 27, 31);"> </font>**[**<font style="color:rgb(9, 64, 142);">nvidia-container-toolkit</font>**](https://zhida.zhihu.com/search?content_id=254435370\&content_type=Article\&match_order=1\&q=nvidia-container-toolkit\&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NTY1MjMzMjgsInEiOiJudmlkaWEtY29udGFpbmVyLXRvb2xraXQiLCJ6aGlkYV9zb3VyY2UiOiJlbnRpdHkiLCJjb250ZW50X2lkIjoyNTQ0MzUzNzAsImNvbnRlbnRfdHlwZSI6IkFydGljbGUiLCJtYXRjaF9vcmRlciI6MSwiemRfdG9rZW4iOm51bGx9.Xaqk9B7pweBxvi0Ws6Lca3mg_DCsSPVWtby_fw8Jlnk\&zhida_source=entity)<font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">才能正常运行官方的docker部署命令，参考</font>

* [CUDA Toolkit 12.1 Downloads](https://link.zhihu.com/?target=https%3A//developer.nvidia.com/cuda-downloads%3Ftarget_os%3DLinux)
* [Ubuntu24.04安装CUDA和NVIDIA显卡驱动 - 走着的小站](https://link.zhihu.com/?target=https%3A//www.openpilot.cc/archives/4411)
* [Installing the NVIDIA Container Toolkit](https://link.zhihu.com/?target=https%3A//docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html%23configuration)

<font style="color:rgb(25, 27, 31);">因为我只需要部署一个OpenAI类型接口就可以，因此选择了 vllm/vllm-openai镜像，参考 vLLM</font><font style="color:rgb(25, 27, 31);"> </font>[官方步骤](https://link.zhihu.com/?target=https%3A//docs.vllm.ai/en/stable/deployment/docker.html)

<font style="color:rgb(25, 27, 31);">拉镜像：</font>

```bash
docker pull vllm/vllm-openai:latest
```

**<font style="color:rgb(25, 27, 31);">\[ Optional Docker代理]</font>\*\*\*\*<font style="color:rgb(25, 27, 31);"> </font>**<font style="color:rgb(25, 27, 31);">可以使用国内各种镜像站，如果自己有代理的话，也可以配置docker代理</font>

```bash
vim /etc/systemd/system/docker.service.d/http-proxy.conf
```

<font style="color:rgb(25, 27, 31);">创建文件后，配置自己的代理环境</font>

```plain
[Service]
Environment="HTTP_PROXY=http://localhost:7890/" # 配置自己的代理
Environment="HTTPS_PROXY=http://localhost:7890/"
Environment="NO_PROXY=localhost,127.0.0.1"
```

<font style="color:rgb(25, 27, 31);">保存退出后，重启Docker服务然后运行下拉命令</font>

```bash
sudo systemctl restart docker.service
sudo systemctl daemon-reload
```

## <font style="color:rgb(25, 27, 31);">部署推理服务</font>

### <font style="color:rgb(25, 27, 31);">非GGUF</font>

<font style="color:rgb(25, 27, 31);">如果你直接下载了某个完整Repo，并且下载的权重和tokenizer的cache地址和huggingface默认一致，那么可以直接按vLLM官方推荐进行运行，例如，你完整下载了</font><font style="color:rgb(25, 27, 31);"> </font>**<font style="color:rgb(25, 27, 31);">Valdemardi/DeepSeek-R1-Distill-Qwen-32B-AWQ</font>\*\*\*\*<font style="color:rgb(25, 27, 31);"> </font>**<font style="color:rgb(25, 27, 31);">这个repo，那么只需要在运行时 -v 将 huggingface 的cache位置和docker容器内进行正确映射即可</font>

```bash
docker run --runtime nvidia --gpus all \
    -v ~/.cache/huggingface:/root/.cache/huggingface \
    --env "HF_HUB_OFFLINE=1" \ # 指定使用本地权重，否则container内会一直尝试连接 huggingface.co，出现proxy错误 
    -p 8000:8000 \
    --ipc=host \
    vllm/vllm-openai:latest \
    --model Valdemardi/DeepSeek-R1-Distill-Qwen-32B-AWQ \ # Model Repo ID
    --served_model_name my_model_name \ # 你希望这个model暴露时的名称，如果不填默认为本地模型权重路径
    --max_model_len 1024 \ # 支持的最长上下文长度，根据显存大小自行匹配
    --api_key "<YOUR-API-KEY-HERE>"  # 调用时的API-key，不设置的话没有API鉴权
```

### <font style="color:rgb(25, 27, 31);">GGUF</font>

<font style="color:rgb(25, 27, 31);">如果使用gguf文件，推荐构建一个如下类似的文件树，如果你使用了 modelscope 或者 huggingface-cli进行下载，那么 .gguf 文件将默认 cache在 ~/.cache/huggingface 或 ~/.cache/modelscope 下，你需要将它们找到</font>

```bash
models/
└── DeepSeek-R1-Distill-Qwen-32B-Q4_1
    ├── config.json # 模型config文件
    ├── DeepSeek-R1-Distill-Qwen-32B-Q4_1.gguf # gguf 模型权重
    ├── tokenizer_config.json  # 确认包含了 tokenizer的config
    └── tokenizer.json # 确认包含了 tokenizer本身的.json文件
```

<font style="color:rgb(25, 27, 31);">当确认了所有文件时，</font>

```bash
docker run --runtime nvidia --gpus all \ # 注意Check Nvidia container toolkit 是否正确安装
        -v ./models:/models \ # 挂载模型权重的目录，这里我将本地 ./models映射到了container的/models目录
        -p 8000:8000 \ # 监听 8000号端口,会暴露一个FastAPI的HTTP Server服务
        --env "HF_HUB_OFFLINE=1" \ # 指定使用本地权重，否则container内会一直尝试连接 huggingface.co，出现proxy错误
        --ipc=host \
        vllm/vllm-openai:latest \ # 指定运行镜像
        --model /models/DeepSeek-R1-Distill-Qwen-32B-Q4_1/DeepSeek-R1-Distill-Qwen-32B-Q4_1.gguf \ # container 内的gguf文件地址
        --tokenizer /models/DeepSeek-R1-Distill-Qwen-32B-Q4_1 \ # container内的 tokenizer路径
        --served_model_name my_model_name \ # 你希望这个model暴露时的名称，如果不填默认为本地模型权重路径
        --max_model_len 1024 \ # 支持的最长上下文长度，根据显存自行匹配
        --quantization gguf \ # 量化方法
        --api_key "<YOUR-API-KEY-HERE>"  # 调用时的API-key，不设置的话没有API鉴权
```

<font style="color:rgb(25, 27, 31);">如果你是多卡，可以添加参数</font><code><font style="color:rgb(25, 27, 31);background-color:rgb(248, 248, 250);">--tensor-parallel-size</font></code><font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);"><你自己的GPU数量> 以开启多卡上的tensor 并行推理，vLLM 的 docker 最终接的参数和 vllm serve 命令一致，针对自己的情况参考</font><font style="color:rgb(25, 27, 31);"> </font>[vllm serve CLI 参数](https://link.zhihu.com/?target=https%3A//docs.vllm.ai/en/latest/serving/openai_compatible_server.html%23cli-reference)<font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">进行更细节的设置。</font>

## <font style="color:rgb(25, 27, 31);">测试验证</font>

<font style="color:rgb(25, 27, 31);">部署成功后，会在本地8000端口开启一个HTTP Server服务，兼容 OpenAI接口，可以用命令行进行验证，或浏览器打开 localhost:8000/docs</font>

```bash
curl localhost:8000/v1/models
```

<font style="color:rgb(25, 27, 31);">顺利的话会输出已经部署好的可用model。</font>


> 更新: 2025-08-28 11:22:36  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/cxu4wfbmuq8fsx92>