#!/bin/sh

bash /scripts/make-morpheus-rb.sh
cat /etc/morpheus/morpheus.rb
/opt/morpheus/embedded/bin/runsvdir-start &
morpheus-ctl reconfigure
morpheus-ctl start
morpheus-ctl tail morpheus-ui
