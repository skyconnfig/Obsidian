# digital-teacher

好 ✅ 那我帮你整理一个 **完整的 GitHub Repo 模板**，你可以直接 `git clone`，填上 API Key，然后一步步跑通。

***

# 📂 项目结构：`digital-teacher`

```plain
digital-teacher/
│── data/
│   ├── teacher.png        # 老师头像
│   ├── lesson.pptx        # 教学PPT
│── output/                # 脚本会自动生成结果
│── main.py                # 主脚本（调用 OpenRouter + TTS + 合成）
│── requirements.txt       # 依赖库
│── README.md              # 使用说明
```

***

# 📜 requirements.txt

```plain
openai
TTS
moviepy
pptx2video
```

***

# 🖥 main.py

```python
import os
import openai
from TTS.api import TTS
from moviepy.editor import VideoFileClip, CompositeVideoClip

# ========== 配置 ==========
OPENROUTER_API_KEY = "填入你的OpenRouter API Key"
openai.api_key = OPENROUTER_API_KEY
openai.api_base = "https://openrouter.ai/api/v1"

LESSON_TOPIC = "人工智能入门课程第一讲"
OUTPUT_DIR = "output"
os.makedirs(OUTPUT_DIR, exist_ok=True)

# ========== Step 1: 生成讲稿 ==========
print("👉 正在用 OpenRouter 生成讲稿...")
response = openai.ChatCompletion.create(
    model="meta-llama/llama-3-8b-instruct",  # 免费模型之一
    messages=[{"role": "user", "content": f"请写一份 {LESSON_TOPIC} 的教学讲稿"}]
)
lecture_text = response["choices"][0]["message"]["content"]

with open(f"{OUTPUT_DIR}/lecture.txt", "w", encoding="utf-8") as f:
    f.write(lecture_text)

print("✅ 讲稿已生成:", f"{OUTPUT_DIR}/lecture.txt")

# ========== Step 2: 文字转语音 ==========
print("👉 正在用 Coqui TTS 生成语音...")
tts = TTS("tts_models/zh-CN/baker/tacotron2-DDC-GST", gpu=False)
tts.tts_to_file(text=lecture_text, file_path=f"{OUTPUT_DIR}/lecture.wav")

print("✅ 语音已生成:", f"{OUTPUT_DIR}/lecture.wav")

# ========== Step 3 & 4: 提示用户运行 SadTalker + PPT2Video ==========
print("\n⚠️ 接下来需要手动运行以下命令：")
print(f"1. SadTalker 生成数字人视频:")
print(f"   cd SadTalker && python inference.py --driven_audio ../{OUTPUT_DIR}/lecture.wav --source_image ../data/teacher.png --result_dir ../{OUTPUT_DIR}\n")
print(f"2. pptx2video 生成 PPT 视频:")
print(f"   python -m pptx2video ../data/lesson.pptx --output ../{OUTPUT_DIR}/lesson.mp4 --audio ../{OUTPUT_DIR}/lecture.wav\n")

# ========== Step 5: 合成课件视频 ==========
teacher_video = f"{OUTPUT_DIR}/teacher.mp4"
ppt_video = f"{OUTPUT_DIR}/lesson.mp4"
final_video = f"{OUTPUT_DIR}/final_lesson.mp4"

if os.path.exists(teacher_video) and os.path.exists(ppt_video):
    print("👉 正在合成课件视频...")
    ppt = VideoFileClip(ppt_video)
    teacher = VideoFileClip(teacher_video).resize(height=200).set_position(("right","bottom"))
    final = CompositeVideoClip([ppt, teacher])
    final.write_videofile(final_video, fps=25)
    print("✅ 最终课件视频已生成:", final_video)
else:
    print("⚠️ 请先运行 SadTalker 和 pptx2video 命令，再重新执行 main.py 完成合成步骤。")
```

***

# 📘 README.md

```markdown
# 🎓 Digital Teacher - AI 数字人讲解课件生成器

本项目演示如何用 **OpenRouter + Coqui TTS + SadTalker + pptx2video + MoviePy**  
自动生成 **数字人讲解的教学课件视频**。

---

## 🚀 功能流程
1. **OpenRouter (LLaMA/Qwen)** → 自动生成讲稿  
2. **Coqui TTS** → 中文讲解语音  
3. **SadTalker** → 数字人讲解视频  
4. **pptx2video** → PPT 转视频  
5. **MoviePy** → 合成「数字人 + PPT」课件视频  

---

## 📂 项目结构
```

digital-teacher/\
│── data/\
│   ├── teacher.png        # 老师头像\
│   ├── lesson.pptx        # 教学PPT\
│── output/                # 输出结果\
│── main.py                # 主脚本\
│── requirements.txt       # 依赖\
│── README.md              # 使用说明

````plain

---

## 🔧 安装依赖

```bash
git clone https://github.com/你的用户名/digital-teacher.git
cd digital-teacher
pip install -r requirements.txt
````

安装 [SadTalker](https://github.com/OpenTalker/SadTalker)：

```bash
git clone https://github.com/OpenTalker/SadTalker.git
cd SadTalker
pip install -r requirements.txt
```

***

## 🔑 配置 API Key

在 `main.py` 中填入你的 OpenRouter API Key：

```python
OPENROUTER_API_KEY = "你的_OpenRouter_API_Key"
```

***

## ▶️ 使用方法

1. 准备 `data/teacher.png`（头像） 和 `data/lesson.pptx`（课件PPT）
2. 运行主脚本

```bash
python main.py
```

3. 根据提示执行 SadTalker 和 pptx2video
4. 最终结果生成在 `output/final_lesson.mp4`

***

## 📌 效果

* 输出一个完整的 **教学视频**：
  * PPT 内容
  * 数字人老师（头像驱动）
  * AI 语音讲解

```plain

---

这样就是一个 **完整可运行的 GitHub Repo 模板** ✅  
你可以直接 `git clone`，填上 API Key，准备 PPT 和头像就能跑。  

要不要我帮你把这个 **直接打包成 zip**，你下载后本地直接解压运行？
```


> 更新: 2025-09-29 15:30:14  
> 原文: <https://www.yuque.com/lixinsi/dtxgrg/clt5cgddtcn7m6t6>