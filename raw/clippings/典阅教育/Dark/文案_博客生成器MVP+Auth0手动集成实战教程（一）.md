# 文案/博客生成器 MVP + Auth0 手动集成实战教程（一）

**AI 文案/博客生成器 MVP + Auth0 手动集成** 内容整理成一份 **小白实操指南**，用 Markdown 格式，包含从准备、模板选择、到部署的每一步操作。你可以直接用这个文档操作。

***

# AI 文案/博客生成器 MVP 实操指南

***

## **目录**

1. 前言
2. 阶段 0：准备工作
3. 阶段 1：部署 Vercel SaaS 模板
4. 阶段 2：改造前端界面
5. 阶段 3：后端 API
6. 阶段 4：数据库配置
7. 阶段 5：Creem 收费逻辑
8. 阶段 6：部署 + 域名绑定
9. 阶段 7：Auth0 手动集成（绕过 Vercel 集成问题）
10. 提示词：生成最小可行 Auth0 Next.js 模板
11. 后续迭代功能

***

## **前言**

本文档针对**小白实操**，使用 Vercel 免费模板 + Auth0 + Neon + Creem 构建一个 **AI 文案/博客生成器 MVP**。\
最终目标：用户可登录 → 输入关键词 → 生成短文或博客文章 → 免费次数控制 → 付费解锁更多生成次数。

***

## **阶段 0：准备工作**

1. **账号和工具**
   * GitHub：存放项目代码
   * Vercel：部署 Next.js 应用
   * Neon：PostgreSQL 数据库，用于存储文章生成历史
   * Creem：收款账户
   * 域名：`lxs.best`
   * OpenAI 或其他 AI 模型账号
2. **环境变量**（在 Vercel 项目中添加）

```plain
OPENAI_API_KEY=<你的OpenAI API Key>
NEON_DB_URL=<你的Neon数据库URL>
CREEM_SECRET_KEY=<你的Creem密钥>
```

***

## **阶段 1：部署 Vercel SaaS 模板**

1. 选择 **SaaS 模板**，推荐关键字：`saas`, `dashboard`, `editor`, `blog`, `content`
2. 点击模板页面的 **Deploy** → 连接你的 GitHub 仓库
3. 部署完成后获取临时域名（例如 `yourproject.vercel.app`）
4. 测试模板登录/注册功能是否可用

***

## **阶段 2：改造前端界面**

目标：实现文章生成界面

1. 新建页面：`pages/generate.tsx`
2. 页面内容：

```plain
import { useState } from 'react';
import axios from 'axios';

export default function Generate() {
  const [keyword, setKeyword] = useState('');
  const [style, setStyle] = useState('正式');
  const [result, setResult] = useState('');

  const handleGenerate = async () => {
    const res = await axios.post('/api/generate', { keyword, style });
    setResult(res.data.text);
  };

  return (
    <div>
      <h1>AI 文案/博客生成器</h1>
      <input value={keyword} onChange={e => setKeyword(e.target.value)} placeholder="输入主题/关键词"/>
      <select value={style} onChange={e => setStyle(e.target.value)}>
        <option>正式</option>
        <option>幽默</option>
        <option>SEO优化</option>
      </select>
      <button onClick={handleGenerate}>生成文章</button>
      <pre>{result}</pre>
    </div>
  );
}
```

***

## **阶段 3：后端 API**

1. 新建文件：`pages/api/generate.ts`
2. 功能：接收前端请求 → 调用 AI 模型 → 返回文章 → 存数据库

```plain
import { NextApiRequest, NextApiResponse } from 'next';
import { OpenAI } from 'openai';
import { saveArticle, checkUserQuota } from '../../lib/db';

const openai = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const { keyword, style, userId } = req.body;

  const canGenerate = await checkUserQuota(userId);
  if (!canGenerate) return res.status(403).json({ error: '请付费解锁更多生成次数' });

  const prompt = `请根据关键词 "${keyword}"，用 "${style}" 风格写一篇博客文章。`;
  const gptRes = await openai.chat.completions.create({
    model: 'gpt-4o-mini',
    messages: [{ role: 'user', content: prompt }],
  });

  const text = gptRes.choices[0].message?.content || '';
  await saveArticle(userId, keyword, style, text);

  res.status(200).json({ text });
}
```

***

## **阶段 4：数据库配置（Neon）**

表结构：

```plain
CREATE TABLE users (
  id VARCHAR(50) PRIMARY KEY,
  free_quota INT DEFAULT 2,
  paid BOOLEAN DEFAULT false
);

CREATE TABLE articles (
  id SERIAL PRIMARY KEY,
  user_id VARCHAR(50),
  keyword TEXT,
  style TEXT,
  content TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);
```

* 每次生成文章：`free_quota -= 1`
* Creem 付费成功后更新 `paid = true`

***

## **阶段 5：Creem 收费逻辑**

1. 前端：
   * 剩余免费次数 >0 → 显示“生成文章”
   * 免费次数用完 → 显示“付费解锁更多”
2. 后端回调示例：

```plain
app.post('/api/creem/callback', async (req, res) => {
  const { userId, status } = req.body;
  if(status === 'success'){
    await db.query('UPDATE users SET paid=true WHERE id=$1', [userId]);
  }
  res.send('ok');
});
```

***

## **阶段 6：部署 + 域名绑定**

1. Vercel 项目 → Domains → 添加 `lxs.best`
2. Cloudflare：
   * CNAME → 指向 Vercel 域名
   * 开启 HTTPS
3. 测试流程：
   * 用户注册 → 免费生成文章 → 显示文章
   * 免费次数用完 → 提示付费 → 支付成功 → 可继续生成

***

## **阶段 7：Auth0 手动集成**

当 Vercel 集成失败时，可手动集成 Auth0：

1. Auth0 Dashboard → Applications → Create Application → Regular Web App
2. 回调 URL：

```plain
https://your-vercel-domain.vercel.app/api/auth/callback
```

1. 登出 URL：

```plain
https://your-vercel-domain.vercel.app
```

1. `.env.local` 配置：

```plain
AUTH0_DOMAIN=your-auth0-domain
AUTH0_CLIENT_ID=your-client-id
AUTH0_CLIENT_SECRET=your-client-secret
NEXT_PUBLIC_AUTH0_REDIRECT_URI=https://your-vercel-domain.vercel.app/api/auth/callback
```

1. 安装依赖：

```plain
npm install @auth0/nextjs-auth0
```

1. 配置 API 路由：

```plain
/api/auth/login
/api/auth/logout
/api/auth/callback
/api/auth/me
```

***

## **提示词：生成最小可行 Auth0 Next.js 模板**

```plain
请生成一个最小可行的 Next.js 项目示例：
- 集成 Auth0 手动登录/登出/回调/获取用户信息
- 文件结构完整，可直接部署在 Vercel
- API 路由：
  - /api/auth/login
  - /api/auth/logout
  - /api/auth/callback
  - /api/auth/me
- 前端 index.tsx 显示登录/登出按钮和用户信息
- 使用 @auth0/nextjs-auth0
- 环境变量：
  AUTH0_DOMAIN, AUTH0_CLIENT_ID, AUTH0_CLIENT_SECRET, NEXT_PUBLIC_AUTH0_REDIRECT_URI
- 带注释解释每个文件和路由作用
```

***

## **后续迭代功能**

1. 邮件发送文章
2. 导出 PDF / Markdown
3. 多风格模板（正式/幽默/SEO）
4. 图像生成功能
5. 用户文章管理历史

***

✅ **完成目标**：\
通过此文档，**小白也能一步步完成 AI 文案/博客生成器 MVP 上线**，支持免费生成次数 + Creem 收费 + 用户登录（Auth0 手动集成）。


> 更新: 2026-05-10 10:38:33  
> 原文: <https://www.yuque.com/lixinsi/khzg7n/qci0mo96qhf4c3df>