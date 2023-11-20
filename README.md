### 3. Сборка и публикация контейнера в Docker Hub

**Шаги:**

1. **Создание Dockerfile:**
   Создайте файл `Dockerfile` в той же директории, что и ваше приложение. Примерный Dockerfile:

```  Dockerfile
   
   
FROM python:3.9 AS backend-builder

WORKDIR /app
COPY requirements.txt ./
COPY . .

# Stage 2: Final Image
FROM python:3.9-slim-buster

WORKDIR /app

COPY --from=backend-builder /app /app
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 32777

CMD ["python", "app.py"]
```



2. **Создание и тестирование образа:**
   - Откройте терминал или командную строку.
   - Перейдите в директорию с вашим приложением и Dockerfile.
   - Соберите образ Docker: `docker build -t hello-world-app .`
   - Запустите контейнер: `docker run -p 32777:32777 hello-world-app`
   - Проверьте, работает ли приложение, открыв в браузере `http://localhost:32777`.

3. **Публикация в Docker Hub:**
   - Создайте учетную запись на [Docker Hub](https://hub.docker.com/), если у вас ее еще нет.
   - Войдите в Docker Hub в терминале: `docker login`.
   - Переименуйте свой образ для Docker Hub: `docker tag hello-world-app [ваше имя пользователя на Docker Hub]/hello-world-app`
   - Отправьте образ в Docker Hub: `docker push [ваше имя пользователя на Docker Hub]/hello-world-app`
