FROM ubuntu:20.04

ADD https://downloads.morpheusdata.com/files/morpheus-appliance_5.4.5-1_amd64.deb /tmp/morpheus.deb
RUN dpkg -i /tmp/morpheus.deb
RUN rm /tmp/morpheus.deb

COPY make-morpheus-rb.sh /tmp/make-morpheus-rb.sh
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

ENTRYPOINT [ "/sbin/entrypoint.sh" ]