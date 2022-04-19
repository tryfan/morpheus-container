#!/bin/sh

bash /tmp/make-morpheus-rb.sh
cat /etc/morpheus/morpheus.rb
morpheus-ctl reconfigure
morpheus-ctl start
morpheus-ctl tail