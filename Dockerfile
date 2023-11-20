# Stage 1: Build the Flask Application
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