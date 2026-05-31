# execlmcp

<https://github.com/haris-musa/excel-mcp-server>

<u><font style="color:rgb(31, 35, 40);">模型上下文协议 （MCP） 服务器，无需安装 Microsoft Excel 即可作 Excel 文件。使用 AI 代理创建、读取和修改 Excel 工作簿。</font></u>

## <font style="color:rgb(31, 35, 40);">Features</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">特征</font></u>

* <font style="color:rgb(31, 35, 40);">📊</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">Excel Operations</font>**<font style="color:rgb(31, 35, 40);">: Create, read, update workbooks and worksheets</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">📊</font></u><u><font style="color:rgb(31, 35, 40);"> Excel作：创建、读取、更新工作簿和工作表</font></u>
* <font style="color:rgb(31, 35, 40);">📈</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">Data Manipulation</font>**<font style="color:rgb(31, 35, 40);">: Formulas, formatting, charts, pivot tables, and Excel tables</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">📈</font></u><u><font style="color:rgb(31, 35, 40);"> 数据作：公式、格式、图表、数据透视表和 Excel 表格</font></u>
* <font style="color:rgb(31, 35, 40);">🔍</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">Data Validation</font>**<font style="color:rgb(31, 35, 40);">: Built-in validation for ranges, formulas, and data integrity</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">🔍</font></u><u><font style="color:rgb(31, 35, 40);"> 数据验证：内置范围、公式和数据完整性验证</font></u>
* <font style="color:rgb(31, 35, 40);">🎨</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">Formatting</font>**<font style="color:rgb(31, 35, 40);">: Font styling, colors, borders, alignment, and conditional formatting</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">🎨</font></u><u><font style="color:rgb(31, 35, 40);"> 格式：字体样式、颜色、边框、对齐方式和条件格式</font></u>
* <font style="color:rgb(31, 35, 40);">📋</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">Table Operations</font>**<font style="color:rgb(31, 35, 40);">: Create and manage Excel tables with custom styling</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">📋</font></u><u><font style="color:rgb(31, 35, 40);"> 表格作：使用自定义样式创建和管理 Excel 表格</font></u>
* <font style="color:rgb(31, 35, 40);">📊</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">Chart Creation</font>**<font style="color:rgb(31, 35, 40);">: Generate various chart types (line, bar, pie, scatter, etc.)</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">📊</font></u><u><font style="color:rgb(31, 35, 40);"> 图表创建：生成各种图表类型（折线图、条形图、饼图、散点图等）</font></u>
* <font style="color:rgb(31, 35, 40);">🔄</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">Pivot Tables</font>**<font style="color:rgb(31, 35, 40);">: Create dynamic pivot tables for data analysis</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">🔄</font></u><u><font style="color:rgb(31, 35, 40);"> 数据透视表：创建用于数据分析的动态数据透视表</font></u>
* <font style="color:rgb(31, 35, 40);">🔧</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">Sheet Management</font>**<font style="color:rgb(31, 35, 40);">: Copy, rename, delete worksheets with ease</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">🔧</font></u><u><font style="color:rgb(31, 35, 40);"> 工作表管理：轻松复制、重命名、删除工作表</font></u>
* <font style="color:rgb(31, 35, 40);">🔌</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">Triple transport support</font>**<font style="color:rgb(31, 35, 40);">: stdio, SSE (deprecated), and streamable HTTP</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">🔌</font></u><u><font style="color:rgb(31, 35, 40);"> 三重传输支持：stdio、SSE（已弃用）和可流式传输的 HTTP</font></u>
* <font style="color:rgb(31, 35, 40);">🌐</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">Remote & Local</font>**<font style="color:rgb(31, 35, 40);">: Works both locally and as a remote service</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">🌐</font></u><u><font style="color:rgb(31, 35, 40);"> 远程和本地：既可以在本地工作，也可以作为远程服务工作</font></u>

## <font style="color:rgb(31, 35, 40);">Usage</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">用法</font></u>

<font style="color:rgb(31, 35, 40);">The server supports three transport methods:</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">服务器支持三种传输方式：</font></u>

### <font style="color:rgb(31, 35, 40);">1. Stdio Transport (for local use)</font><font style="color:rgb(31, 35, 40);">

</font><u><font style="color:rgb(31, 35, 40);">1. Stdio Transport（供本地使用）</font></u> <font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">uvx excel-mcp-server stdio</font>

```plain
{
   "mcpServers": {
      "excel": {
         "command": "uvx",
         "args": ["excel-mcp-server", "stdio"]
      }
   }
}
```

### <font style="color:rgb(31, 35, 40);">2. SSE Transport (Server-Sent Events - Deprecated)</font><font style="color:rgb(31, 35, 40);">

</font><u><font style="color:rgb(31, 35, 40);">2. SSE 传输（服务器发送的事件 - 已弃用）</font></u> <font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">uvx excel-mcp-server sse</font>

**<font style="color:rgb(31, 35, 40);">SSE transport connection</font>**<font style="color:rgb(31, 35, 40);">:</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">SSE传输连接：</font></u>

```plain
{
   "mcpServers": {
      "excel": {
         "url": "http://localhost:8000/sse",
      }
   }
}
```

### <font style="color:rgb(31, 35, 40);">3. Streamable HTTP Transport (Recommended for remote connections)</font><font style="color:rgb(31, 35, 40);">

</font><u><font style="color:rgb(31, 35, 40);">3. 可流式 HTTP 传输（推荐用于远程连接）</font></u> <font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">uvx excel-mcp-server streamable-http</font>

**<font style="color:rgb(31, 35, 40);">Streamable HTTP transport connection</font>**<font style="color:rgb(31, 35, 40);">:</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">可流式 HTTP 传输连接：</font></u>

```plain
{
   "mcpServers": {
      "excel": {
         "url": "http://localhost:8000/mcp",
      }
   }
}
```

## <font style="color:rgb(31, 35, 40);">Environment Variables & File Path Handling</font><font style="color:rgb(31, 35, 40);">

</font><u><font style="color:rgb(31, 35, 40);">环境变量和文件路径处理</font></u>

### <font style="color:rgb(31, 35, 40);">SSE and Streamable HTTP Transports</font><font style="color:rgb(31, 35, 40);">

</font><u><font style="color:rgb(31, 35, 40);">SSE 和可流式 HTTP 传输</font></u> <font style="color:rgb(31, 35, 40);">When running the server with the</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">SSE or Streamable HTTP protocols</font>**<font style="color:rgb(31, 35, 40);">, you</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">must set the</font>\*\*\*\*<font style="color:rgb(31, 35, 40);"> </font>**<code>**<font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">EXCEL_FILES_PATH</font>**</code>**<font style="color:rgb(31, 35, 40);"> </font>\*\*\*\*<font style="color:rgb(31, 35, 40);">environment variable on the server side</font>**<font style="color:rgb(31, 35, 40);">. This variable tells the server where to read and write Excel files.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">使用 SSE 或 Streamable HTTP 协议运行服务器时，必须在服务器端设置 EXCEL\_FILES\_PATH 环境变量。此变量告诉服务器在何处读取和写入 Excel 文件。</font></u>

* <font style="color:rgb(31, 35, 40);">If not set, it defaults to</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">./excel_files</font></code><font style="color:rgb(31, 35, 40);">.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">如果未设置，则默认为</font></u><u><font style="color:rgb(31, 35, 40);"> </font></u><code><u><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">./excel_files</font></u></code><u><font style="color:rgb(31, 35, 40);">。</font></u>

<font style="color:rgb(31, 35, 40);">You can also set the</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">FASTMCP_PORT</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">environment variable to control the port the server listens on (default is</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">8017</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">if not set).</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">您还可以设置</font></u><u><font style="color:rgb(31, 35, 40);"> </font></u><code><u><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">FASTMCP_PORT</font></u></code><u><font style="color:rgb(31, 35, 40);"> </font></u><u><font style="color:rgb(31, 35, 40);">环境变量来控制服务器监听的端口（如果未设置，则默认为</font></u><u><font style="color:rgb(31, 35, 40);"> </font></u><code><u><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">8017</font></u></code><u><font style="color:rgb(31, 35, 40);">）。</font></u>

* <font style="color:rgb(31, 35, 40);">Example (Windows PowerShell):</font>

```plain
$env:EXCEL_FILES_PATH="E:\MyExcelFiles"
$env:FASTMCP_PORT="8007"
uvx excel-mcp-server streamable-http
```

<font style="color:rgb(31, 35, 40);">  
</font><u><font style="color:rgb(31, 35, 40);">示例 （Windows PowerShell）： $env：EXCEL_FILES_PATH=“E：\MyExcelFiles” $env：FASTMCP_PORT=“8007” uvx excel-mcp-server streamable-http</font></u>

* <font style="color:rgb(31, 35, 40);">Example (Linux/macOS):</font><font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">EXCEL\_FILES\_PATH=/path/to/excel\_files FASTMCP\_PORT=8007 uvx excel-mcp-server streamable-http</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">示例 （Linux/macOS）： EXCEL\_FILES\_PATH=/path/to/excel\_files FASTMCP\_PORT=8007 uvx excel-mcp-server streamable-http</font></u>

### <font style="color:rgb(31, 35, 40);">Stdio Transport</font><font style="color:rgb(31, 35, 40);"> </font><u><font style="color:rgb(31, 35, 40);">Stdio 传输</font></u>

<font style="color:rgb(31, 35, 40);">When using the</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">stdio protocol</font>**<font style="color:rgb(31, 35, 40);">, the file path is provided with each tool call, so you do</font><font style="color:rgb(31, 35, 40);"> </font>**<font style="color:rgb(31, 35, 40);">not</font>**<font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">need to set</font><font style="color:rgb(31, 35, 40);"> </font><code><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">EXCEL_FILES_PATH</font></code><font style="color:rgb(31, 35, 40);"> </font><font style="color:rgb(31, 35, 40);">on the server. The server will use the path sent by the client for each operation.</font><font style="color:rgb(31, 35, 40);">\ </font><u><font style="color:rgb(31, 35, 40);">使用 stdio 协议时，每个工具调用都会提供文件路径，因此无需在服务器上设置</font></u><u><font style="color:rgb(31, 35, 40);"> </font></u><code><u><font style="color:rgb(31, 35, 40);background-color:rgba(129, 139, 152, 0.12);">EXCEL_FILES_PATH</font></u></code><u><font style="color:rgb(31, 35, 40);">。服务器将使用客户端发送的路径进行每个作。</font></u>

## <font style="color:rgb(31, 35, 40);">Available Tools </font><u><font style="color:rgb(31, 35, 40);">可用工具</font></u>


> 更新: 2025-09-14 10:24:58  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/wbgfxvsq4dhfr03c>