#!/bin/bash

# Проверка на наличие gdfmt
if ! command -v gdscriptfmt &> /dev/null
then
    echo "❌ gdfmt не найден. Пожалуйста, установите gdfmt."
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

echo "🚀 Форматируем все файлы GDScript в директории $DIRECTORY..."

# Рекурсивное форматирование всех .gd файлов
find "$DIRECTORY" -type f -name "*.gd" -exec gdscriptfmt {} \;

# Проверка успешности форматирования
if [ $? -eq 0 ]; then
    echo "✅ Все файлы GDScript успешно отформатированы!"
else
    echo "❌ Произошла ошибка при форматировании файлов."
    exit 1
fi
