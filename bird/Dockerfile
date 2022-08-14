FROM ibhde/bird4:1.6.8

RUN apt update && apt install -y wget

#ENTRYPOINT /usr/sbin/bird -c /etc/bird/bird.conf
ENTRYPOINT ["/usr/sbin/bird", "-f"]
CMD []
