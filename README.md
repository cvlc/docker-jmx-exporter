
Example to start using jmx-exporter within a Docker container to scrap kafka:

    wget https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/kafka-0-8-2.yml -P /tmp

    docker run -it -v /tmp:/jmx_prometheus -p 9138:9138 yagni/jmx-exporter:0.7-SNAPSHOT /jmx_prometheus/kafka-0-8-2.yml

Build

    docker build -t yagni/jmx-exporter:0.7-SNAPSHOT  .
