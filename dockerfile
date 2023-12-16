FROM adoptopenjdk/openjdk8:latest

ARG APP_JAR=some_default_value.jar

WORKDIR /home/app/

COPY target/AppAdmin-2.7.17.jar app.jar

RUN mkdir logs && chmod -R 777 logs

EXPOSE 9999

ENTRYPOINT ["java", "-jar", "app.jar", "> logs/admin.log 2>&1"]
