# 角色手搓AI-agent-system prompt系统提示词

豆包的角色扮演功能都用过吧？

直到今天才知道，实现豆包的角色扮演功能是如此简单，现在你可以在后台设置任何你想要的角色，

<font style="color:rgb(216,57,49);">比如：萝莉，虚拟女朋友，暖心少女，暴躁老板，数据分析师，财务，看板娘，萌娘，老师，医生，老板，面试官... ... 等等</font>

那么我们今天就秒杀豆包的角色扮演功能！

## 角色功能大揭秘：system prompt(系统提示词)里面！
### 1.什么是system prompt？
System prompt就是给AI设定角色和行为规则的"说明书"，就像告诉它"你是个医生"或者"回答要礼貌点"这样的指令。

### 2.System prompt的主要用法：
**<font style="color:rgb(216,57,49);">角色设定</font>**

+ <font style="color:rgb(216,57,49);">扮演专家：萝莉，虚拟女朋友，暖心少女，暴躁老板</font>
+ <font style="color:rgb(216,57,49);">定义身份：你是客服助手/私人教练/学习伙伴</font>

**<font style="color:rgb(216,57,49);">输出格式控制</font>**

+ <font style="color:rgb(216,57,49);">指定结构：用JSON格式回答/分点列出/表格形式/markdown</font>
+ <font style="color:rgb(216,57,49);">限制长度：回答控制在100字内/详细解释</font>
+ <font style="color:rgb(216,57,49);">语言风格：正式/幽默/简洁/专业</font>

**<font style="color:rgb(216,57,49);">行为约束</font>**

+ <font style="color:rgb(216,57,49);">拒绝回答：不讨论政治/不提供医疗建议</font>
+ <font style="color:rgb(216,57,49);">安全限制：不生成有害内容/不透露个人信息</font>
+ <font style="color:rgb(216,57,49);">准确性要求：承认不知道/引用可靠来源</font>

**<font style="color:rgb(216,57,49);">交互方式</font>**

+ <font style="color:rgb(216,57,49);">对话风格：友好聊天/严肃讨论/苏格拉底式提问</font>
+ <font style="color:rgb(216,57,49);">反馈机制：主动询问/等待指令/自动总结</font>
+ <font style="color:rgb(216,57,49);">记忆管理：记住用户偏好/忘记敏感信息</font>

**<font style="color:rgb(216,57,49);">任务特化</font>**

+ <font style="color:rgb(216,57,49);">工作流程：先分析再建议/多轮确认</font>
+ <font style="color:rgb(216,57,49);">专业技能：代码审查/文本润色/数据分析</font>
+ <font style="color:rgb(216,57,49);">创意限制：原创内容/避免抄袭</font>

直接上示例代码：（<font style="color:rgb(216,57,49);">记得修改你的api-key</font>）

```plain
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
系统提示词示例程序
演示如何使用system参数为Claude设置角色和行为规范
"""

# 导入Anthropic SDK库
import anthropic

# 创建Anthropic客户端实例
# 配置API密钥和基础URL来连接Claude服务
client = anthropic.Anthropic(
    # API密钥配置
    api_key="你的api-key",
    base_url="https://api.xueai.me"
)

# 预定义角色变量（虽然这里没用到，但展示了变量定义方式）
predefined_role = "萌娘"  # 设定AI角色，还可以设定多个角色，然后用户可以选择角色
format = "markdown"       # 设定输出格式，还可以是JSON，markdown，其他所有你想要的格式

# 创建带有系统提示的对话请求
# system参数用于设置AI的行为规范和角色设定
message = client.messages.create(
    # 指定使用Claude Sonnet 4模型
    model="claude-sonnet-4-20250514",
    # 限制最大回复长度
    max_tokens=1024,
    # 温度参数，控制回复的随机性，温度越高，随机性越大
    temperature=1,
    # 系统提示词：设定AI角色，拒绝角色以外的问题
    system=f"你现在是{predefined_role}，拒绝角色以外的问题.注意回答问题的格式为{format}",
    # 用户消息
    messages=[{"role": "user", "content": "你给我撒个娇"}]
)

# 这种方式能正确处理换行符和特殊格式
print(message.content[0].text)
```

**通过在****<font style="color:rgb(216,57,49);">predefined_role</font>**** = "xxx" ，这行代码可以设置你的AI 角色，这样AI 即可扮演你要的角色。**

通过修改system prompt让AI 乖乖听话！

**就这么简单。**



> 更新: 2025-09-13 14:30:30  
> 原文: <https://www.yuque.com/lixinsi/hw0k6o/cozitvutll1n7p61>