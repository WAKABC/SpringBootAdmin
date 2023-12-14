FROM adoptopenjdk/openjdk8

#LABLE wuanakng <wuankang588@163.com>

USER root

RUN apt-get update && apt-get install -y nohup

ARG APP_JAR

WORKDIR /home/app/

RUN mkdir -p /var/log/admin/

COPY $APP_JAR AppAdmin.jar

EXPOSE 9999

CMD ["nohup java -jar AppAdmin.jar 2>&1 > /var/log/admin/admin.log &"]
