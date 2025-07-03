# Exam_Perez - Sistema de Gestión de Productos

Sistema de gestión de productos desarrollado con Spring Boot, que incluye autenticación JWT, API REST y documentación con Swagger.

## 🚀 Características

- **Autenticación JWT**: Sistema de login seguro con tokens
- **API REST**: Endpoints para gestión de productos y usuarios
- **Base de datos H2**: Base de datos en memoria para desarrollo y producción
- **Swagger UI**: Documentación interactiva de la API
- **Docker**: Contenederización para deploy fácil
- **Health Check**: Monitoreo de salud de la aplicación

## 📋 Tecnologías

- Java 17
- Spring Boot 3.5.3
- Spring Security
- Spring Data JPA
- H2 Database
- JWT (JSON Web Tokens)
- Swagger/OpenAPI 3
- Docker
- Maven

## 🔧 Instalación y Ejecución

### Opción 1: Usando Docker (Recomendado)

#### En Windows:
```bash
# Ejecutar el script de deploy
deploy.bat
```

#### En Linux/Mac:
```bash
# Dar permisos de ejecución
chmod +x deploy.sh

# Ejecutar el script de deploy
./deploy.sh
```

#### Manualmente con Docker:
```bash
# Construir imagen
docker build -t exam-perez:latest .

# Ejecutar contenedor
docker run -d --name exam-perez -p 8080:8080 --restart unless-stopped exam-perez:latest
```

### Opción 2: Ejecución Local

```bash
# Compilar y ejecutar
mvn spring-boot:run

# O con perfil específico
mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

## 🌐 Endpoints

### Aplicación Principal
- **Aplicación**: http://localhost:8080
- **Swagger UI**: http://localhost:8080/swagger-ui.html
- **API Docs**: http://localhost:8080/api-docs
- **H2 Console**: http://localhost:8080/h2-console
- **Health Check**: http://localhost:8080/actuator/health

### H2 Database Console
- **URL**: `jdbc:h2:mem:proddb` (producción) o `jdbc:h2:mem:devdb` (desarrollo)
- **Username**: `sa`
- **Password**: (vacío)

## 🔑 Credenciales por Defecto

### Usuarios del Sistema
- **Admin**: 
  - Username: `admin`
  - Password: `password123`
- **Usuario**: 
  - Username: `user1`
  - Password: `password123`

## 📊 API Endpoints

### Autenticación
- `POST /api/auth/login` - Iniciar sesión
- `POST /api/auth/register` - Registrar usuario

### Productos
- `GET /api/products` - Listar productos
- `GET /api/products/{id}` - Obtener producto por ID
- `POST /api/products` - Crear producto (requiere autenticación)
- `PUT /api/products/{id}` - Actualizar producto (requiere autenticación)
- `DELETE /api/products/{id}` - Eliminar producto (requiere autenticación)

## 🐳 Docker

### Comandos Útiles
```bash
# Ver logs del contenedor
docker logs -f exam-perez

# Detener contenedor
docker stop exam-perez

# Eliminar contenedor
docker rm exam-perez

# Ver estado del contenedor
docker ps -a | grep exam-perez
```

## 🔧 Configuración

### Perfiles de Configuración
- **dev**: Para desarrollo local con logging detallado
- **prod**: Para producción con configuraciones optimizadas

### Variables de Entorno
- `SPRING_PROFILES_ACTIVE`: Perfil a usar (dev/prod)
- `JWT_SECRET`: Clave secreta para JWT
- `JWT_EXPIRATION`: Tiempo de expiración del token

## 📝 Desarrollo

### Estructura del Proyecto
```
src/
├── main/
│   ├── java/
│   │   └── com/tecsup/edu/pe/exam_perez/
│   │       ├── config/          # Configuraciones
│   │       ├── controller/      # Controladores REST
│   │       ├── dto/             # DTOs
│   │       ├── entity/          # Entidades JPA
│   │       ├── exception/       # Manejo de excepciones
│   │       ├── repository/      # Repositorios JPA
│   │       └── service/         # Lógica de negocio
│   └── resources/
│       ├── application.properties
│       ├── application-dev.properties
│       ├── application-prod.properties
│       └── data.sql             # Datos iniciales
```

## 🛠️ Troubleshooting

### Errores Comunes
1. **Puerto 8080 ocupado**: Cambiar puerto en `application.properties`
2. **Error de permisos en Docker**: Ejecutar con permisos de administrador
3. **Problema con JWT**: Verificar que la clave secreta sea suficientemente larga

### Logs
```bash
# Ver logs de la aplicación
docker logs exam-perez

# Seguir logs en tiempo real
docker logs -f exam-perez
```

## 📞 Soporte

Para problemas o dudas sobre el sistema, contactar al desarrollador.

## 📄 Licencia

Este proyecto es para uso académico - TECSUP
