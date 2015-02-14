#!/bin/bash

DEB_URL="https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.3.deb"

if [ ! -x /usr/bin/java ]; then
  apt-get install -qq -y openjdk-7-jre
fi

if [ ! -f /etc/init.d/elasticsearch ]; then
  cd /tmp
  curl -Os $DEB_URL
  dpkg -i ${DEB_URL##*/}
  sudo update-rc.d elasticsearch defaults 95 10
fi

cat > /etc/elasticsearch/elasticsearch.yml <<-EOF
node:
  name: shell-kibana
path:
  data: /esdata
EOF

sudo /etc/init.d/elasticsearch restart
