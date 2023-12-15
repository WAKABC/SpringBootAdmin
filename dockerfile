FROM adoptopenjdk/openjdk8

USER root

#ARG APP_JAR

WORKDIR /home/app/

RUN mkdir logs && chomod -R 777 /home/app

VOLUME /home/app

COPY target/AppAdmin-2.7.17.jar /home/app/

EXPOSE 9999

CMD nohup java -jar AppAdmin.jar > logs/admin.log 2>&1 &
