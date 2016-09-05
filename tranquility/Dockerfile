FROM openjdk:8-jre

ENV TRANQUILITY_HOME=/usr/local/tranquility

RUN mkdir -p $TRANQUILITY_HOME

ARG TRANQUILITY_VERSION=0.8.2

RUN curl "http://static.druid.io/tranquility/releases/tranquility-distribution-$TRANQUILITY_VERSION.tgz" \
      | tar zxf - --strip-components 1 -C $TRANQUILITY_HOME

RUN mkdir -p $TRANQUILITY_HOME/extensions \
             $TRANQUILITY_HOME/var/tmp

VOLUME $TRANQUILITY_HOME/conf
VOLUME $TRANQUILITY_HOME/extensions

WORKDIR $TRANQUILITY_HOME

ENTRYPOINT ["bin/tranquility"]
