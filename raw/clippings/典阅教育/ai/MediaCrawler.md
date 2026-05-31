# MediaCrawler

## <font style="color:rgb(31, 35, 40);">📋</font><font style="color:rgb(31, 35, 40);"> 前置依赖</font>

### <font style="color:rgb(31, 35, 40);">🚀</font><font style="color:rgb(31, 35, 40);"> uv 安装（推荐）</font>

<font style="color:rgb(31, 35, 40);">在进行下一步操作之前，请确保电脑上已经安装了 uv：</font>

* **<font style="color:rgb(31, 35, 40);">安装地址</font>**<font style="color:rgb(31, 35, 40);">：</font>[<font style="color:rgb(9, 105, 218);">uv 官方安装指南</font>](https://docs.astral.sh/uv/getting-started/installation)
* **<font style="color:rgb(31, 35, 40);">验证安装</font>**<font style="color:rgb(31, 35, 40);">：终端输入命令</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">uv --version</font></code><font style="color:rgb(31, 35, 40);">，如果正常显示版本号，证明已经安装成功</font>
* **<font style="color:rgb(31, 35, 40);">推荐理由</font>**<font style="color:rgb(31, 35, 40);">：uv 是目前最强的 Python 包管理工具，速度快、依赖解析准确</font>

### <font style="color:rgb(31, 35, 40);">🟢</font><font style="color:rgb(31, 35, 40);"> Node.js 安装</font>

<font style="color:rgb(31, 35, 40);">项目依赖 Node.js，请前往官网下载安装：</font>

* **<font style="color:rgb(31, 35, 40);">下载地址</font>**<font style="color:rgb(31, 35, 40);">：</font>[<font style="color:rgb(9, 105, 218);">https://nodejs.org/en/download/</font>](https://nodejs.org/en/download/)<font style="color:rgb(31, 35, 40);">\ </font>**<font style="color:rgb(31, 35, 40);">下载地址</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">：</font>[<font style="color:rgb(9, 105, 218);">https://nodejs.org/en/download/</font>](https://nodejs.org/en/download/)
* **<font style="color:rgb(31, 35, 40);">版本要求</font>**<font style="color:rgb(31, 35, 40);">：>= 16.0.0</font>

### <font style="color:rgb(31, 35, 40);">📦</font><font style="color:rgb(31, 35, 40);"> Python 包安装</font>

```plain
# 进入项目目录
cd MediaCrawler

# 使用 uv sync 命令来保证 python 版本和相关依赖包的一致性
uv sync
```

### <font style="color:rgb(31, 35, 40);">🌐</font><font style="color:rgb(31, 35, 40);"> 浏览器驱动安装</font>

```plain
# 安装浏览器驱动
uv run playwright install
```

**<font style="color:rgb(89, 99, 110);">💡</font>\*\*\*\*<font style="color:rgb(89, 99, 110);"> 提示</font>**<font style="color:rgb(89, 99, 110);">：MediaCrawler 目前已经支持使用 playwright 连接你本地的 Chrome 浏览器了，一些因为 Webdriver 导致的问题迎刃而解了。</font>

<font style="color:rgb(89, 99, 110);">目前开放了</font><font style="color:rgb(89, 99, 110);"> </font><code><font style="color:rgb(89, 99, 110);background-color:rgba(129, 139, 152, 0.12);">xhs</font></code><font style="color:rgb(89, 99, 110);"> </font><font style="color:rgb(89, 99, 110);">和</font><font style="color:rgb(89, 99, 110);"> </font><code><font style="color:rgb(89, 99, 110);background-color:rgba(129, 139, 152, 0.12);">dy</font></code><font style="color:rgb(89, 99, 110);"> </font><font style="color:rgb(89, 99, 110);">这两个使用 CDP 的方式连接本地浏览器，如有需要，查看</font><font style="color:rgb(89, 99, 110);"> </font><code><font style="color:rgb(89, 99, 110);background-color:rgba(129, 139, 152, 0.12);">config/base_config.py</font></code><font style="color:rgb(89, 99, 110);"> </font><font style="color:rgb(89, 99, 110);">中的配置项。</font>

## <font style="color:rgb(31, 35, 40);">🚀</font><font style="color:rgb(31, 35, 40);"> 运行爬虫程序</font>

```plain
# 项目默认是没有开启评论爬取模式，如需评论请在 config/base_config.py 中的 ENABLE_GET_COMMENTS 变量修改
# 一些其他支持项，也可以在 config/base_config.py 查看功能，写的有中文注释

# 从配置文件中读取关键词搜索相关的帖子并爬取帖子信息与评论
uv run main.py --platform xhs --lt qrcode --type search

# 从配置文件中读取指定的帖子ID列表获取指定帖子的信息与评论信息
uv run main.py --platform xhs --lt qrcode --type detail

# 打开对应APP扫二维码登录

# 其他平台爬虫使用示例，执行下面的命令查看
uv run main.py --help
```

<font style="color:rgb(31, 35, 40);">🔗</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">使用 Python 原生 venv 管理环境（不推荐）</font>**

#### <font style="color:rgb(31, 35, 40);">创建并激活 Python 虚拟环境</font>

<font style="color:rgb(89, 99, 110);">如果是爬取抖音和知乎，需要提前安装 nodejs 环境，版本大于等于：</font><code><font style="color:rgb(89, 99, 110);background-color:rgba(129, 139, 152, 0.12);">16</font></code><font style="color:rgb(89, 99, 110);"> </font><font style="color:rgb(89, 99, 110);">即可</font>

```plain
# 进入项目根目录
cd MediaCrawler

# 创建虚拟环境
# 我的 python 版本是：3.9.6，requirements.txt 中的库是基于这个版本的
# 如果是其他 python 版本，可能 requirements.txt 中的库不兼容，需自行解决
python -m venv venv

# macOS & Linux 激活虚拟环境
source venv/bin/activate

# Windows 激活虚拟环境
venv\Scripts\activate
```

#### <font style="color:rgb(31, 35, 40);">安装依赖库</font>

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">pip install -r requirements.txt</font>

#### <font style="color:rgb(31, 35, 40);">安装 playwright 浏览器驱动</font>

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">playwright install</font>

#### <font style="color:rgb(31, 35, 40);">运行爬虫程序（原生环境）</font>

```plain
# 项目默认是没有开启评论爬取模式，如需评论请在 config/base_config.py 中的 ENABLE_GET_COMMENTS 变量修改
# 一些其他支持项，也可以在 config/base_config.py 查看功能，写的有中文注释

# 从配置文件中读取关键词搜索相关的帖子并爬取帖子信息与评论
python main.py --platform xhs --lt qrcode --type search

# 从配置文件中读取指定的帖子ID列表获取指定帖子的信息与评论信息
python main.py --platform xhs --lt qrcode --type detail

# 打开对应APP扫二维码登录

# 其他平台爬虫使用示例，执行下面的命令查看
python main.py --help
```

## <font style="color:rgb(31, 35, 40);">💾</font><font style="color:rgb(31, 35, 40);"> 数据保存</font>

<font style="color:rgb(31, 35, 40);">支持多种数据存储方式：</font>

* **<font style="color:rgb(31, 35, 40);">MySQL 数据库</font>**<font style="color:rgb(31, 35, 40);">：支持关系型数据库 MySQL 中保存（需要提前创建数据库）</font>
  * <font style="color:rgb(31, 35, 40);">执行</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">python db.py</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">初始化数据库表结构（只在首次执行）</font>
* **<font style="color:rgb(31, 35, 40);">CSV 文件</font>**<font style="color:rgb(31, 35, 40);">：支持保存到 CSV 中（</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">data/</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">目录下）</font>
* **<font style="color:rgb(31, 35, 40);">JSON 文件</font>**<font style="color:rgb(31, 35, 40);">：支持保存到 JSON 中（</font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">data/</font></code><font style="color:rgb(31, 35, 40);"> 目录下）</font>


> 更新: 2025-07-12 14:48:34  
> 原文: <https://www.yuque.com/lixinsi/vnere7/kiyg8vne9mrsaxwm>