FROM lsiobase/ubuntu:bionic

LABEL maintainer="starcraft66@gmail.com"

ARG DEBIAN_FRONTEND="noninteractive"
ARG KERIO_CONNECT_NOT_RUN="yes"

RUN curl -L http://cdn.kerio.com/dwn/connect/connect-9.2.10-4692/kerio-connect-9.2.10-4692-linux-amd64.deb > /tmp/kerio.deb && \
    dpkg -i /tmp/kerio.deb || true && \
    apt-get update && \
    apt-get -f -y install && \
    apt-get -y install libcap2-bin && \
    apt-get -y upgrade && \
    dpkg --fsys-tarfile /tmp/kerio.deb | tar xOf - ./etc/init.d/kerio-connect > /kerio-connect && \
    chmod +x /kerio-connect && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

COPY root/ /

EXPOSE 25 80 110 119 143 389 443 465 563 587 636 993 995 4040 5222 5223

VOLUME /opt/kerio/mailserver/cluster.cfg /opt/kerio/mailserver/users.cfg /opt/kerio/mailserver/mailserver.cfg /opt/kerio/mailserver/stats.dat /opt/kerio/mailserver/license /opt/kerio/mailserver/store /opt/kerio/mailserver/sslcert /opt/kerio/mailserver/stats.dat /opt/kerio/mailserver/charts.dat
