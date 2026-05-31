# 实时Ai语音打断系统

### 1.项目地址

<https://github.com/livekit/livekit>

### 2.项目介绍

#### <font style="color:rgb(31, 35, 40);">iveKit: Real-time video, audio and data for developers

</font><font style="color:rgb(31, 35, 40);">LiveKit：面向开发人员的实时视频、音频和数据</font>

#### [<font style="color:rgb(9, 105, 218);">LiveKit</font>](https://livekit.io/)<font style="color:rgb(31, 35, 40);"> is an open source project that provides scalable, multi-user conferencing based on WebRTC. It's designed to provide everything you need to build real-time video audio data capabilities in your applications.

</font><font style="color:rgb(31, 35, 40);">LiveKit 是一个开源项目，提供基于 WebRTC 的可扩展、多用户会议。它旨在提供在应用程序中构建实时视频音频数据功能所需的一切。</font>

#### <font style="color:rgb(31, 35, 40);">LiveKit's server is written in Go, using the awesome </font>[<font style="color:rgb(9, 105, 218);">Pion WebRTC</font>](https://github.com/pion/webrtc)<font style="color:rgb(31, 35, 40);"> implementation.

</font><font style="color:rgb(31, 35, 40);">LiveKit 的服务器是用 Go 编写的，使用很棒的 Pion WebRTC 实现。</font>

* <font style="color:rgb(31, 35, 40);">Scalable, distributed WebRTC SFU (Selective Forwarding Unit)</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">可扩展的分布式 WebRTC SFU（选择性转发单元）</font></u>
* <font style="color:rgb(31, 35, 40);">Modern, full-featured client SDKs</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">功能齐全的新式客户端 SDK</font></u>
* <font style="color:rgb(31, 35, 40);">Built for production, supports JWT authentication</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">专为生产而构建，支持 JWT 身份验证</font></u>
* <font style="color:rgb(31, 35, 40);">Robust networking and connectivity, UDP/TCP/TURN</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">强大的网络和连接，UDP/TCP/TURN</font></u>
* <font style="color:rgb(31, 35, 40);">Easy to deploy: single binary, Docker or Kubernetes</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">易于部署：单个二进制文件、Docker 或 Kubernetes</font></u>
* <font style="color:rgb(31, 35, 40);">Advanced features including:</font>
  * [<font style="color:rgb(9, 105, 218);">speaker detection</font>](https://docs.livekit.io/home/client/tracks/subscribe/#speaker-detection)<font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">说话人检测</font></u>
  * [<font style="color:rgb(9, 105, 218);">simulcast</font>](https://docs.livekit.io/home/client/tracks/publish/#video-simulcast)<font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">联播</font></u>
  * [<font style="color:rgb(9, 105, 218);">end-to-end optimizations</font>](https://blog.livekit.io/livekit-one-dot-zero/)<font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">端到端优化</font></u>
  * [<font style="color:rgb(9, 105, 218);">selective subscription</font>](https://docs.livekit.io/home/client/tracks/subscribe/#selective-subscription)<font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">选择性订阅</font></u>
  * [<font style="color:rgb(9, 105, 218);">moderation APIs</font>](https://docs.livekit.io/home/server/managing-participants/)<font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">审核 API</font></u>
  * <font style="color:rgb(31, 35, 40);">end-to-end encryption</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">端到端加密</font></u>
  * <font style="color:rgb(31, 35, 40);">SVC codecs (VP9, AV1)</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">SVC 编解码器（VP9、AV1）</font></u>
  * [<font style="color:rgb(9, 105, 218);">webhooks</font>](https://docs.livekit.io/home/server/webhooks/)<font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">Webhook</font></u>
  * [<font style="color:rgb(9, 105, 218);">distributed and multi-region</font>](https://docs.livekit.io/home/self-hosting/distributed/)<font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">分布式和多区域</font></u>

## <font style="color:rgb(31, 35, 40);">Documentation & Guides</font><font style="color:rgb(31, 35, 40);">

</font><u><font style="color:rgb(31, 35, 40);">文档和指南</font></u>
[<font style="color:rgb(9, 105, 218);">https://docs.livekit.io</font>](https://docs.livekit.io/)

## <font style="color:rgb(31, 35, 40);">Live Demos</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">现场演示</font></u>

* [<font style="color:rgb(9, 105, 218);">LiveKit Meet</font>](https://meet.livekit.io/)<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">(</font>[<font style="color:rgb(9, 105, 218);">source</font>](https://github.com/livekit-examples/meet)<font style="color:rgb(31, 35, 40);">)</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">LiveKit Meet（来源）</font></u>
* [<font style="color:rgb(9, 105, 218);">Spatial Audio</font>](https://spatial-audio-demo.livekit.io/)<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">(</font>[<font style="color:rgb(9, 105, 218);">source</font>](https://github.com/livekit-examples/spatial-audio)<font style="color:rgb(31, 35, 40);">)</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">空间音频（源）</font></u>
* <font style="color:rgb(31, 35, 40);">Livestreaming from OBS Studio (</font>[<font style="color:rgb(9, 105, 218);">source</font>](https://github.com/livekit-examples/livestream)<font style="color:rgb(31, 35, 40);">)</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">OBS Studio 直播（来源）</font></u>
* [<font style="color:rgb(9, 105, 218);">AI voice assistant using ChatGPT</font>](https://livekit.io/kitt)<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">(</font>[<font style="color:rgb(9, 105, 218);">source</font>](https://github.com/livekit-examples/kitt)<font style="color:rgb(31, 35, 40);">)</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">使用 ChatGPT 的 AI 语音助手（来源）</font></u>

## <font style="color:rgb(31, 35, 40);">Ecosystem</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">生态系统</font></u>

* [<font style="color:rgb(9, 105, 218);">Agents</font>](https://github.com/livekit/agents)<font style="color:rgb(31, 35, 40);">: build real-time multimodal AI applications with programmable backend participants</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">代理：与可编程后端参与者一起构建实时多模态 AI 应用程序</font></u>
* [<font style="color:rgb(9, 105, 218);">Egress</font>](https://github.com/livekit/egress)<font style="color:rgb(31, 35, 40);">: record or multi-stream rooms and export individual tracks</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">出口：录制或多流房间并导出单个曲目</font></u>
* [<font style="color:rgb(9, 105, 218);">Ingress</font>](https://github.com/livekit/ingress)<font style="color:rgb(31, 35, 40);">: ingest streams from external sources like RTMP, WHIP, HLS, or OBS Studio</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">入口：从 RTMP、WHIP、HLS 或 OBS Studio 等外部源提取流</font></u>

## <font style="color:rgb(31, 35, 40);">SDKs & Tools</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">SDK 和工具</font></u>

### <font style="color:rgb(31, 35, 40);">Client SDKs</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">客户端 SDK</font></u>

<font style="color:rgb(31, 35, 40);">Client SDKs enable your frontend to include interactive, multi-user experiences.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">客户端 SDK 使您的前端能够包含交互式多用户体验。</font></u>

| **<font style="color:rgb(31, 35, 40);">Language</font>****<font style="color:rgb(31, 35, 40);"> </font>****<u><font style="color:rgb(31, 35, 40);">语言</font></u>** | **<font style="color:rgb(31, 35, 40);">Repo</font>** | [**<font style="color:rgb(9, 105, 218);">Declarative UI</font>**](https://docs.livekit.io/home/client/events/#declarative-ui)<br/>**<font style="color:rgb(31, 35, 40);"> </font>\*\*\*\*<u><font style="color:rgb(31, 35, 40);">声明式 UI</font></u>** | **<font style="color:rgb(31, 35, 40);">Links</font>****<font style="color:rgb(31, 35, 40);"> </font>****<u><font style="color:rgb(31, 35, 40);">链接</font></u>** |
| --- | --- | --- | --- |
| <font style="color:rgb(31, 35, 40);">JavaScript (TypeScript)</font> | [<font style="color:rgb(9, 105, 218);">client-sdk-js</font>](https://github.com/livekit/client-sdk-js)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">客户端-SDK-js</font></u> | [<font style="color:rgb(9, 105, 218);">React</font>](https://github.com/livekit/livekit-react)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">反应</font></u> | [<font style="color:rgb(9, 105, 218);">docs</font>](https://docs.livekit.io/client-sdk-js/)<br/><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">|</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">JS example</font>](https://github.com/livekit/client-sdk-js/tree/main/example)<br/><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">|</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">React example</font>](https://github.com/livekit/client-sdk-js/tree/main/example)<br/><font style="color:rgb(31, 35, 40);">   </font><u><font style="color:rgb(31, 35, 40);">文档 |JS 示例 |React 示例</font></u> |
| <font style="color:rgb(31, 35, 40);">Swift (iOS / MacOS)</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">斯威夫特 （iOS / MacOS）</font></u> | [<font style="color:rgb(9, 105, 218);">client-sdk-swift</font>](https://github.com/livekit/client-sdk-swift)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">客户端-sdk-swift</font></u> | <font style="color:rgb(31, 35, 40);">Swift UI</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">快速用户界面</font></u> | [<font style="color:rgb(9, 105, 218);">docs</font>](https://docs.livekit.io/client-sdk-swift/)<br/><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">|</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">example</font>](https://github.com/livekit/client-example-swift)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">文档 |例</font></u> |
| <font style="color:rgb(31, 35, 40);">Kotlin (Android)</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">Kotlin （Android）</font></u> | [<font style="color:rgb(9, 105, 218);">client-sdk-android</font>](https://github.com/livekit/client-sdk-android)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">客户端-SDK-Android</font></u> | <font style="color:rgb(31, 35, 40);">Compose</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">组成</font></u> | [<font style="color:rgb(9, 105, 218);">docs</font>](https://docs.livekit.io/client-sdk-android/index.html)<br/><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">|</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">example</font>](https://github.com/livekit/client-sdk-android/tree/main/sample-app/src/main/java/io/livekit/android/sample)<br/><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">|</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">Compose example</font>](https://github.com/livekit/client-sdk-android/tree/main/sample-app-compose/src/main/java/io/livekit/android/composesample)<br/><font style="color:rgb(31, 35, 40);">   </font><u><font style="color:rgb(31, 35, 40);">文档 |示例 |撰写示例</font></u> |
| <font style="color:rgb(31, 35, 40);">Flutter (all platforms)</font><font style="color:rgb(31, 35, 40);">   </font><u><font style="color:rgb(31, 35, 40);">Flutter（所有平台）</font></u> | [<font style="color:rgb(9, 105, 218);">client-sdk-flutter</font>](https://github.com/livekit/client-sdk-flutter)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">客户端-sdk-颤振</font></u> | <font style="color:rgb(31, 35, 40);">native</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">本地</font></u> | [<font style="color:rgb(9, 105, 218);">docs</font>](https://docs.livekit.io/client-sdk-flutter/)<br/><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">|</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">example</font>](https://github.com/livekit/client-sdk-flutter/tree/main/example)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">文档 |例</font></u> |
| <font style="color:rgb(31, 35, 40);">Unity WebGL</font> | [<font style="color:rgb(9, 105, 218);">client-sdk-unity-web</font>](https://github.com/livekit/client-sdk-unity-web)<br/><font style="color:rgb(31, 35, 40);">   </font><u><font style="color:rgb(31, 35, 40);">客户端-sdk-unity-web</font></u> | | [<font style="color:rgb(9, 105, 218);">docs</font>](https://livekit.github.io/client-sdk-unity-web/) |
| <font style="color:rgb(31, 35, 40);">React Native (beta)</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">React Native（测试版）</font></u> | [<font style="color:rgb(9, 105, 218);">client-sdk-react-native</font>](https://github.com/livekit/client-sdk-react-native)<br/><font style="color:rgb(31, 35, 40);">   </font><u><font style="color:rgb(31, 35, 40);">客户端-sdk-react-native</font></u> | <font style="color:rgb(31, 35, 40);">native</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">本地</font></u> | |
| <font style="color:rgb(31, 35, 40);">Rust</font> | [<font style="color:rgb(9, 105, 218);">client-sdk-rust</font>](https://github.com/livekit/client-sdk-rust)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">客户端-sdk-rust</font></u> | | |

### <font style="color:rgb(31, 35, 40);">Server SDKs</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">服务器 SDK</font></u>

<font style="color:rgb(31, 35, 40);">Server SDKs enable your backend to generate</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">access tokens</font>](https://docs.livekit.io/home/get-started/authentication/)<font style="color:rgb(31, 35, 40);">, call</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">server APIs</font>](https://docs.livekit.io/reference/server/server-apis/)<font style="color:rgb(31, 35, 40);">, and receive</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">webhooks</font>](https://docs.livekit.io/home/server/webhooks/)<font style="color:rgb(31, 35, 40);">. In addition, the Go SDK includes client capabilities, enabling you to build automations that behave like end-users.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">服务器 SDK 使您的后端能够生成访问令牌、调用服务器 API 和接收 Webhook。此外，Go SDK 还包括客户端功能，使您能够构建行为类似于最终用户的自动化。</font></u>

| **<font style="color:rgb(31, 35, 40);">Language</font>****<font style="color:rgb(31, 35, 40);"> </font>****<u><font style="color:rgb(31, 35, 40);">语言</font></u>** | **<font style="color:rgb(31, 35, 40);">Repo</font>** | **<font style="color:rgb(31, 35, 40);">Docs</font>** |
| --- | --- | --- |
| <font style="color:rgb(31, 35, 40);">Go</font> | [<font style="color:rgb(9, 105, 218);">server-sdk-go</font>](https://github.com/livekit/server-sdk-go)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">服务器-sdk-go</font></u> | [<font style="color:rgb(9, 105, 218);">docs</font>](https://pkg.go.dev/github.com/livekit/server-sdk-go) |
| <font style="color:rgb(31, 35, 40);">JavaScript (TypeScript)</font> | [<font style="color:rgb(9, 105, 218);">server-sdk-js</font>](https://github.com/livekit/server-sdk-js)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">服务器-sdk-js</font></u> | [<font style="color:rgb(9, 105, 218);">docs</font>](https://docs.livekit.io/server-sdk-js/) |
| <font style="color:rgb(31, 35, 40);">Ruby</font> | [<font style="color:rgb(9, 105, 218);">server-sdk-ruby</font>](https://github.com/livekit/server-sdk-ruby)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">服务器-sdk-ruby</font></u> | |
| <font style="color:rgb(31, 35, 40);">Java (Kotlin)</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">爪哇 （Kotlin）</font></u> | [<font style="color:rgb(9, 105, 218);">server-sdk-kotlin</font>](https://github.com/livekit/server-sdk-kotlin)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">服务器-sdk-kotlin</font></u> | |
| <font style="color:rgb(31, 35, 40);">Python (community)</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">Python（社区）</font></u> | [<font style="color:rgb(9, 105, 218);">python-sdks</font>](https://github.com/livekit/python-sdks)<br/><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">python-SDK</font></u> | |
| <font style="color:rgb(31, 35, 40);">PHP (community)</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">PHP（社区）</font></u> | [<font style="color:rgb(9, 105, 218);">agence104/livekit-server-sdk-php</font>](https://github.com/agence104/livekit-server-sdk-php) | |

### <font style="color:rgb(31, 35, 40);">Tools</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">工具</font></u>

* [<font style="color:rgb(9, 105, 218);">CLI</font>](https://github.com/livekit/livekit-cli)<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">- command line interface & load tester</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">CLI - 命令行界面和负载测试器</font></u>
* [<font style="color:rgb(9, 105, 218);">Docker image</font>](https://hub.docker.com/r/livekit/livekit-server)<font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">Docker 镜像</font></u>
* [<font style="color:rgb(9, 105, 218);">Helm charts</font>](https://github.com/livekit/livekit-helm)<font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">Helm 图表</font></u>

## <font style="color:rgb(31, 35, 40);">Install</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">安装</font></u>

**<font style="color:rgb(26, 127, 55);">Tip</font>**

<font style="color:rgb(31, 35, 40);">We recommend installing</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">LiveKit CLI</font>](https://github.com/livekit/livekit-cli)<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">along with the server. It lets you access server APIs, create tokens, and generate test traffic.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">建议将 LiveKit CLI 与服务器一起安装。它允许您访问服务器 API、创建令牌并生成测试流量。</font></u>

<font style="color:rgb(31, 35, 40);">The following will install LiveKit's media server:</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">下面将安装 LiveKit 的媒体服务器：</font></u>

### <font style="color:rgb(31, 35, 40);">MacOS</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">作系统</font></u>

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">brew install livekit</font>

### <font style="color:rgb(31, 35, 40);">Linux</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">Linux的</font></u>

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">curl -sSL https://get.livekit.io | bash</font>

### <font style="color:rgb(31, 35, 40);">Windows</font>

<font style="color:rgb(31, 35, 40);">Download the</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">latest release here</font>](https://github.com/livekit/livekit/releases/latest)<font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">在此处下载最新版本</font></u>

## <font style="color:rgb(31, 35, 40);">Getting Started</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">开始</font></u>

### <font style="color:rgb(31, 35, 40);">Starting LiveKit</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">启动 LiveKit</font></u>

<font style="color:rgb(31, 35, 40);">Start LiveKit in development mode by running</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">livekit-server --dev</font></code><font style="color:rgb(31, 35, 40);">. It'll use a placeholder API key/secret pair.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">通过运行</font></u><u><font style="color:rgb(31, 35, 40);"> </font></u><code><u><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">livekit-server --dev</font></u></code><u><font style="color:rgb(31, 35, 40);"> </font></u><u><font style="color:rgb(31, 35, 40);">在开发模式下启动 LiveKit。它将使用占位符 API 密钥/密钥对。</font></u>

```plain
API Key: devkey
API Secret: secret
```

<font style="color:rgb(31, 35, 40);">To customize your setup for production, refer to our</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">deployment docs</font>](https://docs.livekit.io/deploy/)<font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">要自定义生产设置，请参阅我们的部署文档</font></u>

### <font style="color:rgb(31, 35, 40);">Creating access token</font><font style="color:rgb(31, 35, 40);">

</font><u><font style="color:rgb(31, 35, 40);">创建访问令牌</font></u> <font style="color:rgb(31, 35, 40);">A user connecting to a LiveKit room requires an</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">access token</font>](https://docs.livekit.io/home/get-started/authentication/#creating-a-token)<font style="color:rgb(31, 35, 40);">. Access tokens (JWT) encode the user's identity and the room permissions they've been granted. You can generate a token with our CLI:</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">连接到 LiveKit 房间的用户需要访问令牌。访问令牌 （JWT） 对用户的身份和已授予的会议室权限进行编码。您可以使用我们的 CLI 生成令牌：</font></u>

```plain
lk token create \
    --api-key devkey --api-secret secret \
    --join --room my-first-room --identity user1 \
    --valid-for 24h
```

### <font style="color:rgb(31, 35, 40);">Test with example app</font><font style="color:rgb(31, 35, 40);">

</font><u><font style="color:rgb(31, 35, 40);">使用示例应用进行测试</font></u> <font style="color:rgb(31, 35, 40);">Head over to our</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">example app</font>](https://example.livekit.io/)<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">and enter a generated token to connect to your LiveKit server. This app is built with our</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">React SDK</font>](https://github.com/livekit/livekit-react)<font style="color:rgb(31, 35, 40);">.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">前往我们的示例应用程序并输入生成的令牌以连接到您的 LiveKit 服务器。这个应用程序是用我们的 React SDK 构建的。</font></u>

<font style="color:rgb(31, 35, 40);">Once connected, your video and audio are now being published to your new LiveKit instance!</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">连接后，您的视频和音频现在将发布到您的新 LiveKit 实例！</font></u>

### <font style="color:rgb(31, 35, 40);">Simulating a test publisher</font><font style="color:rgb(31, 35, 40);">

</font><u><font style="color:rgb(31, 35, 40);">模拟测试发布者</font></u>

```plain
lk room join \
    --url ws://localhost:7880 \
    --api-key devkey --api-secret secret \
    --identity bot-user1 \
    --publish-demo \
    my-first-room
```

<font style="color:rgb(31, 35, 40);">This command publishes a looped demo video to a room. Due to how the video clip was encoded (keyframes every 3s), there's a slight delay before the browser has sufficient data to begin rendering frames. This is an artifact of the simulation.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">此命令将循环演示视频发布到房间。由于视频剪辑的编码方式（每 3 秒一个关键帧），浏览器在获得足够的数据来开始渲染帧之前会有轻微的延迟。这是模拟的伪影。</font></u>

## <font style="color:rgb(31, 35, 40);">Deployment</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">部署</font></u>

### <font style="color:rgb(31, 35, 40);">Use LiveKit Cloud</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">使用 LiveKit Cloud</font></u>

<font style="color:rgb(31, 35, 40);">LiveKit Cloud is the fastest and most reliable way to run LiveKit. Every project gets free monthly bandwidth and transcoding credits.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">LiveKit Cloud 是运行 LiveKit 的最快、最可靠的方式。每个项目每月都会获得免费的带宽和转码积分。</font></u>

<font style="color:rgb(31, 35, 40);">Sign up for</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">LiveKit Cloud</font>](https://cloud.livekit.io/)<font style="color:rgb(31, 35, 40);">.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">注册 LiveKit Cloud。</font></u>

### <font style="color:rgb(31, 35, 40);">Self-host</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">自托管</font></u>

<font style="color:rgb(31, 35, 40);">Read our</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">deployment docs</font>](https://docs.livekit.io/deploy/)<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">for more information.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">阅读我们的部署文档以获取更多信息。</font></u>

## <font style="color:rgb(31, 35, 40);">Building from source</font><font style="color:rgb(31, 35, 40);">

</font><u><font style="color:rgb(31, 35, 40);">从源码构建</font></u> <font style="color:rgb(31, 35, 40);">Pre-requisites:</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">先决条件：</font></u>

* <font style="color:rgb(31, 35, 40);">Go 1.23+ is installed</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">安装了 Go 1.23+</font></u>
* <font style="color:rgb(31, 35, 40);">GOPATH/bin is in your PATH</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">GOPATH/bin 在您的 PATH 中</font></u>

<font style="color:rgb(31, 35, 40);">Then run</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">然后运行</font></u>

```plain
git clone https://github.com/livekit/livekit
cd livekit
./bootstrap.sh
mage
```

## <font style="color:rgb(31, 35, 40);">Contributing</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">贡献</font></u>

<font style="color:rgb(31, 35, 40);">We welcome your contributions toward improving LiveKit! Please join us</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">on Slack</font>](http://livekit.io/join-slack)<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">to discuss your ideas and/or PRs.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">我们欢迎您为改进 LiveKit 做出贡献！请加入我们的 Slack，讨论您的想法和/或 PR。</font></u>

## <font style="color:rgb(31, 35, 40);">License</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">许可证</font></u>

<font style="color:rgb(31, 35, 40);">LiveKit server is licensed under Apache License v2.0.\ </font><u><font style="color:rgb(31, 35, 40);">LiveKit 服务器根据 Apache 许可证 v2.0 获得许可。</font></u>


> 更新: 2025-09-17 08:39:27  
> 原文: <https://www.yuque.com/lixinsi/ynhoz5/ru7x9z6ha4wzh31h>