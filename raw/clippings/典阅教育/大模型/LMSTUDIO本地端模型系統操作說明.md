# LM STUDIO本地端模型系統操作說明

docker 部署 anythingllm

[https://docs.useanything.com/installation/self-hosted/local-docker](https://docs.useanything.com/installation/self-hosted/local-docker)

```bash
 docker pull mintplexlabs/anythingllm
 docker run
```

powershell 执行

```bash
$env:STORAGE_LOCATION="$HOME\Documents\anythingllm"; `
If(!(Test-Path $env:STORAGE_LOCATION)) {New-Item $env:STORAGE_LOCATION -ItemType Directory}; `
If(!(Test-Path "$env:STORAGE_LOCATION\.env")) {New-Item "$env:STORAGE_LOCATION\.env" -ItemType File}; `
docker run -d -p 3001:3001 `
--cap-add SYS_ADMIN `
-v "$env:STORAGE_LOCATION`:/app/server/storage" `
-v "$env:STORAGE_LOCATION\.env:/app/server/.env" `
-e STORAGE_DIR="/app/server/storage" `
mintplexlabs/anythingllm;
```



linux

```bash
export STORAGE_LOCATION=$HOME/anythingllm && \
mkdir -p $STORAGE_LOCATION && \
touch "$STORAGE_LOCATION/.env" && \
docker run -d -p 3001:3001 \
--cap-add SYS_ADMIN \
-v ${STORAGE_LOCATION}:/app/server/storage \
-v ${STORAGE_LOCATION}/.env:/app/server/.env \
-e STORAGE_DIR="/app/server/storage" \
mintplexlabs/anythingllm
```

[https://hackmd.io/wDeqCis6TPaPPKUv5FrF1Q](https://hackmd.io/wDeqCis6TPaPPKUv5FrF1Q)

[https://www.youtube.com/watch?v=agdWJBQKlEE&t=5658s](https://www.youtube.com/watch?v=agdWJBQKlEE&t=5658s)



groq 注册地址：[https://console.groq.com/keys](https://console.groq.com/keys)

key：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





## <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">LM STUDIO功能介紹</font>
### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">軟體下載</font>
[<font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">https://lmstudio.ai/</font>](https://lmstudio.ai/)<font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">  
</font>

### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">開啟 LM STUDIO</font>


### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">搜尋模型 Breeze</font>


### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">模型文件說明 (SYS_PROMPT)</font>


### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">模型下載清單 (Template)</font>


### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">下拉選單, 切換模型至BREEZE</font>


### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">Breeze模型進行對話結果 (Template Mistral )</font>
<font style="color:rgb(113, 113, 122);background-color:rgb(253, 253, 253);">You are an AI programming assistant, utilizing the Deepseek Coder model, developed by Deepseek Company, and you only answer questions related to computer science.</font>



### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">Breeze模型進行對話結果 (Template Breeze )</font>
[<font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">Breeze system template</font>](https://huggingface.co/MediaTek-Research/Breeze-7B-Instruct-v1_0/blob/main/tokenizer_config.json)

<font style="color:rgb(113, 113, 122);background-color:rgb(253, 253, 253);">You are a helpful AI assistant built by MediaTek Research. The user you are helping speaks Traditional Chinese and comes from Taiwan.</font>

### 


### 
### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">System template</font>
[<font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">https://hf.co/chat/assistant/65c0db011aade7f4a0f5de30</font>](https://hf.co/chat/assistant/65c0db011aade7f4a0f5de30)

### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">操作影片 LM STUDIO 操作介紹</font>


## <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">LM STUDIO API</font>
### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">設定API相關參數</font>


### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">啟動服務產生的連結</font>


### <font style="color:rgb(63, 63, 70);background-color:rgb(253, 253, 253);">操作影片 API 操作介紹</font>
  
 

anythingLLM



> 更新: 2024-08-04 06:03:34  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/vfhio02l62agvtqp>