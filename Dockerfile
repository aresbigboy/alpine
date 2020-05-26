FROM ubuntu:18.04

ENV CONFIG_JSON=none

RUN curl -L -H "Cache-Control: no-cache" -o ./v2ray.zip https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
RUN mkdir -p ./v2ray/
RUN unzip ./v2ray.zip -d ./v2ray/
RUN rm -rf ./v2ray.zip ./v2ray/*.sig ./v2ray/doc ./v2ray/*.json ./v2ray/*.dat ./v2ray/sys*
RUN chmod -R +x ./v2ray

ADD configure.sh ./configure.sh

RUN chmod +x ./configure.sh

ENTRYPOINT ["sh", "./configure.sh"]
EXPOSE 8080
