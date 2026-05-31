# OpenAvatarChat模块化的交互数字人对话实现，能够在单台PC上运行完整功能。

 [https://github.com/HumanAIGC-Engineering/OpenAvatarChat.git](https://github.com/HumanAIGC-Engineering/OpenAvatarChat.git)

### 形象模型库
[https://modelscope.cn/models/HumanAIGC-Engineering/LiteAvatarGallery](https://modelscope.cn/models/HumanAIGC-Engineering/LiteAvatarGallery)

我们推荐使用命令行或者 ModelScope SDK 来进行模型的下载。[操作指引](https://modelscope.cn/docs/模型的下载)

在下载前，请先通过如下命令安装ModelScope

```plain
pip install modelscope
```

命令行下载

下载完整模型库

```plain
modelscope download --model HumanAIGC-Engineering/LiteAvatarGallery
```

下载单个文件到指定本地文件夹（以下载README.md到当前路径下“dir”目录为例）

```plain
modelscope download --model HumanAIGC-Engineering/LiteAvatarGallery README.md --local_dir ./dir
```

更多更丰富的命令行下载选项，可参见[具体文档](https://www.modelscope.cn/docs/models/download#使用命令行工具下载模型)

SDK下载

```plain
#模型下载
from modelscope import snapshot_download
model_dir = snapshot_download('HumanAIGC-Engineering/LiteAvatarGallery')
```

Git下载

请确保 lfs 已经被正确安装

```plain
git lfs install
```

```plain
git clone https://www.modelscope.cn/HumanAIGC-Engineering/LiteAvatarGallery.git
```

如果您希望跳过 lfs 大文件下载，可以使用如下命令

```plain
GIT_LFS_SKIP_SMUDGE=1 git clone https://www.modelscope.cn/HumanAIGC-Engineering/LiteAvatarGallery.git
```



> 更新: 2025-08-18 21:19:37  
> 原文: <https://www.yuque.com/lixinsi/vnere7/tn84hflxkv8zqfon>