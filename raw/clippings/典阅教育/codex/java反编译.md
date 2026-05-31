# java反编译

非常好 👍，我来给你一个**结论导向的推荐**：

✅ 如果你想要“一步反编译成能直接放进 IDE 编译运行的源码项目”，\
**最推荐的工具是：**<code>**CFR Decompiler**</code>**（命令行） + **<code>**Recaf**</code>**（图形界面）**。

下面我详细帮你比较、说明为什么：

***

## 🥇 **首选：CFR Decompiler**

📦 **下载地址**：<https://www.benf.org/other/cfr/>

### ✅ 优点：

* 反编译准确率极高（比 JD-GUI、Procyon 稳定）；
* 支持 Java 8–17（包括 Lambda、Stream、Record、Switch 等语法）；
* 自动还原包结构；
* 生成的代码几乎能直接在 IntelliJ IDEA 编译；
* 命令行版本可批量反编译整个文件夹。

### 🚀 用法超级简单：

1. 下载 `cfr.jar`
2. 打开命令行（进入 jar 文件所在目录）
3. 执行：

```bash
java -jar cfr.jar yourfile.jar --outputdir ./src
```

4. 得到一个完整的 `src/` 源码目录，\
   直接导入到 IntelliJ IDEA / VS Code → 新建项目 → **Build** 即可。

💡 小贴士：

* 可用 `--outputdir` 自定义输出路径；
* 想批量处理，可以用通配符：

```bash
for %f in (*.jar) do java -jar cfr.jar "%f" --outputdir "%~nf-src"
```

***

## 🥈 **次选：Recaf（带GUI的一体化工具）**

📦 **下载地址**：<https://github.com/Col-E/Recaf>

### ✅ 优点：

* 图形界面操作非常友好；
* 集成了 **CFR、Procyon、FernFlower** 多种反编译引擎；
* 可以直接查看、修改、保存 `.class` 或 `.jar`；
* 一键导出完整源码项目。

### 💡 使用方法：

1. 打开 `.jar` 文件；
2. 左上角菜单 → `File → Export → Decompiled Source`;
3. 选择导出目录；
4. 打开 IntelliJ IDEA → 导入该目录。

适合不想敲命令的用户；\
还能直接修改类再打包，非常方便。

***

## 🧩 **对比总结表**

| 工具 | 使用难度 | 是否图形界面 | 反编译准确性 | 可编译性 | 适用人群 |
| --- | --- | --- | --- | --- | --- |
| 🥇 **CFR** | ⭐⭐ | ❌ | ✅✅✅✅ | ✅✅✅✅ | 想要编译、做二次开发 |
| 🥈 **Recaf** | ⭐ | ✅ | ✅✅✅ | ✅✅✅ | 想可视化编辑 / 无命令行经验 |
| 🥉 **Procyon** | ⭐⭐ | ❌ | ✅✅✅ | ✅✅ | 偶尔兼容性好于 CFR |
| JD-GUI | ⭐ | ✅ | ✅ | ❌ | 仅查看源码 |
| Bytecode Viewer | ⭐⭐ | ✅ | ✅✅ | ✅ | 图形多功能版 |

***

## ✅ 最佳推荐组合（终极方案）

| 场景 | 推荐组合 |
| --- | --- |
| 一键生成可编译源码 | 🧩 **CFR Decompiler** |
| 图形化可视操作 + 导出源码 | 💠 **Recaf** |
| 想查看不同反编译结果对比 | 🌀 **Bytecode Viewer** |

***

🎯 **总结一句话：**

想要「最干净、最稳定、能直接放进 IDEA 编译运行的源码」——\
**CFR Decompiler = 最好用的反编译工具。**

***


> 更新: 2025-10-04 14:55:29  
> 原文: <https://www.yuque.com/lixinsi/srnvya/aw9pbgpsm8mub9bn>