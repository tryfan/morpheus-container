#!/bin/sh

echo "
appliance_url '${MORPHEUS_APPLIANCE_URL}'

elasticsearch['enable'] = false
mysql['enable'] = false
rabbitmq['enable'] = false
nginx['enable'] = true
guacd['guacamole_enabled'] = true
firewall['enabled'] = false
" > /etc/morpheus/morpheus.rb

if [[ ! -z "$MORPHEUS_ELASTICSEARCH_ES_HOSTS" ]]; then
  echo "elasticsearch['es_hosts'] = ${MORPHEUS_ELASTICSEARCH_ES_HOSTS}" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_ELASTICSEARCH_HOST" ]]; then
  echo "elasticsearch['host'] = '${MORPHEUS_ELASTICSEARCH_HOST}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_ELASTICSEARCH_USE_TLS" ]]; then
  echo "elasticsearch['use_tls'] = '${MORPHEUS_ELASTICSEARCH_USE_TLS}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_ELASTICSEARCH_AUTH_USER" ]]; then
  echo "elasticsearch['auth_user'] = '${MORPHEUS_ELASTICSEARCH_AUTH_USER}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_ELASTICSEARCH_AUTH_PASSWORD" ]]; then
  echo "elasticsearch['auth_password'] = '${MORPHEUS_ELASTICSEARCH_AUTH_PASSWORD}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_ELASTICSEARCH_LOG_DIR" ]]; then
  echo "elasticsearch['log_dir'] = '${MORPHEUS_ELASTICSEARCH_LOG_DIR}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_ELASTICSEARCH_MEMORY_ALLOC_ARENA_MAX" ]]; then
  echo "elasticsearch['memory_alloc_arena_max'] = '${MORPHEUS_ELASTICSEARCH_MEMORY_ALLOC_ARENA_MAX}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_ELASTICSEARCH_MEMORY_MAP_MAX" ]]; then
  echo "elasticsearch['memory_map_max'] = '${MORPHEUS_ELASTICSEARCH_MEMORY_MAP_MAX}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_ELASTICSEARCH_MEMORY_MAP_THRESHOLD" ]]; then
  echo "elasticsearch['memory_map_threshold'] = '${MORPHEUS_ELASTICSEARCH_MEMORY_MAP_THRESHOLD}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_ELASTICSEARCH_MEMORY_TOP_PAD" ]]; then
  echo "elasticsearch['memory_top_pad'] = '${MORPHEUS_ELASTICSEARCH_MEMORY_TOP_PAD}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_ELASTICSEARCH_MEMORY_TRIM_THRESHOLD" ]]; then
  echo "elasticsearch['memory_trim_threshold'] = '${MORPHEUS_ELASTICSEARCH_MEMORY_TRIM_THRESHOLD}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_ELASTICSEARCH_OPEN_FILES" ]]; then
  echo "elasticsearch['open_files'] = '${MORPHEUS_ELASTICSEARCH_OPEN_FILES}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_MYSQL_HOST" ]]; then
  echo "mysql['host'] = ${MORPHEUS_MYSQL_HOST}" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_MYSQL_USE_TLS" ]]; then
  echo "mysql['use_tls'] = '${MORPHEUS_MYSQL_USE_TLS}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_MYSQL_MORPHEUS_DB_USER" ]]; then
  echo "mysql['morpheus_db_user'] = '${MORPHEUS_MYSQL_MORPHEUS_DB_USER}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_MYSQL_MORPHEUS_PASSWORD" ]]; then
  echo "mysql['morpheus_password'] = '${MORPHEUS_MYSQL_MORPHEUS_PASSWORD}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_MYSQL_MORPHEUS_DB" ]]; then
  echo "mysql['morpheus_db'] = '${MORPHEUS_MYSQL_MORPHEUS_DB}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_MYSQL_MYSQL_URL_OVERIDE" ]]; then
  echo "mysql['mysql_url_overide'] = '${MORPHEUS_MYSQL_MYSQL_URL_OVERIDE}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_MYSQL_TMP_DIR" ]]; then
  echo "mysql['tmp_dir'] = '${MORPHEUS_MYSQL_TMP_DIR}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_MYSQL_LOG_DIR" ]]; then
  echo "mysql['log_dir'] = '${MORPHEUS_MYSQL_LOG_DIR}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_MYSQL_MAX_ACTIVE" ]]; then
  echo "mysql['max_active'] = '${MORPHEUS_MYSQL_MAX_ACTIVE}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_MYSQL_MAX_CONNECTIONS" ]]; then
  echo "mysql['max_connections'] = '${MORPHEUS_MYSQL_MAX_CONNECTIONS}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_MYSQL_MAX_ALLOWED_PACKET" ]]; then
  echo "mysql['max_allowed_packet'] = '${MORPHEUS_MYSQL_MAX_ALLOWED_PACKET}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_RABBITMQ_HOST" ]]; then
  echo "rabbitmq['host'] = '${MORPHEUS_RABBITMQ_HOST}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_RABBITMQ_PORT" ]]; then
  echo "rabbitmq['port'] = '${MORPHEUS_RABBITMQ_PORT}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_RABBITMQ_QUEUE_USER" ]]; then
  echo "rabbitmq['queue_user'] = '${MORPHEUS_RABBITMQ_QUEUE_USER}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_RABBITMQ_QUEUE_USER_PASSWORD" ]]; then
  echo "rabbitmq['queue_user_password'] = '${MORPHEUS_RABBITMQ_QUEUE_USER_PASSWORD}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_RABBITMQ_VHOST" ]]; then
  echo "rabbitmq['vhost'] = '${MORPHEUS_RABBITMQ_VHOST}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_RABBITMQ_HEARTBEAT" ]]; then
  echo "rabbitmq['heartbeat'] = '${MORPHEUS_RABBITMQ_HEARTBEAT}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_RABBITMQ_LOG_DIR" ]]; then
  echo "rabbitmq['log_dir'] = '${MORPHEUS_RABBITMQ_LOG_DIR}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_RABBITMQ_NODENAME" ]]; then
  echo "rabbitmq['nodename'] = '${MORPHEUS_RABBITMQ_NODENAME}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_RABBITMQ_PORT" ]]; then
  echo "rabbitmq['port'] = '${MORPHEUS_RABBITMQ_PORT}'" >> /etc/morpheus/morpheus.rb
fi
if [[ ! -z "$MORPHEUS_RABBITMQ_USE_TLS" ]]; then
  echo "rabbitmq['use_tls'] = '${MORPHEUS_RABBITMQ_USE_TLS}'" >> /etc/morpheus/morpheus.rb
fi

echo "" >> /etc/morpheus/morpheus.rb
