# ubuntu Langchain-Chatchat v 0.3.0 部署记录

[https://gitee.com/RKwork85/langchain-chatchat_v0.3.0-rk/blob/main/rk_readme.md](https://gitee.com/RKwork85/langchain-chatchat_v0.3.0-rk/blob/main/rk_readme.md)



<font style="color:rgb(64, 72, 91);">前提： 1 conda 安装 以及Nvidia驱动安装 cuda cudnn 计算资源可正常使用（确认GPU资源可用）</font>

<font style="color:rgb(64, 72, 91);">一 安装依赖：</font>

<font style="color:rgb(64, 72, 91);">conda create -n chatchat python=3.10</font>

<font style="color:rgb(64, 72, 91);">conda activate chatchat</font>

<font style="color:rgb(64, 72, 91);">pip install -r rk_requirements.txt --no-deps // 若下载缓慢则更换镜像源：pip config set global.index-url</font><font style="color:rgb(64, 72, 91);"> </font>[<font style="color:rgb(64, 72, 91);">https://pypi.tuna.tsinghua.edu.cn/simple</font>](https://gitee.com/link?target=https%3A%2F%2Fpypi.tuna.tsinghua.edu.cn%2Fsimple)

<font style="color:rgb(64, 72, 91);">启动两个模型服务</font>

<font style="color:rgb(64, 72, 91);">XINFERENCE_MODEL_SRC=modelscope xinference-local --host 0.0.0.0 --port 9997</font>

<font style="color:rgb(64, 72, 91);">二 命令行修改配置文件：</font>

<font style="color:rgb(64, 72, 91);">chatchat-config model --default_llm_model qwen2-instruct</font>

<font style="color:rgb(64, 72, 91);">chatchat-config model --set_model_platforms "[{ "platform_name": "xinference", "platform_type": "xinference", "api_base_url": "http://127.0.0.1:9997/v1", "api_key": "EMPT", "api_concurrencies": 5, "llm_models": [ "qwen2-instruct" ], "embed_models": [ "bge-large-zh-v1.5" ], "image_models": [], "reranking_models": [], "speech2text_models": [], "tts_models": [] }]"</font>

<font style="color:rgb(64, 72, 91);">三 测试及服务启动：</font>

<font style="color:rgb(64, 72, 91);">chatchat-kb -r</font>

<font style="color:rgb(64, 72, 91);">chatchat -a</font>

## <font style="color:rgb(64, 72, 91);">使用说明</font>
<font style="color:rgb(64, 72, 91);">全命令行操作：</font>

<font style="color:rgb(64, 72, 91);">基础操作</font>

<font style="color:rgb(64, 72, 91);">查看：</font>

<font style="color:rgb(64, 72, 91);">chatchat-config --help</font>

<font style="color:rgb(64, 72, 91);">chatchat-config model --help</font>

<font style="color:rgb(64, 72, 91);">chatchat-conifg basic --help</font>

<font style="color:rgb(64, 72, 91);">修改：</font>

<font style="color:rgb(64, 72, 91);">chatchat-config model --default_llm_model qwen2-instruct</font>

<font style="color:rgb(64, 72, 91);">chatchat-config model --set_model_platforms "[{ "platform_name": "xinference", "platform_type": "xinference", "api_base_url": "http://127.0.0.1:9997/v1", "api_key": "EMPT", "api_concurrencies": 5, "llm_models": [ "qwen2-instruct" ], "embed_models": [ "bge-large-zh-v1.5" ], "image_models": [], "reranking_models": [], "speech2text_models": [], "tts_models": [] }]"</font>

<font style="color:rgb(64, 72, 91);">chatchat-kb -r</font>

<font style="color:rgb(64, 72, 91);">xinference 启动两个模型服务</font>

<font style="color:rgb(64, 72, 91);">Langchain-Chatchat服务启动</font>

<font style="color:rgb(64, 72, 91);">qwen2-instruct bge-large-zh-v1.5</font>

## <font style="color:rgb(64, 72, 91);">项目记录</font>
<font style="color:rgb(64, 72, 91);">1 embedding模型接口配置文件 ln:121</font>

<font style="color:rgb(64, 72, 91);">/home/rkwork/anaconda3/envs/chatchat/lib/python3.10/site-packages/chatchat/configs/_model_config.py</font>

<font style="color:rgb(64, 72, 91);">2 我需要查找发送接口格式而不是服务接口</font>

<font style="color:rgb(64, 72, 91);">/home/rkwork/anaconda3/envs/chatchat/lib/python3.10/site-packages/chatchat/webui_pages/dialogue/dialogue.py</font>

<font style="color:rgb(64, 72, 91);">3 对话接口地址</font>

[<font style="color:rgb(64, 72, 91);">http://127.0.0.1:7861/chat/chat/completions</font>](https://gitee.com/link?target=http%3A%2F%2F127.0.0.1%3A7861%2Fchat%2Fchat%2Fcompletions)

<font style="color:rgb(64, 72, 91);">4 接口封装格式 /home/rkwork/anaconda3/envs/chatchat/lib/python3.10/site-packages/openai/_base_client.py ln： 1236</font>

```plain
def post(                                       ## Post接口格式
        self,
        path: str,
        *,
        cast_to: Type[ResponseT],
        body: Body | None = None,
        options: RequestOptions = {},
        files: RequestFiles | None = None,
        stream: bool = False,
        stream_cls: type[_StreamT] | None = None,
    ) -> ResponseT | _StreamT:
        opts = FinalRequestOptions.construct(
            method="post", url=path, json_data=body, files=to_httpx_files(files), **options
        )
        return cast(ResponseT, self.request(cast_to, opts, stream=stream, stream_cls=stream_cls))
```

<font style="color:rgb(64, 72, 91);">5 post接口格式 /home/rkwork/anaconda3/envs/chatchat/lib/python3.10/site-packages/openai/resources/chat/completions.py ln: 643</font>

```plain
return self._post(
            "/chat/completions",
            body=maybe_transform(
                {
                    "messages": messages,
                    "model": model,
                    "frequency_penalty": frequency_penalty,
                    "function_call": function_call,
                    "functions": functions,
                    "logit_bias": logit_bias,
                    "logprobs": logprobs,
                    "max_tokens": max_tokens,
                    "n": n,
                    "parallel_tool_calls": parallel_tool_calls,
                    "presence_penalty": presence_penalty,
                    "response_format": response_format,
                    "seed": seed,
                    "service_tier": service_tier,
                    "stop": stop,
                    "stream": stream,
                    "stream_options": stream_options,
                    "temperature": temperature,
                    "tool_choice": tool_choice,
                    "tools": tools,
                    "top_logprobs": top_logprobs,
                    "top_p": top_p,
                    "user": user,
                },
                completion_create_params.CompletionCreateParams,
            ),
            options=make_request_options(
                extra_headers=extra_headers, extra_query=extra_query, extra_body=extra_body, timeout=timeout
            ),
            cast_to=ChatCompletion,
            stream=stream or False,
            stream_cls=Stream[ChatCompletionChunk],
        )
```

<font style="color:rgb(64, 72, 91);">6 与自定义模型进行对话</font>

<font style="color:rgb(64, 72, 91);">1 先使用xinference代码进行模型注册，测试正常部署</font>

<font style="color:rgb(64, 72, 91);">2 修改chatchat配置文件</font>

```plain
chatchat-config model --set_model_platforms "[{
    \"platform_name\": \"xinference\",
    \"platform_type\": \"xinference\",
    \"api_base_url\": \"http://192.168.1.246:9997/v1\",
    \"api_key\": \"EMPT\",
    \"api_concurrencies\": 5,
    \"llm_models\": [
        \"rkllm\"
    ],
    \"embed_models\": [
        \"bge-large-zh-v1.5\"
    ],
    \"image_models\": [],
    \"reranking_models\": [],
    \"speech2text_models\": [],
    \"tts_models\": []
}]"

chatchat-config model --default_llm_model rkllm
```

<font style="color:rgb(64, 72, 91);">3 启动</font>

<font style="color:rgb(64, 72, 91);">chatchat -a</font>



> 更新: 2024-07-31 10:09:25  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/sltxcc7czlmx39uf>