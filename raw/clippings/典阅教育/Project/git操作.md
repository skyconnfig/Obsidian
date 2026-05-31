# git操作

# <font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">直接复制运行这 4 行（一键解决）</font>
<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);"></font>

```bash
git pull origin main --rebase
git push origin main
```

### <font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">强制推送</font>
```bash
git push origin main --force
```

```plain
git add .
git commit -m "first commit"
git branch -M main
git push -u origin main
```

## <font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">第一步：拉取最新代码</font>
<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">bash</font>

<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">运行</font>

```plain
git pull origin main
```

<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">目的：把 GitHub 上的新代码同步到本地。</font>

## <font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">第二步：如果出现冲突（出现 CONFLICT）</font>
<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">打开冲突文件，删掉 Git 自动加的标记：</font>

<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">plaintext</font>

```plain
<<<<<<< HEAD
你的代码
=======
远程代码
>>>>>>> main
```

<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">只保留你</font>**<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">想要的正确代码</font>**<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">，保存文件。</font>

## <font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">第三步：提交 + 推送</font>
<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">bash</font>

<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">运行</font>

```plain
git add .
git commit -m "合并远程更新"
git push origin main
```

---

# <font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">三、最关键：</font>**<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">以后怎么避免这种问题？</font>**
<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">超级简单，记住一句话：</font>

## **<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">每次开始写代码前，先拉最新代码！</font>**
<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">bash</font>

<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">运行</font>

```plain
git pull origin main
```

<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">只要你做到：</font>

+ <font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">写代码前 → pull</font>
+ <font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">写完后 → push</font>

**<font style="color:rgb(0, 0, 0);background-color:rgba(0, 0, 0, 0);">永远不会再出现这种错误！</font>**

## 本地仓库操作
### git init：初始化 git 仓库，一个项目只运行一次
### git status：查看项目状态
### git add .:提交到自己的本地仓库
### git commit -m "init"
### 检查远程仓库：git remote -v 
### 创建远程仓库
### 添加远程仓库git remote add origin [https://github.com/skyconnfig/quiz](https://github.com/skyconnfig/quiz)
### 验证远程仓库： git remote -v 
### 有内容的话线拉取远程的更改然后再图送
```sql
git pull origin main --allow-unrelated-histories 
```

### 查看状态
```sql
git status
```

### 合并更改
```sql
git commit -m "Merge remote README.md with local changes" 
```

### 再次推送
```sql
git push origin main 
```

### 删除原来的 git
```plain
Remove-Item -Recurse -Force .git 
```

### 还原代码 git checkout OnlineExamSystemVue/src/router/index.js
![1761788410259-e8fb565d-c5cd-4116-a111-840b3d0527b6.png](./img/BH4Owi15rXWDk91l/1761788410259-e8fb565d-c5cd-4116-a111-840b3d0527b6-648117.png)



### git 版本回退
### git log 查看 hash 值
![1761788734198-35f711ae-faa0-4b0c-bd63-a24616378215.png](./img/BH4Owi15rXWDk91l/1761788734198-35f711ae-faa0-4b0c-bd63-a24616378215-317866.png)



### 版本
### git reset --hard e9858b3da4d2cc54e31bcc3065deea16580342be
![1761788786247-410decc5-1748-4de1-97a9-bf0661013e87.png](./img/BH4Owi15rXWDk91l/1761788786247-410decc5-1748-4de1-97a9-bf0661013e87-597655.png)



# 1. 允许合并不相关的历史记录
git pull origin main --allow-unrelated-histories

# 2. 如果有冲突，解决冲突后提交
git add .  
git commit -m "Merge remote and local changes"

# 3. 推送到 GitHub
git push -u origin maincd D:\daima\qdq

# 拉取远程变化（允许不相关的历史）
git pull origin main --allow-unrelated-histories

# 推送你的代码
git push -u origin main



### 远程仓库已经存在
```plain
cd "D:\src\kiftd-source\kiftd-source-master"
git remote remove origin
git remote add origin "https://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@github.com/skyconnfig/kiftd.git"
git push -u origin main

```



### 推送到 github 的完整步骤
```plain
# 1. 进入项目目录
cd D:\src\kiftd-source\kiftd-source-master

# 2. 初始化git（如果还未初始化）
git init

# 3. 配置git用户（可选，如果未配置过）
git config user.name "lixinsi7439"
git config user.email "lixinsi7439@gmail.com"

# 4. 添加所有文件到暂存区
git add .

# 5. 提交代码
git commit -m "Initial commit: kiftd file server project"

# 6. 添加远程仓库
git remote add origin https://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@github.com/skyconnfig/kiftd.git

# 7. 推送到GitHub
git branch -M main
git push -u origin main



```



> 更新: 2026-05-08 09:32:07  
> 原文: <https://www.yuque.com/lixinsi/dtxgrg/okf43h2pinex6kgi>