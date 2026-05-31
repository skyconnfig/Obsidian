# CCpane编译以及开发

```bash
```

✅ cc-pane 完整兼容开发方案（含上下文自动清理准则）

```

---

## 🏗️ 整体兼容架构设计

```

┌─────────────────────────────────────────────────────────────────┐
│                    cc-panes + 智能体增强架构                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  🎨 前端层 (src/)                                        │   │
│  │  • React 19 + TypeScript + Zustand 5                    │   │
│  │  • 新增:                                                 │   │
│  │    ├── components/agent/          # 智能体控制面板        │   │
│  │    ├── components/context/        # Viking上下文浏览器   │   │
│  │    ├── components/search/         # 17引擎搜索面板       │   │
│  │    ├── stores/agentStore.ts       # 智能体状态管理       │   │
│  │    ├── services/agent.ts          # Tauri invoke封装     │   │
│  │    └── utils/contextManager.ts    # ← 核心:上下文管理器  │   │
│  └────────────────┬────────────────────────────────────────┘   │
│                   │ Tauri IPC (invoke/listen)                  │
│                   ▼                                             │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  🔌 Tauri 后端层 (src-tauri/)                            │   │
│  │  • Rust + Tokio + rusqlite                              │   │
│  │  • 新增:                                                 │   │
│  │    ├── commands/                                         │   │
│  │    │   ├── agent\_commands.rs    # 智能体闭环命令         │   │
│  │    │   ├── viking\_commands.rs   # Viking上下文命令      │   │
│  │    │   └── search\_commands.rs   # 多搜索引擎命令        │   │
│  │    ├── services/                                         │   │
│  │    │   ├── agent\_service.rs     # 智能体业务逻辑         │   │
│  │    │   ├── context\_service.rs   # ← 核心:上下文管理服务  │   │
│  │    │   └── search\_service.rs    # 搜索聚合服务          │   │
│  │    └── crates/ (workspace members)                       │   │
│  │        ├── cc-agent/            # 多智能体蜂群核心       │   │
│  │        └── cc-viking/           # OpenViking适配器       │   │
│  └────────────────┬────────────────────────────────────────┘   │
│                   │                                             │
│                   ▼                                             │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  💾 数据持久层                                           │   │
│  │  • SQLite (现有) + 新增:                                 │   │
│  │    ├── contexts.db   # Viking上下文索引                 │   │
│  │    ├── memories.db   # Agent记忆/最佳实践               │   │
│  │    └── searches.db   # 搜索历史缓存 (LRU)               │   │
│  └─────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘

````

---

## 🔑 核心准则实现：上下文自动清理机制

### 📄 创建 `src/utils/contextManager.ts` (前端)

```typescript
// src/utils/contextManager.ts
/**
 * 上下文长度管理器
 * 准则：当上下文开发满了 → 自动 /clear 检索历史 → 接着开发
 */

// 配置常量
export const CONTEXT_CONFIG = {
  // 上下文长度阈值 (按字符/token估算)
  MAX_CONTEXT_CHARS: 120_000,      // ~30k tokens (Claude 上下文)
  WARNING_THRESHOLD: 0.85,         // 85% 时预警
  CLEAR_THRESHOLD: 0.95,           // 95% 时自动清理
  
  // 清理策略
  CLEAR_STRATEGY: {
    keep_recent_sessions: 3,       // 保留最近3个会话
    keep_high_relevance: true,     // 保留高相关性检索结果
    compress_old_messages: true,   // 压缩旧消息为摘要
  },
  
  // 检索历史管理
  SEARCH_HISTORY: {
    max_items: 50,                 // 最多保留50条检索记录
    ttl_hours: 24,                 // 24小时后自动过期
  }
}

// 上下文状态
export interface ContextState {
  currentLength: number           // 当前已用字符数
  tokenEstimate: number           // 估算token数
  messages: ContextMessage[]      // 消息历史
  retrievedItems: RetrievedItem[] // 检索结果缓存
  lastClearedAt?: string          // 上次清理时间
}

export interface ContextMessage {
  id: string
  role: 'user' | 'assistant' | 'system'
  content: string
  timestamp: number
  metadata?: {
    source?: string      // 'chat' | 'retrieval' | 'code'
    relevance?: number   // 相关性分数 (检索结果)
    compressed?: boolean // 是否已压缩
  }
}

// 上下文管理器类
export class ContextManager {
  private state: ContextState
  private listeners: Array<(state: ContextState) => void> = []
  
  constructor(initialState?: Partial<ContextState>) {
    this.state = {
      currentLength: 0,
      tokenEstimate: 0,
      messages: [],
      retrievedItems: [],
      ...initialState
    }
  }
  
  /**
   * 添加消息并检查上下文长度
   * @returns 是否触发了自动清理
   */
  async addMessage(msg: Omit<ContextMessage, 'id' | 'timestamp'>): Promise<{ triggered: boolean; clearedCount?: number }> {
    const newMsg: ContextMessage = {
      ...msg,
      id: crypto.randomUUID(),
      timestamp: Date.now()
    }
    
    // 估算新增长度 (简单: 字符数 * 1.3 ≈ tokens)
    const addedLength = newMsg.content.length
    const projectedLength = this.state.currentLength + addedLength
    const utilization = projectedLength / CONTEXT_CONFIG.MAX_CONTEXT_CHARS
    
    // 检查是否需要自动清理
    if (utilization >= CONTEXT_CONFIG.CLEAR_THRESHOLD) {
      console.warn(`⚠️ Context utilization ${Math.round(utilization * 100)}% - triggering auto-clear`)
      const result = await this.autoClear()
      this.state.messages.push(newMsg)
      this.state.currentLength = this.calculateCurrentLength()
      this.notify()
      return { triggered: true, clearedCount: result.clearedCount }
    }
    
    // 预警但不清理
    if (utilization >= CONTEXT_CONFIG.WARNING_THRESHOLD) {
      console.warn(`⚡ Context utilization ${Math.round(utilization * 100)}% - approaching limit`)
      // 可触发UI预警
    }
    
    // 正常添加
    this.state.messages.push(newMsg)
    this.state.currentLength += addedLength
    this.state.tokenEstimate = Math.round(this.state.currentLength * 1.3)
    this.notify()
    
    return { triggered: false }
  }
  
  /**
   * 自动清理策略：/clear 检索历史 + 压缩旧消息
   */
  async autoClear(): Promise<{ clearedCount: number; strategy: string }> {
    const { keep_recent_sessions, keep_high_relevance, compress_old_messages } = CONTEXT_CONFIG.CLEAR_STRATEGY
    
    let clearedCount = 0
    
    // 1. 清理低相关性检索结果 (保留高相关)
    if (keep_high_relevance) {
      const before = this.state.retrievedItems.length
      this.state.retrievedItems = this.state.retrievedItems.filter(
        item => (item.metadata?.relevance ?? 0) >= 0.7
      )
      clearedCount += before - this.state.retrievedItems.length
      console.log(`🗑️ Cleared ${before - this.state.retrievedItems.length} low-relevance retrievals`)
    }
    
    // 2. 压缩旧消息为摘要 (保留最近会话)
    if (compress_old_messages) {
      const cutoffIndex = Math.max(0, this.state.messages.length - (keep_recent_sessions * 10))
      const toCompress = this.state.messages.slice(0, cutoffIndex)
      
      if (toCompress.length > 0) {
        // 调用后端压缩服务
        const summary = await this.compressMessages(toCompress)
        
        // 替换为摘要消息
        this.state.messages = [
          {
            id: crypto.randomUUID(),
            role: 'system',
            content: `[上下文摘要] ${summary}`,
            timestamp: Date.now(),
            meta { source: 'compression', compressed: true }
          },
          ...this.state.messages.slice(cutoffIndex)
        ]
        clearedCount += toCompress.length - 1 // -1 因为保留了摘要
        console.log(`🗜️ Compressed ${toCompress.length} messages into summary`)
      }
    }
    
    // 3. 清理过期检索历史 (按TTL)
    const now = Date.now()
    const ttlMs = CONTEXT_CONFIG.SEARCH_HISTORY.ttl_hours * 60 * 60 * 1000
    const beforeHist = this.state.retrievedItems.length
    this.state.retrievedItems = this.state.retrievedItems.filter(
      item => (now - (item.metadata?.timestamp ?? 0)) < ttlMs
    )
    clearedCount += beforeHist - this.state.retrievedItems.length
    
    // 更新状态
    this.state.currentLength = this.calculateCurrentLength()
    this.state.tokenEstimate = Math.round(this.state.currentLength * 1.3)
    this.state.lastClearedAt = new Date().toISOString()
    
    // 触发 /clear 命令到后端 (同步检索历史)
    await this.invokeClearCommand()
    
    this.notify()
    return { clearedCount, strategy: 'auto-clear-v1' }
  }
  
  /**
   * 压缩消息为摘要 (调用后端LLM服务)
   */
  private async compressMessages(messages: ContextMessage[]): Promise<string> {
    try {
      // 调用Tauri命令: agent_compress_context
      const { invoke } = await import('@tauri-apps/api/core')
      const result = await invoke<{ summary: string }>('agent_compress_context', {
        messages: messages.map(m => ({ role: m.role, content: m.content })),
        max_tokens: 500
      })
      return result.summary
    } catch (err) {
      // 降级: 简单截取
      const combined = messages.map(m => m.content).join('\n')
      return combined.slice(0, 1000) + '...[compressed]'
    }
  }
  
  /**
   * 调用后端 /clear 命令同步清理
   */
  private async invokeClearCommand(): Promise<void> {
    try {
      const { invoke } = await import('@tauri-apps/api/core')
      await invoke('agent_clear_retrieval_history', {
        keep_recent: CONTEXT_CONFIG.CLEAR_STRATEGY.keep_recent_sessions,
        keep_high_relevance: CONTEXT_CONFIG.CLEAR_STRATEGY.keep_high_relevance
      })
    } catch (err) {
      console.warn('Failed to sync clear command to backend:', err)
    }
  }
  
  /**
   * 计算当前上下文长度
   */
  private calculateCurrentLength(): number {
    return this.state.messages.reduce((sum, m) => sum + m.content.length, 0) +
           this.state.retrievedItems.reduce((sum, i) => sum + (i.l1_content?.length ?? 0), 0)
  }
  
  /**
   * 手动执行 /clear 命令
   */
  async manualClear(reason?: string): Promise<void> {
    console.log(`🧹 Manual clear triggered${reason ? `: ${reason}` : ''}`)
    await this.autoClear()
    // 可添加用户反馈
  }
  
  /**
   * 订阅状态变化
   */
  subscribe(listener: (state: ContextState) => void): () => void {
    this.listeners.push(listener)
    return () => {
      this.listeners = this.listeners.filter(l => l !== listener)
    }
  }
  
  /**
   * 通知所有监听器
   */
  private notify(): void {
    for (const listener of this.listeners) {
      listener(this.state)
    }
  }
  
  /**
   * 获取当前状态
   */
  getState(): ContextState {
    return { ...this.state }
  }
}

// 单例导出
export const contextManager = new ContextManager()
````

***

### 🦀 创建 <code>src-tauri/src/services/context_service.rs</code> (后端)

```rust
// src-tauri/src/services/context_service.rs
//! 上下文管理服务 - 实现自动清理准则

use crate::models::context::{ContextMessage, ContextConfig, ClearStrategy};
use crate::repository::context_repo::ContextRepository;
use cc_agent::context::viking_adapter::{VikingClient, RetrievalResult};
use rusqlite::Connection;
use std::sync::Arc;
use tokio::sync::RwLock;

pub struct ContextService {
    repo: Arc<ContextRepository>,
    viking: Arc<VikingClient>,
    config: ContextConfig,
    // 内存缓存: session_id -> 上下文状态
    session_cache: RwLock<HashMap<String, SessionContext>>,
}

impl ContextService {
    pub fn new(
        db: Arc<Connection>,
        viking: Arc<VikingClient>,
        config: ContextConfig,
    ) -> Self {
        Self {
            repo: Arc::new(ContextRepository::new(db)),
            viking,
            config,
            session_cache: RwLock::new(HashMap::new()),
        }
    }
    
    /// 添加消息并检查是否触发自动清理
    pub async fn add_message(
        &self,
        session_id: &str,
        message: ContextMessage,
    ) -> Result<AddMessageResult, AppError> {
        let mut cache = self.session_cache.write().await;
        let session = cache.entry(session_id.to_string())
            .or_insert_with(|| SessionContext::new(&self.config));
        
        // 估算新增长度
        let added_chars = message.content.len();
        let projected = session.current_chars + added_chars;
        let utilization = projected as f32 / self.config.max_chars as f32;
        
        // 检查自动清理阈值
        if utilization >= self.config.clear_threshold {
            warn!("Session {} at {}% - triggering auto-clear", 
                  session_id, (utilization * 100.0) as u32);
            
            let clear_result = self.auto_clear_session(session_id, session).await?;
            
            // 添加新消息
            session.messages.push(message);
            session.current_chars = session.calculate_current_length();
            
            // 持久化
            self.repo.save_session(session_id, session).await?;
            
            return Ok(AddMessageResult {
                success: true,
                triggered_clear: true,
                cleared_count: clear_result.cleared_count,
                new_utilization: session.utilization(),
            });
        }
        
        // 预警
        if utilization >= self.config.warning_threshold {
            warn!("Session {} at {}% - approaching limit", 
                  session_id, (utilization * 100.0) as u32);
        }
        
        // 正常添加
        session.messages.push(message);
        session.current_chars += added_chars;
        session.token_estimate = (session.current_chars as f32 * 1.3) as usize;
        
        // 异步持久化 (不阻塞)
        let repo_clone = self.repo.clone();
        let session_clone = session.clone();
        let sid = session_id.to_string();
        tokio::spawn(async move {
            let _ = repo_clone.save_session(&sid, &session_clone).await;
        });
        
        Ok(AddMessageResult {
            success: true,
            triggered_clear: false,
            cleared_count: 0,
            new_utilization: session.utilization(),
        })
    }
    
    /// 自动清理策略实现
    async fn auto_clear_session(
        &self,
        session_id: &str,
        session: &mut SessionContext,
    ) -> Result<ClearResult, AppError> {
        let mut cleared_count = 0;
        let strategy = &self.config.clear_strategy;
        
        // 1. 清理低相关性检索结果
        if strategy.keep_high_relevance {
            let before = session.retrieved_items.len();
            session.retrieved_items.retain(|item| {
                item.metadata.as_ref()
                    .and_then(|m| m.relevance)
                    .unwrap_or(0.0) >= 0.7
            });
            cleared_count += before - session.retrieved_items.len();
            info!("Cleared {} low-relevance retrievals", cleared_count);
        }
        
        // 2. 压缩旧消息
        if strategy.compress_old_messages {
            let cutoff = session.messages.len()
                .saturating_sub(strategy.keep_recent_sessions * 10);
            
            if cutoff > 0 {
                let to_compress: Vec<_> = session.messages.drain(0..cutoff).collect();
                
                // 调用LLM生成摘要
                match self.compress_messages(&to_compress).await {
                    Ok(summary) => {
                        session.messages.insert(0, ContextMessage {
                            id: uuid::Uuid::new_v4().to_string(),
                            role: "system".into(),
                            content: format!("[上下文摘要] {}", summary),
                            timestamp: chrono::Utc::now(),
                            metadata: Some(ContextMetadata {
                                source: Some("compression".into()),
                                compressed: Some(true),
                                ..Default::default()
                            }),
                        });
                        cleared_count += to_compress.len() - 1;
                        info!("Compressed {} messages into summary", to_compress.len());
                    }
                    Err(e) => {
                        warn!("Compression failed: {}, using fallback", e);
                        // 降级: 简单截取
                        let fallback = to_compress.iter()
                            .map(|m| &m.content)
                            .collect::<Vec<_>>()
                            .join("\n")
                            .chars()
                            .take(1000)
                            .collect::<String>();
                        session.messages.insert(0, ContextMessage {
                            id: uuid::Uuid::new_v4().to_string(),
                            role: "system".into(),
                            content: format!("[摘要] {}...", fallback),
                            timestamp: chrono::Utc::now(),
                            metadata: Some(ContextMetadata {
                                source: Some("fallback".into()),
                                ..Default::default()
                            }),
                        });
                    }
                }
            }
        }
        
        // 3. 清理过期检索历史 (按TTL)
        let now = chrono::Utc::now();
        let ttl = chrono::Duration::hours(self.config.search_history_ttl_hours as i64);
        let before = session.retrieved_items.len();
        session.retrieved_items.retain(|item| {
            item.metadata.as_ref()
                .and_then(|m| m.timestamp)
                .map(|ts| now.signed_duration_since(ts) < ttl)
                .unwrap_or(false)
        });
        cleared_count += before - session.retrieved_items.len();
        
        // 4. 同步清理检索历史 (调用 /clear 逻辑)
        self.clear_retrieval_history_impl(session_id, strategy).await?;
        
        // 更新统计
        session.current_chars = session.calculate_current_length();
        session.token_estimate = (session.current_chars as f32 * 1.3) as usize;
        session.last_cleared_at = Some(chrono::Utc::now());
        
        Ok(ClearResult {
            cleared_count,
            strategy: "auto-clear-v1".into(),
            new_utilization: session.utilization(),
        })
    }
    
    /// 压缩消息为摘要 (调用智能体服务)
    async fn compress_messages(&self, messages: &[ContextMessage]) -> Result<String, AppError> {
        // 调用 cc-agent 的摘要能力
        let prompt = format!(
            "请将以下对话历史压缩为一句话摘要，保留关键决策和代码变更：\n{}",
            messages.iter()
                .map(|m| format!("{}: {}", m.role, m.content.chars().take(200).collect::<String>()))
                .collect::<Vec<_>>()
                .join("\n")
        );
        
        // 使用内置agent执行摘要
        let agent = cc_agent::agent::SmartAgent::default(); // 实际应从服务获取
        let response = agent.execute(&prompt, Default::default()).await
            .map_err(|e| AppError::Internal(format!("Compression failed: {}", e)))?;
        
        Ok(response.output.chars().take(500).collect())
    }
    
    /// 实现 /clear 检索历史的核心逻辑
    async fn clear_retrieval_history_impl(
        &self,
        session_id: &str,
        strategy: &ClearStrategy,
    ) -> Result<(), AppError> {
        // 1. 从数据库清理
        self.repo.clear_retrieval_history(
            session_id,
            strategy.keep_recent_sessions as i64,
            strategy.keep_high_relevance,
        ).await?;
        
        // 2. 通知 Viking 客户端清理缓存
        self.viking.clear_session_cache(session_id).await;
        
        // 3. 记录清理事件
        self.repo.log_clear_event(session_id, "auto-clear", strategy).await?;
        
        Ok(())
    }
    
    /// 手动执行 /clear 命令
    pub async fn manual_clear(
        &self,
        session_id: &str,
        reason: Option<String>,
    ) -> Result<ClearResult, AppError> {
        info!("Manual clear for session {}: {}", session_id, reason.as_deref().unwrap_or("no reason"));
        
        let mut cache = self.session_cache.write().await;
        if let Some(session) = cache.get_mut(session_id) {
            self.auto_clear_session(session_id, session).await
        } else {
            Err(AppError::NotFound(format!("Session {} not found", session_id)))
        }
    }
    
    /// 获取会话上下文状态
    pub async fn get_session_status(&self, session_id: &str) -> Result<SessionStatus, AppError> {
        let cache = self.session_cache.read().await;
        if let Some(session) = cache.get(session_id) {
            Ok(SessionStatus {
                session_id: session_id.into(),
                current_chars: session.current_chars,
                token_estimate: session.token_estimate,
                utilization: session.utilization(),
                message_count: session.messages.len(),
                retrieval_count: session.retrieved_items.len(),
                last_cleared_at: session.last_cleared_at,
            })
        } else {
            // 从数据库加载
            if let Some(session) = self.repo.load_session(session_id).await? {
                Ok(SessionStatus {
                    session_id: session_id.into(),
                    current_chars: session.current_chars,
                    token_estimate: session.token_estimate,
                    utilization: session.utilization(),
                    message_count: session.messages.len(),
                    retrieval_count: session.retrieved_items.len(),
                    last_cleared_at: session.last_cleared_at,
                })
            } else {
                Err(AppError::NotFound(format!("Session {} not found", session_id)))
            }
        }
    }
}

#[derive(Debug, Clone)]
pub struct SessionContext {
    pub messages: Vec<ContextMessage>,
    pub retrieved_items: Vec<RetrievedItem>,
    pub current_chars: usize,
    pub token_estimate: usize,
    pub last_cleared_at: Option<chrono::DateTime<chrono::Utc>>,
    config: ContextConfig,
}

impl SessionContext {
    pub fn new(config: &ContextConfig) -> Self {
        Self {
            messages: Vec::new(),
            retrieved_items: Vec::new(),
            current_chars: 0,
            token_estimate: 0,
            last_cleared_at: None,
            config: config.clone(),
        }
    }
    
    pub fn calculate_current_length(&self) -> usize {
        self.messages.iter().map(|m| m.content.len()).sum::<usize>() +
        self.retrieved_items.iter().map(|i| i.l1_content.as_ref().map(|s| s.len()).unwrap_or(0)).sum::<usize>()
    }
    
    pub fn utilization(&self) -> f32 {
        self.current_chars as f32 / self.config.max_chars as f32
    }
}

#[derive(Debug, Serialize, Deserialize)]
pub struct AddMessageResult {
    pub success: bool,
    pub triggered_clear: bool,
    pub cleared_count: usize,
    pub new_utilization: f32,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct ClearResult {
    pub cleared_count: usize,
    pub strategy: String,
    pub new_utilization: f32,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct SessionStatus {
    pub session_id: String,
    pub current_chars: usize,
    pub token_estimate: usize,
    pub utilization: f32,  // 0.0 - 1.0
    pub message_count: usize,
    pub retrieval_count: usize,
    pub last_cleared_at: Option<chrono::DateTime<chrono::Utc>>,
}
```

***

### 🔌 Tauri 命令绑定

### 创建 <code>src-tauri/src/commands/context_commands.rs</code>

```rust
//! 上下文管理相关 Tauri 命令

use crate::services::context_service::ContextService;
use tauri::{State, Window};
use serde::{Deserialize, Serialize};

/// 添加消息 (自动触发清理检查)
#[derive(Debug, Deserialize)]
pub struct AddMessageRequest {
    pub session_id: String,
    pub role: String,  // "user" | "assistant" | "system"
    pub content: String,
    pub metadata: Option<serde_json::Value>,
}

#[derive(Debug, Serialize)]
pub struct AddMessageResponse {
    pub success: bool,
    pub triggered_clear: bool,
    pub cleared_count: Option<usize>,
    pub utilization: f32,
    pub warning: Option<String>,
}

#[tauri::command]
pub async fn context_add_message(
    service: State<'_, ContextService>,
    request: AddMessageRequest,
) -> Result<AddMessageResponse, String> {
    use crate::models::context::ContextMessage;
    
    let message = ContextMessage {
        id: uuid::Uuid::new_v4().to_string(),
        role: request.role,
        content: request.content,
        timestamp: chrono::Utc::now(),
        meta request.metadata.and_then(|v| serde_json::from_value(v).ok()),
    };
    
    let result = service.add_message(&request.session_id, message).await
        .map_err(|e| e.to_string())?;
    
    let warning = if result.new_utilization >= 0.85 {
        Some(format!("⚠️ 上下文使用率 {:.0}%", result.new_utilization * 100.0))
    } else {
        None
    };
    
    Ok(AddMessageResponse {
        success: result.success,
        triggered_clear: result.triggered_clear,
        cleared_count: if result.triggered_clear { Some(result.cleared_count) } else { None },
        utilization: result.new_utilization,
        warning,
    })
}

/// 手动执行 /clear 命令
#[derive(Debug, Deserialize)]
pub struct ClearRequest {
    pub session_id: String,
    pub reason: Option<String>,
}

#[derive(Debug, Serialize)]
pub struct ClearResponse {
    pub success: bool,
    pub cleared_count: usize,
    pub new_utilization: f32,
}

#[tauri::command]
pub async fn context_clear(
    service: State<'_, ContextService>,
    request: ClearRequest,
) -> Result<ClearResponse, String> {
    let result = service.manual_clear(&request.session_id, request.reason).await
        .map_err(|e| e.to_string())?;
    
    Ok(ClearResponse {
        success: true,
        cleared_count: result.cleared_count,
        new_utilization: result.new_utilization,
    })
}

/// 获取上下文状态
#[derive(Debug, Deserialize)]
pub struct GetStatusRequest {
    pub session_id: String,
}

#[derive(Debug, Serialize)]
pub struct GetStatusResponse {
    pub session_id: String,
    pub utilization: f32,
    pub token_estimate: usize,
    pub message_count: usize,
    pub retrieval_count: usize,
    pub status_color: String,  // "green" | "yellow" | "red"
}

#[tauri::command]
pub async fn context_get_status(
    service: State<'_, ContextService>,
    request: GetStatusRequest,
) -> Result<GetStatusResponse, String> {
    let status = service.get_session_status(&request.session_id).await
        .map_err(|e| e.to_string())?;
    
    let status_color = if status.utilization >= 0.95 {
        "red"
    } else if status.utilization >= 0.85 {
        "yellow"
    } else {
        "green"
    }.to_string();
    
    Ok(GetStatusResponse {
        session_id: status.session_id,
        utilization: status.utilization,
        token_estimate: status.token_estimate,
        message_count: status.message_count,
        retrieval_count: status.retrieval_count,
        status_color,
    })
}

/// 订阅上下文状态变化 (通过 Tauri event)
#[tauri::command]
pub async fn context_subscribe(
    window: Window,
    session_id: String,
) -> Result<(), String> {
    // 实际实现: 将 window 加入订阅列表, 状态变化时 emit 事件
    // 简化: 前端轮询或监听全局事件
    Ok(())
}
```

***

## 🎨 前端集成示例

### 创建 `src/components/context/ContextStatusBar.tsx`

```tsx
// src/components/context/ContextStatusBar.tsx
import { useEffect, useState } from 'react'
import { invoke } from '@tauri-apps/api/core'
import { listen } from '@tauri-apps/api/event'
import { Progress, Badge, Tooltip, Button } from 'antd'
import { ClearOutlined, InfoCircleOutlined } from '@ant-design/icons'
import { contextManager, CONTEXT_CONFIG } from '../../utils/contextManager'

interface ContextStatusBarProps {
  sessionId: string
  onAutoClear?: (clearedCount: number) => void
}

export function ContextStatusBar({ sessionId, onAutoClear }: ContextStatusBarProps) {
  const [utilization, setUtilization] = useState(0)
  const [tokenEstimate, setTokenEstimate] = useState(0)
  const [statusColor, setStatusColor] = useState<'green' | 'yellow' | 'red'>('green')
  const [loading, setLoading] = useState(false)

  // 订阅本地 contextManager
  useEffect(() => {
    const unsubscribe = contextManager.subscribe((state) => {
      const util = state.currentLength / CONTEXT_CONFIG.MAX_CONTEXT_CHARS
      setUtilization(util)
      setTokenEstimate(state.tokenEstimate)
      setStatusColor(util >= 0.95 ? 'red' : util >= 0.85 ? 'yellow' : 'green')
    })
    return unsubscribe
  }, [])

  // 轮询后端状态同步
  useEffect(() => {
    const fetchStatus = async () => {
      try {
        const status = await invoke<GetStatusResponse>('context_get_status', {
          request: { session_id: sessionId }
        })
        setUtilization(status.utilization)
        setTokenEstimate(status.token_estimate)
        setStatusColor(status.status_color as any)
      } catch (err) {
        console.warn('Failed to fetch context status:', err)
      }
    }
    
    fetchStatus()
    const interval = setInterval(fetchStatus, 30000) // 30秒轮询
    return () => clearInterval(interval)
  }, [sessionId])

  // 监听自动清理事件
  useEffect(() => {
    const unlisten = listen('context:auto-cleared', (event) => {
      const payload = event.payload as { session_id: string; cleared_count: number }
      if (payload.session_id === sessionId) {
        onAutoClear?.(payload.cleared_count)
        // 显示通知
        console.log(`🧹 Auto-cleared ${payload.cleared_count} items`)
      }
    })
    return () => { unlisten.then(f => f()) }
  }, [sessionId, onAutoClear])

  const handleManualClear = async () => {
    setLoading(true)
    try {
      const result = await invoke<ClearResponse>('context_clear', {
        request: { session_id, reason: 'manual-clear' }
      })
      onAutoClear?.(result.cleared_count)
      // 显示成功反馈
    } catch (err) {
      console.error('Manual clear failed:', err)
    } finally {
      setLoading(false)
    }
  }

  const getStatusText = () => {
    if (statusColor === 'red') return '⚠️ 上下文即将满载'
    if (statusColor === 'yellow') return '⚡ 上下文使用率较高'
    return '✅ 上下文充足'
  }

  return (
    <div className="context-status-bar">
      <Tooltip title={getStatusText()}>
        <Badge color={statusColor} text={
          <span className="utilization-text">
            {Math.round(utilization * 100)}% ({tokenEstimate.toLocaleString()} tokens)
          </span>
        } />
      </Tooltip>
      
      <Progress 
        percent={Math.round(utilization * 100)} 
        size="small" 
        status={statusColor === 'red' ? 'exception' : statusColor === 'yellow' ? 'active' : 'normal'}
        className="utilization-progress"
        strokeColor={statusColor === 'red' ? '#ff4d4f' : statusColor === 'yellow' ? '#faad14' : '#52c41a'}
      />
      
      <div className="actions">
        <Tooltip title="查看上下文详情">
          <Button 
            type="text" 
            size="small" 
            icon={<InfoCircleOutlined />}
            onClick={() => {/* 打开详情面板 */}}
          />
        </Tooltip>
        
        <Tooltip title={utilization >= 0.85 ? "立即清理检索历史" : "手动清理"}>
          <Button 
            type={utilization >= 0.85 ? "primary" : "text"}
            size="small"
            danger={utilization >= 0.95}
            icon={<ClearOutlined />}
            loading={loading}
            onClick={handleManualClear}
            disabled={loading}
          >
            {utilization >= 0.95 ? '紧急清理' : '清理'}
          </Button>
        </Tooltip>
      </div>
    </div>
  )
}
```

***

## 📦 Cargo.toml 工作区更新

```toml
# 根 Cargo.toml
[workspace]
resolver = "2"
members = [
  "src-tauri",
  "cc-panes-core",
  "cc-panes-api",
  "cc-panes-hook", 
  "cc-panes-web",
  "cc-memory",
  "cc-memory-mcp",
  "cc-notify",
  "cc-cli-adapters",
  # === 新增智能体相关 ===
  "crates/cc-agent",      # 多智能体蜂群核心
  "crates/cc-viking",     # OpenViking适配器
]

# crates/cc-agent/Cargo.toml (关键依赖)
[dependencies]
# 核心
tokio = { version = "1", features = ["full"] }
serde = { version = "1", features = ["derive"] }
serde_json = "1"
uuid = { version = "1", features = ["v4", "serde"] }
chrono = { version = "0.4", features = ["serde"] }
async-trait = "0.1"
tracing = "0.1"

# 网络/解析
reqwest = { version = "0.12", features = ["json", "gzip"] }
scraper = "0.19"
regex = "1"
urlencoding = "2"

# 向量检索 (可选)
faiss = { version = "0.12", optional = true }

# cc-panes 内部
cc-panes-core = { path = "../../cc-panes-core" }
cc-memory = { path = "../../cc-memory" }

[features]
default = ["local-storage"]
local-storage = []
faiss-backend = ["dep:faiss"]
```

***

## 🚀 集成验证流程

```bash
# === 1. 编译检查 ===
cargo check --workspace

# === 2. 运行上下文服务测试 ===
cargo test -p cc-panes-core context_service -- --nocapture

# === 3. 启动开发服务器 ===
cd src-tauri && cargo tauri dev

# === 4. 前端调用测试 (浏览器控制台) ===

// 测试自动清理触发
await invoke('context_add_message', {
  request: {
    session_id: 'test-session',
    role: 'user',
    content: 'A'.repeat(100000), // 大量内容触发阈值
  }
})

// 手动执行 /clear
await invoke('context_clear', {
  request: {
    session_id: 'test-session',
    reason: 'test-manual-clear'
  }
})

// 监听自动清理事件
listen('context:auto-cleared', (event) => {
  console.log('🧹 Auto-cleared:', event.payload)
})

// === 5. 端到端场景测试 ===
// 1. 启动智能体闭环开发
// 2. 持续添加代码/检索结果
// 3. 观察上下文使用率达到 95% 时自动触发 /clear
// 4. 验证开发流程无缝继续
```

***

## 📋 自动清理准则执行流程图

```
┌─────────────────────────────────────┐
│  用户/智能体添加新消息              │
└────────────┬────────────────────────┘
             ▼
┌─────────────────────────────────────┐
│  计算预估上下文利用率                │
│  utilization = (current + new) / max│
└────────────┬────────────────────────┘
             ▼
    ┌─────────────────┐
    │ utilization >= 95%? │
    └────────┬────────┘
             │
     ┌───────┴───────┐
     ▼               ▼
┌─────────┐   ┌─────────────┐
│ 正常添加 │   │ 触发自动清理 │
└─────────┘   └──────┬──────┘
                     ▼
        ┌─────────────────────────┐
        │ 1. 清理低相关性检索结果 │
        │ 2. 压缩旧消息为摘要     │
        │ 3. 移除过期检索历史     │
        │ 4. 调用 /clear 同步后端 │
        └────────┬────────────────┘
                 ▼
        ┌─────────────────┐
        │ 添加新消息      │
        │ 更新状态        │
        │ 通知前端/UI     │
        └────────┬────────┘
                 ▼
        ┌─────────────────┐
        │ ✅ 开发无缝继续 │
        └─────────────────┘
```

***

## 🎯 下一步建议

✅ cc-pane 完整兼容方案 + 上下文自动清理准则已就绪。

**请选择继续方向：**

```
[9]  前端流水线可视化面板
     - 实时进度 + 任务图谱 + Viking检索轨迹 + 上下文状态联动

[10] GitHub 集成完整实现  
     - OAuth授权 + PR自动创建 + Viking记忆同步到Issues/Release

[11] 最佳实践检索增强
     - Viking L0/L1摘要 + 17引擎搜索 + 效果反馈闭环 + 自动清理策略优化

[12] 端到端演示测试
     - 完整用户旅程: 需求→分解→开发→检索→(自动清理)→修复→提交→记忆迭代
```

上下文达到限制后，直接用/clear清理上下文，可以手动输入和自动运行。继续开发。可以内置 skill 和 mcp，以及自定义 skill 和 mcp。支持一键导入导出配置文件
支持拆分功能与最小模块实现，提交测试后进行下一个功能开发。支持回复数字或描述需求，我继续为您开发 🚀

```
```


> 更新: 2026-03-31 10:39:16  
> 原文: <https://www.yuque.com/lixinsi/yh04az/fd9wq7mu5k5yxrkf>