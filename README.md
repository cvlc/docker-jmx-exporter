
## Build

    docker build -t cvlc/jmx-exporter .

## Example (Kafka)

    docker run -d -e REMOTE_HOST=kafka:9010 -p 9138 cvlc/jmx-exporter "https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/kafka-0-8-2.yml"
