# Claude Code Hooks：自動環境設定＋手機推播通知【進階篇】



```powershell
param(
    [string]$jsonInput
)

# ========================
# 1. 解析输入
# ========================
try {
    if (-not $jsonInput) {
        $jsonInput = $input | Out-String
    }

    $data = $jsonInput | ConvertFrom-Json -ErrorAction Stop

    $title = if ($data.title) { $data.title } else { "Claude Code" }
    $message = if ($data.message) { $data.message } else { "需要你的注意" }
    $type = if ($data.type) { $data.type } else { "info" }

} catch {
    $title = "Claude Code"
    $message = "收到通知（解析失败）"
    $type = "info"
}

# ========================
# 2. 不同类型处理（可扩展）
# ========================
switch ($type) {
    "success" { $title = "✅ $title" }
    "error"   { $title = "❌ $title" }
    "warn"    { $title = "⚠️ $title" }
    default   { }
}

# ========================
# 3. Windows Toast 初始化
# ========================
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null

$template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02
$xml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($template)

# ⚠️ 关键：转数组避免崩溃
$nodes = @($xml.GetElementsByTagName("text"))

if ($nodes.Count -ge 2) {
    $nodes[0].AppendChild($xml.CreateTextNode($title)) | Out-Null
    $nodes[1].AppendChild($xml.CreateTextNode($message)) | Out-Null
}

# ========================
# 4. 发送通知
# ========================
$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("Claude Code")

$notifier.Show($toast)
```



> 更新: 2026-04-07 14:56:27  
> 原文: <https://www.yuque.com/lixinsi/ughw43/ym2iahop0c6yg8h8>