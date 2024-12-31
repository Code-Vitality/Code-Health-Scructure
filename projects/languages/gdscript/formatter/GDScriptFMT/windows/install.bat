@echo off
chcp 65001 >nul

echo 🚀 Проверяем наличие Python и pip...

:: Проверка наличия Python
where python >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Python не найден. Пожалуйста, установите Python и попробуйте снова.
    exit /b 1
)

:: Проверка наличия pip
where pip >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ pip не найден. Пожалуйста, установите pip и попробуйте снова.
    exit /b 1
)

echo ✅ Python и pip найдены!

:: Установка gdfmt
echo 🚀 Устанавливаем gdfmt...
pip install gdscriptfmt

:: Проверка успешности установки
if %ERRORLEVEL% EQU 0 (
    echo ✅ gdfmt успешно установлен!
) else (
    echo ❌ Произошла ошибка при установке gdfmt.
    exit /b 1
)

:: Проверка наличия gdfmt в PATH
where gdscriptfmt >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✅ gdfmt успешно установлен и доступен в командной строке.
) else (
    echo ❌ gdfmt не найден в PATH. Проверьте логи установки.
    exit /b 1
)
