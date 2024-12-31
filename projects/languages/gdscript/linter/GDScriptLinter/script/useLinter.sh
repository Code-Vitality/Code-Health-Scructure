#!/bin/bash

# Проверка на наличие gdscript-linter
if ! command -v gdscript-linter &> /dev/null
then
    echo "❌ gdscript-linter не найден. Пожалуйста, установите gdscript-linter."
    exit 1
fi

# Директория по умолчанию — текущая
DIRECTORY="."

# Если указан путь, то используем его как директорию
if [ $# -gt 0 ]; then
    DIRECTORY="$1"
fi

# Проверяем, существует ли указанная директория
if [ ! -d "$DIRECTORY" ]; then
    echo "❌ Директория $DIRECTORY не найдена."
    exit 1
fi

echo "🚀 Проверяем все файлы GDScript в директории $DIRECTORY..."

# Рекурсивная проверка всех .gd файлов
gdscript-linter -r "$DIRECTORY"

# Проверка успешности
if [ $? -eq 0 ]; then
    echo "✅ Все файлы GDScript прошли линтинг!"
else
    echo "❌ Обнаружены ошибки в коде GDScript."
    exit 1
fi
