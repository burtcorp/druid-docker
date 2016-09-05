FROM openjdk:8-jre

ENV DRUID_HOME=/usr/local/druid

RUN mkdir -p $DRUID_HOME

ARG DRUID_VERSION=0.9.1.1

RUN curl "http://static.druid.io/artifacts/releases/druid-$DRUID_VERSION-bin.tar.gz" \
      | tar zxf - --strip-components 1 -C $DRUID_HOME

RUN curl "http://static.druid.io/artifacts/releases/mysql-metadata-storage-$DRUID_VERSION.tar.gz" \
      | tar zxf - -C $DRUID_HOME/extensions

RUN mkdir -p $DRUID_HOME/var/druid \
             $DRUID_HOME/var/tmp

COPY run.sh $DRUID_HOME/bin/run.sh

# Remove config properties to make it possible to specify them on the command line
RUN sed -i '/druid.extensions.loadList=/s/^/#/' $DRUID_HOME/conf/druid/_common/common.runtime.properties
RUN sed -i '/druid.zk.service.host=/s/^/#/' $DRUID_HOME/conf/druid/_common/common.runtime.properties
RUN sed -i '/druid.metadata.storage./s/^/#/' $DRUID_HOME/conf/druid/_common/common.runtime.properties

VOLUME $DRUID_HOME/var/druid

WORKDIR $DRUID_HOME

EXPOSE 8081-8083 8090

ENTRYPOINT ["bin/run.sh"]
