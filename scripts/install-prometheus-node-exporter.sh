#!/usr/bin/env bash
set -euo pipefail

cd /tmp
LATEST=$(curl -s https://api.github.com/repos/prometheus/node_exporter/releases/latest | jq -r .tag_name)
FILE="node_exporter-${LATEST#v}.linux-amd64.tar.gz"

wget "https://github.com/prometheus/node_exporter/releases/download/${LATEST}/${FILE}"
tar xvf "${FILE}"

sudo cp "node_exporter-${LATEST#v}.linux-amd64/node_exporter" /usr/local/bin/
sudo useradd --no-create-home --shell /bin/false node_exporter || true

sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<'SERVICE'
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
SERVICE

sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
