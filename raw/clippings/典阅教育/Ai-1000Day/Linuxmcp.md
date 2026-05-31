# Linux mcp

+ 1 .阿里云购买个人服务器
+ 2. 购买地址:[https://www.aliyun.com/product/ecs](https://www.aliyun.com/product/ecs),下单购买，99 元 /年
+ ![1752827502594-77b96e34-3db5-4a6a-a553-b07e416e440d.png](./img/bMA_xG3VGL8lkSwb/1752827502594-77b96e34-3db5-4a6a-a553-b07e416e440d-605384.png)
+ 绑定密钥对
+ ![1752827695263-fda78056-8804-4238-b308-225f074e0371.png](./img/bMA_xG3VGL8lkSwb/1752827695263-fda78056-8804-4238-b308-225f074e0371-157762.png)
+ 创建密钥对
+ ![1752827730128-066685bc-5260-430b-80d0-4d074dcea000.png](./img/bMA_xG3VGL8lkSwb/1752827730128-066685bc-5260-430b-80d0-4d074dcea000-496555.png)
+ ![1752827791982-6488f7d5-ef89-48c9-a188-fc101aa5e759.png](./img/bMA_xG3VGL8lkSwb/1752827791982-6488f7d5-ef89-48c9-a188-fc101aa5e759-902166.png)
+ ![1752827859446-309e8d59-6cba-4618-b58e-d5d089a666db.png](./img/bMA_xG3VGL8lkSwb/1752827859446-309e8d59-6cba-4618-b58e-d5d089a666db-974953.png)
+ 重启
+ ![1752827897571-ece75bde-018b-4056-98ae-38be0471d797.png](./img/bMA_xG3VGL8lkSwb/1752827897571-ece75bde-018b-4056-98ae-38be0471d797-280081.png)
+ 为后续 mcp 配置做准备，配置 mcp 工具
+ 打开刚才阿里云下载的密钥工具，全选复制内容

```sql
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAnOeGiCaYvqcGXXQbkx/Ps83n+6ERsUsP6XxxBmsa4eEJB7S9
U6QkgTIowgZgWSH5kF0DYV/offP4vjhg/ih1IX2b/JDOUwf2y1FHQ5a8M/DV3pFo
wMjl198P7yurqPuWnH2el2KrDOzIFerHARNeWROmedB5HWcheFx2s+I68CmapVI4
J7zg0kA3m98bhFg/bMHk0jh69CL38Akct7ptVm7WFWTfgeQ74wrsngNJePzrrvD+
0asHLH6I4bULpC04yDD99HAACzy7QyPaYsvQlOQxclqBD0h+3qzhaa9gCzpASbhX
TLV9ZsRDetlPI6dvfzkaxFw6QAHoWTN/jr9aIQIDAQABAoIBAErBJB+KBAwRl76+
qsSVy2dnGreQLdXCZXpgh5j/PnePt7WsLufCtIG5XCHU1+KfhT96kTm7cBFSQ5id
U9jDfcrPBZp3g1Wb3cFQoBtbnZ9BhyPbM4VmMdt/sx/INqjz9PXqA70sjUJDLbED
gnzItZLLAe3XnVyc3h1yMDvT9TCmXp8NnCJNpuqyWykQ8eq2yCsv2T/k2s5rdC1O
Q0jf4FV3/LLMcfCpEOI/eF+eTBZI2Bk5KjWQMVLdbGHGyRKDCevdXdQ9xJVdKGvW
Ytpeua+QiEROecCKRxLYGH3RVlJQq/Zk6sHW/j+ko8mYSJpJ3VOMs+nUcHTpKh5E
xw0WvoECgYEA9suyK1uvS7WDLsrWl1cJ7lR905avTwcU2EhPsESzf879nG0uD+yZ
I5u71y773NYd7m6tUswCA0Wf080XlCbUyM37UkVVV37MQmWMSFier1G8VoCsL7xA
AjExdjHxdXdhr+ZfnT2pbQJKs8u+JbP3u6dwyGrLXyOVEy3NzrQlgH0CgYEAosGV
mE8Wn7wtvJJ95iOoi7d0PXFV7FeF3uk6sqNoMFJxReZRqgYE1a1Moqhdtg9iDW9Z
F4kVgtwwX7Argzg+sIcJ153TBteXhEUrW1S9ZVv/Dy4Zo8eewhiZK2pMFS5zgMkB
ODMbiu1F6dHmvKqAN9UTn8I+2VQ6ur29JSF09XUCgYAksntGyTZSqqXcAltQW6fl
YXjoSoK83I+z7WS0EDMksRGy/eUYhxTqX5DZ2WmoF8qRlrF9G0q9U9AFPXzhEbkY
NtDFFfwvq3IR+WmXpF3MMfowXqe73WEjMk9phNmjnuHOtxHGntGfnPSgsY4PqygO
JkK1+nNNLUxQcsIkl1LwPQKBgQCNZ1k8QgJq94hZHIFLsNFfyhywwUYgl44UtFeu
GrCLwyTs0QVEjgQnTXCWpWb9pXHQMFycSRqqXfmdOSck03oLztcrQNC2Uhsu7RWV
PRNr+7inDKt0ExwIkGyLPsgpYvkw+/IWTLjyQ+GJGze31P6fA34QQChwk3CPDAhI
OUAvfQKBgDo2p14F1ffENwrHxpApcmxkIgvwPwLK45ZSRcAdt8yIzvTms9W8ZOEj
Rxqt4b4ggHlldkb0DEXOf+DPlIyb02oh9CS6HkhAHugzMsJEvR1kIBKKrd/IjuPu
ipmoIdsFWsFtdWys+dYIU39LXU5vW2IEvZ/n6DjhQ5OOUqki3CnA
-----END RSA PRIVATE KEY-----
```

+ 如遇到 mcp 报错，更换阿里镜像源

```sql
pip install mcp -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com --default-timeout=1000
```

![1752829665693-eb7e5fd6-1d6e-40a0-a1d1-3480940c2a57.png](./img/bMA_xG3VGL8lkSwb/1752829665693-eb7e5fd6-1d6e-40a0-a1d1-3480940c2a57-166883.png)



```plain
 pip install fastmcp paramiko
```

```sql
{
  "mcpServers": {
    "linux_Toolkit_advance": {
      "command": "python",
      "args": [
        "D:\\alimiyao\\linux_mcp\\linux_Toolkit_advance.py"
      ]
    }
  }
}
```

+ 等价写法（正斜杠路径）：

```plain
{
  "mcpServers": {
    "linux_Toolkit_advance": {
      "command": "python",
      "args": [
        "D:/alimiyao/linux_mcp/
        linux_Toolkit_advance.py"
      ]
    }
  }
}
```

必要依赖

+ 安装依赖，避免服务启动时报错：

```sql
  pip install fastmcp paramiko
```

+ 你的脚本使用 from mcp.server.fastmcp import FastMCP 并在 **main** 中调用 mcp.run() ，与上述配置兼容。  
启动与验证
+ 由于这是 MCP 服务器，直接在终端运行会等待客户端握手，出现 JSON-RPC 错误属正常现象。
+ 正确验证方式是让你的 MCP 客户端加载这份配置并启动服务；若客户端支持日志查看，确认服务已成功拉起即可。

![1752830992985-9a8c0876-22f9-4dcb-9764-31a0498ca1a7.png](./img/bMA_xG3VGL8lkSwb/1752830992985-9a8c0876-22f9-4dcb-9764-31a0498ca1a7-944845.png)

+ 阿里云 ubuntu docker 镜像拉取不了报错
+ 解决方案
+ clash-for-linux-install
+ 仓库地址

```plain
https://github.com/nelvko/clash-for-linux-install.git
```

+ 安装后导入订阅开启代理以及全局，镜像问题解决



> 更新: 2025-10-31 08:46:08  
> 原文: <https://www.yuque.com/lixinsi/hw0k6o/hbxfqh77abyu1dkg>