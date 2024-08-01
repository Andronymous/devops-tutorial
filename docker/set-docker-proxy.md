
# To set a proxy config for docker:

## 1. Create the docker service.d folder if not exist:
```shell
mkdir -p /etc/systemd/system/docker.service.d
```

## 2. Create the http-proxy.conf file in the folder with this content:
```shell
cat <<EOF >/etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://username:password@host.com:port"
Environment="HTTPS_PROXY=http://username:password@host.com:port"
Environment="NO_PROXY=localhost,127.0.0.1,example-no-proxy.com"
EOF
```

## Example:
```shell
cat <<EOF >/etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://188.120.99.16:5556"
Environment="HTTPS_PROXY=http://188.120.99.16:5556"
Environment="NO_PROXY=localhost,127.0.0.1"
EOF
```

## 3. Reload the daemon and restart the docker service to confirm the proxy config:  
```shell
systemctl daemon-reload
systemctl restart docker 
```
