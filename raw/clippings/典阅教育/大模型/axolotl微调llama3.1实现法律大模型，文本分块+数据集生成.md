# axolotl微调llama3.1实现法律大模型，文本分块+数据集生成

### <font style="color:rgb(55, 53, 47);">Axolotl</font>

<font style="color:rgb(55, 53, 47);">Axolotl是一款极简开源框架。它为开发者提供了一个简单易用的工具，可以快速高效地微调大语言模型，使其更好地适应特定任务和领域。

</font>

* **<font style="color:rgb(55, 53, 47);">极简易用：</font>**<font style="color:rgb(55, 53, 47);"> Axolotl的设计理念就是简单易用，即使没有深度学习背景的开发者也能快速上手。它提供了直观的接口和丰富的文档，让用户可以专注于模型的微调，而不用过多地关注底层的技术细节。</font>
* **<font style="color:rgb(55, 53, 47);">高效率：</font>**<font style="color:rgb(55, 53, 47);"> Axolotl在性能优化方面做了很多工作，可以大大缩短模型微调的时间。它支持分布式训练，可以充分利用多台机器的计算资源，加速训练过程。</font>

### <font style="color:rgb(55, 53, 47);">文本分块</font>

<font style="color:rgb(55, 53, 47);">使用文本分块的作用：

</font>

* <font style="color:rgb(55, 53, 47);">控制输入长度：大多数语言模型都有最大输入长度限制。通过将长文本分成较小的块，可以确保每个输入都在模型的处理能力范围内。</font>
* <font style="color:rgb(55, 53, 47);">提高效率：较小的文本块可以更快地被处理，这在训练大规模数据集时特别重要，可以显著减少训练时间。</font>
* <font style="color:rgb(55, 53, 47);">增加多样性：将长文档分成多个块可以增加训练样本的数量和多样性，有助于模型学习更广泛的语言模式和上下文关系。</font>
* <font style="color:rgb(55, 53, 47);">保持上下文：合理的分块可以确保每个块都包含足够的上下文信息，使模型能够理解和生成连贯的文本。</font>
* <font style="color:rgb(55, 53, 47);">优化内存使用：较小的文本块占用更少的内存，使得在有限的硬件资源上也能处理大型数据集。</font>
* <font style="color:rgb(55, 53, 47);">便于并行处理：小型文本块更容易进行并行处理，可以充分利用现代计算架构的优势。</font>
* <font style="color:rgb(55, 53, 47);">适应不同任务：不同的NLP任务可能需要不同长度的输入。分块允许灵活地准备适合各种任务的数据。</font>
* <font style="color:rgb(55, 53, 47);">提高模型泛化能力：通过学习处理不同长度和结构的文本块，模型可以提高其在各种实际应用场景中的泛化能力。</font>

### <code><font style="color:rgb(235, 87, 87);">google-bert/bert-base-chinese</font></code><font style="color:rgb(55, 53, 47);"> 是一个基于BERT的预训练语言模型，主要用于自然语言理解任务，如文本分类、命名实体识别、问答等。</font>

<font style="color:rgb(55, 53, 47);">使用google-bert/bert-base-chinese进行文本分块的主要优势是它能够基于深度语义理解和中文语言特性，生成更加连贯、语义完整的文本块，同时保持了对中文词汇和上下文的敏感性，这有助于提高后续NLP任务的性能和效果。</font>

## **<font style="color:rgb(55, 53, 47);">👉👉👉</font>\*\*\*\*<font style="color:rgb(55, 53, 47);">如有问题请联系我的徽信 stoeng</font>**

## **<font style="color:rgb(55, 53, 47);">🔥🔥🔥</font>****<font style="color:rgb(55, 53, 47);">本项目代码由AI超元域频道制作，观看更多大模型微调视频请访问我的频道</font>****<font style="color:rgb(55, 53, 47);">⬇</font>**

### **<font style="color:rgb(55, 53, 47);">👉👉👉</font>**[**<font style="color:rgb(55, 53, 47);">我的哔哩哔哩频道</font>**](https://space.bilibili.com/3493277319825652)

### **<font style="color:rgb(55, 53, 47);">👉👉👉</font>**[**<font style="color:rgb(55, 53, 47);">我的YouTube频道</font>**](https://www.youtube.com/@AIsuperdomain)

### **<font style="color:rgb(55, 53, 47);">👉👉👉</font>\*\*\*\*<font style="color:rgb(55, 53, 47);">我的开源项目 </font>**[**<font style="color:rgb(55, 53, 47);">https://github.com/win4r/AISuperDomain</font>**](https://github.com/win4r/AISuperDomain)

### <font style="color:rgb(55, 53, 47);">使用</font><code><font style="color:rgb(235, 87, 87);">bert-base-chinese</font></code><font style="color:rgb(55, 53, 47);">进行文本分块</font>

```bash
import torch
from transformers import BertTokenizer, BertModel
import re
import os
from scipy.spatial.distance import cosine


def get_sentence_embedding(sentence, model, tokenizer):
    """
    获取句子的嵌入表示

    参数:
    sentence (str): 输入句子
    model (BertModel): 预训练的BERT模型
    tokenizer (BertTokenizer): BERT分词器

    返回:
    numpy.ndarray: 句子的嵌入向量
    """
    # 使用分词器处理输入句子，并转换为模型输入格式
    inputs = tokenizer(sentence, return_tensors="pt", padding=True, truncation=True, max_length=512)
    # 使用模型获取输出，不计算梯度
    with torch.no_grad():
        outputs = model(**inputs)
    # 返回最后一层隐藏状态的平均值作为句子嵌入
    return outputs.last_hidden_state.mean(dim=1).squeeze().numpy()


def split_text_by_semantic(text, max_length, similarity_threshold=0.5):
    """
    基于语义相似度对文本进行分块

    参数:
    text (str): 输入的长文本
    max_length (int): 每个文本块的最大长度（以BERT分词器的token为单位）
    similarity_threshold (float): 语义相似度阈值，默认为0.5

    返回:
    list: 分割后的文本块列表
    """
    # 加载BERT模型和分词器
    tokenizer = BertTokenizer.from_pretrained('bert-base-chinese')
    model = BertModel.from_pretrained('bert-base-chinese')
    model.eval()  # 设置模型为评估模式

    # 按句子分割文本（使用常见的中文标点符号）
    sentences = re.split(r'(。|！|？|；)', text)
    # 重新组合句子和标点
    sentences = [s + p for s, p in zip(sentences[::2], sentences[1::2]) if s]

    chunks = []
    current_chunk = sentences[0]
    # 获取当前chunk的嵌入表示
    current_embedding = get_sentence_embedding(current_chunk, model, tokenizer)

    for sentence in sentences[1:]:
        # 获取当前句子的嵌入表示
        sentence_embedding = get_sentence_embedding(sentence, model, tokenizer)
        # 计算当前chunk和当前句子的余弦相似度
        similarity = 1 - cosine(current_embedding, sentence_embedding)

        # 如果相似度高于阈值且合并后不超过最大长度，则合并
        if similarity > similarity_threshold and len(tokenizer.tokenize(current_chunk + sentence)) <= max_length:
            current_chunk += sentence
            # 更新当前chunk的嵌入表示
            current_embedding = (current_embedding + sentence_embedding) / 2
        else:
            # 否则，保存当前chunk并开始新的chunk
            chunks.append(current_chunk)
            current_chunk = sentence
            current_embedding = sentence_embedding

    # 添加最后一个chunk
    if current_chunk:
        chunks.append(current_chunk)

    return chunks


def read_text_file(file_path):
    """
    读取文本文件

    参数:
    file_path (str): 文件路径

    返回:
    str: 文件内容
    """
    with open(file_path, 'r', encoding='utf-8') as file:
        return file.read()


def save_chunks_to_files(chunks, output_dir):
    """
    将分割后的文本块保存到文件

    参数:
    chunks (list): 文本块列表
    output_dir (str): 输出目录路径
    """
    # 如果输出目录不存在，则创建
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # 将每个文本块保存为单独的文件
    for i, chunk in enumerate(chunks):
        chunk_file_path = os.path.join(output_dir, f"chunk_{i + 1}.txt")
        with open(chunk_file_path, 'w', encoding='utf-8') as file:
            file.write(chunk)
        print(f"已保存第 {i + 1} 个文本块到 {chunk_file_path}")


# 主程序

# 设置输入和输出路径
input_file_path = './book/1.txt'  # 替换为你的长文本文件路径
output_dir = './saveChunk/'  # 替换为你希望保存文本块的目录路径

# 读取长文本
long_text = read_text_file(input_file_path)

# 设置每个文本块的最大分词数量和相似度阈值
max_length = 2048  # 可根据需要调整
similarity_threshold = 0.5  # 可根据需要调整

# 分割长文本
text_chunks = split_text_by_semantic(long_text, max_length, similarity_threshold)

# 保存分割后的文本块到指定目录
save_chunks_to_files(text_chunks, output_dir)
```

### <font style="color:rgb(55, 53, 47);">生成数据集</font>

```bash
import json
import os
import time
import re
from typing import List, Dict
from openai import OpenAI
import logging
import backoff
import pyarrow as pa
import pyarrow.parquet as pq

# 设置日志
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# 初始化 OpenAI 客户端
client = OpenAI(base_url="https://api.together.xyz/v1", api_key="your_api_Key")  # 替换为你的 API 密钥

def read_file(file_path: str) -> str:
    with open(file_path, 'r', encoding='utf-8') as file:
        return file.read()

@backoff.on_exception(backoff.expo, Exception, max_tries=3)
def generate_single_entry(text: str) -> Dict:
    prompt = f"""
    基于以下文本，生成1个用于指令数据集的高质量条目。条目应该直接关联到给定的文本内容，提出相关的问题或任务。
    请确保生成多样化的指令类型，例如：
    - 分析类："分析..."
    - 比较类："比较..."
    - 解释类："解释..."
    - 评价类："评价..."
    - 问答类："为什么..."

    文本内容：
    {text}

    请以下面的格式生成条目，确保所有字段都有适当的内容：
    {{
        "instruction": "使用上述多样化的指令类型之一，提出一个具体的、与文本相关的问题或任务",
        "input": "如果需要额外的上下文信息，请在这里提供，否则留空",
        "output": "对instruction的详细回答或任务的完成结果"
    }}
    确保所有生成的内容都与给定的文本直接相关，生成的是有效的JSON格式，并且内容高质量、准确、详细。
    """

    try:
        response = client.chat.completions.create(
            model="meta-llama/Meta-Llama-3.1-70B-Instruct-Turbo",
            messages=[{"role": "user", "content": prompt}],
            temperature=0.7,  # 增加温度以提高多样性
            max_tokens=4098
        )
        logger.info(f"API 响应: {response.choices[0].message.content}")

        json_match = re.search(r'\{.*\}', response.choices[0].message.content, re.DOTALL)
        if json_match:
            entry = json.loads(json_match.group())
            required_keys = ['instruction', 'input', 'output']
            if isinstance(entry, dict) and all(key in entry for key in required_keys):
                # 根据 input 是否为空来设置 text 字段
                if entry['input'].strip():
                    entry[
                        'text'] = f"Below is an instruction that describes a task, paired with an input that provides further context. Write a response that appropriately completes the request.### Instruction: {entry['instruction']}\n### Input: {entry['input']}\n### Response: {entry['output']}"
                else:
                    entry[
                        'text'] = f"Below is an instruction that describes a task. Write a response that appropriately completes the request.### Instruction: {entry['instruction']}\n### Input: {entry['input']}\n### Response: {entry['output']}"

                logger.info("成功生成完整条目")
                return entry
            else:
                logger.warning("JSON 解析成功，但缺少必要字段")
                return {}
        else:
            logger.error("无法从API响应中提取有效的JSON")
            return {}

    except Exception as e:
        logger.error(f"生成条目时发生错误: {str(e)}")
        raise
def generate_dataset(folder_path: str, entries_per_file: int = 2) -> List[Dict]:
    dataset = []
    for filename in os.listdir(folder_path):
        if filename.endswith(".txt"):
            file_path = os.path.join(folder_path, filename)
            logger.info(f"正在处理文件: {filename}")
            text = read_file(file_path)
            for j in range(entries_per_file):
                logger.info(f"  生成第 {j + 1}/{entries_per_file} 个条目")
                entry = generate_single_entry(text)
                if entry and all(key in entry for key in ['instruction', 'input', 'output', 'text']):
                    dataset.append(entry)
                    logger.info(f"  成功生成 1 个完整条目")
                else:
                    logger.warning(f"  跳过不完整的条目")
                time.sleep(2)  # 在请求之间增加延迟到2秒

    return dataset

def save_dataset_as_parquet(dataset: List[Dict], output_file: str):
    schema = pa.schema([
        ('instruction', pa.string()),
        ('input', pa.string()),
        ('output', pa.string()),
        ('text', pa.string())
    ])

    arrays = [
        pa.array([entry['instruction'] for entry in dataset]),
        pa.array([entry['input'] for entry in dataset]),
        pa.array([entry['output'] for entry in dataset]),
        pa.array([entry['text'] for entry in dataset])
    ]

    table = pa.Table.from_arrays(arrays, schema=schema)
    pq.write_table(table, output_file)

if __name__ == "__main__":
    input_folder = "./saveChunk"  # 指定输入文件夹路径
    output_file = "instruction_dataset.parquet"

    logger.info("开始生成数据集")
    dataset = generate_dataset(input_folder, entries_per_file=10)
    save_dataset_as_parquet(dataset, output_file)
    logger.info(f"数据集已生成并保存到 {output_file}")
    logger.info(f"共生成 {len(dataset)} 个有效条目")
```

### <font style="color:rgb(55, 53, 47);">微调命令</font>

```bash
#将当前登录的用户添加到docker组中，使其拥有使用docker命令的权限。
sudo usermod -aG docker $USER

#sudo docker run --gpus '"all"' -it winglian/axolotl:main-latest
sudo docker run --gpus '"all"' --rm -it winglian/axolotl:main-latest


rm examples/llama-3/qlora.yml

wget -P examples/llama-3/ https://raw.githubusercontent.com/win4r/mytest/main/qlora.yml

#数据集 https://raw.githubusercontent.com/win4r/mytest/main/qlora.yml
#模型 NousResearch/Meta-Llama-3.1-8B
#数据集 leo009/lawdata



CUDA_VISIBLE_DEVICES="" python -m axolotl.cli.preprocess examples/llama-3/qlora.yml
accelerate launch -m axolotl.cli.train examples/llama-3/qlora.yml

# 预处理数据集
CUDA_VISIBLE_DEVICES="" python -m axolotl.cli.preprocess examples/llama-3/instruct-dpo-lora-8b.yml

# finetune lora
accelerate launch -m axolotl.cli.train examples/llama-3/instruct-dpo-lora-8b.yml

# inference
accelerate launch -m axolotl.cli.inference examples/llama-3/qlora.yml \
    --lora_model_dir="./outputs/qlora-out"

# gradio
accelerate launch -m axolotl.cli.inference examples/llama-3/qlora.yml \
    --lora_model_dir="./outputs/qlora-out" --gradio

# remote yaml files - the yaml config can be hosted on a public URL
# Note: the yaml config must directly link to the **raw** yaml
accelerate launch -m axolotl.cli.train https://raw.githubusercontent.com/axolotl-ai-cloud/axolotl/main/examples/openllama-3b/lora.yml


#合并模型
python3 -m axolotl.cli.merge_lora examples/llama-3/qlora.yml --lora_model_dir="./outputs/qlora-out"

#上次合并后到模型到hf
huggingface-cli login
#然后输入write权限的token
huggingface-cli upload leo009/merged-llama3.1-8b outputs/qlora-out/merged
```

### <font style="color:rgb(55, 53, 47);">数据集处理</font>

```bash
#pip install ollama datasets

import json
from datasets import load_dataset
import ollama
from rich import print

# Load a real dataset from Hugging Face
dataset = load_dataset("squad_v2", split="train")

# Convert dataset to list of dictionaries
json_data = dataset.select(range(10)).to_dict()

print("Dataset Rows:", len(json_data['id']))
print({key: json_data[key][0] for key in json_data})

# Function to format the input for the model
def format_input(context, question):
    return (
        "### Context:\n" + context +
        ("\n\n### Question:\n" + question if question else "")
    )

# Initialize the Ollama client
client = ollama.Client()  # Replace with your actual API key if required

# Initialize new keys in the json_data dictionary
json_data['rejected'] = [''] * len(json_data['id'])
json_data['chosen'] = [''] * len(json_data['id'])

# Process each entry in the dataset
for i in range(len(json_data['id'])):
    context = json_data['context'][i]
    question = json_data['question'][i]
    answer = json_data['answers'][i]['text'][0] if json_data['answers'][i]['text'] else "No answer"

    print("Rejected Answer:", answer)

    prompt_text = format_input(context, question)

    prompt = (
        f"Rewrite `{prompt_text}` output to be concise and clear: {answer}. "
        "Ensure the response is easy to understand, professional and as a full sentense. Just respond only with the Answer"
    )

    response = client.generate(
        model="llama3.1",
        prompt=prompt,
        options={"seed": 123, "temperature": 0}
    )
    chosen_answer = response['response']
    print("Chosen Answer:", chosen_answer)

    json_data['rejected'][i] = answer
    json_data['chosen'][i] = chosen_answer

# Convert back to dictionary format expected by json.dump
final_data = [{key: json_data[key][i] for key in json_data} for i in range(len(json_data['id']))]

with open("preference_dataset.json", "w") as file:
    json.dump(final_data, file, indent=4)
```

### <font style="color:rgb(55, 53, 47);">转alpaca数据集</font>

```bash
import json
from datasets import load_dataset
import ollama
from rich import print

# Load a real dataset from Hugging Face
dataset = load_dataset("squad_v2", split="train")

# Convert dataset to list of dictionaries
json_data = dataset.select(range(10)).to_dict()

print("Dataset Rows:", len(json_data['id']))
print({key: json_data[key][0] for key in json_data})

# Function to format the input for the model
def format_input(context, question):
    return (
        "### Context:\n" + context +
        ("\n\n### Question:\n" + question if question else "")
    )

# Initialize the Ollama client
client = ollama.Client()  # Replace with your actual API key if required

# Initialize list to store Alpaca format data
alpaca_data = []

# Process each entry in the dataset
for i in range(len(json_data['id'])):
    context = json_data['context'][i]
    question = json_data['question'][i]
    original_answer = json_data['answers'][i]['text'][0] if json_data['answers'][i]['text'] else "No answer"

    print("Original Answer:", original_answer)

    prompt_text = format_input(context, question)

    prompt = (
        f"Rewrite `{prompt_text}` output to be concise and clear: {original_answer}. "
        "Ensure the response is easy to understand, professional and as a full sentence. Just respond only with the Answer"
    )

    response = client.generate(
        model="llama3.1",
        prompt=prompt,
        options={"seed": 123, "temperature": 0}
    )
    improved_answer = response['response']
    print("Improved Answer:", improved_answer)

    # Create Alpaca format entry
    alpaca_entry = {
        "instruction": "Answer the following question based on the given context.",
        "input": f"Context: {context}\n\nQuestion: {question}",
        "output": improved_answer
    }
    alpaca_data.append(alpaca_entry)

# Save in Alpaca format
with open("alpaca_dataset.json", "w") as file:
    json.dump(alpaca_data, file, indent=4)

print("Alpaca format dataset saved as 'alpaca_dataset.json'")
```

### <font style="color:rgb(55, 53, 47);">qLoRA优势</font>

<font style="color:rgb(55, 53, 47);">qLoRA是一种高效的微调技术,具有以下几个主要优点:</font>

1. <font style="color:rgb(55, 53, 47);">显著降低内存需求:\ </font><font style="color:rgb(55, 53, 47);">qLoRA通过量化模型参数并仅训练低秩适应矩阵,大大减少了内存使用。这使得在消费级GPU上微调大型模型成为可能。
   </font>
2. <font style="color:rgb(55, 53, 47);">保持模型性能:\ </font><font style="color:rgb(55, 53, 47);">尽管使用了量化技术,qLoRA仍能保持接近全精度微调的性能。在许多任务中,qLoRA微调的模型表现可以与全参数微调相媲美。
   </font>
3. <font style="color:rgb(55, 53, 47);">加快训练速度:\ </font><font style="color:rgb(55, 53, 47);">由于减少了需要更新的参数数量,qLoRA可以加快微调过程,节省时间和计算资源。
   </font>
4. <font style="color:rgb(55, 53, 47);">适用于各种规模的模型:\ </font><font style="color:rgb(55, 53, 47);">qLoRA技术可以应用于从较小到非常大的语言模型,具有良好的可扩展性。
   </font>
5. <font style="color:rgb(55, 53, 47);">便于部署和共享:\ </font><font style="color:rgb(55, 53, 47);">qLoRA微调后的模型更小,更容易部署和分享,特别适合资源受限的环境。
   </font>
6. <font style="color:rgb(55, 53, 47);">支持增量学习:\ </font><font style="color:rgb(55, 53, 47);">qLoRA允许在不影响原始预训练权重的情况下进行微调,有利于模型的持续更新和适应。
   </font>


> 更新: 2024-08-02 14:27:49  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/gvgwulm6v9i66rc9>