FROM  openjdk:11-jre-buster

RUN apt-get update && \
    apt-get install -y curl

ENV KAKFA_VERSION 3.5.1
ENV SCALA_VERSION 2.13


RUN mkdir /tmp/kafka && \
    curl "https://downloads.apache.org/kafka/${KAKFA_VERSION}/kafka_${SCALA_VERSION}-${KAKFA_VERSION}.tgz" \
    -o /tmp/kafka/kafka.tgz && \
    mkdir /kafka && cd /kafka && \
    tar -xvzf /tmp/kafka/kafka.tgz --strip 1

COPY start-kafka.sh /usr/bin
RUN chmod +x /usr/bin/start-kafka.sh

CMD [ "start-kafka.sh" ]