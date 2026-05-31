# 调整 IIS 10.0

Windows Server 2022 附带 Internet 信息服务 (IIS) 10.0。它使用与 IIS 8.5 和 IIS 7.0 类似的进程模型。内核模式 Web 驱动程序 (http.sys) 接收和路由 HTTP 请求，并从其响应缓存中满足请求。工作进程注册 URL 子空间，http.sys 将请求路由到适当的进程（或应用程序池的进程集）。



HTTP.sys 负责连接管理和请求处理。请求可以从 HTTP.sys 缓存中提供，也可以传递给工作进程进行进一步处理。可以配置多个工作进程，以较低的成本提供隔离。有关请求处理工作原理的更多信息，请参见下图：







HTTP.sys 包含一个响应缓存。当请求与响应缓存中的条目匹配时，HTTP.sys 会直接从内核模式发送缓存响应。某些 Web 应用程序平台（例如 ASP.NET）提供了允许将任何动态内容缓存在内核模式缓存中的机制。IIS 10.0 中的静态文件处理程序会自动将经常请求的文件缓存在 http.sys 中。



由于 Web 服务器具有内核模式和用户模式组件，因此必须对这两个组件进行调整以获得最佳性能。因此，针对特定工作负载调整 IIS 10.0 包括配置以下内容：



HTTP.sys 和相关的内核模式缓存



工作进程和用户模式 IIS，包括应用程序池配置



影响性能的某些调整参数



以下部分讨论如何配置 IIS 10.0 的内核模式和用户模式方面。



内核模式设置

与性能相关的 HTTP.sys 设置分为两大类：缓存管理以及连接和请求管理。所有注册表设置都存储在以下注册表项下：



```powershell
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Http\Parameters
```

**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">注意</font>**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">  如果 HTTP 服务已在运行，则必须重新启动它才能使更改生效。</font>

## <font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">缓存管理设置</font>
<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">HTTP.sys 提供的一个好处是内核模式缓存。如果响应位于内核模式缓存中，则可以完全从内核模式满足 HTTP 请求，这大大降低了处理请求的 CPU 成本。但是，IIS 10.0 的内核模式缓存基于物理内存，条目的成本是它占用的内存。</font>

<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">缓存中的条目只有在使用时才有用。但是，无论条目是否正在使用，它始终会消耗物理内存。您必须考虑可用资源（CPU 和物理内存）和工作负载要求，评估缓存中项目的实用性（能够从缓存中提供该项目所节省的资源）及其在条目生命周期内的成本（占用的物理内存）。HTTP.sys 尝试仅将有用的、主动访问的项目保留在缓存中，但您可以通过针对特定工作负载调整 HTTP.sys 缓存来提高 Web 服务器的性能。</font>

<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">以下是 HTTP.sys 内核模式缓存的一些有用设置：</font>

+ **<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">UriEnableCache</font>**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">默认值： 1</font>

<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">非零值会启用内核模式响应和片段缓存。对于大多数工作负载，缓存应保持启用状态。如果您预计响应和片段缓存非常低，请考虑禁用缓存。</font>

+ **<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">UriMaxCacheMegabyteCount</font>**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">默认值： 0</font>

<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">一个非零值，指定内核模式缓存可用的最大内存。默认值为 0，表示系统可以自动调整缓存可用的内存量。</font>

**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">注意</font>**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);"> </font><font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">指定大小仅设置最大值，系统可能不允许缓存增长到最大设置大小。</font>

<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">A </font>

+ **<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">UriMaxUriBytes</font>**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">默认值：262144 字节 (256 KB)</font>

<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">内核模式缓存中条目的最大大小。大于此大小的响应或片段不会被缓存。如果您有足够的内存，请考虑增加限制。如果内存有限，并且大条目会挤占小条目，则降低限制可能会有所帮助。</font>

+ **<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">UriScavengerPeriod</font>**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">默认值：120 秒</font>

<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">HTTP.sys 缓存由清理程序定期扫描，清理程序扫描期间未访问的条目将被删除。将清理程序周期设置为较高值可减少清理程序扫描的次数。但是，缓存内存使用量可能会增加，因为较旧、访问频率较低的条目可能会保留在缓存中。将周期设置得太低会导致清理程序扫描更频繁，并可能导致过多的刷新和缓存流失。</font>

## <font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">请求和连接管理设置</font>
<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">在 Windows Server 2022 中，HTTP.sys 会自动管理连接。以下注册表设置不再使用：</font>

+ **<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">最大连接数</font>**

```powershell
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Http\Parameters\MaxConnections
```

**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">空闲连接HighMark</font>**

```powershell
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Http\Parameters\IdleConnectionsHighMark
```

**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">空闲连接低标记</font>**

```powershell
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Http\Parameters\IdleConnectionsLowMark
```

**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">空闲列表修剪周期</font>**

```powershell
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Http\Parameters\IdleListTrimmerPeriod
```

**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">请求缓冲区后备深度</font>**

```powershell
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Http\Parameters\RequestBufferLookasideDepth
```

**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">内部请求后备深度</font>**

```powershell
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Http\Parameters\InternalRequestLookasideDepth
```

## <font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">用户模式设置</font>
<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">本节中的设置会影响 IISÂ 10.0 工作进程行为。大多数这些设置都可以在以下 XML 配置文件中找到：</font>

<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">%SystemRoot%\system32\inetsrv\config\applicationHost.config</font>

<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">使用 Appcmd.exe、IIS 10.0 管理控制台、WebAdministration 或 IISAdministration PowerShell 命令来更改它们。大多数设置都会自动检测，并且不需要重新启动 IIS 10.0 工作进程或 Web 应用程序服务器。有关 applicationHost.config 文件的更多信息，请参阅</font>[ApplicationHost.config 简介](https://www.iis.net/learn/get-started/planning-your-iis-architecture/introduction-to-applicationhostconfig)<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">。</font>

## <font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">NUMA 硬件的理想 CPU 设置</font>
<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">从 Windows Server 2016 开始，IIS 10.0 支持为其线程池线程自动分配理想的 CPU，以增强 NUMA 硬件上的性能和可扩展性。此功能默认启用，可通过以下注册表项进行配置：</font>

```powershell
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\InetInfo\Parameters\ThreadPoolUseIdealCpu
```

<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">启用此功能后，IIS 线程管理器将尽最大努力根据当前负载在所有 NUMA 节点的所有 CPU 上均匀分配 IIS 线程池线程。一般情况下，建议对于 NUMA 硬件保持此默认设置不变。</font>

**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">注意理想 CPU 设置</font>**[与应用程序池的 CPU 设置](https://www.iis.net/configreference/system.applicationhost/applicationpools/add/cpu)<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">  中介绍的工作进程 NUMA 节点分配设置（numaNodeAssignment 和 numaNodeAffinityMode）不同</font><font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">。理想 CPU 设置会影响 IIS 如何分配其线程池线程，而工作进程 NUMA 节点分配设置决定工作进程在哪个 NUMA 节点上启动。</font>

## <font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">用户模式缓存行为设置</font>
<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">本节介绍影响 IISÂ 10.0 中缓存行为的设置。用户模式缓存实现为一个模块，用于侦听集成管道引发的全局缓存事件。要完全禁用用户模式缓存，请从 applicationHost.config 中的 system.webServer/globalModules 配置部分中的已安装模块列表中删除 FileCacheModule (cachfile.dll) 模块。</font>

**<font style="color:rgb(230, 230, 230);background-color:rgb(23, 23, 23);">system.webServer/缓存</font>**



> 更新: 2024-07-01 10:20:56  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/qqbf9x6uymzaersa>