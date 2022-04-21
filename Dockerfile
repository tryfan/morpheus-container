FROM ubuntu:20.04

RUN apt update
RUN apt -y install sudo

ADD https://downloads.morpheusdata.com/files/morpheus-appliance_5.4.5-1_amd64.deb /tmp/morpheus.deb
RUN dpkg -i /tmp/morpheus.deb
RUN rm /tmp/morpheus.deb
RUN sed -i "s/^default.'morpheus_solo'..'check-server'..'enable'. = true/default['morpheus_solo']['check-server']['enable'] = false/" /opt/morpheus/embedded/cookbooks/morpheus-solo/attributes/default.rb
RUN mv /opt/morpheus/embedded/cookbooks/morpheus-solo/recipes/check_server_disable.rb /opt/morpheus/embedded/cookbooks/morpheus-solo/recipes/check-server_disable.rb

RUN mkdir /scripts
COPY make-morpheus-rb.sh /scripts/make-morpheus-rb.sh
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

EXPOSE 80
EXPOSE 443

ENTRYPOINT [ "/sbin/entrypoint.sh" ]
