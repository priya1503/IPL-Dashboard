FROM openjdk:11.0

EXPOSE 8081
ENTRYPOINT ["java","-jar","/app.jar"]