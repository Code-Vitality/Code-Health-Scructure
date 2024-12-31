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

# Устанавливаем gdscript-linter
echo "🚀 Устанавливаем gdscript-linter..."
pip3 install gdscript-linter

# Проверяем, успешно ли выполнена установка
if [ $? -eq 0 ]; then
    echo "✅ gdscript-linter успешно установлен!"
else
    echo "❌ Произошла ошибка при установке gdscript-linter."
    exit 1
fi

# Проверяем наличие gdscript-linter
if command -v gdscript-linter &> /dev/null
then
    echo "✅ gdscript-linter успешно установлен и доступен в командной строке."
else
    echo "❌ gdscript-linter не найден в PATH. Проверьте логи установки."
    exit 1
fi
