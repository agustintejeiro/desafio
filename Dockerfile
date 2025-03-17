# Usamos una imagen base de Python
FROM python:3.9-slim

# Establecer el directorio de trabajo en /app
WORKDIR /app

# Copiar los archivos locales a la imagen
COPY . .

# Instalar las dependencias
RUN pip install -r requirements.txt

# Exponer el puerto en el que la app estará corriendo
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["python", "app.py"]