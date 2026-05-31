# lightrag问答系统

技术栈neo4j d3.js

### 导出所有模块
```python
pip freeze > requirements.txt
```

1 创建虚拟环境

```python
python -m venv lightrag
```

2.激活虚拟环境

```python
lightrag\Scripts\activate.bat
```

3.安装

```python
cd LightRAG
pip install -e .
```

```python
pip install lightrag-hku
```

```python
ollama pull nomic-embed-text
```

```python
ollama pull qwen2
```

```python
ollama run qwen2
```

```python
ollama run qwen2 >>> /set parameter num_ctx 32000
```

```python
/bye
```

![1735222665116-a7a64642-a59c-4cda-881a-386bf1c4524a.png](./img/3nR2Bgx2dGLGAdoq/1735222665116-a7a64642-a59c-4cda-881a-386bf1c4524a-127649.png)

```python
ollama rm llama3
```

![1735222744733-7cecb943-9b62-4170-9b3d-68dd1ba50aad.png](./img/3nR2Bgx2dGLGAdoq/1735222744733-7cecb943-9b62-4170-9b3d-68dd1ba50aad-448929.png)

```python
 ollama show --modelfile qwen2 > Modelfile
```

![1735355136472-18a7a5fb-1a61-4e5c-9a89-15102ce214af.png](./img/3nR2Bgx2dGLGAdoq/1735355136472-18a7a5fb-1a61-4e5c-9a89-15102ce214af-931011.png)



Modefile 添加配置

```python
PARAMETER num_ctx 32768
```

![1735355338445-37bdfa35-dcf9-45e5-b68b-d6cc24a0b263.png](./img/3nR2Bgx2dGLGAdoq/1735355338445-37bdfa35-dcf9-45e5-b68b-d6cc24a0b263-236301.png)



```python
 ollama create -f Modelfile qwen2m
```

![1735355477819-592be0f4-89bc-4dfc-bfaa-61d51c12ffe7.png](./img/3nR2Bgx2dGLGAdoq/1735355477819-592be0f4-89bc-4dfc-bfaa-61d51c12ffe7-998291.png)



```python
ollama run qwen2m
```

![1735355585460-046f5135-e671-4b70-9f30-3413edeb17d6.png](./img/3nR2Bgx2dGLGAdoq/1735355585460-046f5135-e671-4b70-9f30-3413edeb17d6-072164.png)



修改lightrag_ollama_demo 第 19 行

![1735355730585-f93e9a2c-5eee-448c-b938-cb835fc0dd8c.png](./img/3nR2Bgx2dGLGAdoq/1735355730585-f93e9a2c-5eee-448c-b938-cb835fc0dd8c-259139.png)



接下来是文本模型配置，进入另外一个终端

```python
 ollama ps
```

![1735355862569-03f949db-a734-4613-80cc-dfffa76c4c3e.png](./img/3nR2Bgx2dGLGAdoq/1735355862569-03f949db-a734-4613-80cc-dfffa76c4c3e-315796.png)

ollama 在局域网访问

```python
OLLAMA_HOST=0.0.0.0:11434 ollama serve
```



测试 ollama 在硬件设备上面可以跑什么型号的模型

标准是每秒能出多少 token

```python
ollama run --verbose qwen2m
```

[https://www.youtube.com/watch?v=g21royNJ4fw](https://www.youtube.com/watch?v=g21royNJ4fw)

[https://github.com/h2oai/h2ogpt](https://github.com/h2oai/h2ogpt)

[https://cloud.tencent.com/developer/article/2474817](https://cloud.tencent.com/developer/article/2474817)

[https://github.com/severian42/GraphRAG-Local-UI](https://github.com/severian42/GraphRAG-Local-UI)

[https://github.com/microsoft/graphrag](https://github.com/microsoft/graphrag)

[https://github.com/adoresever](https://github.com/adoresever)

[https://www.53ai.com/news/RAG/2024072729431.html](https://www.53ai.com/news/RAG/2024072729431.html)

[https://github.com/Cinnamon/kotaemon](https://github.com/Cinnamon/kotaemon)  //UI



[https://github.com/spmallick/learnopencv/tree/master/LightRAG-Legal](https://github.com/spmallick/learnopencv/tree/master/LightRAG-Legal)



> 更新: 2025-01-07 10:30:21  
> 原文: <https://www.yuque.com/lixinsi/vnere7/lk4t4r2gggx6wvxa>