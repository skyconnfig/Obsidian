# FastAPI 项目实战指南

> 填补现有 wiki 中 FastAPI 的知识缺口：路由组织、生产中间件、Vue3 对接、Docker 部署
> 侧重"判别式经验"——什么场景用什么模式，而非官方文档搬运

---

## 1. 路由组织规范

### 1.1 按模块分文件，按版本分前缀

```
app/
├── api/
│   ├── v1/
│   │   ├── __init__.py       # 聚合所有 v1 路由
│   │   ├── auth.py           # 登录注册
│   │   ├── users.py          # 用户管理
│   │   ├── tenants.py        # 租户管理（SaaS 场景）
│   │   ├── crawler_tasks.py  # 爬虫任务
│   │   └── data_analysis.py  # 数据分析
│   └── v2/                   # 后续版本迭代
├── core/                     # 配置、数据库、安全
├── models/                   # SQLAlchemy ORM
├── schemas/                  # Pydantic 模型
└── services/                 # 业务逻辑层
```

**注册方式**（一个文件聚合，新人也能看懂路由全貌）：
```python
# app/api/v1/__init__.py
from fastapi import APIRouter
from .auth import router as auth_router
from .users import router as users_router
from .tenants import router as tenant_router

router = APIRouter(prefix="/v1")
router.include_router(auth_router, prefix="/auth", tags=["认证"])
router.include_router(users_router, prefix="/users", tags=["用户"])
router.include_router(tenant_router, prefix="/tenants", tags=["租户"])

# app/main.py
from app.api.v1 import router as v1_router
app.include_router(v1_router)
```

**什么时候分版本**：不是所有项目都需要API版本化。判断标准——如果这个 API 有外部调用方（其他团队/第三方），从第一天就加 `/v1` 前缀。如果只是一个前后端项目，可以不加，重构时再切。

### 1.2 依赖注入的实用模式

FastAPI 的 `Depends` 是用来替代手写 if-else 校验的利器。实际项目中这三个注入最常用：

**获取当前用户**
```python
# core/dependencies.py
from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials

security = HTTPBearer()

async def get_current_user(
    credentials: HTTPAuthorizationCredentials = Depends(security)
):
    token = credentials.credentials
    # 验证 token，从 Redis/DB 取用户
    user = await verify_token(token)
    if not user:
        raise HTTPException(status_code=401)
    return user
```

**多租户隔离（来自 Marspython 的实战经验）**
```python
async def get_current_tenant(
    user = Depends(get_current_user)
):
    # 从用户信息中提取租户 ID
    tenant_id = user.tenant_id
    # 后续所有 SQL 查询都带上这个 tenant_id
    return tenant_id
```

**分页参数（复用率最高）**
```python
from fastapi import Query
from typing import Optional

async def pagination_params(
    page: int = Query(1, ge=1),
    page_size: int = Query(20, ge=1, le=100),
):
    return {"skip": (page - 1) * page_size, "limit": page_size}
```

### 1.3 Service 层 vs 直接在路由中写逻辑

**经验法则**：

```
├── routers/        # 只做：参数提取 + 权限校验 + 调用 service + 返回
├── services/       # 业务逻辑：数据库操作、外部调用、事务管理
└── models/         # 纯数据定义：ORM 模型 + Pydantic schema
```

路由层不应该超过 20 行。超过的话，把逻辑提到 service。理由：路由层没法做单元测试（需要起 HTTP 服务器），service 层可以。

---

## 2. 生产级中间件配置

### 2.1 中间件加载顺序（顺序敏感的）

```python
app = FastAPI()

# 1. CORS — 最先，拒绝跨域请求后不用继续处理
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.CORS_ORIGINS,  # 白名单，不要用 "*"
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 2. 请求日志 — 记录所有进出的请求
app.add_middleware(RequestLogMiddleware)

# 3. 限流 — 在业务逻辑之前拦截
app.add_middleware(RateLimitMiddleware)

# 4. 异常统一处理 — 最后兜底
app.add_exception_handler(HTTPException, http_error_handler)
app.add_exception_handler(ValidationError, validation_error_handler)
app.add_exception_handler(Exception, generic_error_handler)
```

### 2.2 认证中间件 vs 路由级依赖

文档中踩过的坑：**不要用中间件做认证**。原因：
- 中间件是全局的，无法精准控制哪些路由需要认证
- 使用路由级 `Depends(get_current_user)` 可以精确到每个接口
- 公开接口（登录、健康检查）不加该依赖即可

```python
# 公开接口 — 不需要认证
@router.post("/auth/login")
async def login(cred: LoginRequest):
    ...

# 受保护接口 — 自动注入当前用户
@router.get("/users/me")
async def get_me(user = Depends(get_current_user)):
    return user
```

### 2.3 限流实现

FastAPI 本身不提供限流，推荐的轻量方案：

```python
# core/middleware/ratelimit.py
from fastapi import Request, HTTPException
from starlette.middleware.base import BaseHTTPMiddleware
import time

class RateLimitMiddleware(BaseHTTPMiddleware):
    def __init__(self, app, max_requests: int = 100, window: int = 60):
        super().__init__(app)
        self.max_requests = max_requests
        self.window = window
        self.requests = {}  # 生产环境用 Redis

    async def dispatch(self, request: Request, call_next):
        client_ip = request.client.host
        now = time.time()
        
        # 清理过期记录
        self.requests = {k: v for k, v in self.requests.items() if now - v[0] < self.window}
        
        if client_ip in self.requests:
            count, start_time = self.requests[client_ip]
            if count >= self.max_requests:
                raise HTTPException(status_code=429, detail="请求过于频繁")
            self.requests[client_ip] = (count + 1, start_time)
        else:
            self.requests[client_ip] = (1, now)
        
        return await call_next(request)
```

**判断标准**：单机部署用内存限流就够了；多实例部署必须用 Redis。

### 2.4 请求日志中间件

```python
# core/middleware/logging.py
import logging
import time
from fastapi import Request

logger = logging.getLogger("api")

async def request_log_middleware(request: Request, call_next):
    start = time.time()
    response = await call_next(request)
    duration = time.time() - start
    
    logger.info(
        f"{request.method} {request.url.path} "
        f"→ {response.status_code} "
        f"({duration:.3f}s) "
        f"[{request.client.host}]"
    )
    return response
```

**关键点**：不要记请求体（可能包含密码/token），记录 `method + path + status + duration + client_ip` 就够了。排查问题时再临时开 debug 日志。

### 2.5 统一异常处理

```python
@ app.exception_handler(Exception)
async def generic_error_handler(request: Request, exc: Exception):
    logger.error(f"未捕获异常: {exc}", exc_info=True)
    return JSONResponse(
        status_code=500,
        content={"detail": "服务器内部错误"},
    )
```

**判断标准**：生产环境不要把原始异常信息返回给客户端。一律改成 `"服务器内部错误"`，完整异常栈记到日志里供排查。

---

## 3. 与 Vue3 前端的对接方式

### 3.1 推荐的项目结构（前后端分离）

```
项目/
├── back_end/               # FastAPI 后端
│   ├── app/
│   ├── requirements.txt
│   └── Dockerfile
├── front_end/              # Vue3 前端（来自 cursorrules 的目录规范）
│   ├── src/
│   ├── package.json
│   └── Dockerfile
├── docker-compose.yml      # 一键启动
└── docs/                   # 接口文档
```

### 3.2 API 对接规范

**后端返回格式统一化**（前端不用处理多种返回结构）：

```python
# schemas/response.py
from typing import Generic, TypeVar
from pydantic import BaseModel

T = TypeVar("T")

class ApiResponse(BaseModel, Generic[T]):
    code: int = 0           # 0=成功，非0=业务错误
    message: str = "success"
    data: T | None = None

class PaginatedResponse(BaseModel, Generic[T]):
    code: int = 0
    message: str = "success"
    data: list[T] = []
    total: int = 0
    page: int = 1
    page_size: int = 20
```

**前端 axios 封装**（对接这个统一格式）：
```typescript
// front_end/src/utils/request.ts
import axios from 'axios'

const request = axios.create({ baseURL: '/api/v1' })

request.interceptors.response.use(
  (res) => {
    if (res.data.code !== 0) {
      ElMessage.error(res.data.message)
      return Promise.reject(res.data)
    }
    return res.data.data  // 直接拿到 data，不需要再 .data.data
  },
  (err) => {
    if (err.response?.status === 401) {
      // token 过期，跳转登录
      router.push('/login')
    }
    ElMessage.error(err.response?.data?.detail || '网络错误')
    return Promise.reject(err)
  }
)
```

### 3.3 WebSocket 实时通信

来自文档中"抢答助手"和"美股抓取"项目的经验：

```python
# 后端：FastAPI WebSocket
from fastapi import WebSocket, WebSocketDisconnect

class ConnectionManager:
    def __init__(self):
        self.active_connections: dict[str, list[WebSocket]] = {}

    async def connect(self, room: str, ws: WebSocket):
        await ws.accept()
        if room not in self.active_connections:
            self.active_connections[room] = []
        self.active_connections[room].append(ws)

    async def broadcast(self, room: str, message: dict):
        for ws in self.active_connections.get(room, []):
            await ws.send_json(message)

manager = ConnectionManager()

@router.websocket("/ws/{room}")
async def websocket_endpoint(ws: WebSocket, room: str):
    await manager.connect(room, ws)
    try:
        while True:
            data = await ws.receive_json()
            # 处理前端发来的消息
            await manager.broadcast(room, {"type": "response", "data": data})
    except WebSocketDisconnect:
        manager.active_connections[room].remove(ws)
```

**前端对接**：
```typescript
// Vue3 composable
export function useWebSocket(room: string) {
  const ws = ref<WebSocket | null>(null)
  
  const connect = () => {
    ws.value = new WebSocket(`ws://localhost:8000/api/v1/ws/${room}`)
    ws.value.onmessage = (event) => {
      const data = JSON.parse(event.data)
      // 处理数据
    }
  }
  
  const send = (data: any) => {
    ws.value?.send(JSON.stringify(data))
  }
  
  onUnmounted(() => ws.value?.close())
  
  return { connect, send }
}
```

---

## 4. Docker 容器化部署

### 4.1 多阶段构建（减小镜像体积）

```dockerfile
# back_end/Dockerfile
FROM python:3.11-slim AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY . .

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

**为什么用多阶段构建**：`python:3.11-slim` 基础镜像 150MB，如果直接装依赖，最终镜像 500MB+。多阶段构建可以把编译产物（build 阶段）和运行环境（最终阶段）分离，最终镜像只有 200MB 左右。

### 4.2 docker-compose 编排

```yaml
# docker-compose.yml
version: "3.8"

services:
  api:
    build: ./back_end
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=mysql+asyncmy://user:pass@db:3306/app
      - REDIS_URL=redis://redis:6379/0
    depends_on:
      - db
      - redis
    restart: unless-stopped
    volumes:
      - ./logs:/app/logs

  frontend:
    build: ./front_end
    ports:
      - "80:80"
    depends_on:
      - api

  db:
    image: mysql:8.0
    environment:
      - MYSQL_ROOT_PASSWORD=rootpass
      - MYSQL_DATABASE=app
      - MYSQL_USER=user
      - MYSQL_PASSWORD=pass
    volumes:
      - mysql_data:/var/lib/mysql
    ports:
      - "3306:3306"

  redis:
    image: redis:7-alpine
    volumes:
      - redis_data:/data

volumes:
  mysql_data:
  redis_data:
```

### 4.3 生产环境的配置策略

**环境变量驱动配置**（而不是 .env 文件部署）：
```yaml
# docker-compose.yml 中直接传环境变量
environment:
  - DATABASE_URL=mysql+asyncmy://user:pass@db:3306/app
  - REDIS_URL=redis://redis:6379/0
  - DEBUG=false
  - CORS_ORIGINS=["https://yourdomain.com"]
```

**对应 Python 代码**：
```python
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    database_url: str
    redis_url: str
    debug: bool = False
    cors_origins: list[str] = ["http://localhost:3000"]
    
    class Config:
        env_file = ".env"  # 开发环境用 .env，Docker 部署通过环境变量注入
```

### 4.4 启动脚本

来自 `wiki/部署运维实战经验.md` 中 Windows 服务的启发，Linux 下的启动管理：

```bash
# start.sh
#!/bin/bash
docker-compose up -d
echo "API: http://localhost:8000"
echo "API Docs: http://localhost:8000/docs"

# stop.sh
#!/bin/bash
docker-compose down

# 查看日志
docker-compose logs -f api
```

---

## 5. 快速启动项目模板

综合以上所有模式，一个可以直接用的最小化模板结构：

```
fastapi-project/
├── back_end/
│   ├── app/
│   │   ├── __init__.py
│   │   ├── main.py              # 应用入口 + 中间件
│   │   ├── api/
│   │   │   ├── __init__.py
│   │   │   └── v1/
│   │   │       ├── __init__.py   # 聚合路由
│   │   │       └── example.py    # 示例路由
│   │   ├── core/
│   │   │   ├── config.py         # Settings + 环境变量
│   │   │   ├── database.py       # 异步数据库会话
│   │   │   └── dependencies.py   # 公共依赖注入
│   │   ├── models/               # SQLAlchemy 模型
│   │   ├── schemas/              # Pydantic 请求/响应
│   │   ├── services/             # 业务逻辑
│   │   └── middleware/           # 自定义中间件
│   ├── tests/
│   │   ├── test_api/
│   │   └── test_services/
│   ├── requirements.txt
│   └── Dockerfile
├── front_end/                    # Vue3 项目
├── docs/                         # 接口文档
├── docker-compose.yml
└── README.md
```

**复用时只需要改**：`core/config.py` 中的 `Settings` 类名和默认值，以及 `api/v1/` 下的路由文件。
