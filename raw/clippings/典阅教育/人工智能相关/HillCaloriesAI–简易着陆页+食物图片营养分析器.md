# Hill Calories AI – 简易着陆页 + 食物图片营养分析器

技术栈  

Lovable: [https://lovable.dev/](https://lovable.dev/)  

n8n: [https://n8n.io/](https://n8n.io/)  



Lovable 提示 - 创建应用  

项目：Hill Calories AI – 简易着陆页 + 食物图片营养分析器  

目标：构建一个快速、移动优先的着陆页，用户可上传（或拍摄）一餐照片，并通过 POST 请求即时获取宏量营养素分析数据（蛋白质、碳水化合物、脂肪）。保持界面简洁、美观且可直接上线。  



使用 ChatGPT 修复设计问题  

批评这个网页设计并告诉我如何改进。请用一段话回答。  



Lovable - 如何处理图片上传  

当用户提交图片后，分析该餐食内容，并将图片发送至以下 Webhook：  

[https://n8n.hillfusion.com/webhook-test/hill-cal-ai](https://n8n.hillfusion.com/webhook-test/hill-cal-ai)  

收到响应后，请将其显示给用户。  



以下是一个示例响应 JSON：  

[  

```plain
  {  
    "output": {  
      "status": "success",  
      "food": [  
        {  
          "name": "烤鸡胸肉",  
          "quantity": "150克",  
          "calories": 248,  
          "protein": 46,  
          "carbs": 0,  
          "fat": 5.3  
        },  
        {  
          "name": "樱桃番茄",  
          "quantity": "100克",  
          "calories": 18,  
          "protein": 0.9,  
          "carbs": 3.9,  
          "fat": 0.2  
        },  
        {  
          "name": "切碎的胡萝卜",  
          "quantity": "100克",  
          "calories": 41,  
          "protein": 0.9,  
          "carbs": 10,  
          "fat": 0.2  
        },  
        {  
          "name": "青豆",  
          "quantity": "100克",  
          "calories": 31,  
          "protein": 1.8,  
          "carbs": 7,  
          "fat": 0.1  
        },  
        {  
          "name": "猕猴桃",  
          "quantity": "80克",  
          "calories": 42,  
          "protein": 0.8,  
          "carbs": 10.1,  
          "fat": 0.4  
        },  
        {  
          "name": "苹果片",  
          "quantity": "100克",  
          "calories": 52,  
          "protein": 0.3,  
          "carbs": 14,  
          "fat": 0.2  
        },  
        {  
          "name": "混合浆果（黑莓、蓝莓）",  
          "quantity": "50克",  
          "calories": 29,  
          "protein": 0.4,  
          "carbs": 7,  
          "fat": 0.3  
        },  
        {  
          "name": "柠檬角",  
          "quantity": "20克",  
          "calories": 6,  
          "protein": 0.1,  
          "carbs": 2,  
          "fat": 0  
        }  
      ],  
      "total": {  
        "calories": 467,  
        "protein": 51.2,  
        "carbs": 54,  
        "fat": 6.7  
      }  
    }  
  }  
]  
```



n8n 智能体提示  

分析这张图片中的菜肴，并提供详细的营养成分分解，包括估算的热量、宏量营养素（蛋白质、碳水化合物、脂肪），以及任何显著的微量营养素或健康建议。  



```plain
n8n 智能体格式  
{  
  "status": "success",  
  "food": [  
    {  
      "name": "烤鸡胸肉",  
      "quantity": "150克",  
      "calories": 240,  
      "protein": 45,  
      "carbs": 0,  
      "fat": 5  
    },  
    {  
      "name": "清蒸西兰花",  
      "quantity": "100克",  
      "calories": 35,  
      "protein": 3,  
      "carbs": 7,  
      "fat": 0  
    }  
  ],  
  "total": {  
    "calories": 275,  
    "protein": 48,  
    "carbs": 7,  
    "fat": 5  
  }  
}
```



> 更新: 2025-09-16 16:09:53  
> 原文: <https://www.yuque.com/lixinsi/ynhoz5/lmnqth79w77rgs5h>