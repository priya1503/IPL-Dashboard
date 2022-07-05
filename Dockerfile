FROM openjdk:11.0
WORKDIR /app
RUN pwd
RUN ls
RUN readlink -f ipl-dashboard-0.0.1-SNAPSHOT.jar

COPY /app/target/ipl-dashboard-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/app.jar"]