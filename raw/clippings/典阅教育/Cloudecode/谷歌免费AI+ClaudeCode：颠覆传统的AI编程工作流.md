# 谷歌免费AI + Claude Code：颠覆传统的AI编程工作流

### 仓库地址[https://github.com/jacob-bd/notebooklm-mcp-cli](https://github.com/jacob-bd/notebooklm-mcp-cli)
```sql
uv tool install notebooklm-mcp-cli
```

### 完成身份验证
```sql
nlm login
```

![1773101780925-64d7d1dc-f2a0-44d2-94bf-966f367e726f.png](./img/CtzHg4pU68xs4seO/1773101780925-64d7d1dc-f2a0-44d2-94bf-966f367e726f-485388.png)

![1773101847307-8738b39f-4c42-4b38-ad78-fedd111d0f1e.png](./img/CtzHg4pU68xs4seO/1773101847307-8738b39f-4c42-4b38-ad78-fedd111d0f1e-474722.png)

### 配置 claudecode mcp 服务器
```sql
# Add to any supported tool
nlm setup add claude-code
nlm setup add claude-desktop
nlm setup add gemini
nlm setup add cursor
nlm setup add windsurf

# Generate JSON config for any other tool
nlm setup add json

# Check which tools are configured
nlm setup list

# Diagnose installation & auth issues
nlm doctor
```

![1773101978649-a2bffb6a-4866-444c-a22d-07505c4e327d.png](./img/CtzHg4pU68xs4seO/1773101978649-a2bffb6a-4866-444c-a22d-07505c4e327d-951006.png)



### 实用
```sql
use the yt-search skill to find the latest trending videoson Claude Code Skills. Once we have those videos, sendthem over to NotebookLM using the notebooklm skill. Give meits analysis on the top Claude Code skills, then havenotebooklm create an infographic in a handwritten /blueprint style depicting that analysis on the top skills.
```

### 安装技能
```sql
notebooklm skill install
```



> 更新: 2026-03-10 09:06:14  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/egn48kk4q2q7loav>