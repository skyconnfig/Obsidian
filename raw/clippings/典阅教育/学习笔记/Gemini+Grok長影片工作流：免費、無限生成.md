# Gemini + Grok 長影片工作流：免費、無限生成

**<font style="color:#000000;">本工作流旨在利用 Gemini 撰寫連貫腳本，並使用 Grok 和其他輔助工具（如即夢）製作出角色和場景一致的長動畫影片。</font>**

---

## **<font style="color:#000000;">步驟一：Gemini 寫腳本</font>**
**<font style="color:#000000;">有兩種方法可以實現</font>**

### **<font style="color:#000000;">直接描述故事</font>**
**<font style="color:#000000;">直接在 Gemini 輸入框中描述故事風格、場景數量和內容。</font>**

**<font style="color:#000000;">示例提示詞：</font>**

**<font style="color:#000000;">“幫我寫個腳本，皮克斯動畫風格，包含12個場景，描述兩個小孩子在農場裡快樂的生活。” </font>**_**<font style="color:#000000;">Gemini 會直接給你一個包含角色設定、場景設定和完整的場景描述的腳本。</font>**_

### **<font style="color:#000000;">打造專屬 Gem（智能體）</font>**
**<font style="color:#000000;">為了免去一遍遍調整的麻煩，建議打造一個專門寫腳本的 </font>****<font style="color:#000000;">Gem</font>****<font style="color:#000000;">。</font>**

1. **<font style="color:#000000;">打開 Gemini，點擊左側工具欄的 </font>****<font style="color:#000000;">Gem</font>****<font style="color:#000000;">，選擇 </font>****<font style="color:#000000;">“新建Gem”</font>****<font style="color:#000000;">。</font>**
2. **<font style="color:#000000;">命名 Gem（例如：“長影片創作大師”）。</font>**
3. **<font style="color:#000000;">將以下</font>****<font style="color:#000000;">提示詞（指令）粘貼到 </font>****<font style="color:#000000;">Gem 的</font>****<font style="color:#000000;">“指令”</font>****<font style="color:#000000;">區域，並點擊保存。</font>**

#### **<font style="color:#000000;">💡</font>****<font style="color:#000000;"> </font>**[<u><font style="color:#1155cc;background-color:transparent;">核心 Gem 指令 / 提示詞</font></u>](https://docs.google.com/document/d/1_RJKTkk_E-iPmrWaKJTSX65lA58xsikMfGD-s2bk0zE/edit?hl=fr&tab=t.0)<font style="color:#666666;">（點擊鏈接即可獲得）</font>
+ **<font style="color:#000000;">你可以根據自己的需求修改提示詞，但注意保證場景銜接的連貫性，在指令中加入：“</font>****<font style="color:#000000;">必須保證場景和場景之間銜接的連貫性，以便最終形成完整的長影片視覺上不能有跳躍感</font>****<font style="color:#000000;">”。</font>**

---

## **<font style="color:#000000;">步驟二：Grok 製作視頻</font>**
1. **<font style="color:#000000;">生成並下載角色圖片：</font>****<font style="color:#000000;"> 在 Grok 側邊欄找到 </font>****<font style="color:#000000;">image</font>****<font style="color:#000000;">，切換到**“圖片”</font>****<font style="color:#000000;">，粘貼 Gemini 的</font>****<font style="color:#000000;">角色提示詞</font>****<font style="color:#000000;">生成圖片，並將滿意的角色圖片</font>****<font style="color:#000000;">下載保存**。</font>**
2. **<font style="color:#000000;">【重要設置】關閉自動生成視頻：</font>****<font style="color:#000000;"> 生成場景前，先</font>****<font style="color:#000000;">關閉</font>****<font style="color:#000000;">設置裡的 </font>****<font style="color:#000000;">“開啟自動生成視頻”</font>****<font style="color:#000000;">。</font>**
3. **<font style="color:#000000;">製作場景視頻（保持角色一致性）：</font>****<font style="color:#000000;"> 解決畫面中角色不一致的問題。</font>**
    - **<font style="color:#000000;">解決方法：</font>****<font style="color:#000000;"> 在 Grok 輸入框裡，</font>****<font style="color:#000000;">上傳</font>****<font style="color:#000000;">您保存的</font>****<font style="color:#000000;">角色圖片</font>****<font style="color:#000000;">，然後</font>****<font style="color:#000000;">再粘貼場景描述</font>****<font style="color:#000000;">，即可生成包含固定角色的視頻。</font>**

---

## **<font style="color:#000000;">步驟三：優化場景畫面</font>**
**<font style="color:#000000;">由於我們上傳的是已經包含場景環境的角色圖片（比如一個身處大自然中的小女孩），此時再粘貼場景提示詞給 Grok 時，會出現生成的視頻不符合場景描述的情況（畫面會接著身處戶外的小女孩延續，沒辦法直接修改為室內環境、但角色不變）。</font>**

**<font style="color:#000000;">這時則需要使用輔助工具，在固定角色設定的基礎上修改場景圖片。</font>**

1. **<font style="color:#000000;">使用作圖工具生成場景圖：</font>****<font style="color:#000000;"> 選擇即夢、Canva 或 Nanobanana 等你喜歡的作圖工具。</font>**
    - **<font style="color:#000000;">操作：</font>****<font style="color:#000000;"> 上傳保存的</font>****<font style="color:#000000;">角色圖片</font>****<font style="color:#000000;">，下達指令“根據我上傳的角色圖，生成場景一的場景圖”</font>****<font style="color:#000000;">，並粘貼</font>****<font style="color:#000000;">場景描述。</font>**
    - _**<font style="color:#000000;">提示：可以同時上傳多個角色的圖片，並在描述中優化場景細節，確保多角色同時出現。</font>**_
2. **<font style="color:#000000;">回到 Grok 製作視頻：</font>**
    - **<font style="color:#000000;">將作圖工具生成的</font>****<font style="color:#000000;">優化後場景圖</font>****<font style="color:#000000;">上傳到 Grok 輸入框。</font>**
    - **<font style="color:#000000;">再複製</font>****<font style="color:#000000;">場景一的畫面描述，依據此圖生成視頻。</font>**
    - _**<font style="color:#000000;">提示：為方便後期配音，可在描述中加入</font>**__**<font style="color:#000000;">口型變化的細節描述</font>**__**<font style="color:#000000;">。</font>**_

---

## **<font style="color:#000000;">步驟四：重複步驟，局部優化</font>**
**  
**

1. **<font style="color:#000000;">保持場景連貫性（畫面、動作銜接）</font>****<font style="color:#000000;">：</font>**

**<font style="color:#000000;">當腳本沒有出現新的場景變化時，你可以直接在 Grok 的輸入框裡依次完成。只要不退出輸入框重新操作，Grok 會保持場景一致性。</font>**

+ **<font style="color:#000000;">如果你不止想要場景一致、還需要人物的動作前後銜接、避免剪輯時的跳躍感，</font>****<font style="color:#000000;">只需要做如下動作：</font>**

**<font style="color:#000000;">回到上一個視頻，</font>****<font style="color:#000000;">複製最後一幀畫面</font>****<font style="color:#000000;">。將它</font>****<font style="color:#000000;">粘貼給 Grok image 的輸入框</font>****<font style="color:#000000;">，</font>****<font style="color:#000000;">再輸入新的描述</font>****<font style="color:#000000;">（例如：改變角色的動作）。</font>**

1. **<font style="color:#000000;">製作新場景：</font>**
    - **<font style="color:#000000;">當故事出現</font>****<font style="color:#000000;">新的場景</font>****<font style="color:#000000;">時，</font>****<font style="color:#000000;">重複步驟三</font>****<font style="color:#000000;">：用作圖工具（如即夢）生成包含固定角色的新場景圖。</font>**
    - **<font style="color:#000000;">回到 Grok 生成視頻，可嘗試 Grok 自帶的 </font>****<font style="color:#000000;">Fun 模式</font>****<font style="color:#000000;">，有時會生成更富卡通感的有趣畫面。</font>**
2. **<font style="color:#000000;">重複與優化：</font>****<font style="color:#000000;"> 依次重複：</font>****<font style="color:#000000;">製作場景圖 → 回到 Grok 生成場景視頻</font>****<font style="color:#000000;"> → 用修改描述詞的方式</font>****<font style="color:#000000;">優化細節</font>****<font style="color:#000000;">。</font>**

---

## **<font style="color:#000000;">步驟五：後期製作</font>**
1. **<font style="color:#000000;">導入素材：</font>****<font style="color:#000000;"> 將全部視頻導入到剪映等編輯軟體。</font>**
2. **<font style="color:#000000;">配音：</font>****<font style="color:#000000;"> 可使用 </font>****<font style="color:#000000;">Minimax</font>****<font style="color:#000000;"> 設計動畫角色的音色，或在剪映裡自己配音後再替換成童音（方便對軌）。</font>**
3. **<font style="color:#000000;">配樂：</font>****<font style="color:#000000;"> 可使用 </font>****<font style="color:#000000;">AI 工具</font>****<font style="color:#000000;">（如 Minimax），描述歡快、充滿動畫感的歌曲風格，並輸入想要的歌詞來生成。</font>**
4. **<font style="color:#000000;">最終調整：</font>****<font style="color:#000000;"> 在剪映裡對齊音軌、調整畫面色調和清晰度。</font>**
5. **<font style="color:#000000;">導出：</font>****<font style="color:#000000;"> 用高清模式導出。</font>**

**  
**



> 更新: 2026-01-28 16:46:58  
> 原文: <https://www.yuque.com/lixinsi/yh04az/icd2pc115zpkxlrv>