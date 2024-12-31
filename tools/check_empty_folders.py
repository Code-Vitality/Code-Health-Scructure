import os

def check_empty_folders_and_create_gitkeep(directory):
    # Получаем список всех элементов в директории
    for root, dirs, files in os.walk(directory, topdown=True):  # topdown=True, чтобы сначала обрабатывать текущую директорию
        # Исключаем папки .git и tech из обработки
        dirs[:] = [d for d in dirs if d != '.git' and d != 'tech']
        
        # Для каждой директории проверяем, пуста ли она
        for dir in dirs:
            dir_path = os.path.join(root, dir)
            # Проверяем, пуста ли директория
            if not os.listdir(dir_path):
                # Выводим относительный путь к папке
                relative_path = os.path.relpath(dir_path, directory)
                print(f"Папка пуста: {relative_path}")
                
                # Создаем файл .gitkeep в пустой папке
                gitkeep_path = os.path.join(dir_path, '.gitkeep')
                with open(gitkeep_path, 'w') as f:
                    f.write("# This folder is kept by gitkeep\n")
                print(f"Файл .gitkeep создан в: {relative_path}")

# Получаем текущую директорию
current_directory = os.getcwd()
check_empty_folders_and_create_gitkeep(current_directory)
