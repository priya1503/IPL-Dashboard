FROM openjdk:11

COPY app.jar target/ipl-dashboard-0.0.1-SNAPSHOT.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "/app.jar"]