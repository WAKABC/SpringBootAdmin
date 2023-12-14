FROM adoptopenjdk/openjdk8

#LABLE wuanakng <wuankang588@163.com>

USER root

# 备份原始的 sources.list 文件
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak

# 将阿里云镜像源追加到 sources.list 文件中
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list

# 更新软件包列表
RUN apt update

RUN apt-get install -y nohup

ARG APP_JAR

WORKDIR /home/app/

RUN mkdir -p /var/log/admin/

COPY $APP_JAR AppAdmin.jar

EXPOSE 9999

CMD ["nohup java -jar AppAdmin.jar 2>&1 > /var/log/admin/admin.log &"]
