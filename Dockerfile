FROM openjdk:11.0
RUN pwd
RUN ls
RUN readlink -f ipl-dashboard-0.0.1-SNAPSHOT.jar
WORKDIR /app
COPY /app/target/ipl-dashboard-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/app.jar"]