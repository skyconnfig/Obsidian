# MCP-PyPI模板

```plain
#!/usr/bin/env python3
"""
🚀 MCP工具开发模板
快速创建MCP工具的精简模板

使用步骤：
1. 填写下方配置信息
2. 替换工具函数为你的功能
3. 运行测试：python MCP_PyPI_template.py
4. 发布到PyPI：参考文件末尾的发布指南
"""

import json
import logging
from datetime import datetime
from mcp.server.fastmcp import FastMCP

# ================================
# 🔧 配置区域 - 请填写以下信息
# ================================

# 基本信息（用于生成setup.py）
PACKAGE_NAME = "my-mcp-tool"  # PyPI包名（小写，用连字符）
TOOL_NAME = "我的MCP工具"  # 工具显示名称
VERSION = "0.1.0"  # 版本号
AUTHOR = "你的名字"  # 作者名
AUTHOR_EMAIL = "your.email@example.com"  # 作者邮箱
DESCRIPTION = "一个强大的MCP工具"  # 简短描述
URL = "https://github.com/yourusername/your-repo"  # 项目主页
LICENSE = "MIT"  # 许可证

# 依赖包列表
REQUIREMENTS = [
    "mcp>=1.0.0",
    "fastmcp>=0.1.0",
    # 在这里添加你的其他依赖
]

# ================================
# 🛠️ MCP工具核心代码
# ================================

# 设置日志
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# 创建MCP服务器
mcp = FastMCP(TOOL_NAME)

# ================================
# 🔧 在这里添加你的工具函数
# ================================

@mcp.tool()
def hello_world(name: str = "World") -> str:
    """
    一个简单的问候工具
    
    Args:
        name: 要问候的名字
    
    Returns:
        问候消息
    """
    return f"Hello, {name}! 这是来自 {TOOL_NAME} 的问候。"

@mcp.tool()
def get_current_time() -> str:
    """
    获取当前时间
    
    Returns:
        当前时间字符串
    """
    return datetime.now().strftime("%Y-%m-%d %H:%M:%S")

@mcp.tool()
def calculate_sum(a: float, b: float) -> float:
    """
    计算两个数的和
    
    Args:
        a: 第一个数
        b: 第二个数
    
    Returns:
        两数之和
    """
    return a + b

# ================================
# 🚀 主函数
# ================================

def main():
    """启动MCP服务器"""
    logger.info(f"启动 {TOOL_NAME}...")
    logger.info(f"版本: {VERSION}")
    logger.info(f"作者: {AUTHOR}")
    mcp.run()

if __name__ == "__main__":
    main()

# ================================
# 📦 PyPI发布指南
# ================================
"""
🚀 如何发布到PyPI：

1. 准备项目结构：
   创建以下文件结构：
   my-mcp-tool/
   ├── my_mcp_tool/
   │   ├── __init__.py
   │   └── main.py  (复制本文件内容)
   ├── setup.py
   ├── README.md
   └── requirements.txt

2. 创建setup.py文件：
   ```python
   from setuptools import setup, find_packages
   
   with open("README.md", "r", encoding="utf-8") as fh:
       long_description = fh.read()
   
   setup(
       name="{PACKAGE_NAME}",
       version="{VERSION}",
       author="{AUTHOR}",
       author_email="{AUTHOR_EMAIL}",
       description="{DESCRIPTION}",
       long_description=long_description,
       long_description_content_type="text/markdown",
       url="{URL}",
       packages=find_packages(),
       classifiers=[
           "Development Status :: 3 - Alpha",
           "Intended Audience :: Developers",
           "License :: OSI Approved :: MIT License",
           "Operating System :: OS Independent",
           "Programming Language :: Python :: 3",
           "Programming Language :: Python :: 3.8+",
       ],
       python_requires=">=3.8",
       install_requires=[
           "mcp>=1.0.0",
           "fastmcp>=0.1.0",
       ],
       entry_points={
           "console_scripts": [
               "my-mcp-tool=my_mcp_tool.main:main",
           ],
       },
   )
   ```

3. 创建requirements.txt：
   ```
   mcp>=1.0.0
   fastmcp>=0.1.0
   ```

4. 创建README.md：
   ```markdown
   # {TOOL_NAME}
   
   {DESCRIPTION}
   
   ## 安装
   
   ```bash
   pip install {PACKAGE_NAME}
   ```
   
   ## 使用
   
   ```bash
   {PACKAGE_NAME}
   ```
   ```

5. 构建和上传：
   ```bash
   # 安装构建工具
   pip install build twine
   
   # 构建包
   python -m build
   
   # 上传到PyPI（需要先注册PyPI账号并获取API Token）
   twine upload dist/*
   ```

6. 使用API Token上传：
   ```bash
   # 方法1：环境变量
   export TWINE_USERNAME=__token__
   export TWINE_PASSWORD=pypi-your-api-token-here
   twine upload dist/*
   
   # 方法2：直接指定
   twine upload -u __token__ -p pypi-your-api-token-here dist/*
   ```

📝 注意事项：
- 包名必须在PyPI上唯一
- 建议先上传到TestPyPI测试：twine upload --repository testpypi dist/*
- API Token比用户名密码更安全，推荐使用
- 每次发布前记得更新版本号
"""
```



> 更新: 2025-07-31 08:26:55  
> 原文: <https://www.yuque.com/lixinsi/hw0k6o/udi2mru60z491m37>