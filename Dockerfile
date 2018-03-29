FROM  openjdk:8u151-jre-alpine3.7
RUN echo http://mirror.yandex.ru/mirrors/alpine/v3.7/main > /etc/apk/repositories; \
    echo http://mirror.yandex.ru/mirrors/alpine/v3.7/community >> /etc/apk/repositories

RUN apk update && apk add jq && apk add bash

ADD target/payments2-0.0.1-SNAPSHOT-fat.jar /service.jar
#ADD cluster.xml /cluster.xml

RUN mkdir /realm
ADD realm /opt/realm
ADD docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /

EXPOSE 5701
#EXPOSE 5702
EXPOSE 5705
EXPOSE 5709
#EXPOSE 15701
#EXPOSE 15702
EXPOSE 15709
#CMD ["java"]

#HEALTHCHECK --interval=10s --timeout=3s --retries=5 CMD curl -f / http://localhost:8091/version || exit 1

ENTRYPOINT [ "/docker-entrypoint.sh" ]

