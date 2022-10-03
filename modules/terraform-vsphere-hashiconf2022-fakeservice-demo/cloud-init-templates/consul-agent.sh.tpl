#!/bin/bash
# Prepares Consul Enterprise in a deployed VM.
set -v

systemctl stop consul
rm /opt/consul/node-id
# Create Consul Service Config Entry
echo '> Creating Consul Service Configuration File'
tee /etc/consul.d/consul_app.json >/dev/null <<EOL
{
  "node_name": "${name}",
  "service": {
    "id": "${name}",
    "name": "${service_name}",
    "tags": ["${service_tag}"],
    "port": ${service_port},
    "checks": [
      {
        "id": "HTTP-${service_name}",
        "name": "Checks ${service_name} on port ${service_port}",
        "http": "http://localhost:${service_port}/health",
        "interval": "5s",
        "timeout": "1s",
        "DeregisterCriticalServiceAfter": "7m"
      }
    ]
  }
}
EOL

echo '> Creating Docker-Compose File'
tee /home/natilik/docker-compose.yaml >/dev/null <<EOL
---

version: "3.3"
services:
  ${service_name}:
    image: nicholasjackson/fake-service:v0.22.7
    container_name: ${service_name}
    restart: unless-stopped
    network_mode: host
    environment:
      SERVER_TYPE: "http"
      NAME: ${name}
      MESSAGE: "${service_message}"
      UPSTREAM_URIS: "${upstream_service}"
      LISTEN_ADDR: 0.0.0.0:${service_port}
EOL

echo '> Starting ${service_name}'
cd /home/natilik/

docker compose up -d

systemctl start consul
