#!/bin/sh

bash /scripts/make-morpheus-rb.sh
cat /etc/morpheus/morpheus.rb
bash /scripts/modify-app-yaml.sh
/opt/morpheus/embedded/bin/runsvdir-start &
morpheus-ctl reconfigure
morpheus-ctl stop morpheus-ui
morpheus-ctl start
if [ -n "$MORPHEUS_UI_LOG_DIR" ]; then
  tail -f $MORPHEUS_UI_LOG_DIR/current
else
  morpheus-ctl tail morpheus-ui
fi
