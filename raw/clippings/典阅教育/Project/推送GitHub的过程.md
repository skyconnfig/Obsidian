# 推送GitHub 的过程

1. 初始化 Git 仓库

```plain
git init
git config user.name "skyconnfig"
git config user.email "your-email@example.com"
```

2. 添加远程仓库

```plain
git remote add origin https://skyconnfig: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@github.com/skyconnfig/quiz.git
```

3. 提交代码

```plain
git add .
git commit -m "Initial commit"

```

4. 遇到的问题与解决方案  
问题：remote: error: GH007: Your push would publish a private email address  
原因：GitHub 邮箱隐私保护被启用  
解决方案：  
方案 A：使用 GitHub 私密邮箱 skyconnfig@users.noreply.github.com  
方案 B：在 GitHub 设置中禁用邮箱隐私保护（[https://github.com/settings/emails）](https://github.com/settings/emails）)
5. 推送代码

```plain
git push -u origin main
```



> 更新: 2025-12-20 20:22:43  
> 原文: <https://www.yuque.com/lixinsi/dtxgrg/zr28cgda42gd22u1>