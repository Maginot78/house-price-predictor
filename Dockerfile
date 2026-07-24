# Imagen base
FROM python:3.11-slim

# Evita generación de .pyc y fuerza logs inmediatos
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Directorio de trabajo
WORKDIR /app

# Copiar primero requirements para aprovechar la caché de Docker
COPY src/api/requirements.txt .

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código de la aplicación
COPY src/api/main.py .
COPY src/api/schemas.py .
COPY src/api/inference.py .

# Copiar modelos
COPY models/ ./models/

# Exponer puerto
EXPOSE 8000

# Comando de arranque
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]