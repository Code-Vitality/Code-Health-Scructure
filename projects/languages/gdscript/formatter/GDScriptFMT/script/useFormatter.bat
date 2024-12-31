@echo off
chcp 65001 >nul

echo 🚀 Проверяем наличие gdfmt...

:: Проверка наличия gdfmt
where gdscriptfmt >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ gdfmt не найден. Пожалуйста, установите gdfmt.
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

echo 🚀 Форматируем все файлы GDScript в директории %DIRECTORY%...

:: Рекурсивное форматирование всех .gd файлов
for /r "%DIRECTORY%" %%f in (*.gd) do (
    gdscriptfmt "%%f"
)

:: Проверка успешности форматирования
if %ERRORLEVEL% EQU 0 (
    echo ✅ Все файлы GDScript успешно отформатированы!
) else (
    echo ❌ Произошла ошибка при форматировании файлов.
    exit /b 1
)
