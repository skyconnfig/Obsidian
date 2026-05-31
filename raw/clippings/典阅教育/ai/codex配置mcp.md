# codex配置mcp

```plain
# Playwright MCP 服务器
[mcp_servers.playwright]
type = "stdio"
command = "cmd"
args = ["/c", "npx", "-y", "@playwright/mcp@latest"]
startup_timeout_ms = 180000
env = { APPDATA = "C:\\Users\\Administrator\\AppData\\Roaming", LOCALAPPDATA = "C:\\Users\\Administrator\\AppData\\Local", HOME = "C:\\Users\\Administrator", SystemRoot = "C:\\Windows", NODE_OPTIONS = "--dns-result-order=ipv4first" }

# Memory LibSQL MCP 服务器
[mcp_servers.mcp-memory-libsql]
type = "stdio"
command = "cmd"
args = ["/c", "npx", "-y", "mcp-memory-libsql"]
startup_timeout_ms = 180000

[mcp_servers.mcp-memory-libsql.env]
LIBSQL_URL = "libsql://your-database-name.turso.io"
LIBSQL_AUTH_TOKEN = "your-actual-libsql-auth-token"
APPDATA = "C:\\Users\\Administrator\\AppData\\Roaming"
LOCALAPPDATA = "C:\\Users\\Administrator\\AppData\\Local"
HOME = "C:\\Users\\Administrator"
SystemRoot = "C:\\Windows"
NODE_OPTIONS = "--dns-result-order=ipv4first"

# Context7 MCP 服务器
[mcp_servers.context7]
type = "stdio"
command = "cmd"
args = ["/c", "npx", "-y", "@upstash/context7-mcp", "--api-key", "your-context7-api-key"]
startup_timeout_ms = 120000
env = { APPDATA = "C:\\Users\\Administrator\\AppData\\Roaming", LOCALAPPDATA = "C:\\Users\\Administrator\\AppData\\Local", HOME = "C:\\Users\\Administrator", SystemRoot = "C:\\Windows", NODE_OPTIONS = "--dns-result-order=ipv4first" }

# Supabase MCP 服务器
[mcp_servers.supabase]
type = "stdio"
command = "cmd"
args = ["/c", "npx", "-y", "@supabase/mcp-server-supabase@latest", "--read-only", "--project-ref=your-project-ref"]
startup_timeout_ms = 120000
env = { APPDATA = "C:\\Users\\Administrator\\AppData\\Roaming", LOCALAPPDATA = "C:\\Users\\Administrator\\AppData\\Local", HOME = "C:\\Users\\Administrator", SystemRoot = "C:\\Windows", NODE_OPTIONS = "--dns-result-order=ipv4first", SUPABASE_ACCESS_TOKEN = "your-supabase-access-token" }
```



```plain
按照这个模板[mcp_servers.mcp-memory-libsql]
type = "stdio"
command = "cmd"
args = ["/c", "npx", "-y", "mcp-memory-libsql"]
startup_timeout_ms = 180000

[mcp_servers.mcp-memory-libsql.env]
LIBSQL_URL = "libsql://your-database-name.turso.io"
LIBSQL_AUTH_TOKEN = "your-actual-libsql-auth-token"
APPDATA = "C:\\Users\\Administrator\\AppData\\Roaming"
LOCALAPPDATA = "C:\\Users\\Administrator\\AppData\\Local"
HOME = "C:\\Users\\Administrator"
SystemRoot = "C:\\Windows"
NODE_OPTIONS = "--dns-result-order=ipv4first"帮我{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": ["-y", "chrome-devtools-mcp@latest"]
    }
  }
}
```

```plain
[mcp_servers.chrome-devtools]
type = "stdio"
command = "cmd"
args = ["/c", "npx", "-y", "chrome-devtools-mcp@latest"]
startup_timeout_ms = 180000

[mcp_servers.chrome-devtools.env]
APPDATA = "C:\\Users\\lixin\\AppData\\Roaming"
LOCALAPPDATA = "C:\\Users\\lixin\\AppData\\Local"
HOME = "C:\\Users\\lixin"
SystemRoot = "C:\\Windows"
NODE_OPTIONS = "--dns-result-order=ipv4first"
```



> 更新: 2025-10-27 13:35:40  
> 原文: <https://www.yuque.com/lixinsi/vnere7/rbzl470xuih0bge4>