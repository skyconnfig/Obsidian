# theajack/disable-devtool — 禁用浏览器开发者工具

> 来源：`theajack/disable-devtool` GitHub 仓库 README
> 用途：在线考试/比赛系统防作弊 — 一行代码禁用 F12、右键菜单、Ctrl+Shift+I 等开发者工具入口

---

## 简介

[disable-devtool](https://github.com/theajack/disable-devtool) 是一个轻量级的前端安全工具库，**一行代码即可禁用所有进入浏览器开发者工具的途径**。在典阅教育的在线考试/比赛场景中，此工具可用于防止考生通过控制台作弊或查看源码。

## 核心特性

| 特性 | 说明 |
|------|------|
| 快捷键禁用 | F12、Ctrl+Shift+I、Ctrl+Shift+J、Ctrl+U 等 |
| 右键菜单禁用 | 可配置是否禁用右键 |
| 菜单栏检测 | 识别从浏览器菜单手动打开 DevTools，自动关闭/跳转页面 |
| 多探测器 | 8 种检测模式覆盖几乎所有浏览器（Chrome、Firefox、Edge、360、QQ 等） |
| 绕过机制 | 支持通过 URL 参数 + MD5 加密白名单绕过（管理员调试用） |
| 移动端适配 | 识别真移动端 vs 伪造移动端，节省性能 |
| 关闭事件 | 支持监听开发者工具关闭回调 |
| 第三方调试检测 | 识别 eruda、vconsole 等调试工具 |

## 快速使用

### npm 方式

```bash
npm i disable-devtool
```

```javascript
import DisableDevtool from 'disable-devtool';
DisableDevtool();
```

### Script 标签方式

```html
<script disable-devtool-auto src='https://cdn.jsdelivr.net/npm/disable-devtool'></script>
```

## 配置选项

```javascript
DisableDevtool({
  md5: 'xxx',              // 绕过禁用的 md5 值，管理员调试用
  url: 'https://...',      // 关闭页面失败时的跳转地址
  ondevtoolopen(type, next) {
    // 开发者工具打开时的回调，可做数据上报
    next();                // 关闭当前窗口
  },
  ondevtoolclose() {
    // 开发者工具关闭时的回调
  },
  interval: 200,           // 检测间隔（ms）
  disableMenu: true,       // 禁用右键菜单
  clearLog: true,          // 每次清除控制台日志
  disableSelect: false,    // 禁用文本选择
  disableCopy: false,      // 禁用复制
  disableCut: false,       // 禁用剪切
  disablePaste: false,     // 禁用粘贴
  ignore: ['/user/login'], // 某些路径忽略禁用（管理员页面）
})
```

## 在典阅场景中的应用

在线考试/比赛系统中，**前端安全是防止作弊的第一道防线**：

1. **防 F12 查看接口请求**：防止考生通过 Network 面板分析后端接口
2. **防控制台执行脚本**：防止考生通过 Console 修改答题状态
3. **防查看源码**：防止考生下载前端源码分析业务逻辑
4. **管理员绕过**：通过 URL 参数 `?ddtk=密钥` 临时禁用保护，方便调试

## 相关工具

- [[../部署运维实战经验|部署运维实战经验]] §5.2 源代码泄漏防护
- [[../运维技术|运维技术]] §5 安全防护与漏洞修复
