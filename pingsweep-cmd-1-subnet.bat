@echo off
setlocal enabledelayedexpansion
set /p subnet=Enter 1st 3 octets of IP address range (e.g., 192.168.1)

for /L %%k in (1,1,254) do (
    cls
    echo. & ECHO Trying %subnet%.%%k
    ping -n 1 -w 1000 %subnet%.%%k >nul  
    IF !errorlevel! == 0 (
REM        echo %subnet%.%%k UP >> C:\Users\Admin\Documents\exceptions-tools-scripts\up-ips.txt
        echo %subnet%.%%k >> C:\Users\Admin\Documents\exceptions-tools-scripts\up-ips.txt 
    ) ELSE (
        echo %subnet%.%%k DOWN >> C:\Users\Admin\Documents\exceptions-tools-scripts\down-ips.txt
    )
)
endlocal