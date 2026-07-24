# Imagen base
FROM python:3.9-slim

# Evita generación de .pyc y fuerza logs inmediatos
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Directorio de trabajo
WORKDIR /app

# Copiar primero requirements para aprovechar la caché de Docker
COPY . .

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt


# Exponer puerto
EXPOSE 8501

# Comando de arranque
CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0"]