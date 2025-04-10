@echo off

tasklist /fi "ImageName eq frpc.exe" /fo csv 2>NUL | find /I "frpc.exe">NUL

if "%ERRORLEVEL%"=="0" (
    echo frpc sudah ada
) else (
    echo menjalakan frpc,nircmd, 
    cmd /K "nircmd win hide ititle 'frpc.exe' & frpc -c frpc.ini"
)


