FROM adoptopenjdk/openjdk8

#LABLE wuanakng <wuankang588@163.com>

USER root

ARG APP_JAR

WORKDIR /home/app/

COPY $APP_JAR AppAdmin.jar

RUN mkdir -p /var/log/admin

EXPOSE 9999

CMD ["nohup java -jar AppAdmin.jar 2>&1 > /var/log/admin/admin.log &"]
