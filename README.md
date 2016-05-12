
Example to start using jmx-exporter within a Docker container to scrap kafka:

    docker run -p 9138:9138 yagni/jmx-exporter:0.7-SNAPSHOT https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/kafka-0-8-2.yml

Build

    docker build -t yagni/jmx-exporter:0.7-SNAPSHOT  .
