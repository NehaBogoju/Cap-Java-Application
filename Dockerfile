FROM maven:3.8.7-openjdk-8
WORKDIR /app
COPY . .
RUN mvn clean package
EXPOSE 8086
CMD ["java", "-jar", "target/maven-web-application.war"]