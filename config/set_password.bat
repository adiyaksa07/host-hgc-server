@echo off

:: 这个批处理脚本用于更新 Sunshine 应用程序的配置文件和凭证。
:: 脚本功能如下：
:: 1. 检查 Sunshine 是否已安装（通过判断安装文件夹是否存在）。
:: 2. 如果已安装，则删除旧的配置文件和凭证。
:: 3. 从当前脚本目录复制新的配置文件和凭证到 Sunshine 的配置目录。
:: 4. 强制关闭正在运行的 Sunshine 应用程序进程。
:: 5. 如果未安装 Sunshine，则提示用户安装 Sunshine。

set location_sunshine=C:\Program Files\Sunshine\config\
set location_config=%~dp0sunshine_state.json
set location_cacert=%~dp0credentials\cacert.pem
set location_cakey=%~dp0credentials\cakey.pem

if exist "%location_sunshine%" ( 
	echo 找到 Sunshine
	del /F /Q "C:\Program Files\Sunshine\config\sunshine_state.json"
	del /F /Q "C:\Program Files\Sunshine\config\credentials\cacert.pem"
	del /F /Q "C:\Program Files\Sunshine\config\credentials\cakey.pem"
	copy "%location_config%" "C:\Program Files\Sunshine\config\"
	copy "%location_cacert%" "C:\Program Files\Sunshine\config\credentials\"
	copy "%location_cakey%" "C:\Program Files\Sunshine\config\credentials\"
	taskkill /f /im "sunshine.exe"
) else (
	echo 未找到 Sunshine 文件夹
	echo 请先安装 Sunshine！
)
