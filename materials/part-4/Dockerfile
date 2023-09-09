FROM nginx:latest

USER root

COPY ./hello.c /home/hello.c
COPY ./start_point.sh /home/start_point.sh
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get upgrade -y && \
    apt-get install -y gcc spawn-fcgi libfcgi-dev;

WORKDIR /home/

ENTRYPOINT ["sh", "./start_point.sh"]