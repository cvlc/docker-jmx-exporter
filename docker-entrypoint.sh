#!/bin/bash
set -e
jar="jmx_prometheus_httpserver-${JMX_PROMETHEUS_HTTPSERVER_VERSION}-jar-with-dependencies.jar"
url="${1}"
curl "$url" -o /jmx_prometheus/config.yml
sed -i /jmx_prometheus/config.yml -e "s%^---.*$%---\nhostPort: ${REMOTE_HOST}%"
java ${JVM_OPTS:--Xmx256m} -jar "$jar" "9138" "${JMX_PROMETHEUS_CONFIG}" ${@:2}
