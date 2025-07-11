# Etapa de construcción
FROM maven:3.9.5-amazoncorretto-17 AS build

# Establecer variables de entorno para codificación
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    MAVEN_OPTS="-Dfile.encoding=UTF-8 -Dproject.build.sourceEncoding=UTF-8"

# Establecer directorio de trabajo
WORKDIR /app

# Copiar solo pom.xml primero para aprovechar la cache de Docker
COPY pom.xml .

# Descargar dependencias (se cachea si pom.xml no cambia)
RUN mvn dependency:go-offline -B

# Copiar código fuente
COPY src ./src

# Construir la aplicación con optimizaciones y codificación UTF-8
RUN mvn clean package -DskipTests -B -q \
    -Dfile.encoding=UTF-8 \
    -Dproject.build.sourceEncoding=UTF-8 \
    -Dproject.reporting.outputEncoding=UTF-8

# Etapa de ejecución
FROM amazoncorretto:17-alpine-jdk

# Establecer variables de entorno para codificación
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    JAVA_OPTS="-Dfile.encoding=UTF-8 -Xmx512m -Xms256m"

# Crear usuario no root para seguridad
RUN addgroup -g 1001 -S appgroup && \
    adduser -S appuser -u 1001 -G appgroup

# Establecer directorio de trabajo
WORKDIR /app

# Copiar el jar desde la etapa de construcción
COPY --from=build /app/target/*.jar app.jar

# Cambiar propietario de los archivos
RUN chown -R appuser:appgroup /app

# Cambiar al usuario no root
USER appuser

# Exponer puerto
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/health || exit 1

# Punto de entrada - usar perfil prod con H2
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar --spring.profiles.active=prod"]
