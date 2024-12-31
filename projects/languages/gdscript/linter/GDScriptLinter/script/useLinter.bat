@echo off
chcp 65001 >nul

echo 🚀 Проверяем наличие gdscript-linter...

:: Проверка наличия gdscript-linter
where gdscript-linter >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ gdscript-linter не найден. Пожалуйста, установите gdscript-linter.
    exit /b 1
)

:: Директория по умолчанию — текущая
set DIRECTORY=.

:: Если указан путь, используем его как директорию
if not "%~1"=="" set DIRECTORY=%~1

:: Проверяем, существует ли указанная директория
if not exist "%DIRECTORY%" (
    echo ❌ Директория %DIRECTORY% не найдена.
    exit /b 1
)

echo 🚀 Проверяем все файлы GDScript в директории %DIRECTORY%...

:: Рекурсивная проверка всех .gd файлов
gdscript-linter -r "%DIRECTORY%"

:: Проверка успешности
if %ERRORLEVEL% EQU 0 (
    echo ✅ Все файлы GDScript прошли линтинг!
) else (
    echo ❌ Обнаружены ошибки в коде GDScript.
    exit /b 1
)
