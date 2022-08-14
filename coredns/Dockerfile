FROM coredns/coredns:1.7.0

EXPOSE 53 53/udp
VOLUME ["/etc/coredns"]
ENTRYPOINT ["/coredns"]
CMD ["-conf", "/etc/coredns/Corefile"]
