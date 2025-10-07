# -------- Stage 1: Build the WAR --------
    FROM maven:3.8.7-eclipse-temurin-8 AS builder
    WORKDIR /app
    COPY . .
    RUN mvn clean package
    
    # -------- Stage 2: Run the WAR --------
    FROM openjdk:8-jdk-alpine
    WORKDIR /app
    COPY --from=builder /app/target/maven-web-application.war app.war
    EXPOSE 8080
    CMD ["java", "-jar", "app.war"]