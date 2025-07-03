@echo off
REM Script de deploy para Exam_Perez en Windows
REM Este script construye la imagen Docker y ejecuta el contenedor

echo 🚀 Iniciando deploy de Exam_Perez...

REM Detener y eliminar contenedor existente si existe
echo 🛑 Deteniendo contenedor existente...
docker stop exam-perez 2>nul
docker rm exam-perez 2>nul

REM Construir nueva imagen
echo 🔨 Construyendo imagen Docker...
docker build -t exam-perez:latest .

if %errorlevel% equ 0 (
    echo ✅ Imagen construida exitosamente

    REM Ejecutar contenedor
    echo 🚀 Ejecutando contenedor...
    docker run -d --name exam-perez -p 8080:8080 --restart unless-stopped exam-perez:latest

    if %errorlevel% equ 0 (
        echo ✅ Contenedor ejecutándose correctamente
        echo 📱 Aplicación disponible en: http://localhost:8080
        echo 📚 Swagger UI: http://localhost:8080/swagger-ui.html
        echo 🗄️ H2 Console: http://localhost:8080/h2-console
        echo 💚 Health Check: http://localhost:8080/actuator/health
        echo.
        echo 🔑 Credenciales por defecto:
        echo    Username: admin
        echo    Password: password123
        echo.
        echo 📊 Para ver logs: docker logs -f exam-perez
        echo 🛑 Para detener: docker stop exam-perez
    ) else (
        echo ❌ Error al ejecutar el contenedor
        exit /b 1
    )
) else (
    echo ❌ Error al construir la imagen
    exit /b 1
)

pause
