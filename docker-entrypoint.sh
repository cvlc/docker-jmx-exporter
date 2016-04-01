#!/bin/bash
set -e
jar='jmx_prometheus_httpserver-*.jar'
java ${JVM_OPTS:--Xmx256m} -jar $jar 9138 "$@"