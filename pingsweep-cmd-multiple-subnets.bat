@echo off
setlocal enabledelayedexpansion

for /f "delims=" %%i in (subnets.txt) do (
    echo Working on %%i subnet
    set "ipAddress=%%i"
    for /f "tokens=1-4 delims=." %%a in ("!ipAddress!") do (
        set "octet1=%%a"
        set "octet2=%%b"
        set "octet3=%%c"
        set "octet4=%%d"
    )
    for /L %%k in (1,1,254) do (
        echo. & echo Trying !octet1!.!octet2!.!octet3!.%%k
        ping -n 1 -w 1000 !octet1!.!octet2!.!octet3!.%%k >nul  
        if !errorlevel! == 0 (
REM            echo !octet1!.!octet2!.!octet3!.%%k UP >> ping-UP.txt
			echo !octet1!.!octet2!.!octet3!.%%k >> ping-UP.txt
        ) else (
            echo !octet1!.!octet2!.!octet3!.%%k DOWN >> ping-DOWN.txt
        )
    )
)

endlocal
