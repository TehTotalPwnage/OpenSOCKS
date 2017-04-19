# Dockerfile for LEMP stack in development mode.
FROM debian:wheezy

MAINTAINER tehtotalpwnage "tehtotalpwnage@gmail.com"

# Run all package installation steps.
RUN apt-get update
RUN apt-get install -y openvpn dante-server

COPY openvpn/ /opensocks/
COPY sockd.conf /etc/danted.conf
COPY opensocks.sh /usr/local/bin/opensocks

RUN chmod +x /usr/local/bin/opensocks
# Expose NGINX listening port.
EXPOSE 1080

# Entrypoint and CMD.
ENTRYPOINT ["opensocks"]

CMD ["start"]
