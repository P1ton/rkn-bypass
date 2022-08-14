FROM ubuntu:jammy
RUN apt-get update && apt-get install -y sstp-client
COPY health.sh /bin/
RUN chmod +x /bin/health.sh
