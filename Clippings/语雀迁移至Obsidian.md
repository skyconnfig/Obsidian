---
title: 语雀迁移至Obsidian
source: https://www.cnblogs.com/luolin-cn/p/18071645
author:
  - "[[luolin1024]]"
published: 2024-03-13
created: 2026-05-30
description: 背景 本人从2020年初开始使用语雀，在这段时间中通过语雀做了大量的笔记，也写了一些自己的博客，十分感谢语雀，给了我一个干净整洁的mark在线笔记。在最近这一个月内，起因是某天在b站看到了对Obsidian的介绍，本来自己也是十分想要记日记的，但是无奈语雀不可以定制日记模版，以及其他模版。另外语雀也
tags:
  - 语雀
---
## 背景

本人从2020年初开始使用语雀，在这段时间中通过语雀做了大量的笔记，也写了一些自己的博客，十分感谢语雀，给了我一个干净整洁的mark在线笔记。在最近这一个月内，起因是某天在b站看到了对Obsidian的介绍，本来自己也是十分想要记日记的，但是无奈语雀不可以定制日记模版，以及其他模版。另外语雀也不支持个人任务管理以及个人okr管理，因此对Obsidian和logseq，语雀，思源和notion等笔记软件十分感兴趣，想要实现All in one，在了解了这些软件之后，发现每个软件都有自己的长处和短处，开始逐渐反思或许不应该追求所谓的all in all，而是用不同的软件组合实现，整理了一下自己的需求：

- 记日记
- 做好GTD
- 个人目标管理
- 读书笔记
- 记录工作相关笔记
- 知识沉淀
- 编写博客并发布至网上
- 支持本地化，避免软件丢失
- 最好可以支持双链(这样我就可以看到我的知识图谱，然后满满的成就感，嘿嘿)

## 具体工具使用方式

按照这个思路确定了我之后的将要使用的工具，主要有语雀，微软todo和obsidian，其中语雀主要是博客的载体，微软todo作为认为管理工具参考 [effie任务管理](https://blog.effie.co/7%e7%a7%8d%e5%b8%b8%e8%a7%81%e7%9a%84%e4%bb%bb%e5%8a%a1%e7%ae%a1%e7%90%86%e6%96%b9%e6%b3%95/) ，obsidian主要解决我的日记、笔记以及其他事项。

### GTD：微软todo

首先是微软todo，我为啥要用微软todo呢，因为他免费、好用、支持多平台同步。先给大家看下我的微软todo ![https://cdn.jsdelivr.net/gh/luolin1024/image@main/img/1660985273921-9b52c2e2-59cf-4390-a77b-14170fb72fb2.png](https://www.cnblogs.com/luolin-cn/p/image.png "image.png") 我将我的todo按照四象限的思路建立了不同的list，以及收集箱list主要用于收集每天的任务，然后进行分类，如果是当天要完成的就放到我的一天中快速搞定。另外，每个任务最好都有对应的计划完成时间，毕竟有句话叫做 `如果计划没有截止时间，那么他将无限期推迟`,我的还有些没有加计划完成，这个别学我～

### 博客：语雀

语雀，主要会是我编写博客并发布至网上、组建对外公布的个人知识库主要工具，另外因为语雀本身

### 知识图谱：Obsidian

首先Obsidian其实是一块白板，需要自己有自己的定制化内容，github上也有一些主页可以fork过来之后自己直接使用，但是那些对我来讲太过花里胡哨了，我不喜欢，所以参考了Obsidian社区的另一位老哥的工作区，我也对我的Obsidian工作区进行了规划，通过目录文件夹分好每一个文件的内容，将收集箱，okr，daily，工作相关，博客相关进行拆分，看起来有条理些，自己也更舒服，这个是我目前的工作区：

![https://cdn.jsdelivr.net/gh/luolin1024/image@main/img/1660985642887-f5129b52-1bc3-43c3-9492-ee8ad060b2c4.png](https://www.cnblogs.com/luolin-cn/p/image.png "image.png") 我的需求都是怎么实现的呢？记日记：Obsidian的day planer工具可以结合日记模版，提前规划好每天的时间块，按照自己的实际动态调整，本地化、记录工作相关笔记、个人目标管理、读书笔记、知识沉淀、本地化、双链组成个人知识图谱

## 语雀导出到本地Markdown

语雀目前官方批量导出只支持导出pdf获取和自主研发文本类型导出，不支持markdow导出，所以想要本地备份需要稍微花点功夫，通过脚本将文件下载下来 建议使用如下脚本：

[truda8/ExportMD: 语雀知识库自动导出为 Markdown 格式 (github.com)](https://github.com/truda8/ExportMD)

本人使用的是python版本为3.8.19，另外注意使用bash执行，使用pycharm会报错

### 图片导入个人图床

这一步可以直接使用obsidian的插件 `Image auto upload` (插件市场已有)组合picGo全量上传，他会自动替换好上传后的图片位置

![https://cdn.jsdelivr.net/gh/luolin1024/image@main/img/20240726130242.png](https://www.cnblogs.com/luolin-cn/p/image.png "image.png")

## 随想

其实折腾个工具还是挺蛋疼的，俗话是磨刀不误砍柴工，一直折腾这玩意就像是一直在磨刀，一磨就是老半天，以后再也不想折腾笔记软件了～

本文来自博客园，作者： [luolin1024](https://www.cnblogs.com/luolin-cn/) ，转载请注明原文链接： [https://www.cnblogs.com/luolin-cn/p/18071645](https://www.cnblogs.com/luolin-cn/p/18071645)