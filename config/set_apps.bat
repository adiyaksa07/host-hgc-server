@echo off

:: 此批处理脚本用于更新 Sunshine 的 apps.json 文件并重启 Sunshine 服务。
:: 功能说明：
:: 1. 检查 Sunshine 的配置文件夹是否存在。
:: 2. 如果存在，则检查 apps.json 是否存在。
:: 3. 如果 apps.json 存在，则删除旧文件并复制新文件。
:: 4. 使用 CURL 发送请求重启 Sunshine。
:: 5. 如果缺少文件或文件夹，提示用户重新安装 Sunshine。

set location_sunshine=C:\Program Files\Sunshine\config
set location_config=%~dp0apps.json

if exist "%location_sunshine%" (
	echo 找到 Sunshine 文件夹
	if exist "%location_config%" ( 
		echo 找到 apps.json
		del /F /Q "C:\Program Files\Sunshine\config\apps.json"
		echo 默认 apps.json 已删除
		copy "%location_config%" "%location_sunshine%"
		echo apps.json 已更新
		curl -u sunshine:admin -X POST -k https://localhost:47990/api/restart
		echo Sunshine 已重新启动
	) else ( 
		echo 未找到 apps.json
	)
) else ( 
	echo 未找到 Sunshine 文件夹和 apps.json
	echo 请重新安装 Sunshine！
)
