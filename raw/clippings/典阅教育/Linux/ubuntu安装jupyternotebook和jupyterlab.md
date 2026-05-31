# ubuntu安装jupyter notebook和jupyter lab

在 Ubuntu 上使用 Anaconda 详细安装 Jupyter Notebook，可以按照以下步骤操作：

### 1. 确保 Anaconda 已安装

确保 Anaconda 已经正确安装并且能够使用。如果尚未安装，请参照之前的安装说明完成安装。

### 2. 打开终端

在 Ubuntu 上，打开一个新的终端窗口。

### 3. 创建一个新的 Conda 环境（可选）

如果你希望在一个新的 Conda 环境中安装 Jupyter Notebook，可以创建一个新的环境。例如，创建一个名为 `myenv` 的环境，并安装 Python ：

```plain
conda create --name myenv python=3.10
```

激活这个新环境：

```plain
conda activate myenv
```

### 4. 安装 Jupyter Notebook

在 Conda 环境中，使用 `conda` 命令安装 Jupyter Notebook：

```plain
conda install jupyter
```

这将自动安装 Jupyter Notebook 以及它所需的依赖项。

### 5. 启动 Jupyter Notebook

安装完成后，你可以通过以下命令启动 Jupyter Notebook：

```plain
jupyter notebook
```

### 6. 使用 Jupyter Notebook

运行上述命令后，Jupyter Notebook 会在默认的浏览器中自动打开，网址通常是 `http://localhost:8888`。你可以在浏览器中创建和管理笔记本文件。

### 7. 更新 Jupyter Notebook（可选）

如果你需要更新 Jupyter Notebook 到最新版本，可以使用以下命令：

```plain
conda update jupyter
```

### 8. 关闭 Jupyter Notebook

要关闭 Jupyter Notebook，返回到启动 Jupyter 的终端窗口，按下 `Ctrl + C`，然后确认终止进程。

### 附加说明

* **安装特定版本的 Jupyter Notebook：** 如果你需要安装特定版本的 Jupyter Notebook，可以指定版本号。例如：

```plain
conda install jupyter=1.0.0
```

* **安装 JupyterLab：** 如果你更倾向于使用 JupyterLab，这是 Jupyter 的下一代用户界面，可以通过以下命令安装：

```plain
conda install jupyterlab
```

启动 JupyterLab 的命令是：

```plain
jupyter lab
```

通过这些步骤，你可以在 Ubuntu 上使用 Anaconda 安装和使用 Jupyter Notebook。如果遇到问题或需要进一步帮助，请随时告知！

# <font style="color:rgb(34, 34, 38);">jupyter 启动不限制ip 指定端口 允许root</font>

## <font style="color:rgb(79, 79, 79);">jupyter 启动不限制ip 指定端口 允许root</font>

```plain
jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root
jupyter lab --ip 0.0.0.0 --port 8888 --allow-root
```


> 更新: 2024-08-21 14:26:23  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/cfsxonp1mq66ok0b>