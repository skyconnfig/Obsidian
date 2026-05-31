# 文案/博客生成器 MVP实战教程（二）

好的，我帮你把你之前关于 **Creem 收费产品、GitHub/Gmail/Google 登录、域名上线、Vercel 部署、AI 文案生成器 MVP** 的操作流程，整理成一份**小白可操作的详细 Markdown 文档**，一步步教你从零搭建到上线。

***

# SmartContent AI - 从零到上线实操指南

## 目录

1. 环境准备
2. GitHub 仓库
3. Vercel 部署与子域名
4. Auth 登录集成
   * GitHub 登录
   * Google 登录
5. Creem 收费产品配置
6. Webhook 集成
7. AI 生成接口
8. 首页设计与转化
9. MVP 上线策略

***

## 环境准备

1. **安装 Node.js ≥ 20**
2. **安装 pnpm / npm / yarn**
3. **安装 Prisma**

```plain
npm install prisma @prisma/client
npx prisma generate
```

1. \*\*创建 \*\*<code>**.env.local**</code> 文件，用于存放密钥：

```plain
NEXTAUTH_URL=http://localhost:3000
NEXTAUTH_SECRET=随机长字符串

OPENAI_API_KEY=你的OpenAIKey

GITHUB_CLIENT_ID=
GITHUB_CLIENT_SECRET=

GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=

CREEM_API_KEY=
CREEM_WEBHOOK_SECRET=
CREEM_PRODUCT_ID_CREATOR=
```

***

## GitHub 仓库

1. 创建仓库：`smart-content`
2. Clone 到本地：

```plain
git clone https://github.com/skyconnfig/smart-content.git
cd smart-content
```

1. 安装依赖：

```plain
npm install
```

***

## Vercel 部署与子域名

1. 登录 Vercel → Connect GitHub → 选择 `smart-content` 仓库
2. 部署项目（Next.js 框架）
3. 添加自定义域名：

```plain
ai.lxs.best
```

1. 在 Cloudflare DNS 添加记录：

| 类型 | 名称 | 值 |
| --- | --- | --- |
| CNAME | ai | cname.vercel-dns.com |

1. 等待 1~10 分钟生效
2. 配置 Vercel 环境变量：

```plain
NEXTAUTH_URL=https://ai.lxs.best
```

***

## Auth 登录集成

### GitHub 登录

1. GitHub → Developer Settings → OAuth Apps → New OAuth App
2. 填写：

| 字段 | 内容 |
| --- | --- |
| Application name | smart-content |
| Homepage URL | http://localhost:3000 |
| Authorization callback URL | http://localhost:3000/api/auth/callback/github |

1. 获取 **Client ID** 和 **Client Secret**
2. NextAuth 配置：

```plain
import NextAuth from "next-auth";
import GithubProvider from "next-auth/providers/github";

export default NextAuth({
  providers: [
    GithubProvider({
      clientId: process.env.GITHUB_CLIENT_ID!,
      clientSecret: process.env.GITHUB_CLIENT_SECRET!,
    }),
  ],
  secret: process.env.NEXTAUTH_SECRET,
});
```

1. `.env.local` 填入 Client ID / Secret

***

### Google 登录

1. Google Cloud → APIs & Services → OAuth consent screen → External
2. 创建 OAuth Client ID（Web Application）
3. 填写：

| 字段 | 内容 |
| --- | --- |
| Authorized JavaScript origins | http://localhost:3000 |
| Authorized redirect URIs | http://localhost:3000/api/auth/callback/google |

1. NextAuth 配置：

```plain
import GoogleProvider from "next-auth/providers/google";

GoogleProvider({
  clientId: process.env.GOOGLE_CLIENT_ID!,
  clientSecret: process.env.GOOGLE_CLIENT_SECRET!,
}),
```

1. `.env.local` 填入 Google Key
2. 测试登录：

```plain
http://localhost:3000/api/auth/signin
```

***

## Creem 收费产品配置

1. Creem Dashboard → Products → 创建产品
2. 填写：

| 字段 | 内容 |
| --- | --- |
| Name | SmartContent Creator Pack |
| Description | Get 30 AI-powered content generations for blogs, SEO articles, social media posts and marketing copy. |
| Price | $4.99 一次性付款 |
| Tax | Digital Goods, Price inclusive |

1. 上传产品图（可以使用简单推广图）
2. 获取 **Checkout Link**：

```plain
https://creem.io/pay/xxxxx
```

1. 网站添加购买按钮：

```plain
<button onClick={() => window.open("Creem支付链接")}>
  Buy 30 AI Generations - $4.99
</button>
```

***

## Webhook 集成

1. Creem Dashboard → Developers → Webhooks → 添加 Endpoint：

```plain
http://localhost:3000/api/webhook/creem
```

开发阶段可用 ngrok 暴露 localhost\
上线后改为：

```plain
https://ai.lxs.best/api/webhook/creem
```

1. 复制 Webhook Signing Secret → 填入 `.env.local`：

```plain
CREEM_WEBHOOK_SECRET=whsec_xxxxx
```

1. 创建 webhook API：

```plain
// app/api/webhook/creem/route.ts
import { NextResponse } from "next/server";

export async function POST(req: Request) {
  const body = await req.json();
  const email = body.customer?.email;

  // 数据库增加 30 次生成
  await prisma.user.update({
    where: { email },
    data: { paidCount: { increment: 30 } },
  });

  return NextResponse.json({ success: true });
}
```

***

## AI 生成接口

1. 创建 `/api/generate` 接口
2. 判断用户次数：

```plain
if(user.freeCount <= 0 && user.paidCount <= 0){
  return res.status(403).json({error: "请购买套餐"});
}
```

1. 调用 OpenAI API 生成文章
2. 扣除次数：

```plain
user.freeCount > 0 ? freeCount-- : paidCount--
```

***

## 首页设计与转化

1. 第一屏标题（1秒吸引用户）：

```plain
在10秒内生成一篇可以发布的文章
```

1. 副标题：

```plain
输入关键词 → 自动生成博客 / SEO / 社交媒体内容
```

1. CTA 按钮：

```plain
免费生成第一篇文章 →
```

1. 提示免费次数：

```plain
无需注册 · 2次免费体验
```

1. 第二屏：

```plain
关键词 → AI生成 → 一键复制 → 发布
```

***

## MVP 上线策略

1. 先上线免费 2 次生成版本
2. 不要完善支付自动化，先收集用户反馈
3. 上线后再完善 Creem Webhook 自动加次数
4. 推广渠道：

* Toolify
* Product Hunt
* Reddit
* X (Twitter)

***


> 更新: 2026-05-10 10:40:40  
> 原文: <https://www.yuque.com/lixinsi/khzg7n/byzknvi72q4fepl7>