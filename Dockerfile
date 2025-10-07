FROM maven:3.9.4-eclipse-temurin-17
WORKDIR /app
COPY pom.xml ./
RUN mvn clean package
COPY src/ ./src/
EXPOSE 8080
CMD ["java", "-jar", "target/java-docker-tutorial-1.0-SNAPSHOT.jar"]