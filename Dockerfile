# Використовуємо базовий образ Python з підтримкою Python 3.11
FROM python:3.11

# Встановлюємо віртуальне середовище
RUN python -m venv /venv

# Встановлюємо необхідні залежності
COPY requirements.txt /app/requirements.txt
RUN /venv/bin/pip install -r /app/requirements.txt

# Встановимо змінну середовища для вказівки шляху до віртуального середовища
ENV VIRTUAL_ENV /venv
ENV PATH /venv/bin:$PATH

# Встановимо робочу директорію всередині контейнера
WORKDIR /app

# Копіюємо ваш код в контейнер
COPY .. /app

# Команда для запуску додатку, змініть на своє
CMD ["python", "__main__.py"]
