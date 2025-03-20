# Desafío de Containerización y Despliegue en la Nube

Este proyecto es parte de un desafío para demostrar habilidades en containerización, configuración de pipelines CI/CD, y despliegue en la nube utilizando Docker, GitHub Actions y DigitalOcean.

## Instrucciones de Configuración

### Requisitos Previos
1. Tener instalado [Docker](https://www.docker.com/get-started).
2. Tener una cuenta en [DockerHub](https://hub.docker.com/).
3. Tener una cuenta en [GitHub](https://github.com/).
4. Tener una cuenta gratuita en [DigitalOcean](https://www.digitalocean.com/).

### Pasos para ejecutar la aplicación localmente

1. Clona el repositorio:

    ```bash
    git clone https://github.com/atejeiro/desafio.git
    cd desafio
    ```

2. Construye la imagen Docker:

    ```bash
    docker build -t atejeiro/desafio:latest .
    ```

3. Corre el contenedor Docker:

    ```bash
    docker run -p 8080:8080 atejeiro/desafio:latest
    ```

4. Accede a la aplicación en tu navegador visitando:

    ```
    http://localhost:8080
    ```

    La aplicación mostrará el mensaje **"¡Hola Mundo, Soy Agustin!"**.

### Despliegue en DigitalOcean

1. La aplicación está desplegada en **DigitalOcean**.

2. El despliegue se realiza automáticamente mediante un pipeline CI/CD configurado con **GitHub Actions**, que:
    - Construye la imagen Docker.
    - La sube a DockerHub.
    - Despliega la imagen en **DigitalOcean**.

## Descripción de la Containerización

La aplicación está containerizada utilizando Docker. El **Dockerfile** se encuentra en la raíz del proyecto y fue creado para contener una aplicación Flask simple en Python que muestra el mensaje "¡Hola Mundo, Soy Agustin!".

### Dockerfile

```Dockerfile
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