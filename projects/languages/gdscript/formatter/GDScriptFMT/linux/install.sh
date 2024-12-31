#!/bin/bash

echo "🚀 Проверяем наличие Python и pip..."

# Проверяем, установлен ли Python
if ! command -v python3 &> /dev/null
then
    echo "❌ Python не найден. Пожалуйста, установите Python и попробуйте снова."
    exit 1
fi

# Проверяем, установлен ли pip
if ! command -v pip3 &> /dev/null
then
    echo "❌ pip не найден. Пожалуйста, установите pip и попробуйте снова."
    exit 1
fi

echo "✅ Python и pip найдены!"

# Устанавливаем gdfmt
echo "🚀 Устанавливаем gdfmt..."
pip3 install gdscriptfmt

# Проверяем, успешно ли выполнена установка
if [ $? -eq 0 ]; then
    echo "✅ gdfmt успешно установлен!"
else
    echo "❌ Произошла ошибка при установке gdfmt."
    exit 1
fi

# Проверяем наличие gdfmt
if command -v gdscriptfmt &> /dev/null
then
    echo "✅ gdfmt успешно установлен и доступен в командной строке."
else
    echo "❌ gdfmt не найден в PATH. Проверьте логи установки."
    exit 1
fi
