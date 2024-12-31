import os

def find_gitkeep_files_and_extract_names(directory):
    technologies = []  # Список для хранения названий технологий
    for root, dirs, files in os.walk(directory, topdown=True):
        if '.gitkeep' in files:
            # Вычисляем относительный путь
            relative_path = os.path.relpath(root, directory)
            # Проверяем, содержит ли путь папку "languages"
            if "languages" in relative_path:
                # Извлекаем технологию из пути
                tech_name = relative_path.split(os.sep)[-1]
                technologies.append(tech_name)
                print(f"Relative Path: {relative_path}")  # Выводим путь в консоль
    return technologies

def create_todo_with_message(technologies):
    message = (
        "# 🌟 Приветствуем разработчиков! 🚀\n\n"
        "Если вы являетесь экспертом в одной или нескольких из технологий, перечисленных ниже, и знакомы с лучшими практиками в их использовании, "
        "мы будем рады вашей помощи в развитии наших проектов. 💡\n\n"
        "## 🏗️ Список технологий, в которых мы ищем поддержку\n\n"
    )

    technology_list = "\n".join([f"- {tech}" for tech in technologies])

    full_message = message + technology_list + "\n\n"
    full_message += "Если вам интересно присоединиться и внести свой вклад в развитие этих технологий, мы будем рады сотрудничеству! 🤝\n"

    # Записываем это в файл todo.md с кодировкой UTF-8
    file_path = "todo.md"
    with open(file_path, "w", encoding="utf-8") as file:
        file.write(full_message)

# Получаем текущую директорию
current_directory = os.getcwd()
technologies = find_gitkeep_files_and_extract_names(current_directory)

# Создаем todo.md с нужным сообщением
create_todo_with_message(technologies)
