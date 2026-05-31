# Claude切换key脚本

### 1.<font style="color:rgb(44, 44, 54);">先选择模型 → 再输入Key → 保存到脚本</font>
```plain
@echo off
title Claude Code 大模型环境切换工具
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 获取当前脚本路径
set "SCRIPT_PATH=%~f0"

:: 检查脚本中是否已有有效Key
set "KEY_VALID=0"
for %%K in (KEY_QWEN KEY_DEEPSEEK KEY_KIMI) do (
    set "keyval=!%%K!"
    if not "!keyval:...=!"=="!keyval!" set "KEY_VALID=1"
)

:: ============== 主菜单 ==============
:menu
cls
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo        Claude Code 大模型环境切换工具
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo.
echo 请选择操作：
echo.
echo   [1] 切换模型环境
echo   [2] 设置API Key
echo   [3] 查看当前配置
echo   [0] 退出
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
set /p "choice=  请输入选项 (0-3) > " 

if "%choice%"=="1" goto switch
if "%choice%"=="2" goto setup
if "%choice%"=="3" goto view
if "%choice%"=="0" exit /b
goto invalid

:: ============== 查看当前配置 ==============
:view
cls
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo        当前环境配置
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo.
echo  ▶ 当前模型: %MODEL_NAME%
echo  ▶ API Key : %MODEL_KEY:~0,5%...%MODEL_KEY:~-5%
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo  脚本中存储的Key：
for %%K in (KEY_QWEN KEY_DEEPSEEK KEY_KIMI) do (
    set "keyval=!%%K!"
    if "!keyval:...=!"=="!keyval!" (
        echo   - %%K : !keyval:~0,5!...!keyval:~-5!
    ) else (
        echo   - %%K : (未设置)
    )
)
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo  按任意键返回...
pause >nul
goto menu

:: ============== 设置API Key ==============
:setup
cls
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo        API Key 设置向导
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo.
echo 请选择要设置的模型：
echo.
echo   [1] Qwen (通义千问)
echo   [2] DeepSeek
echo   [3] Kimi
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
set /p "choice=  请输入选项 (1-3) > " 

if "%choice%"=="1" (
    set "KEY_VAR=KEY_QWEN"
    set "MODEL_NAME=Qwen"
) else if "%choice%"=="2" (
    set "KEY_VAR=KEY_DEEPSEEK"
    set "MODEL_NAME=DeepSeek"
) else if "%choice%"=="3" (
    set "KEY_VAR=KEY_KIMI"
    set "MODEL_NAME=Kimi"
) else (
    goto invalid
)

:: 获取当前Key值
call set "CURRENT_KEY=%%%KEY_VAR%%%"

:: 检查Key是否已设置
if not "!CURRENT_KEY:...=!"=="!CURRENT_KEY!" (
    cls
    echo.
    echo ╔══════════════════════════════════════╗
    echo ║ 该模型的Key已设置：                 ║
    echo ║   !CURRENT_KEY:~0,5!...!CURRENT_KEY:~-5! ║
    echo ║                                      ║
    echo ║ 是否要重新设置？(Y/N)               ║
    echo ╚══════════════════════════════════════╝
    set /p "renew= > "
    if /i "!renew!" neq "y" goto menu
)

:: 输入新Key
cls
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo        设置 !MODEL_NAME! API Key
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo.
echo 请在下方输入您的API Key：
echo (输入时不会显示字符，请直接粘贴后按回车)
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
set "NEW_KEY="
set /p "NEW_KEY=>"

:: 验证Key格式
if "!NEW_KEY!"=="" (
    echo.
    echo ╔══════════════════════════════════════╗
    echo ║ 错误：Key不能为空！                  ║
    echo ╚══════════════════════════════════════╝
    timeout /t 2 >nul
    goto setup
)

if "!NEW_KEY:~0,3!" neq "sk-" (
    echo.
    echo ╔══════════════════════════════════════╗
    echo ║ 警告：Key格式可能不正确！            ║
    echo ║ 通常以 "sk-" 开头                    ║
    echo ║ 是否继续？(Y/N)                     ║
    echo ╚══════════════════════════════════════╝
    set /p "confirm= > "
    if /i "!confirm!" neq "y" goto setup
)

:: 更新脚本文件
set "TEMP_SCRIPT=%TEMP%\switch_model_temp.bat"
(
    for /f "usebackq delims=" %%L in ("%SCRIPT_PATH%") do (
        set "line=%%L"
        setlocal enabledelayedexpansion
        set "search=set "!KEY_VAR!=""
        if "!line:%search%=!" neq "!line!" (
            echo set "!KEY_VAR!=!NEW_KEY!"
        ) else (
            echo(!line!
        )
        endlocal
    )
) > "%TEMP_SCRIPT%"

:: 替换原脚本
move /y "%TEMP_SCRIPT%" "%SCRIPT_PATH%" >nul
if errorlevel 1 (
    cls
    echo.
    echo ╔══════════════════════════════════════╗
    echo ║ 错误：无法更新脚本文件！            ║
    echo ║ 请尝试：                            ║
    echo ║  1. 以管理员身份运行                ║
    echo ║  2. 关闭正在编辑脚本的程序          ║
    echo ╚══════════════════════════════════════╝
    pause
    goto menu
)

:: 成功提示
cls
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo        Key 设置成功！
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo.
echo  ▶ 模型: !MODEL_NAME!
echo  ▶ 新Key: !NEW_KEY:~0,5!...!NEW_KEY:~-5!
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo  提示：
echo  1. 脚本已自动更新，无需重新运行
echo  2. 请立即重启使用该Key的程序
echo  3. 安全提示：完整Key仅存储在脚本中
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo.
echo 按任意键返回主菜单...
pause >nul
goto menu

:: ============== 切换模型环境 ==============
:switch
cls
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo        选择要切换的模型
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo.
echo   [1] Qwen (通义千问)
echo   [2] DeepSeek
echo   [3] Kimi
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
set /p "choice=  请输入选项 (1-3) > " 

if "%choice%"=="1" (
    set "KEY_VAR=KEY_QWEN"
    set "MODEL_NAME=Qwen"
) else if "%choice%"=="2" (
    set "KEY_VAR=KEY_DEEPSEEK"
    set "MODEL_NAME=DeepSeek"
) else if "%choice%"=="3" (
    set "KEY_VAR=KEY_KIMI"
    set "MODEL_NAME=Kimi"
) else (
    goto invalid
)

:: 检查Key是否已设置
call set "CURRENT_KEY=%%%KEY_VAR%%%"
if "!CURRENT_KEY:...=!"=="!CURRENT_KEY!" (
    cls
    echo.
    echo ╔══════════════════════════════════════╗
    echo ║ 未设置 !MODEL_NAME! 的API Key！     ║
    echo ║                                      ║
    echo ║ 请先执行：                           ║
    echo ║  [2] 设置API Key                     ║
    echo ╚══════════════════════════════════════╝
    timeout /t 3 >nul
    goto menu
)

:: 设置环境变量
setx MODEL_KEY "!CURRENT_KEY!" >nul
setx MODEL_NAME "!MODEL_NAME!" >nul
set "MODEL_KEY=!CURRENT_KEY!"
set "MODEL_NAME=!MODEL_NAME!"

:: 成功提示
cls
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo        环境切换成功！
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo.
echo  ▶ 当前模型: !MODEL_NAME!
echo  ▶ API Key : !CURRENT_KEY:~0,5!...!CURRENT_KEY:~-5!
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo  提示：
echo  1. 环境变量已全局生效（重启程序后生效）
echo  2. 当前命令行会话已立即生效
echo  3. 完整Key存储在脚本文件中
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo.
echo 按任意键返回主菜单...
pause >nul
goto menu

:: ============== 错误处理 ==============
:invalid
cls
echo.
echo ╔══════════════════════════════════════╗
echo ║ 错误：请输入有效的选项 (0-3)         ║
echo ╚══════════════════════════════════════╝
timeout /t 2 >nul
goto menu
```

### 2.先保存三个 key 再选择模型
```plain
@echo off
title Claude Code 一键切换大模型
chcp 65001 >nul
setlocal enabledelayedexpansion

:: ==================== 1. 请在这里一次性填写好 3 个 Key ====================
:: 填好后保存，后续无需再改。
set "KEY_QWEN=sk-b3b3998cd369467e80079a..."
set "KEY_DEEPSEEK=sk-08090b8782904fc09cee9da664a187c2"
set "KEY_KIMI=sk-E8u0bOgGXVYpkG3eNJeR...NIR8h"
:: =====================================================================

:: 检查所有 Key 是否为默认占位符（优化检查逻辑）
set "needEdit=0"
for %%K in (KEY_QWEN KEY_DEEPSEEK KEY_KIMI) do (
    set "keyval=!%%K!"
    if "!keyval:...=!"=="!keyval!" set "needEdit=1"
)
if "!needEdit!"=="1" (
    echo.
    echo ========================================
    echo 请先编辑本脚本，替换所有 Key 占位符（包含 ... 的行）
    echo 保存后重新运行脚本！
    echo ========================================
    echo 当前检测到未修改的 Key：
    for %%K in (KEY_QWEN KEY_DEEPSEEK KEY_KIMI) do (
        set "keyval=!%%K!"
        if "!keyval:...=!"=="!keyval!" echo   - %%K
    )
    echo.
    pause
    exit /b
)

:: 显示菜单并让用户选择模型（增加视觉优化）
cls
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo        Claude Code 大模型环境切换工具
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo.
echo 请选择要使用的模型：
echo.
echo   [1] Qwen (通义千问)
echo   [2] DeepSeek
echo   [3] Kimi
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
set /p "choice=  请输入选项 (1-3) > " 

:: 验证输入有效性（增加输入校验）
if not defined choice goto invalid
if "!choice!"=="1" (
    set "MODEL_KEY=%KEY_QWEN%"
    set "MODEL_NAME=Qwen"
) else if "!choice!"=="2" (
    set "MODEL_KEY=%KEY_DEEPSEEK%"
    set "MODEL_NAME=DeepSeek"
) else if "!choice!"=="3" (
    set "MODEL_KEY=%KEY_KIMI%"
    set "MODEL_NAME=Kimi"
) else (
    :invalid
    echo.
    echo ╔══════════════════════════════════════╗
    echo ║ 错误：请输入有效的选项 (1-3)         ║
    echo ╚══════════════════════════════════════╝
    timeout /t 2 >nul
    goto :menu
)

:: 安全处理Key显示（关键优化：掩码处理）
set "DISPLAY_KEY=!MODEL_KEY:~0,5!...!MODEL_KEY:~-5!"

:: 设置环境变量（优化：仅设置用户级变量）
setx MODEL_KEY "!MODEL_KEY!" >nul
setx MODEL_NAME "!MODEL_NAME!" >nul

:: 更新当前会话环境变量（重要：立即生效）
set "MODEL_KEY=!MODEL_KEY!"
set "MODEL_NAME=!MODEL_NAME!"

:: 显示成功信息（增加专业感）
cls
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo        环境切换成功！
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo.
echo  ▶ 当前模型: !MODEL_NAME!
echo  ▶ API Key : !DISPLAY_KEY!
echo.
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo  提示：
echo  1. 环境变量已全局生效（重启程序后生效）
echo  2. 当前命令行会话已立即生效
echo  3. 安全提示：完整Key仅存储在系统环境变量中
echo 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
echo.
echo 按任意键退出...
pause >nul
exit /b
```



> 更新: 2025-09-03 08:54:23  
> 原文: <https://www.yuque.com/lixinsi/xdiarx/pead5lorel3km4y4>