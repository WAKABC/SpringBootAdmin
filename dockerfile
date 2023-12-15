FROM adoptopenjdk/openjdk8

USER root

ARG APP_JAR

WORKDIR /home/app/

RUN mkdir -p /var/log/admin/

RUN ls -al /var/jenkins_home/workspace/spring-boot-admin/target/

COPY $APP_JAR /home/app/

EXPOSE 9999

CMD "nohup java -jar AppAdmin.jar > /var/log/admin/admin.log 2>&1 &"
