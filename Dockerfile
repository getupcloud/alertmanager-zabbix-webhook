FROM golang:1.10

EXPOSE 8080

RUN adduser webhook --uid 1001 --shell /bin/false  --disabled-login --disabled-password --gecos ""
USER webhook

VOLUME /etc/webhook

RUN go get github.com/getupcloud/alertmanager-zabbix-webhook

ENTRYPOINT ["/usr/bin/alertmanager-zabbix-webhook"]
CMD ["-config", "/etc/webhook/config.yaml"]
