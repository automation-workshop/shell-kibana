#!/bin/bash

ES_IP=$1
URL="https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-rc1-linux-x64.tar.gz"

if [ ! -f /usr/local/kibana/bin/kibana ]; then
  mkdir -p /usr/local/kibana
  curl -s $URL | tar zx -C /usr/local/kibana --strip-components=1
fi

perl -pi -e "s#^(elasticsearch_url: )\S+#\1'http://$ES_IP:9200'#" \
  /usr/local/kibana/config/kibana.yml

cat > /etc/init/kibana.conf <<-EOF
description "kibana"
author "Patrick Lenz <plenz@topmedia.de>"

start on local-filesystems
stop on shutdown

respawn
respawn limit 10 5

script
cd /usr/local/kibana
./bin/kibana >> /var/log/kibana.log 2>&1
end script
EOF

restart kibana || start kibana
