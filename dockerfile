FROM adoptopenjdk/openjdk8

USER root

#ARG APP_JAR

WORKDIR /home/app/

VOLUME /home/app

COPY target/AppAdmin-2.7.17.jar /home/app/app.jar

RUN mkdir /home/app/logs && chmod -R 777 /home/app

EXPOSE 9999

CMD nohup java -jar app.jar > logs/admin.log 2>&1 &
