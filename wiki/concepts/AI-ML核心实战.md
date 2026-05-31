# AI/ML 核心实战知识库

> 来源：`raw/clippings/典阅教育/ai/` (87文件) + `大模型/` (45文件) + `人工智能相关/` (36文件) + `Ai-1000Day/` (27文件) + `cursor知识库/` (16文件) + `langchain/` (4文件)
> 这是逐篇实践后踩坑的实录，不是官方文档的搬运——任何说"按官方步骤就行"的地方，往往才是真正需要记录的部分。

---

## 1. LLM 本地部署与推理

### 1.1 硬件选型判断逻辑

- **GPU 模式（推荐）**：ChatGLM3-6B 需要至少 6GB 显存（4bit 量化），RTX 4080 16GB 足够流畅
- **CPU 模式**：需要至少 32GB 内存，效率极低，只适合验证，不适合生产
- **Apple M 系列**：统一内存架构，至少 13GB 即可
- **量化版本选择**：以 DeepSeek R1-Distill-Qwen-32B 为例，Q4_1 量化版可在 RTX 3090 24GB 上跑到 35 token/s

### 1.2 环境准备通用套路

所有 LLM 部署的第一步都是相通的：

1. **换国内软件源**（Ubuntu）→ 清华/中科大/阿里源，备份 `/etc/apt/sources.list` 再修改
2. **系统更新** → `sudo apt update && sudo apt upgrade`
3. **安装 NVIDIA 驱动 + CUDA** → `nvidia-smi` 确认驱动正常
4. **创建 Python 虚拟环境** → conda 或 venv，**推荐 Python 3.10-3.11**

### 1.3 ChatGLM3-6B 部署要点

- 官方部署文档看起来清晰，但实际依赖库版本冲突是最大坑点
- **GLM 的 tokenizer 和模型权重需分别下载**，huggingface 国内访问用 HF-Mirror 代理
- gradio 启动后若页面空白，一般是因为 WebSocket 被代理阻断

### 1.4 DeepSeek R1 GGUF 量化部署（Docker + vLLM）

**最具性价比的 24GB 单卡方案**：

```
# 模型权重下载（国内推荐 ModelScope）
pip install modelscope
modelscope download TreeDy2023/DeepSeek-R1-Distill-Qwen-32B-GGUF DeepSeek-R1-Distill-Qwen-32B-Q4_1.gguf

# Tokenizer 也需要单独下载（GGUF 格式 vLLM 需要）
huggingface-cli download deepseek-ai/DeepSeek-R1-Distill-Qwen-32B --local-dir ./tokenizer
```

**选择 GGUF 量化版本的决策依据**：
- Q4_K_M：平衡质量和显存，推荐
- Q4_1：体积更小，精度略降
- Q8_0：质量更高但显存需求大

**注意**：vLLM 对 GGUF 格式的支持在 25/04/03 才正式加入，较新，部分功能仍有坑。

### 1.5 Ollama 便捷部署

适合快速实验和轻量场景：
- `ollama pull qwen2.5:7b` 一行命令即可运行
- 但 Ollama 的服务化能力（并发、批处理）不如 vLLM

### 1.6 推理框架选择矩阵

| 场景 | 推荐 | 原因 |
|------|------|------|
| 单卡快速实验 | Ollama | 零配置 |
| 生产高并发 | vLLM | 连续批处理，PagedAttention |
| 知识库/应用集成 | Xinference | 内置兼容 OpenAI API |
| 客户端轻量推理 | LM Studio | 可视化界面 |

---

## 2. RAG 与知识图谱

### 2.1 GraphRAG（微软）部署踩坑记录

**环境要求**：
- Python 3.11（3.12 部分依赖不兼容）
- 需要通过 poetry 管理依赖（`pip install poetry` → `poetry install`）
- 至少需要多次调用 LLM + Embedding，对 API 费用敏感

**部署流程**：
```
git clone https://github.com/microsoft/graphrag.git
cd graphrag
conda create -n GraphRAG python=3.11
pip install poetry && poetry install
poetry run poe index --init --root .
```

**配置文件要点**：
- `.env` 填 API_KEY
- `settings.yaml` 配置 LLM 模型和 `api_base`
- **输入文件仅支持 txt 和 csv**，其他格式需预处理

**关键教训**：
- 将 `.parquet` 输出转为 `.csv` 再导入 Neo4j 实现可视化
- GraphRAG 对中文的支持主要依赖 LLM 本身的能力，如果用国产模型替换 GPT-4，中文效果可能更好
- 使用 GPT-4o-mini 可大幅降低构建成本（但质量略有下降）

### 2.2 LightRAG + Neo4j 知识图谱可视化

**版本匹配是最大的坑**：JDK ← Neo4j ← APOC 插件三者环环相扣

```
JDK 11 → Neo4j 4.4.0.x → APOC 4.4.0
```

- JDK 版本决定了 Neo4j 版本上限
- APOC 插件必须精确匹配 Neo4j 主版本号
- 错误提示会告诉你"需要 JDK x"，按它说的改就好
- Community 版解压即用，Desktop 版适合探索

### 2.3 国产方案：FastGPT / AnythingLLM / Dify 知识库

这三种方案都适合**非技术用户快速搭建企业内部知识库**：

- **FastGPT**：Windows 一键部署，适合不想碰 Docker 的场景
- **AnythingLLM**：支持多种 LLM 后端切换，灵活但配置稍复杂
- **Dify 知识库**：工作流 + RAG 一体化，推荐搭配 DeepSeek 本地大模型

**DeepSeek + Dify 本地部署**：Dify 的 embedding 模型可以对接本地部署的 DeepSeek，完全内网运行。

### 2.4 LangChain-Chatchat 部署（Ubuntu）

- v0.3.0 版本需要 Python 3.10+
- 依赖 `chromadb` 和 `sentence-transformers`，国内 pip 源可能下载慢
- 切换国内源：`pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple`

---

## 3. 模型微调

### 3.1 LLaMA Factory（最推荐）

**部署最简、功能最全的微调框架**：

- 支持 LLaMA、Qwen、DeepSeek 等主流模型
- 可视化界面操作，不需要手写训练脚本
- 支持 LoRA/QLoRA 微调，单卡 24GB 可微调 7B 模型
- 数据集支持 JSON/JSONL 格式

### 3.2 Unsloth（快速训练）

- 比 Huggingface 原生训练快 2x，显存节省 50%
- 适合 Llama 3 系列模型的本机微调
- 典型场景：个性化聊天机器人、垂直领域问答

### 3.3 axolotl（进阶用户）

**实际案例**：微调 LLaMA 3.1 实现法律大模型

完整的微调流程：
1. **文本分块**：将法律文档按语义分段
2. **数据集生成**：使用 LLM 生成问答对
3. **LoRA 微调**：配置 peft 参数
4. **评估**：人工 + 自动评估

**微调医疗模型案例**同样采用类似流程，只是数据集换成了医疗问答对。

### 3.4 模型微调决策树

```
目标是什么？
├── 快速验证想法 → Unsloth + 小数据集
├── 生产级垂直模型 → LLaMA Factory + QLoRA
├── 自定义训练逻辑 → axolotl
└── 只需要提示词工程 → 不需要微调
```

---

## 4. AIGC 应用

### 4.1 语音：GPT-SoVITS + 实时语音打断

**GPT-SoVITS**：
- 支持 1 分钟音频克隆声音
- WebUI 操作，需要 NVIDIA GPU
- 模型文件较大（~2GB），注意硬盘空间

**实时语音打断（LiveKit）**：
- 基于 WebRTC 的实时音频框架
- 支持说话人检测、多用户会议
- JWT 鉴权、UDP/TCP/TURN 网络穿透
- 适用场景：AI 语音助手、实时客服

### 4.2 数字人

**技术栈演进路线**：
```
Fay（规则驱动）→ DIFY+ADH（LLM 驱动）→ LiveTalking（实时交互）
```

**DIFY + 数字人框架 ADH**：
- 架构：Dify 提供 LLM/ASR/TTS 能力，ADH 做前端展示
- 部署：`docker-compose up -d`
- 配置：`configs/config_all_in_dify.yaml` 模板开箱即用
- 访问：`http://localhost:3000`

**LiveTalking**：开源实时交互数字人，支持音视频同步对话

**NanoBanana**：0.5B 参数的 2D 数字人，效果好，体积小，适合边缘部署

### 4.3 图像：Stable Diffusion + ComfyUI

- **Docker 部署 SD WebUI**：方便 GPU 资源管理，但需要处理容器内挂载共享目录（模型文件/LoRA）
- **ComfyUI**：工作流节点编辑器，适合复杂图像生成管线
- **ComfyUI + Sonic**：视频生成工作流

### 4.4 视频：VideoLingo 一站式视频翻译

- 自动视频翻译 + 本地化配音
- 支持多种语言互相转换
- 需要较大的临时存储空间

### 4.5 长文创作

AI 辅助长文（论文/课题/报告）创作的工作流：
1. 大纲生成（Coze/Dify 工作流）
2. 分章节撰写
3. 引用管理与格式校对
4. 查重与降重

---

## 5. AI 工具平台

### 5.1 Dify

- 支持对接本地部署的 LLM（DeepSeek、ChatGLM 等）
- 知识库 + 工作流 + Agent 一站式
- 可通过 astrBot 连接微信和钉钉

### 5.2 Coze（扣子）

**实际创作案例**：
- 6 片段故事绘本工作流
- AI 资讯快报自动生成
- 智能体创建指南（含 System Prompt 编写技巧）

### 5.3 JupyterHub 多用户平台

两种部署方式：
- **在线部署（GCP）**：适合生产环境，可扩展
- **Docker 部署**：快速验证，适合小团队

**自定义用户认证**：JupyterHub 支持对接 LDAP/OAuth，文档中有完整配置示例

### 5.4 OpenSpec（项目迭代）

项目功能迭代的 AI 辅助工具，64KB 的大文档，记录详细的开发规范和 Prompt 体系。

---

## 6. 提示词工程与智能体

### 6.1 提示词汇总（60KB 文档）

文档涵盖大量实战 prompt 模板，按场景分类：

| 场景 | 特点 |
|------|------|
| 产品经理 Prompt | 需求分析、功能拆解 |
| 金融 AI 助手 | 专业领域知识注入 |
| 角色扮演 | agent 角色设定 + system prompt |
| AI 销售指导 | 实时话术生成 |

### 6.2 MCP 体系

MCP（Model Context Protocol）是 AI 与外部工具交互的标准协议，文档中的实践：

- **PowerShell MCP**：用自然语言操作 Windows 系统
- **MCP-PyPI 模板**：快速创建 Python 包 MCP
- **MongoDB MCP**：AI 自动查询数据库（文档中有完整的百万行数据分析案例）
- **自动生成并发布 MCP**：通过模板自动化

### 6.3 AI 能力扩展套路

从文档中提炼的模式：
1. **数据访问层**：通过 MCP 给 AI 数据库/SQL 能力
2. **系统操作层**：PowerShell MCP 访问 OS 能力
3. **网络层**：爬虫/搜索能力（MediaCrawler 等）
4. **文件层**：本地文档读取（WORD/PDF）
5. **工具层**：生成代码、操作浏览器

---

## 7. AI 编程与开发环境

### 7.1 Cursor 实践

- rules 文件管理：cursorrules 是开发规范的抓手
- AI agent 模式：全栈开发的最佳实践
- 使用 Cursor 做代码反编译

### 7.2 Codex 实践

- CodeGraph 代码图谱：索引项目结构
- MCP 配置：对接各种工具
- 项目总结：从开发到部署的全流程 AI 辅助

### 7.3 MCP 配置实战

从文档中整理的实际 MCP 配置集合：

```
MCP Servers:
  ├── filesystem    → 文件读写
  ├── github        → 代码仓库
  ├── puppeteer     → 浏览器操作
  ├── sqlite        → 数据库查询
  ├── sequential-thinking → 思维链
  ├── brave-search  → 网络搜索
  └── custom MCPs:
      ├── MongoDB MCP      → AI 查询数据库
      ├── PowerShell MCP   → 系统管理
      └── data-analysis    → CSV/Excel 自动分析
```

### 7.4 数据自动化分析案例

文档中有一个完整的"AI 查询百万行数据"案例，核心思路：
1. 通过 MCP 让 AI 定位本地文件
2. 自动导入 SQLite 临时数据库
3. 让 AI 自主编写并执行 SQL 查询
4. 结果可视化输出

这个模式可推广到任何结构化的数据分析场景。

---

## 8. 经验沉淀

### 8.1 部署通用原则

从 215 篇文档中提炼的 AI 部署第一性原理：

1. **Python 版本锁定**：指定 Python 3.10/3.11，避免 3.12/3.13 的新语法不兼容
2. **国内源配置**：`pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple`
3. **虚拟环境隔离**：每个项目独立 conda env，避免依赖污染
4. **GPU 驱动先行**：先确认 `nvidia-smi` 和 CUDA 版本匹配
5. **Docker 化部署**：环境一致性的最佳方案
6. **模型下载代理**：HuggingFace 国内慢，使用 HF-Mirror 或 ModelScope
7. **踩坑留痕**：官方步骤 + 实际差异 = 真正的文档价值

### 8.2 学习路线建议

从文档内容看，学习路径的合理顺序：
1. **Ollama** → 快速体验 LLM 能力
2. **Dify 知识库** → 理解 RAG 工作流
3. **LLaMA Factory 微调** → 掌握模型定制
4. **vLLM 部署** → 生产级推理优化
5. **GraphRAG/LightRAG** → 知识图谱进阶
6. **数字人/AIGC** → 多模态应用
