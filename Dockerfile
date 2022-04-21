FROM ubuntu:20.04

RUN apt update
RUN apt -y install sudo

ADD https://downloads.morpheusdata.com/files/morpheus-appliance_5.4.5-1_amd64.deb /tmp/morpheus.deb
RUN dpkg -i /tmp/morpheus.deb
RUN rm /tmp/morpheus.deb
RUN sed -i "s/^default.'morpheus_solo'..'check-server'..'enable'. = true/default['morpheus_solo']['check-server']['enable'] = false/" /opt/morpheus/embedded/cookbooks/morpheus-solo/attributes/default.rb
RUN mv /opt/morpheus/embedded/cookbooks/morpheus-solo/recipes/check_server_disable.rb /opt/morpheus/embedded/cookbooks/morpheus-solo/recipes/check-server_disable.rb

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libtool-bin libpng-dev freerdp2-dev \
  autoconf binutils-doc bison build-essential flex gettext ncurses-dev libcairo2-dev libossp-uuid-dev \
  libpango1.0-dev libssh2-1-dev libtelnet-dev libvncserver-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev

ADD https://downloads.morpheusdata.com/files/guacamole-server-1.2.0.tar.gz /tmp/guacamole-server-1.2.0.tar.gz
RUN PKG_CONFIG=/usr/bin/pkg-config CPPFLAGS=-I/usr/local/include LDFLAGS=-L/usr/local/lib \
  cd /tmp && \
  tar -xzf guacamole-server-1.2.0.tar.gz && \
  cd guacamole-server-1.2.0 && \
  autoreconf -if && \
  ./configure && \
  make && \
  make install && \
  ldconfig

RUN apt-get clean

RUN mkdir /scripts
COPY make-morpheus-rb.sh /scripts/make-morpheus-rb.sh
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

EXPOSE 80
EXPOSE 443

ENTRYPOINT [ "/sbin/entrypoint.sh" ]
