# Python程序流程

### 1.创建虚拟环境
```plain
python -m venv venv
```

### 2.激活虚拟环境
```plain
./venv/Scripts/activate 
```

### 3.安装依赖
```plain
pip install -r requirements.txt
```

### 4.卸载依赖
+ 查看 python 安装包

```plain
pip freeze
```

+ 导出依赖包命令

```plain
pip install -r pkgs.txt
```

+ 卸载依赖包脚本

```plain
import subprocess
import codecs

with codecs.open('pkgs.txt', 'r', encoding='utf-8', errors='ignore') as f:
    for line in f:
        pkg = line.strip()
        # 跳过空行和通过路径/git安装的库
        if not pkg or pkg.startswith('-e ') or pkg.startswith('git+') or '@' in pkg:
            continue
        # 只取包名部分（去掉版本号）并移除空字符
        pkg_name = pkg.split('==')[0].split('>=')[0].split('<=')[0].split('~')[0].replace('\x00', '')
        if not pkg_name:  # 如果处理后包名为空则跳过
            continue
        print(f'正在卸载: {pkg_name}')
        try:
            subprocess.run(['pip', 'uninstall', '-y', pkg_name], check=True)
        except subprocess.CalledProcessError as e:
            print(f'卸载失败: {pkg_name}, 错误: {e}')
```





> 更新: 2025-08-09 23:34:21  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/qbngqqt227ncrzra>