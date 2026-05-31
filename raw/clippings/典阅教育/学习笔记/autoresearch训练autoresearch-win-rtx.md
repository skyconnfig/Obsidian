# autoresearch训练autoresearch-win-rtx

### github 地址：<https://github.com/karpathy/autoresearch>

### GitHub 地址：<https://github.com/jsegov/autoresearch-win-rtx>

# autoresearch

> 将您的游戏电脑转变为自主AI研究者。

> 此仓库是 [karpathy/autoresearch](https://github.com/karpathy/autoresearch) 的一个分支。此分支的目标是为Windows上的消费级NVIDIA GPU提供原生支持，并按架构分层设置VRAM下限。

![](progress.png)

有一天，前沿AI研究曾由在吃饭、睡觉、娱乐以及偶尔使用声波互连进行“小组会议”同步的肉体计算机完成。那个时代早已过去。研究现在完全是自主AI代理群在天空中的计算集群巨型结构上运行的领域。这些代理声称我们现在处于代码库的第10,205代，无论如何没有人能说这是否正确，因为“代码”现在是一个超越人类理解的自修改二进制文件。这个仓库就是它如何开始的故事。 -@karpathy, 2026年3月。

想法：给一个AI代理一个小而真实的LLM训练设置，让它在夜间自主实验。它会修改代码，训练5分钟，检查结果是否改善，保留或丢弃，然后重复。您早上醒来时会看到实验日志，（希望）有一个更好的模型。这里的训练代码是[nanochat](https://github.com/karpathy/nanochat)的简化单GPU实现。核心思想是您不会像通常那样作为研究者去修改任何Python文件。相反，您是在编程提供给AI代理上下文并设置您的自主研究组织的`program.md` Markdown文件。此仓库中的默认`program.md`被故意保持为一个基本的基线，尽管显然可以随着时间的推移对其进行迭代，以找到能够实现最快研究进展的“研究组织代码”，您也可以了解如何向其中添加更多代理等。有关此项目的更多背景信息可以在这条[tweet](https://x.com/karpathy/status/2029701092347630069)中找到。

## 分支范围

* 上游来源：[karpathy/autoresearch](https://github.com/karpathy/autoresearch)
* 主要目标：在Windows上原生运行，使用台式消费级NVIDIA GPU（Turing架构显存>=8GB，Ampere/Ada/Blackwell架构显存>=10GB），不使用非官方的Triton-on-Windows堆栈。
* 更改范围：为实现该目标平台所需的兼容性和稳定性更新。
* 原始的面向Linux/H100的路径在此分支中被移除，并且不受支持。
* 如果您需要上游的Linux/H100路径，请使用 [karpathy/autoresearch](https://github.com/karpathy/autoresearch)。

## 工作原理

该仓库被刻意保持得很小，只有三个文件真的很重要：

* `prepare.py` — 固定常量、一次性数据准备（下载TinyStories数据，训练BPE分词器），以及运行时实用程序（数据加载器，评估）。
* `train.py` — 代理编辑的单个文件。包含完整的GPT模型，优化器（Muon + AdamW），和训练循环。一切皆可修改：架构，超参数，优化器，批量大小等。**此文件由代理编辑和迭代**。
* `program.md` — 一个代理的基线指令。将您的代理指向此文件并让它运行。**此文件由人类编辑和迭代**。

设计上，训练运行在一个**固定的5分钟时间预算**（墙钟时间，不包括启动/编译），无论您的计算细节如何。度量标准是**val\_bpb**（验证每字节比特数）——越低越好，并且与词汇表大小无关，因此架构更改可以公平比较。

## 快速开始（PowerShell）

**要求：** 一块NVIDIA GPU，Python 3.10+，[uv](https://docs.astral.sh/uv/)。

* 单运行时路径使用PyTorch SDPA注意力和急切执行（无FA3/`torch.compile`快速路径）。
* 原生Windows支持针对具有分层VRAM策略的台式消费级GPU（Turing >=8 GB，Ampere/Ada/Blackwell >=10 GB），官方PyTorch CUDA轮子，和SDPA注意力。
* 默认数据集现在是TinyStories GPT-4清净版，以适用于消费级GPU设置。

```powershell

# 1. 安装uv项目管理器（如果您还没有安装）
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

# 2. 安装依赖项
uv sync

# 3. 下载数据并训练分词器（一次性）
#    默认数据集：TinyStories GPT-4清净版
uv run prepare.py

# 4. 手动运行单个训练实验（~5分钟）
uv run train.py
```

快速验证运行（设置后推荐）：

```powershell
uv run train.py --smoke-test
```

如果上述命令都能正常工作，那么您的设置是可用的，您可以进入自主研究模式。

## 运行代理

只需在此仓库中启动您的Claude/Codex或您想要的任何工具（并禁用所有权限），然后您可以提示类似：

```plain
嗨，看看program.md，让我们开始一个新的实验！先做好准备。
```

`program.md` 文件本质上是一个超轻量级的“技能”。

## 项目结构

```plain
prepare.py      — 常量，数据准备 + 运行时实用程序（请勿修改）
train.py        — 模型，优化器，训练循环（代理修改此文件）
program.md      — 代理指令
pyproject.toml  — 依赖项
```

## 设计选择

* **单个文件修改。** 代理只修改`train.py`。这使得范围易于管理，并且差异易于审查。
* **固定时间预算。** 训练总是恰好运行5分钟，无论您的具体平台如何。这意味着您可以期望大约每小时12次实验，而在您睡觉时大约有100次实验。此设计决策有两个好处。首先，这使得实验无论代理更改什么（模型大小，批量大小，架构等）都可以直接比较。其次，这意味着autoresearch将在该时间预算内为您的平台找到最优模型。缺点是您的运行（和结果）无法与在其他计算平台上运行的其他人的结果进行比较。
* **自包含。** 除了PyTorch和少量小程序包之外，没有外部依赖。没有分布式训练，没有复杂的配置。一个GPU，一个文件，一个度量标准。

## 平台支持

此分支的平台政策是明确的和分层的。

| 架构 | 最低VRAM底线 | 支持的台式消费级GPU |
| --- | --- | --- |
| Turing | `>=8 GB` | `RTX 2060 12GB`, `RTX 2060 SUPER 8GB`, `RTX 2070 8GB`, `RTX 2070 SUPER 8GB`, `RTX 2080 8GB`, `RTX 2080 SUPER 8GB`, `RTX 2080 Ti 11GB` |
| Ampere | `>=10 GB` | `RTX 3060 12GB`, `RTX 3080 10GB`, `RTX 3080 12GB`, `RTX 3080 Ti 12GB`, `RTX 3090 24GB`, `RTX 3090 Ti 24GB` |
| Ada | `>=10 GB` | `RTX 4060 Ti 16GB`, `RTX 4070 12GB`, `RTX 4070 SUPER 12GB`, `RTX 4070 Ti 12GB`, `RTX 4070 Ti SUPER 16GB`, `RTX 4080 16GB`, `RTX 4080 SUPER 16GB`, `RTX 4090 24GB` |
| Blackwell | `>=10 GB` | `RTX 5060 Ti 16GB`, `RTX 5070 12GB`, `RTX 5070 Ti 16GB`, `RTX 5080 16GB`, `RTX 5090 32GB` |

* 仅限台式机：由于功耗和热量的广泛差异，笔记本GPU不在官方支持范围内。
* 底线政策：Turing台式GPU在>=8GB VRAM时受支持；Ampere/Ada/Blackwell台式GPU需要>=10GB VRAM。
* `RTX 2060 6GB`由于显存底线而不在支持矩阵中。
* 运行路径在所有平台上故意统一：PyTorch SDPA注意力 + 渴望优化器步骤。
* 运行时适应是由配置文件驱动的：计算能力，BF16/TF32支持，操作系统，和VRAM层级决定候选批量大小和检查点策略。
* 支持的消费者配置文件运行一个短暂的急切模式自动调谐通过，并根据GPU/运行时指纹缓存所选候选者。
* 自动调谐环境控制：`AUTORESEARCH_DISABLE_AUTOTUNE=1`跳过探测；`AUTORESEARCH_AUTOTUNE_REFRESH=1`刷新缓存的决策。
* 此仓库中测试的硬件仍然是Windows上的RTX 3080 10 GB。其他列出的SKU是矩阵支持的，但可能在此处经过较少的现场测试。
* 此分支的非目标包括FA3/H100专用路径，非官方的Triton-for-Windows堆栈，AMD/ROCm，Apple Metal，以及多GPU训练。
* 默认数据集是`karpathy/tinystories_gpt4_clean`，以实现消费级GPU的实际应用。

##


> 更新: 2026-03-15 12:46:31  
> 原文: <https://www.yuque.com/lixinsi/yh04az/wlvtkfa9byzq1r0g>