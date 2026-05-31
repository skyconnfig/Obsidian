# 谷歌云平台 (GCP) 安装 No-Code Architects Toolkit 手把手中文教程

![1752655078264-171c9218-4e21-44a5-8b6d-a79599add947.png](./img/n0LyxT_JCvSbSGpG/1752655078264-171c9218-4e21-44a5-8b6d-a79599add947-768182.png)

为了能让大家更好地部署和使用 **No-Code Architects Toolkit API**，花费了大约3个小时，为大家撰写了这篇详尽的中文手把手教程，希望能帮助各位小伙伴更简单地上手和应用这款强大的工具。

本教程将完整指导您如何在 Google Cloud Platform (GCP) 上成功安装和部署 No-Code Architects Toolkit。我们将从最开始的创建 GCP 账户入手，然后一步步带您完成后续的项目配置、应用部署等所有关键环节，并且会尽可能通俗易懂地解释其中涉及的基础概念，确保即使是初次接触云平台的朋友们也能轻松跟学并成功操作。

<https://github.com/stephengpope/no-code-architects-toolkit>

如果没有信用卡可以参考如下教程：

<https://xiangyugongzuoliu.com/bingo-card-google-cloud-vps-guide-for-beginners/>

**目录**[隐藏](https://xiangyugongzuoliu.com/google-cloud-nocode-architects-toolkit-guide-zh/#)

[1 为什么使用No-Code Architects Toolkit ？](https://xiangyugongzuoliu.com/google-cloud-nocode-architects-toolkit-guide-zh/#wei_shen_me_shi_yongNo-Code_Architects_Toolkit)

[2 视频教程参考](https://xiangyugongzuoliu.com/google-cloud-nocode-architects-toolkit-guide-zh/#shi_pin_jiao_cheng_can_kao)

[3 创建并配置 Google Cloud Platform (GCP) 账户](https://xiangyugongzuoliu.com/google-cloud-nocode-architects-toolkit-guide-zh/#chuang_jian_bing_pei_zhi_Google_Cloud_Platform_GCP_zhang_hu)

[4 准备工作](https://xiangyugongzuoliu.com/google-cloud-nocode-architects-toolkit-guide-zh/#zhun_bei_gong_zuo)

[5 创建一个谷歌云项目](https://xiangyugongzuoliu.com/google-cloud-nocode-architects-toolkit-guide-zh/#chuang_jian_yi_ge_gu_ge_yun_xiang_mu)

[6 启用所需的 API](https://xiangyugongzuoliu.com/google-cloud-nocode-architects-toolkit-guide-zh/#qi_yong_suo_xu_de_API)

[7 创建一个服务账户](https://xiangyugongzuoliu.com/google-cloud-nocode-architects-toolkit-guide-zh/#chuang_jian_yi_ge_fu_wu_zhang_hu)

[8 创建一个云存储桶](https://xiangyugongzuoliu.com/google-cloud-nocode-architects-toolkit-guide-zh/#chuang_jian_yi_ge_yun_cun_chu_tong)

[9 在 Google Cloud Run 上部署](https://xiangyugongzuoliu.com/google-cloud-nocode-architects-toolkit-guide-zh/#zai_Google_Cloud_Run_shang_bu_shu)

[10 测试部署](https://xiangyugongzuoliu.com/google-cloud-nocode-architects-toolkit-guide-zh/#ce_shi_bu_shu)

## 为什么使用No-Code Architects Toolkit ？

### No-Code Architects Toolkit 简介

**No-Code Architects Toolkit API** 是一款多功能、可自部署的 API 服务，专为简化和自动化媒体处理任务而设计。您可以将其视为一个部署在您自己云服务器上的媒体处理“瑞士军刀”，尤其适合希望低成本实现强大功能的创作者。

**核心功能：** 该工具包通过 API 提供了丰富的媒体处理能力，主要包括视频编辑与创作（如裁剪、拼接、从图片生成视频）、音频处理（如提取、转换、语音转文本）、图像处理以及执行自定义 Python 脚本，赋予您极大的灵活性。

**为何在 n8n/Make.com 中使用？** 在 [n8n](https://n8n.io/) 或 [Make.com](https://www.make.com/) 这样的无代码自动化平台中，此 Toolkit API 可以通过 HTTP 请求为自动化平台提供服务，可以轻松将其集成到自动化工作流中。

**“免费”如何实现？** 此工具包的“免费”主要指软件本身免费，并推荐用户在 Google Cloud Platform (GCP) 等云平台上自行部署。成本效益来源于：

**利用云平台免费额度：** GCP 为新用户提供数百美元的体验赠金。中低频使用下，您的 API 服务可能完全免费。

**与付费工具对比：** 市面上的专业媒体自动化SaaS工具，如 **Creatomate** 或 **JSON2Video**，通常提供强大的功能，但其月度订阅费用一般从数十美元到数百美元不等（例如，40-200+/月，具体视套餐而定）。通过自部署 No-Code Architects Toolkit API，你可以免费实现以上大部分功能。

总而言之，No-Code Architects Toolkit API 为您提供了一个高性价比的选择，通过自部署模式，在享受强大媒体处理能力的同时，有效控制成本。

### 作者介绍

**No-Code Architects Toolkit API** 由开发者 **Stephen G. Pope** (`stephengpope`) 创建并无私开源。他的工作为自动化爱好者和开发者提供了极大的便利。

**深入学习与交流：** 除了项目本身，Stephen G. Pope 还在其他平台分享更多关于无代码、自动化以及此工具包应用的知识：

* **YouTube 频道：** 您可以通过此链接访问相关的视频内容：<www.youtube.com/@StephenGPope>
* **Skool 社区：** 加入 No-Code Architects 社区，与其他用户交流心得、提问并获取支持：<https://www.skool.com/no-code-architects/about>

**支持开源：** 若此工具对您有帮助，请考虑前往其 GitHub 仓库点亮一颗星 (![1752655233028-d15b9bdb-77ac-42bc-8a9e-f071954239da.svg](./img/n0LyxT_JCvSbSGpG/1752655233028-d15b9bdb-77ac-42bc-8a9e-f071954239da-747763.svg) Star)。这不仅是对作者辛勤付出的认可，也能帮助更多人发现这个实用项目。订阅作者的频道和加入社区也是很好的支持方式，同时能让您获取最新资讯。您的每一个积极反馈都是对开源贡献者的莫大鼓励！

## 视频教程参考

如果您更喜欢观看视频，可以参考以下教程设置 No-Code Architects Toolkit API。

### 视频相关资源

* [Postman 模板](https://bit.ly/49Gkh61)
  * **基本概念解释：**
    * **Postman:** 一个流行的 API 开发和测试工具。模板通常包含了一系列预设的 API 请求，方便用户快速开始测试。
* [NCA Toolkit API GPT](https://bit.ly/4feDDk4) (一个基于 GPT 的工具，用于了解更多关于 NCA Toolkit API 的信息)
* [No-Code Architects ToolkitGithu 仓库](https://github.com/stephengpope/no-code-architects-toolkit)
* 视频中会使用下面的 **Docker 镜像**： stephengpope/no-code-architects-toolkit:latest**基本概念解释：**
  * **Docker 镜像:** 可以把它想象成一个轻量级的、包含应用程序运行所需所有东西（代码、运行时、库、环境变量、配置文件）的包裹。使用 Docker 镜像可以确保应用在任何地方都能以相同的方式运行。
  * `stephengpope/no-code-architects-toolkit:latest`: 这是一个 Docker 镜像的名称。`stephengpope` 通常是发布者的用户名或组织名，`no-code-architects-toolkit` 是镜像的名称，`latest` 表示这是该镜像的最新版本。

## **创建并配置 Google Cloud Platform (GCP) 账户**

在部署任何应用或使用 GCP 服务之前，您首先需要一个 GCP 账户。如果您计划将 Google 服务（如 Gmail）与外部应用（如 n8n、Make.com）集成，通常也需要一个 GCP 项目来管理 API 凭证（例如客户端 ID 和客户端密钥）。以下步骤专注于创建 GCP 账户本身。

1. **访问 GCP 控制台并开始免费试用:**
   * 打开浏览器，访问 [Google Cloud Platform 控制台](https://console.cloud.google.com/)。![1752655260364-68572ed8-98a6-4f0b-88d0-fda0d3c60af1.jpeg](./img/n0LyxT_JCvSbSGpG/1752655260364-68572ed8-98a6-4f0b-88d0-fda0d3c60af1-265603.jpeg)
   * 点击页面右上角的“免费开始使用”或类似按钮。您需要使用您的 Google 账户（例如 Gmail 账户）登录。
2. **国家/地区选择:**
   * 根据提示选择您的国家/地区。
   * 阅读并同意服务条款，然后点击“同意并继续”。![1752655260702-becee014-4cee-47c7-ac59-cc5c2eb09748.jpeg](./img/n0LyxT_JCvSbSGpG/1752655260702-becee014-4cee-47c7-ac59-cc5c2eb09748-262967.jpeg)
3. **验证身份 – 客户信息:**
   * 您会进入验证身份页面，首先需要填写付款资料。![1752655261349-a64ee3d2-5da5-4101-b8c0-f97e4a07e85c.jpeg](./img/n0LyxT_JCvSbSGpG/1752655261349-a64ee3d2-5da5-4101-b8c0-f97e4a07e85c-610656.jpeg)
   * **地址填写:** 点击“添加加号地址”。
     * 如果您在特定区域注册遇到困难，有些用户会尝试使用地址生成工具。
     * 具体网址：<https://www.meiguodizhi.com/>![1752655261391-b009d601-dab7-4a9c-b2e5-37e11862f1c1.jpeg](./img/n0LyxT_JCvSbSGpG/1752655261391-b009d601-dab7-4a9c-b2e5-37e11862f1c1-688774.jpeg)
     * 将生成的地址（或您的真实地址）对应填写到街道地址、城市、州/省、邮政编码等字段。 ![1752655261955-b73e9f5b-11b2-42f9-bbb6-20de214ad3b1.jpeg](./img/n0LyxT_JCvSbSGpG/1752655261955-b73e9f5b-11b2-42f9-bbb6-20de214ad3b1-192265.jpeg)
4. **验证身份 – 付款方式:**
   * 填写完地址后，点击“添加付款方式”。
   * ![1752655265498-aa0d2089-68c1-4d12-aa64-2831fa498181.jpeg](./img/n0LyxT_JCvSbSGpG/1752655265498-aa0d2089-68c1-4d12-aa64-2831fa498181-986246.jpeg)
   * 选择“添加信用卡或借记卡”。![1752655267776-f85dd33f-f5e2-4957-ae06-dae10c97c447.jpeg](./img/n0LyxT_JCvSbSGpG/1752655267776-f85dd33f-f5e2-4957-ae06-dae10c97c447-863123.jpeg)
   * **注意事项:**
     * 如果没有信用卡可以参考如下教程：\
       <https://xiangyugongzuoliu.com/bingo-card-google-cloud-vps-guide-for-beginners/>
     * 对于中国大陆用户，可以尝试使用支持美元扣款的双币信用卡（例如招商银行、中国银行等银行发行的 Visa 或 Mastercard 双币信用卡）。
     * GCP 会进行小额预授权（通常是 0 或 1）以验证卡的有效性，这笔款项后续会退还。![1752655272175-80e07608-5e6e-4ef4-a1e0-7fcdfff6fe70.jpeg](./img/n0LyxT_JCvSbSGpG/1752655272175-80e07608-5e6e-4ef4-a1e0-7fcdfff6fe70-709310.jpeg)
5. **注册成功与否的提示:**
   * 能否成功注册 GCP 免费试用，有时会受到网络环境、IP 地址纯净度等多种因素影响。
   * **建议尝试：**
     1. 确保您的网络环境稳定，并且与您选择的账户区域相符（例如，如果您选择美国，则使用美国网络环境）。
     2. 避免使用公开的、被滥用的免费 VPN 或代理服务器，因为这类 IP 地址可能已被标记。
     3. 尝试在浏览器的无痕模式 (Incognito/Private Window) 下进行注册，以避免浏览器插件或缓存的干扰。
   * 如果多次尝试仍不成功，建议搜索最新的网络教程的帮助。
6. **完成注册:**
   * 付款信息验证通过后，您可能需要回答一些关于您计划如何使用 GCP 的调查问卷。![1752655273708-a4cfde74-65f7-45c8-985d-fb740c2ed719.jpeg](./img/n0LyxT_JCvSbSGpG/1752655273708-a4cfde74-65f7-45c8-985d-fb740c2ed719-104182.jpeg)
   * 完成问卷后，点击“完成”或类似按钮，即可进入 Google Cloud 控制台。
   * 新用户通常会获得一定额度的免费赠金（例如 $300），可在一定期限内用于抵扣 GCP 服务费用。

现在您已经成功创建了 GCP 账户并进入了控制台。接下来，我们将为 NCA Toolkit 创建一个专门的项目。

## **准备工作**

在您按照后续步骤操作之前，请确保：

* 您已成功创建并登录到您的 **Google Cloud 账户** (如步骤 0 所述)。
* 您对 GCP 服务有一定的基础了解，例如什么是 Cloud Run 和 Cloud Storage。
  * **基本概念解释：**
    * **GCP (Google Cloud Platform):** 谷歌提供的云计算服务平台，包含计算、存储、数据库、机器学习等多种服务。
    * **Cloud Run:** GCP 上的一个服务，可以让您轻松部署和扩展容器化的应用程序（比如我们后面要用的 Docker 镜像）。您只需提供代码（或镜像），Cloud Run 会处理服务器的运维。
    * **Cloud Storage:** GCP 提供的对象存储服务，可以用来存储各种文件，比如图片、视频、备份数据等。
* 您有一个终端或代码编辑器，虽然本教程主要通过 GCP 控制台操作，但这些工具对后续管理有益。

## **创建一个谷歌云项目**

项目是 GCP 中组织和管理所有云资源的基本单位。您可以将相关的服务和资源都放在同一个项目中。

1. **导航到项目创建页面:**
   * 登录到 [GCP 控制台 (GCP Console)](https://console.cloud.google.com/)。
   * ![1752655276168-d92956e7-80b0-49a1-abbb-8b75bbf96b00.png](./img/n0LyxT_JCvSbSGpG/1752655276168-d92956e7-80b0-49a1-abbb-8b75bbf96b00-997953.png)
   * 点击控制台左上角的项目选择器。
   * 在弹出的对话框中，点击**新建项目**。
   * ![1752655280192-cd395961-9d55-43aa-9dfe-86bf111ec417.png](./img/n0LyxT_JCvSbSGpG/1752655280192-cd395961-9d55-43aa-9dfe-86bf111ec417-026641.png)
2. **填写项目信息:**
   * 输入一个**项目名称**，例如 `NCA Toolkit Project`。这个名称主要用于您自己识别。
   * ![1752655284702-b1073883-1f9c-437d-99e2-a421cd9eddaf.png](./img/n0LyxT_JCvSbSGpG/1752655284702-b1073883-1f9c-437d-99e2-a421cd9eddaf-489881.png)
   * GCP 会根据项目名称自动生成一个唯一的**项目 ID**。您可以编辑这个 ID，但它在所有 GCP 项目中必须是唯一的，并且创建后不能更改，默认不修改即可。
   * 选择一个**组织** (如果您有的话) 和**位置**。对于个人用户，可能没有“组织”选项，可以直接选择“无组织”。
3. **创建项目:**
   * 点击**创建**。
   * 等待项目创建完成，这可能需要几十秒到一分钟。创建完成后，GCP 控制台通常会自动切换到新创建的项目。如果没有自动切换，您可以再次点击顶部的项目选择器，然后选择您刚刚创建的项目。![1752655290071-c533ad50-4c52-4610-a389-cd77958d9e35.png](./img/n0LyxT_JCvSbSGpG/1752655290071-c533ad50-4c52-4610-a389-cd77958d9e35-209417.png)

## \*\*启用所需的 API \*\*

API (Application Programming Interface – 应用程序编程接口) 允许不同的软件服务之间进行通信和数据交换。为了让我们的应用能够使用 Cloud Storage 和 Cloud Run 服务，需要先启用它们的 API。

您需要启用以下 API：

* **Cloud Storage API**
* **Cloud Storage JSON API**
* **Cloud Run Admin API**

### **如何启用 API：**

1. 确保您当前在 GCP 控制台操作的是您在步骤 1 中创建的项目。
2. 在 GCP 控制台的左侧导航菜单中，找到并点击 **API 和服务**> \*\*库 \*\*(有时也可能直接是“启用 API 和服务”)。![1752655291089-31e006dd-28ef-417d-b53d-b4fa62cc39b9.png](./img/n0LyxT_JCvSbSGpG/1752655291089-31e006dd-28ef-417d-b53d-b4fa62cc39b9-589998.png)![1752655294077-8905a2a4-afe5-4080-a67c-f41598048203.png](./img/n0LyxT_JCvSbSGpG/1752655294077-8905a2a4-afe5-4080-a67c-f41598048203-253551.png)
3. 在 API 库的搜索框中分别搜索以上列出的每一个 API 名称。
4. 点击搜索到的 API（例如，先搜索 “Cloud Storage API”）。![1752655295627-2de036d9-3990-4d41-8477-c702a141ed28.png](./img/n0LyxT_JCvSbSGpG/1752655295627-2de036d9-3990-4d41-8477-c702a141ed28-681267.png)
5. 在 API 的详情页面，点击**启用**按钮。 ![1752655300684-eff16346-47d6-48b8-9cea-11d7a21dbae8.png](./img/n0LyxT_JCvSbSGpG/1752655300684-eff16346-47d6-48b8-9cea-11d7a21dbae8-074241.png)
6. 对 `Cloud Storage JSON API` 和 `Cloud Run Admin API` 重复此启用过程，务必这三个 API 都已启用。
7. ![1752655302050-25f3d7c9-fa14-47e9-ae8a-6bd25dd15101.png](./img/n0LyxT_JCvSbSGpG/1752655302050-25f3d7c9-fa14-47e9-ae8a-6bd25dd15101-583885.png)![1752655308145-b5840024-9402-4843-9fa4-986207600b63.png](./img/n0LyxT_JCvSbSGpG/1752655308145-b5840024-9402-4843-9fa4-986207600b63-004196.png)

## **创建一个服务账户**

服务账户是一种特殊的 Google 账户，它属于您的项目，而不是某个具体的用户。应用程序或虚拟机可以使用服务账户来调用 Google API，进行身份验证和授权。NCA Toolkit 将使用这个服务账户来访问 GCP 资源（例如 Cloud Storage）。

1. 在 GCP 控制台中，点击左上角三横线按钮导航到 **IAM 和管理** > **服务帐号**。 ![1752655312973-00655a50-b2f1-4ef8-82ef-4dbc73255261.png](./img/n0LyxT_JCvSbSGpG/1752655312973-00655a50-b2f1-4ef8-82ef-4dbc73255261-246308.png)
2. 点击页面顶部的 **+ 创建服务帐号**。![1752655329436-aa3bf605-16c5-4dd8-a9f9-9b830fa58e57.png](./img/n0LyxT_JCvSbSGpG/1752655329436-aa3bf605-16c5-4dd8-a9f9-9b830fa58e57-970445.png)
3. **填写服务账户详情:**
   * **服务帐号名称:** 输入一个名称，例如 `NCA Toolkit Service Account`。
   * **服务帐号 ID:** 系统会自动根据名称生成一个 ID，您可以保留默认值。
   * **服务帐号描述:** 可选，可以添加描述信息，例如“用于 NCA Toolkit 访问 GCP 资源”。![1752655335867-6e415125-9873-4dfd-a353-7f9bcfb1c672.png](./img/n0LyxT_JCvSbSGpG/1752655335867-6e415125-9873-4dfd-a353-7f9bcfb1c672-308391.png)
4. 点击**创建并继续**。
5. **授予此服务帐号对项目的访问权限:**
   * 点击“选择角色”下拉菜单。
   * 分配以下角色：
     * 搜索并选择 **Storage Admin (存储管理员)** (在“Cloud Storage”类别下)。此角色授予对 Cloud Storage 资源的完全控制权限。![1752655338662-86c2be35-8c90-477e-be1b-2898ea9db80b.png](./img/n0LyxT_JCvSbSGpG/1752655338662-86c2be35-8c90-477e-be1b-2898ea9db80b-355768.png)![1752655352803-ac74de74-0620-48b2-b5ff-fda362f3732d.png](./img/n0LyxT_JCvSbSGpG/1752655352803-ac74de74-0620-48b2-b5ff-fda362f3732d-999825.png)
     * 搜索并选择 **Viewer (查看者)** (在“基本”或“项目”类别下)。此角色授予对项目资源的只读访问权限。
     * ![1752655360992-d906b629-66ae-45aa-bd5e-8def4dd17953.png](./img/n0LyxT_JCvSbSGpG/1752655360992-d906b629-66ae-45aa-bd5e-8def4dd17953-933773.png)
   * **基本概念解释：**
     * **角色:** 一组权限的集合。将角色分配给服务账户，就授予了该账户这些权限。
6. 点击\*\*继续 \*\*。![1752655365929-382a722e-54e8-4c4c-a68a-9a944619b575.png](./img/n0LyxT_JCvSbSGpG/1752655365929-382a722e-54e8-4c4c-a68a-9a944619b575-212262.png)
7. **授予用户对此服务帐号的访问权限:** 点击**完成**来创建服务账户。![1752655367237-889972aa-6912-4ecc-b7c7-9ec3324f86b9.png](./img/n0LyxT_JCvSbSGpG/1752655367237-889972aa-6912-4ecc-b7c7-9ec3324f86b9-410727.png)
8. **创建并下载服务账户密钥:**
   * 创建完成后，您会回到服务账户列表。找到您刚刚创建的服务账户（例如 `NCA Toolkit Service Account`）。
   * 点击该服务账户名称右侧的三个点（操作菜单），选择**管理密钥**。![1752655367876-f250c715-a49b-4ab1-8076-2fab92e51125.png](./img/n0LyxT_JCvSbSGpG/1752655367876-f250c715-a49b-4ab1-8076-2fab92e51125-595592.png)
   * 在密钥页面，点击**添加密钥**> **创建新密钥**。![1752655370912-748d73ef-c9f8-4e15-833a-ccc29181d1b0.png](./img/n0LyxT_JCvSbSGpG/1752655370912-748d73ef-c9f8-4e15-833a-ccc29181d1b0-669532.png)
   * 选择密钥类型为 **JSON**。
   * 点击**创建**。一个 JSON 文件（密钥文件）会自动下载到您的计算机。![1752655419498-222238a7-7991-454a-9fbc-3af0cc1b5a53.png](./img/n0LyxT_JCvSbSGpG/1752655419498-222238a7-7991-454a-9fbc-3af0cc1b5a53-140601.png)
   * **重要提示:** 这个 JSON 文件包含了服务账户的私钥，非常敏感。请务必将其**安全地存储**在您本地的计算机上，不要将其上传到公共代码库或泄露给他人。后续部署 Cloud Run 服务时会用到这个文件的内容。

**如果出现如下错误，可以参考会员老酒给出解决方案，特此感谢老酒分享经验：**

![1752655430886-55aa99f6-0a49-4f79-b27d-d6667892e8bb.png](./img/n0LyxT_JCvSbSGpG/1752655430886-55aa99f6-0a49-4f79-b27d-d6667892e8bb-933333.png)

**第一步：在左上角选择组织，而不要选择项目。**

![1752655438813-1488e386-7ae0-4784-8cdf-cb2e200c4c0a.png](./img/n0LyxT_JCvSbSGpG/1752655438813-1488e386-7ae0-4784-8cdf-cb2e200c4c0a-175856.png)

**第二步：点选IAM，选择目前已登录的账号最后面的铅笔图标进行编辑。**

![1752655438502-85ee0356-7ab1-495d-9c09-5f2e07011a2b.png](./img/n0LyxT_JCvSbSGpG/1752655438502-85ee0356-7ab1-495d-9c09-5f2e07011a2b-643881.png)

**第三步：点选“添加其它角色”并输入“Organization Policy Administrator”后，点击确定。等待3-5分钟后即可为服务账号创建Json密钥。**

![1752655449148-243ce6ac-d71a-497b-8069-c2955933c65b.png](./img/n0LyxT_JCvSbSGpG/1752655449148-243ce6ac-d71a-497b-8069-c2955933c65b-277017.png)

## **创建一个云存储桶**

存储桶是 Cloud Storage 中存储数据的基本容器，类似于您电脑上的文件夹，但功能更强大。我们将用它来存储 NCA Toolkit 可能需要的文件。

1. 在 GCP 控制台中，导航到 **存储** > 存储浏览器。
2. ![1752655448979-1a562221-eb74-4463-bfea-b1dd72333233.png](./img/n0LyxT_JCvSbSGpG/1752655448979-1a562221-eb74-4463-bfea-b1dd72333233-527647.png)
3. 点击 **+ 创建** (或“创建存储桶”)。![1752655449924-a6f24cf3-a8a7-4a5e-902a-dfa045be1cc3.png](./img/n0LyxT_JCvSbSGpG/1752655449924-a6f24cf3-a8a7-4a5e-902a-dfa045be1cc3-192851.png)
4. **配置存储桶:**
   * **为您的存储桶命名:** 选择一个**全局唯一**的名称（例如 nca-toolkit-bucket-xiangyu（自己取一个自己的标识），因为存储桶名称在所有 GCP 用户中必须是唯一的）。可以使用小写字母、数字、短划线 (`-`)、下划线 (`_`) 和点 (`.`)。![1752655451541-dfe71d9c-b25a-40a8-91c3-508f7e885257.png](./img/n0LyxT_JCvSbSGpG/1752655451541-dfe71d9c-b25a-40a8-91c3-508f7e885257-005963.png)
   * **选择数据的存储位置:** 选择一个位置类型（例如 `Region` 区域级）和具体区域（例如 `us-central1`）。![1752655451852-c384cb6c-4405-483f-bb4e-dc61f04b0d11.png](./img/n0LyxT_JCvSbSGpG/1752655451852-c384cb6c-4405-483f-bb4e-dc61f04b0d11-873560.png)
   * **为数据选择默认存储类别:** 通常选择 `Standard` 标准存储类别即可。![1752655459754-8768e497-bc74-45f9-8c6c-375279fc7e0d.png](./img/n0LyxT_JCvSbSGpG/1752655459754-8768e497-bc74-45f9-8c6c-375279fc7e0d-196216.png)
   * **选择如何控制对对象的访问权限:** 选择**统一**访问控制。这意味着您在存储桶级别管理所有对象的权限，而不是为每个对象单独设置权限，这通常更易于管理。
   * **保护工具:** 可以保留默认设置（例如对象版本控制关闭，保留策略无）。 \[图片：GCP 创建存储桶配置表单]
5. 取消选中 **强制执行公开访问权限阻止**复选框下的“为此存储桶强制执行公开访问权限阻止”。
   * **解释:** 默认情况下，GCP 为了安全会阻止存储桶被公开访问。这里要求取消此选项，为了允许公开访问文件。
   * ![1752655460586-561ea2b3-4b17-485e-b0d0-729ffbee3a7e.png](./img/n0LyxT_JCvSbSGpG/1752655460586-561ea2b3-4b17-485e-b0d0-729ffbee3a7e-877981.png)
6. 点击**创建**完成存储桶的创建。![1752655462899-e230d9ca-fab5-4f2c-91b6-6c9f40a1b8d0.png](./img/n0LyxT_JCvSbSGpG/1752655462899-e230d9ca-fab5-4f2c-91b6-6c9f40a1b8d0-677448.png)
7. **配置公开访问权限:**
   * 存储桶创建后，进入该存储桶的详情页面，找到**权限**标签页。![1752655484543-93d4f78d-f580-48c8-8980-c69bf3d9ef62.png](./img/n0LyxT_JCvSbSGpG/1752655484543-93d4f78d-f580-48c8-8980-c69bf3d9ef62-664717.png)
   * 点击**授予访问权限**或类似的按钮。![1752655488516-efd0b07c-21b7-4048-b657-2c9426b1adbf.png](./img/n0LyxT_JCvSbSGpG/1752655488516-efd0b07c-21b7-4048-b657-2c9426b1adbf-762227.png)
   * 在“新的主账号”字段中，输入 `allUsers`。
     * **解释:**`allUsers` 是一个特殊标识符，代表互联网上的任何人，包括未经身份验证的用户。![1752655496031-b5abb33e-585f-4a8d-9272-d5220c3e2863.png](./img/n0LyxT_JCvSbSGpG/1752655496031-b5abb33e-585f-4a8d-9272-d5220c3e2863-119120.png)
   * 为 `allUsers` 分配角色：**存储对象查看者**。
     * **解释:** 这个角色允许任何人查看（读取）存储桶中的对象（文件），但不能修改或删除它们。![1752655496011-a173913c-0fea-48ea-a8bb-a54231acb728.png](./img/n0LyxT_JCvSbSGpG/1752655496011-a173913c-0fea-48ea-a8bb-a54231acb728-762608.png)
   * **注意:** 将 `allUsers` 设置为 `Storage Object Viewer` 意味着您存储桶中的所有对象都将公开可读。请确保您只在此存储桶中存放希望公开的数据。
8. 点击**保存**更改。![1752655499628-867203e7-24d5-4180-ade5-4d4a801aa65e.png](./img/n0LyxT_JCvSbSGpG/1752655499628-867203e7-24d5-4180-ade5-4d4a801aa65e-754349.png)![1752655528000-ee940614-14dc-4f7a-8e80-9a1dea831bcb.png](./img/n0LyxT_JCvSbSGpG/1752655528000-ee940614-14dc-4f7a-8e80-9a1dea831bcb-543926.png)

## **在 Google Cloud Run 上部署**

现在我们将把 NCA Toolkit API 的 Docker 镜像部署到 Cloud Run 服务上。

### 1. 导航到 Cloud Run

* 在 **Google Cloud Console** 中打开 **Cloud Run** 服务。您可以通过顶部搜索栏搜索 “Cloud Run” 来快速找到它，或者左侧导航栏跳转。
* ![1752655531423-0f27d250-850f-4449-81f5-79e0063972bc.png](./img/n0LyxT_JCvSbSGpG/1752655531423-0f27d250-850f-4449-81f5-79e0063972bc-414166.png)

### 2. 创建一个新服务

* 点击 **创建服务**。![1752655533485-d1cdbfa4-a352-426f-b8c9-917ffc7ceacf.png](./img/n0LyxT_JCvSbSGpG/1752655533485-d1cdbfa4-a352-426f-b8c9-917ffc7ceacf-650716.png)
* **部署源:** 选择**从现有容器映像部署一个修订版本**。
* **容器映像网址,输入或粘贴以下 Docker Hub 镜像地址：** **stephengpope/no-code-architects-toolkit:latest**![1752655533753-dce0d948-53d2-4f24-8ade-ac8669562266.png](./img/n0LyxT_JCvSbSGpG/1752655533753-dce0d948-53d2-4f24-8ade-ac8669562266-674006.png)

### 3. 配置身份验证和调用

* **调用:** 在“身份验证 ”部分，选择\*\*允许未经身份验证的调用 \*\*。![1752655535212-163b7205-4dc0-4900-9723-90d212d4df17.png](./img/n0LyxT_JCvSbSGpG/1752655535212-163b7205-4dc0-4900-9723-90d212d4df17-085057.png)![1752655537774-45f2973e-d98d-4ee5-9b5f-6dd946a9212d.png](./img/n0LyxT_JCvSbSGpG/1752655537774-45f2973e-d98d-4ee5-9b5f-6dd946a9212d-065527.png)
  * **解释:** 这意味着任何人都可以访问您部署的 API 端点，而无需进行 Google 账户登录验证。这对于公开的 API 是必要的。如果您的 API 需要保护，则应选择“需要身份验证”。

### 4. 配置容器、变量和密钥、连接、安全

展开此部分进行详细配置。

* **容器 :**
  * **容器端口:** 默认为 `8080`。如果 Docker 镜像中的应用监听的是其他端口，请修改为此端口。通常 `8080` 是很多 Web 应用的默认端口。![1752655540919-505939d9-fa82-4c0f-99dd-83e3edbb1d79.png](./img/n0LyxT_JCvSbSGpG/1752655540919-505939d9-fa82-4c0f-99dd-83e3edbb1d79-954163.png)
    * **内存:** 设置为 `16 GiB`。
    * **CPU:** 设置为 `4 vCPUs`。
  * **CPU 分配和价格 :** 选择 **CPU 始终分配**。
    * **解释:**
      * **内存和 CPU:** 这些是您的应用运行时可以使用的计算资源。`16 GiB` 内存和 `4 vCPUs` 是比较高的配置，确保应用有足够的资源处理请求。
  * **自动扩缩:**
  * ![1752655542860-250fd1f7-60bf-44f4-b5aa-d89f7d0ab04f.png](./img/n0LyxT_JCvSbSGpG/1752655542860-250fd1f7-60bf-44f4-b5aa-d89f7d0ab04f-684027.png)
    * **最小实例数:** 设置为 `0`。
      * **解释:** 当没有流量时，实例数可以缩减到 0，这有助于在空闲时最大限度地降低成本。但下次请求时会有冷启动。
    * **最大实例数:** 设置为 `1`。
      * **解释:** 这是 Cloud Run 可以自动扩展到的最大实例数量，以应对高流量。您可以根据预期的负载进行调整。
  * **请求超时:** 设置为 `300 秒`。
    * **解释:** 这是 Cloud Run 等待您的应用响应请求的最长时间。对于可能需要较长时间处理的请求，增加超时时间可以防止请求过早失败。
  * **启动 CPU 加速:** 勾选启用此选项。
    * **解释:** 这有助于在冷启动（即从 0 个实例扩展到至少 1 个实例时）后，为第一个请求提供更快的响应速度，因为它会临时提供更多 CPU 资源。
  * **执行环境:** 选择**第二代**。
    * **解释:** 第二代执行环境通常提供更好的性能和对高级功能的支持。
* **变量和密钥标签页:**
  * 点击**添加变量**来添加以下环境变量：![1752655544727-809d85b5-4576-456f-b2d4-df269a18c0f3.png](./img/n0LyxT_JCvSbSGpG/1752655544727-809d85b5-4576-456f-b2d4-df269a18c0f3-257505.png)
    * **名称:**`API_KEY`
      * **值:** 您的 API 密钥（例如，`Test123`）。这是您自定义的一个密钥，用于保护您的 API 不被随意调用。
    * **名称:**`GCP_BUCKET_NAME`
      * ![1752655545664-8a65eb17-53c6-4836-b395-939dda4c4171.png](./img/n0LyxT_JCvSbSGpG/1752655545664-8a65eb17-53c6-4836-b395-939dda4c4171-255405.png)
      * **值:** 您在上面创建的 Cloud Storage 存储桶的名称 (例如 `nca-toolkit-bucket-您的唯一标识`)。
    * **名称:**`GCP_SA_CREDENTIALS`
      * **值:** 您的服务账户的 JSON 密钥的**全部内容**。
        * **操作方法:** 打开您在上面步骤中下载的服务账户 JSON 密钥文件，将其中的所有文本复制，然后粘贴到这个“值”字段中。![1752655582475-d5d16ab2-cd2a-452c-ab6f-c769d01372e9.png](./img/n0LyxT_JCvSbSGpG/1752655582475-d5d16ab2-cd2a-452c-ab6f-c769d01372e9-090298.png)
        * **确保:**
          * 粘贴的内容是**完整的 JSON 格式**。
          * 内容前后**没有多余的空格或换行符**。

### 5. 部署服务

* 仔细检查所有设置，然后点击页面底部的**创建**或 **部署**。![1752655584086-e2ea8401-8ed8-4c44-ba40-b963c7cd5311.png](./img/n0LyxT_JCvSbSGpG/1752655584086-e2ea8401-8ed8-4c44-ba40-b963c7cd5311-062568.png)
* 部署过程可能需要几分钟。完成后，您应该会在 Cloud Run 服务列表或服务详情页面看到一个绿色的对勾标记，表示服务已成功部署。Cloud Run 会为您的服务提供一个 URL，这就是您的 API 端点。
* ![1752655585863-3b24dcc5-44c8-43b3-b5c0-72255de6167e.png](./img/n0LyxT_JCvSbSGpG/1752655585863-3b24dcc5-44c8-43b3-b5c0-72255de6167e-796368.png)

通过执行这些步骤，NCA Toolkit API 将成功部署并通过 Google Cloud Run 访问，并利用第二代执行环境以获得最佳性能。

![1752655586678-4ba638b1-81b7-4c4f-bd83-c4779eb40058.png](./img/n0LyxT_JCvSbSGpG/1752655586678-4ba638b1-81b7-4c4f-bd83-c4779eb40058-596978.png)

## **测试部署**

部署完成后，您需要测试 API 是否正常工作。

1. 部署完成后，您需要测试 API 是否正常工作。您可以直接在 n8n 中使用 HTTP 请求节点进行测试，这对于后续将 API 集成到自动化流程中非常方便。**测试前准备：**
   1. 确保您的 NCA Toolkit API 已成功部署到 Google Cloud Run，并且您拥有其服务 URL。
   2. 确保您拥有在步骤 5 中配置的 API 密钥 (`API_KEY`)。
2. **在 n8n 中配置 HTTP 请求节点进行测试的步骤：**
   1. **创建新工作流或打开现有工作流：**
      * 登录到您的 n8n 实例。
      * 点击“+ New workflow”创建一个新工作流，或者在现有工作流中添加节点。
   2. **添加 HTTP 请求节点：**
      * 在工作流画布中，点击 “+” 按钮添加一个新节点。
      * 搜索 “HTTP Request” 并选择它。
   3. **配置 HTTP 请求节点：**
      * **请求方法:**
        * 选择适合您要测试的 API 端点的方法。对于简单的连通性测试或获取数据的端点，通常选择 **GET**。如果您要测试一个需要提交数据的功能（例如创建资源），则可能需要选择 **POST**。
        * *建议：* 如果您不确定，可以先尝试用 GET 方法访问 API 的根 URL (即 Cloud Run 服务 URL 本身) 或 API 文档中提供的简单GET端点（例如健康检查端点 `/health`，如果存在的话）。
      * **URL (网址):**
        * 输入您要请求的完整 API 端点 URL。它通常由两部分组成：
          1. **基础 URL:** 这是您在步骤 5 中部署 Cloud Run 服务后获得的 URL (例如 `https://your-nca-toolkit-api-xxxxxx-uc.a.run.app`)。
          2. **API 路径:** 这是您要访问的具体 API 功能路径 (例如 `/users`, `/generate-video` 等)。您需要查阅 NCA Toolkit API 的文档或示例来获取可用的路径。
        * 示例 URL 格式： \[您的 Cloud Run 服务 URL]/\[API 功能路径]
          * 例如：`https://your-nca-toolkit-api-xxxxxx-uc.a.run.app/v1/status`
      * **身份验证:**
        * 从下拉菜单中选择 **“None” (无)**，因为我们将通过请求头传递 API 密钥。
      * **发送请求头:**
        * 点击 **“Headers”** 旁边的 **“Add Header” (添加请求头)** 按钮。
        * **名称:** 输入 `x-api-key`
        * **值:** 输入您在步骤 5 中为 `API_KEY` 环境变量配置的 API 密钥值 (例如 `Test123`)。
      * **发送请求体(主要用于 POST, PUT, PATCH 等方法):**
        * 如果您的请求方法是 POST 或其他需要发送数据的方法：
          * **请求体内容类型:** 通常选择 **“JSON”**。
          * **JSON 请求体:** 在下方的文本框中输入您的 JSON 请求数据。这些数据需要根据 NCA Toolkit API 相应端点的要求来构造。请参考 API 文档或 Postman 模板中的示例请求。
      * **选项 – 可选配置：**
        * 您可以根据需要配置其他选项，例如 “Timeout” (超时时间)。
   4. **执行节点并检查结果：**
      * 点击节点右上角的 **“Execute Node” (执行节点)** 或 **“Test step” (测试步骤)** 按钮。
      * 等待节点执行完成。n8n 会在下方显示节点的输出数据。
      * 检查响应：
        * **状态码:** 查看输出结果中的 `statusCode` 字段。通常 `200` (OK) 或 `201` (Created) 表示请求成功。其他 `2xx` 范围的状态码也可能表示成功，具体取决于 API 设计。`4xx` 或 `5xx` 范围的状态码则表示错误。
        * **响应体:** 查看输出结果中的 `body` (或 `data`，取决于n8n版本和节点设置) 字段。这里会显示 API 返回的数据。验证这些数据是否符合您的预期。
        * **响应头:** 您也可以检查 `headers` 字段，了解 API 返回的响应头信息。

![1752655590196-4dfeff2f-3ac8-4241-b216-5ca623082089.png](./img/n0LyxT_JCvSbSGpG/1752655590196-4dfeff2f-3ac8-4241-b216-5ca623082089-417277.png)

按照这些步骤操作，您的 NCA Toolkit API 应该已成功部署在 Google Cloud Platform 上并可以正常使用了。如果在任何步骤遇到问题，请仔细检查配置或查阅 GCP 的官方文档。


> 更新: 2025-07-16 17:11:10  
> 原文: <https://www.yuque.com/lixinsi/vnere7/xe8ok000ze2n8yqw>