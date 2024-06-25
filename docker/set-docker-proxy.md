#!/bin/bash

mkdir -p /etc/systemd/system/docker.service.d
cat <<EOF >/etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://188.121.99.16:5555"
Environment="HTTPS_PROXY=http://188.121.99.16:5555"
Environment="NO_PROXY=localhost,127.0.0.1,hub.zamin.link,reg.zamin.link"
EOF
