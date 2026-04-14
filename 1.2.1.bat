@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
    echo Usage: %0 directory_name
    exit /b 1
)

if not exist "%1" (
    echo error.
    exit /b 1
)

set count=0

for /d /r "%1" %%d in (System*) do (
    set /a count+=1
    echo %%d
)

echo.
echo total with "System": %count%
endlocal