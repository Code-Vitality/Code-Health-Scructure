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

:: Установка gdscript-linter
echo 🚀 Устанавливаем gdscript-linter...
pip install gdscript-linter

:: Проверка успешности установки
if %ERRORLEVEL% EQU 0 (
    echo ✅ gdscript-linter успешно установлен!
) else (
    echo ❌ Произошла ошибка при установке gdscript-linter.
    exit /b 1
)

:: Проверка наличия gdscript-linter
where gdscript-linter >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✅ gdscript-linter успешно установлен и доступен в командной строке.
) else (
    echo ❌ gdscript-linter не найден в PATH. Проверьте логи установки.
    exit /b 1
)
