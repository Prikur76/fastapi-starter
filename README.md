Готово — ниже **финальный, полностью оформленный README.md с бейджами**, идеально подходящий для публикации на GitHub.
Он основан на содержимом твоего стартера, учитывает структуру файлов, возможности шаблона и позиционирование через Copier.

---

# 📦 FastAPI Starter Template

<p align="center">
  <a href="https://fastapi.tiangolo.com/">
    <img src="https://img.shields.io/badge/FastAPI-0.115+-009688?logo=fastapi&logoColor=white" alt="FastAPI">
  </a>
  <a href="https://www.python.org/">
    <img src="https://img.shields.io/badge/Python-3.12+-3776AB?logo=python&logoColor=white" alt="Python">
  </a>
  <a href="https://github.com/Prikur76/fastapi-starter-template/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License MIT">
  </a>
  <a href="https://github.com/copier-org/copier"><img src="https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/copier-org/copier/master/img/badge/badge-grayscale-inverted-border-teal.json
" alt="Copier" style="max-width:100%;"/>
  </a>
  <br/>  
</p>

---

Минимальный, аккуратный и структурированный starter-шаблон FastAPI-проекта, предназначенный **не для запуска как готовый продукт**, а для быстрых стартов новых сервисов.

Шаблон позволяет разработчикам избегать рутинной настройки:

* структуры проекта
* подготовки Docker-окружения
* настройки Alembic
* конфигурирования Pydantic Settings
* подключения линтеров и pre-commit
* формирования `.env`
* базовых слоёв API, моделей и схем

С помощью **Copier** можно разворачивать новый проект за 5–10 секунд.

---

# 🚀 Возможности шаблона

### 🔹 Подготовленная структура проекта

* `api/` — эндпоинты (с примером `/health`)
* `core/` — конфигурация и инфраструктура
* `db/` — SQLAlchemy engine и SessionLocal
* `models/` — ORM-модели
* `schemas/` — Pydantic-модели
* `services/` — бизнес-логика
* `main.py` — приложение FastAPI

### 🔹 Готовая работа с БД

* SQLAlchemy 2.0 (синхронный engine, пул соединений)
* Alembic настроен через `alembic/env.py`
* Миграции применяются при старте Docker

### 🔹 DevOps-инфраструктура

* Dockerfile (multi-stage)
* docker-compose (web + PostgreSQL)
* Healthchecks
* Переменные окружения через `.env`

### 🔹 Инструменты разработчика

* Ruff (линтер + форматирование)
* Pre-commit хуки
* EditorConfig
* pytest-ready структура

### 🔹 Copier-шаблон

* `copier.yml` с параметрами проекта
* Автоматическая генерация `.env`
* Исключения через `.copier-ignore`

---

# 📥 Установка нового проекта через Copier

Установите Copier:

```bash
pip install copier
```

Сгенерировать новый проект из шаблона:

```bash
copier copy gh:Prikur76/fastapi-starter new-project --trust
```

или локально:

```bash
copier copy /path/to/fastapi-starter new-project --trust
```

Copier задаст параметры:

* project_name
* project_description
* python_version
* PostgreSQL пользователи/БД
* автор

Ответы сохраняются в `.copier/.copier-answers.yml`.

---

# 🔧 Настройка git-репозитория

После генерации проекта выполните:

```bash
cd new-project
git init .
```

Если исходный шаблон уже содержал remote — удалите его:

```bash
git remote remove origin
```

Добавьте свой репозиторий:

```bash
git remote add origin git@github.com:YOUR_USERNAME/YOUR_REPO.git
git add .
git commit -m "Initial commit from FastAPI starter"
git push -u origin main
```

---

# 🐳 Запуск проекта

## 1. Переменные окружения

Скопируйте `.env.example` в `.env` и при необходимости измените значения.
Если его нет:

```bash
python .copier/update_dotenv.py
```

## 2. Запуск docker-compose

```bash
docker-compose up --build
```

После старта сервис доступен по адресу:

```
http://localhost:8000
```

Документация API:

```
http://localhost:8000/docs
```

---

# 🛢 Миграции Alembic

### Создать миграцию:

```bash
alembic revision -m "init"
```

### Применить миграции:

```bash
alembic upgrade head
```

---

# 📁 Структура проекта

```
src/
├── api/
│   ├── v1/
│   │   ├── health.py
│   │   └── __init__.py
│   ├── deps.py
│   └── __init__.py
├── core/
│   ├── config.py
│   └── security.py
├── db/
│   ├── session.py
│   └── __init__.py
├── models/
│   ├── base.py
│   └── __init__.py
├── schemas/
├── services/
├── main.py
```

Сопутствующие файлы:

* `.pre-commit-config.yaml`
* `.editorconfig`
* `Dockerfile`
* `docker-compose.yml`
* `copier.yml`
* `alembic.ini`
* `tests/`

---

# 🤝 CONTRIBUTING

Мы приветствуем Pull Request'ы!

### Перед вкладом убедитесь:

* Линтеры проходят:

  ```bash
  pre-commit run --all-files
  ```
* Тесты проходят:

  ```bash
  pytest -q
  ```
* Документация обновлена, если вы добавили новые функции.

---

# 🙌 Зачем нужен этот шаблон?

Он создан для команд и разработчиков, которые хотят:

* быстро стартовать новый микросервис на FastAPI
* иметь единообразные структуры проекта
* не тратить время на настройку Docker, SQLAlchemy, Alembic
* получить современный минималистичный foundation без лишней магии
* добавить свои модули, модели, сервисы сразу «в чистую основу»

Этот шаблон — **конструктор**, а не готовое приложение.

---
