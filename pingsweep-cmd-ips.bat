@echo off
setlocal enabledelayedexpansion
REM ips.txt contains 1 ip address per line
for /f "delims=" %%a in (ips.txt) do (
    echo. & ECHO Trying %%a
    ping -n 1 -w 1000 %%a >nul  
    if !errorlevel! == 0 (
REM        echo %%a UP >> C:\Users\Admin\Documents\exceptions-tools-scripts\up-ips.txt
        echo %%a >> up-ips.txt
    ) else (
        echo %%a DOWN >> down-ips.txt
    )
)
endlocal