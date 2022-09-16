FROM golang:latest
RUN apt update
RUN apt-get install -y npm
RUN git clone https://github.com/eminems95/prometheus.git
WORKDIR /prometheus/
RUN make build
VOLUME prometheus_vol
