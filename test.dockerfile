FROM prometheus_build:latest
WORKDIR /prometheus/
RUN make test-short
