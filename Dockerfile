FROM debian:8

ENV DEBIAN_FRONTEND noninteractive

ENV JAVA_VERSION 8
ENV JMX_PROMETHEUS_HTTPSERVER_VERSION 0.7-SNAPSHOT
ENV JMX_PROMETHEUS_CONFIG /jmx_prometheus/config.yml
ENV REMOTE_HOST tomcat:9010

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
  DISTRO=debian && \
  CODENAME=jessie && \
  echo "deb http://http.debian.net/${DISTRO} ${CODENAME}-backports main" >> /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install -yq --no-install-recommends \
      apt-utils \
      bash \
      curl \
      openjdk-${JAVA_VERSION}-jre-headless && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /jmx_prometheus_httpserver /jmx_prometheus
WORKDIR /jmx_prometheus_httpserver
RUN curl -O -k -L https://github.com/yagniio/docker-jmx-exporter/releases/download/$JMX_PROMETHEUS_HTTPSERVER_VERSION/jmx_prometheus_httpserver-$JMX_PROMETHEUS_HTTPSERVER_VERSION-jar-with-dependencies.jar

ADD docker-entrypoint.sh /jmx_prometheus_httpserver/docker-entrypoint.sh

EXPOSE     9138

ENTRYPOINT ["/jmx_prometheus_httpserver/docker-entrypoint.sh"]
CMD "https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/tomcat.yml"
