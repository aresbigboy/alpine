FROM ubuntu:18.04

ENV CONFIG_JSON=none

ADD configure.sh ./configure.sh

RUN sh ./configure.sh

ENTRYPOINT ["sh", "./configure.sh"]
EXPOSE 8080
