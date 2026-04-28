@echo off
chcp 1251 >nul
setlocal enabledelayedexpansion

set /p direction="Введите научное направление: "
set /p journal="Введите научный журнал: "
echo.

if not exist "Индексы\Направления\%direction%" (
    echo Направление не найдено.
    pause
    exit /b
)
if not exist "Индексы\Журналы\%journal%" (
    echo Журнал не найден.
    pause
    exit /b
)

set count=0

for %%F in ("Индексы\Направления\%direction%\*.lnk") do (
    set "link_name=%%~nF"
    
    if exist "Индексы\Журналы\%journal%\!link_name!.lnk" (
        echo !link_name!
        set /a count+=1
    )
)

if %count%==0 (
    echo Не найдено статей
) else (
    echo Найдено %count% статей
)

echo.
pause