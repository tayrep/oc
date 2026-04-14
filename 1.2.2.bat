@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
    exit /b 1
)

if not exist "%1" (
    exit /b 1
)

set count=0

echo found:

for /r "%1" %%f in (*.exe *.com *.bat) do (
    echo %%f
    set /a count+=1
)

echo.
echo total executable files: %count%
endlocal