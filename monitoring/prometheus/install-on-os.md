
# Prometheus Installation on Ubuntu

Follow these steps to install Prometheus on an Ubuntu system.

## Step 1: Update System Packages
```
sudo apt update
sudo apt upgrade
```

## Step 2: Create a System User for Prometheus
```
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus
```

## Step 3: Create Directories for Prometheus
```
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
```

## Step 4: Download and Extract Prometheus
```
wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz
tar vxf prometheus*.tar.gz
cd prometheus*/
```

## Step 5: Move Binary Files & Set Owner
```
sudo mv prometheus /usr/local/bin
sudo mv promtool /usr/local/bin
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
```

## Step 6: Move Configuration Files & Set Owner
```
sudo mv consoles /etc/prometheus
sudo mv console_libraries /etc/prometheus
sudo mv prometheus.yml /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /var/lib/prometheus
```

## Step 7: Create Prometheus Systemd Service
Create and edit the service file:
```
sudo vim /etc/systemd/system/prometheus.service
```
Add the following content:
```
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
```

## Step 8: Reload Systemd and Start Prometheus
```
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus
```

## Step 9: Check Prometheus Status
```
sudo systemctl status prometheus
```

## Step 10: Allow Prometheus Port on Firewall
```
sudo ufw allow 9090/tcp
```

## Access Prometheus
Open Prometheus in a web browser at `http://<ip_address>:9090`.
