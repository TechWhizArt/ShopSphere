FROM eclipse-temurin:21-jre
WORKDIR /app
COPY target/ecom-proj-0.0.1-SNAPSHOT.jar /app/ecom-proj.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "ecom-proj.jar"]