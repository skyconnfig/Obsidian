---
title: "yuque-dl/docs/GET_TOEKN.md at main"
source: "https://github.com/gxr404/yuque-dl/tree/main"
author:
published:
created: 2026-05-30
description: "yuque 语雀知识库下载. Contribute to gxr404/yuque-dl development by creating an account on GitHub."
tags:
  - "clippings"
---
## yuque-dl

语雀知识库下载为本地markdown

[![header](https://camo.githubusercontent.com/fdc7c6726a7c11d4a1e743a34cc07613a2f5eaa7eb75bcfe859c4a110cbe6da2/68747470733a2f2f736f6369616c6966792e6769742e63692f6778723430342f79757175652d646c2f696d6167653f6465736372697074696f6e3d31266465736372697074696f6e4564697461626c653d254538254146254144254539253942253830254537253946254135254538254146253836254535254241253933254534254238253842254538254244254244266973737565733d31266c6f676f3d68747470732533412532462532467261772e67697468756275736572636f6e74656e742e636f6d25324667787234303425324679757175652d646c2532466d61696e253246646f63732532466173736574732532466c6f676f2e706e67266e616d653d31267061747465726e3d43697263756974253230426f6172642670756c6c733d31267374617267617a6572733d31267468656d653d4c69676874)](https://camo.githubusercontent.com/fdc7c6726a7c11d4a1e743a34cc07613a2f5eaa7eb75bcfe859c4a110cbe6da2/68747470733a2f2f736f6369616c6966792e6769742e63692f6778723430342f79757175652d646c2f696d6167653f6465736372697074696f6e3d31266465736372697074696f6e4564697461626c653d254538254146254144254539253942253830254537253946254135254538254146253836254535254241253933254534254238253842254538254244254244266973737565733d31266c6f676f3d68747470732533412532462532467261772e67697468756275736572636f6e74656e742e636f6d25324667787234303425324679757175652d646c2532466d61696e253246646f63732532466173736574732532466c6f676f2e706e67266e616d653d31267061747465726e3d43697263756974253230426f6172642670756c6c733d31267374617267617a6572733d31267468656d653d4c69676874)

## Prerequisite

- Node.js 18.4 or later

## Install

```
npm i -g yuque-dl
```

## Usage

```
$ yuque-dl --help

  Usage:
    $ yuque-dl <url>

  Commands:
    <url>                语雀知识库url
    doc <...urls>        下载单个或多个文档
    server <serverPath>  启动web服务

  For more info, run any command with the \`--help\` flag:
    $ yuque-dl --help
    $ yuque-dl server --help

  Options:
    -d, --distDir <dir>                  下载的目录
                                          └─ eg: -d download (默认值: download)
    -i, --ignoreImg                      忽略图片不下载 (默认值: false)
    --ignoreAttachments [fileExtension]  忽略附件, 可选带上忽略的附件文件后缀(多种后缀逗号分割)
                                          └─ eg: --ignoreAttachments mp4,pdf // 忽略后缀名mp4,pdf的附件
                                          └─ eg: --ignoreAttachments // 忽略所有附件 (默认值: false)
    -k, --key <key>                      语雀的cookie key， 默认是 "_yuque_session"， 在某些企业版本中 key 不一样
    -t, --token <token>                  语雀的cookie key 对应的值 
    --toc                                是否输出文档toc目录 (默认值: false)
    --incremental                        开启增量下载[初次下载加不加该参数没区别] (默认值: false)
    --convertMarkdownVideoLinks          转化markdown视频链接为video标签 (默认值: false)
    --hideFooter                         是否禁用页脚显示[更新时间、原文地址...] (默认值: false)
    -h, --help                           显示帮助信息
    -v, --version                        显示当前版本
```

### Start

下载整个知识库

```
# url 为对应需要的知识库地址
yuque-dl "https://www.yuque.com/yuque/thyzgp"
```

下载知识库中指定文档

```
# 下载单个文档
yuque-dl doc "https://www.yuque.com/yuque/thyzgp/repository"

# 下载多个文档
yuque-dl doc "https://www.yuque.com/yuque/thyzgp/repository" "https://www.yuque.com/yuque/thyzgp/gbdfpb"
```

## Example

[![demo](https://private-user-images.githubusercontent.com/17134256/338872613-98fbbc81-91d4-47f8-9316-eb0ef060d6be.gif?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3ODAxMjg5OTUsIm5iZiI6MTc4MDEyODY5NSwicGF0aCI6Ii8xNzEzNDI1Ni8zMzg4NzI2MTMtOThmYmJjODEtOTFkNC00N2Y4LTkzMTYtZWIwZWYwNjBkNmJlLmdpZj9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MzAlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTMwVDA4MTEzNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWUyZjQxZTE1MzFmMDhlYWU5NzRhODNlZDgyN2MwZjQ2YzEyNmIyZTRmZmE3OGEyZTYzOTk5YzhlZjIxYjE5YTAmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRmdpZiJ9.AKD_15qNMuXlsMEo-BmHYUhO1j1owHR8r2yOw64zswU)](https://private-user-images.githubusercontent.com/17134256/338872613-98fbbc81-91d4-47f8-9316-eb0ef060d6be.gif?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3ODAxMjg5OTUsIm5iZiI6MTc4MDEyODY5NSwicGF0aCI6Ii8xNzEzNDI1Ni8zMzg4NzI2MTMtOThmYmJjODEtOTFkNC00N2Y4LTkzMTYtZWIwZWYwNjBkNmJlLmdpZj9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MzAlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTMwVDA4MTEzNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWUyZjQxZTE1MzFmMDhlYWU5NzRhODNlZDgyN2MwZjQ2YzEyNmIyZTRmZmE3OGEyZTYzOTk5YzhlZjIxYjE5YTAmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRmdpZiJ9.AKD_15qNMuXlsMEo-BmHYUhO1j1owHR8r2yOw64zswU)

## 其他场景

### 私有知识库

通过别人私有知识库 分享的链接，需使用 `-t` 添加token才能下载

```
yuque-dl "https://www.yuque.com/yuque/thyzgp" -t "abcd..."
```

[token的获取请看](https://github.com/gxr404/yuque-dl/blob/main/docs/GET_TOEKN.md)

### 企业私有服务

企业服务有自己的域名(黄色语雀logo)，非 `yuque.com` 结尾, 如 `https://yuque.antfin.com/r/zone`

这种情况 token的key不唯一, 不一定是为 `_yuque_session` 需用户使用 `-k` 指定 token的key,`-t` 指定 token的值。

至于 `key` 具体是什么只能靠用户自己在 `浏览器Devtools-> Application -> Cookies` 里找了🤔

### 公开密码访问的知识库

> [!warning] Warning
> 下载"公开密码访问的知识库" 前提是需要知道别人设置的密码，输入密码后拿cookie进行下载， **无法做到破解密码**, 请须知

[![public_pwd](https://private-user-images.githubusercontent.com/17134256/338881532-b546a9a3-68f0-4f76-b450-6b16f464db5d.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3ODAxMjg5OTUsIm5iZiI6MTc4MDEyODY5NSwicGF0aCI6Ii8xNzEzNDI1Ni8zMzg4ODE1MzItYjU0NmE5YTMtNjhmMC00Zjc2LWI0NTAtNmIxNmY0NjRkYjVkLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MzAlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTMwVDA4MTEzNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTBkNGFlOGRhZTFmNzJmNjU5YTBiYWNiN2JjODUxNDJhMDdlMDZmN2UxY2VkYTIwMmJmMTAyMjZiOTg5ZDAzMTUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.Edp3zv38jUUyB9Icjn9UARSl2VxHLnHpb9hjmJxll_w)](https://private-user-images.githubusercontent.com/17134256/338881532-b546a9a3-68f0-4f76-b450-6b16f464db5d.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3ODAxMjg5OTUsIm5iZiI6MTc4MDEyODY5NSwicGF0aCI6Ii8xNzEzNDI1Ni8zMzg4ODE1MzItYjU0NmE5YTMtNjhmMC00Zjc2LWI0NTAtNmIxNmY0NjRkYjVkLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MzAlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTMwVDA4MTEzNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTBkNGFlOGRhZTFmNzJmNjU5YTBiYWNiN2JjODUxNDJhMDdlMDZmN2UxY2VkYTIwMmJmMTAyMjZiOTg5ZDAzMTUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.Edp3zv38jUUyB9Icjn9UARSl2VxHLnHpb9hjmJxll_w)

⚠️

公开密码访问的知识库两种情况:

- 已经登录语雀，访问需要密码的知识库 输入密码后使用 `_yuque_session` 这个cookie
	```
	yuque-dl "url" -t "_yuque_session的值"
	```
- 未登录语雀，访问需要密码的知识库 输入密码后需要使用 `verified_books` / `verified_docs` 这个cookie
	```
	yuque-dl "url" -k "verified_books" -t "verified_books的值"
	```

## 内置启动web服务可快速预览

使用 [`vitepress`](https://vitepress.dev/) 快速启动一个web服务提供可预览下载的内容

```
yuque-dl server ./download/知识库/

➜  Local:   http://localhost:5173/
➜  Network: use --host to expose
```

[![server](https://private-user-images.githubusercontent.com/17134256/338881607-6d3a06cd-20b1-4eca-ae75-d9a90614336f.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3ODAxMjg5OTUsIm5iZiI6MTc4MDEyODY5NSwicGF0aCI6Ii8xNzEzNDI1Ni8zMzg4ODE2MDctNmQzYTA2Y2QtMjBiMS00ZWNhLWFlNzUtZDlhOTA2MTQzMzZmLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MzAlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTMwVDA4MTEzNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTIxMDVkNzk0YjQ5ZTJkNmFlMGEwOTFiZmVmMzNmMWViYmNlYjBkN2YwZjI0NjJiNjBkZDRhZWEwNWIzODFmODQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.poTtn8BusZ85rtYVMAqZJDfXsRFRhAfsSsVKNY_ps2o)](https://private-user-images.githubusercontent.com/17134256/338881607-6d3a06cd-20b1-4eca-ae75-d9a90614336f.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3ODAxMjg5OTUsIm5iZiI6MTc4MDEyODY5NSwicGF0aCI6Ii8xNzEzNDI1Ni8zMzg4ODE2MDctNmQzYTA2Y2QtMjBiMS00ZWNhLWFlNzUtZDlhOTA2MTQzMzZmLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MzAlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTMwVDA4MTEzNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTIxMDVkNzk0YjQ5ZTJkNmFlMGEwOTFiZmVmMzNmMWViYmNlYjBkN2YwZjI0NjJiNjBkZDRhZWEwNWIzODFmODQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.poTtn8BusZ85rtYVMAqZJDfXsRFRhAfsSsVKNY_ps2o)

## Feature

- 支持下载中断继续
- 支持图片下载本地
- 支持下载分享私有的知识库
- 支持转换表格类型的文档 (ps: 表格内插入图表暂不支持)
- 添加toc目录功能
- 添加测试
- 添加附件下载
- 支持下载单个或多个指定文档
- 支持其他文档类型？🤔
- 直接打包成可执行文件 🤔

## 常见错误

1. 由于token可能含有 特殊字符导致参数识别错误
```
yuque-dl "https://www.yuque.com/yuque/thyzgp" -t "-a123"
yuque-dl [ERROR]: Unknown option \`-1\`
```

解决方案

```
yuque-dl "https://www.yuque.com/yuque/thyzgp" -t="-a123"
```
2. 附件下载失败，需设置登录token

附件文件下载需要用户登录token，即使是完全公开的知识库，下载附件也可能需要

完全公开的知识库未登录的情况下查看附件:

[![attachments](https://private-user-images.githubusercontent.com/17134256/356571201-6e764abf-0da6-4fb8-ab96-7d027830b291.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3ODAxMjg5OTUsIm5iZiI6MTc4MDEyODY5NSwicGF0aCI6Ii8xNzEzNDI1Ni8zNTY1NzEyMDEtNmU3NjRhYmYtMGRhNi00ZmI4LWFiOTYtN2QwMjc4MzBiMjkxLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MzAlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTMwVDA4MTEzNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWI1ZWQxYjgwNzBkMTVjMWMyMzUwZWExMzEwNGNjMmVmNDBmYWFmZjc4NjU2MjQ1MGMyNjY2Y2NmN2FhMDYxYmUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.rSTLJYsGsXw5To2r5yMokKKF8wPqtjyEeMv8zbgHR8o)](https://private-user-images.githubusercontent.com/17134256/356571201-6e764abf-0da6-4fb8-ab96-7d027830b291.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3ODAxMjg5OTUsIm5iZiI6MTc4MDEyODY5NSwicGF0aCI6Ii8xNzEzNDI1Ni8zNTY1NzEyMDEtNmU3NjRhYmYtMGRhNi00ZmI4LWFiOTYtN2QwMjc4MzBiMjkxLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MzAlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTMwVDA4MTEzNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWI1ZWQxYjgwNzBkMTVjMWMyMzUwZWExMzEwNGNjMmVmNDBmYWFmZjc4NjU2MjQ1MGMyNjY2Y2NmN2FhMDYxYmUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.rSTLJYsGsXw5To2r5yMokKKF8wPqtjyEeMv8zbgHR8o)

## Tips

由于网络波动下载失败的，重新运行即可，已下载的进度不会受到影响