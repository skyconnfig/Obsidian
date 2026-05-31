# claude code 调用GLM4.5

### **<font style="color:rgb(25, 27, 31);">1、安装 Claude Code</font>**

<font style="color:rgb(83, 88, 97);">如果之前已经安装过 Claude Code 了，可以直接到下一步。</font>

**<font style="color:rgb(25, 27, 31);">① 安装</font>\*\*\*\*<font style="color:rgb(25, 27, 31);"> </font>**[**<font style="color:rgb(9, 64, 142);">Node.js</font>**](https://zhida.zhihu.com/search?content_id=261163985\&content_type=Article\&match_order=1\&q=Node.js\&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NTcxMTg3MDMsInEiOiJOb2RlLmpzIiwiemhpZGFfc291cmNlIjoiZW50aXR5IiwiY29udGVudF9pZCI6MjYxMTYzOTg1LCJjb250ZW50X3R5cGUiOiJBcnRpY2xlIiwibWF0Y2hfb3JkZXIiOjEsInpkX3Rva2VuIjpudWxsfQ.RbxuLZoyDAFsCnkgIcTrzbSV_xuDC3l2cb_M-TzNZhA\&zhida_source=entity)**<font style="color:rgb(25, 27, 31);">（版本在 18 及以上）</font>**

<font style="color:rgb(25, 27, 31);">Node.js 下载地址：</font>

[<u>https://nodejs.org/en/download/</u>](https://link.zhihu.com/?target=https%3A//nodejs.org/en/download/)

<font style="color:rgb(25, 27, 31);">下载合适的版本安装好后，在命令行中输入</font><font style="color:rgb(25, 27, 31);"> </font><code><font style="color:rgb(25, 27, 31);background-color:rgb(248, 248, 250);">node -v</font></code><font style="color:rgb(25, 27, 31);">，显示版本号，说明安装成功。</font>

**<font style="color:rgb(25, 27, 31);">② 安装 Claude Code</font>**

<font style="color:rgb(25, 27, 31);">在命令行中输入下面安装命令：</font>

```plain
npm install -g @anthropic-ai/claude-code
```

<font style="color:rgb(25, 27, 31);">安装完成后，输入</font><code><font style="color:rgb(25, 27, 31);background-color:rgb(248, 248, 250);">claude -v</font></code><font style="color:rgb(25, 27, 31);">，显示 Claude Code 版本号，说明 Claude Code 安装成功。</font>

### **<font style="color:rgb(25, 27, 31);">2、申请 API Key</font>**

<font style="color:rgb(25, 27, 31);">打开智谱大模型开放平台 BigModel：</font>

[智谱AI开放平台](https://link.zhihu.com/?target=https%3A//bigmodel.cn/)

<font style="color:rgb(25, 27, 31);">在「个人中心」-「项目管理」-「API keys」下，点「添加新的 API Key」，然后复制 API key。</font>

<font style="color:rgb(25, 27, 31);">  
</font>

![1756946084980-e37af3d9-6ac0-4b8a-8509-378043ea9472.png](./img/vzmwsBYIqIFeAS2i/1756946084980-e37af3d9-6ac0-4b8a-8509-378043ea9472-679172.png)

<font style="color:rgb(25, 27, 31);">  
</font>

### **<font style="color:rgb(25, 27, 31);">3、配置环境变量</font>**

<font style="color:rgb(25, 27, 31);">新建一个项目目录，进入到项目目录下：</font>

```plain
cd /path/to/your/project
```

<font style="color:rgb(25, 27, 31);">在项目目录下，运行这两行命令：</font>

```plain
export ANTHROPIC_BASE_URL=``https://open.bigmodel.cn/api/anthropic
export ANTHROPIC_AUTH_TOKEN="75d98580dce84795b61102038c9de984.EygPfCiBJuoWxzEA"
```

<font style="color:rgb(25, 27, 31);">输入</font><font style="color:rgb(25, 27, 31);"> </font><code><font style="color:rgb(25, 27, 31);background-color:rgb(248, 248, 250);">claude</font></code><font style="color:rgb(25, 27, 31);">命令，看到 API Base URL 如下图，说明可以开始用 GLM-4.5 干活了。</font>

![1756946084097-7e3cb913-eb76-4323-9e9c-bcb3a050a2c9.png](./img/vzmwsBYIqIFeAS2i/1756946084097-7e3cb913-eb76-4323-9e9c-bcb3a050a2c9-198543.png)

<font style="color:rgb(25, 27, 31);">输入任务要求，就可以坐等结果了：</font>

![1756946084038-3d070c77-1d11-420a-b704-4e292312cdff.png](./img/vzmwsBYIqIFeAS2i/1756946084038-3d070c77-1d11-420a-b704-4e292312cdff-251510.png)

![1756946084272-5ac60715-fe46-416c-8ff4-72aceca19028.png](./img/vzmwsBYIqIFeAS2i/1756946084272-5ac60715-fe46-416c-8ff4-72aceca19028-560479.png)

<font style="color:rgb(25, 27, 31);">不过说实话，Claude Code + GLM-4.5 的效果，并没有特别惊艳到我，反而感觉不如网页版效果好。</font>

<font style="color:rgb(25, 27, 31);">经常哐哐一顿改，告诉我改好了，但一测还是老样子。</font>

<font style="color:rgb(25, 27, 31);">不知道大家用的怎么样，可以评论区分享下使用体验。</font>

## **<font style="color:rgb(25, 27, 31);">四、写在最后</font>**

<font style="color:rgb(25, 27, 31);">智谱 GLM-4.5 的发布，让「能打」的国产大模型又 + 1！</font>

<font style="color:rgb(25, 27, 31);">虽然在体验的过程中，也有一些槽点。</font>

<font style="color:rgb(25, 27, 31);">比如 PPT 制作的能力，依然没有达到预期；用 Claude Code + GLM-4.5 测了几个项目，效果也不是很理想。</font>

<font style="color:rgb(25, 27, 31);">但还是有被 GLM-4.5 惊艳到的地方。</font>

<font style="color:rgb(25, 27, 31);">另外不知道大家有没有注意，在</font><font style="color:rgb(25, 27, 31);"> </font>[<font style="color:rgb(9, 64, 142);">HuggingFace</font>](https://zhida.zhihu.com/search?content_id=261163985\&content_type=Article\&match_order=1\&q=HuggingFace\&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NTcxMTg3MDMsInEiOiJIdWdnaW5nRmFjZSIsInpoaWRhX3NvdXJjZSI6ImVudGl0eSIsImNvbnRlbnRfaWQiOjI2MTE2Mzk4NSwiY29udGVudF90eXBlIjoiQXJ0aWNsZSIsIm1hdGNoX29yZGVyIjoxLCJ6ZF90b2tlbiI6bnVsbH0.E9-ouodw1TfVrxHKoy-UF3PXLkFOsxr2-GZWftfpe6E\&zhida_source=entity)<font style="color:rgb(25, 27, 31);"> </font><font style="color:rgb(25, 27, 31);">上，开源的国产大模型已占据了半壁江山。</font>

**<font style="color:rgb(25, 27, 31);">敢于将最核心的竞争力开源，本身就是一种技术自信的体现！</font>**

<font style="color:rgb(25, 27, 31);">期待国产大模型的下一次更新。</font>


> 更新: 2025-09-04 08:35:08  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/iegk4dmyoqgtt2zs>