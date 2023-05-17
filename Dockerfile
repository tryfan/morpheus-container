FROM ubuntu:22.04

RUN apt-get update && \
  apt-get -y install wget sudo && \
  apt-get clean

RUN wget -q -O /tmp/morpheus.deb https://morpheus.zip/6.1.0-2/ubuntu && \
  dpkg -i /tmp/morpheus.deb && \
  rm /tmp/morpheus.deb

RUN sed -i "s/^default.'morpheus_solo'..'check-server'..'enable'. = true/default['morpheus_solo']['check-server']['enable'] = false/" /opt/morpheus/embedded/cookbooks/morpheus-solo/attributes/default.rb
RUN mv /opt/morpheus/embedded/cookbooks/morpheus-solo/recipes/check_server_disable.rb /opt/morpheus/embedded/cookbooks/morpheus-solo/recipes/check-server_disable.rb

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libtool-bin libpng-dev freerdp2-dev python3-yaml iputils-ping \
  autoconf binutils-doc bison build-essential flex gettext ncurses-dev libcairo2-dev libossp-uuid-dev curl \
  libpango1.0-dev libssh2-1-dev libtelnet-dev libvncserver-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev && \
  apt-get clean

RUN mkdir /scripts
COPY make-morpheus-rb.sh /scripts/make-morpheus-rb.sh
COPY modify-app-yaml.sh /scripts/modify-app-yaml.sh
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

EXPOSE 443

ENTRYPOINT [ "/sbin/entrypoint.sh" ]
