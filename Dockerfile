# Stage 1: Build the application
FROM eclipse-temurin:23-jdk AS builder
WORKDIR /app
COPY . .
RUN ./gradlew clean bootJar

# Stage 2: Use a slim runtime image (JDK 23-based)
FROM eclipse-temurin:23.0.2_7-jre-ubi9-minimal
WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /app/build/libs/demo-web-0.0.1-SNAPSHOT.jar /app/app.jar

# Expose the default Spring Boot port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]