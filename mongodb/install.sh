#!/usr/bin/env bash
# Instal·la MongoDB 8.0 Community a Ubuntu 24.04 (Noble)
set -euo pipefail

# 1. Dependències
sudo apt-get update
sudo apt-get install -y gnupg curl

# 2. Clau pública del repositori
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
  sudo gpg --yes --dearmor -o /usr/share/keyrings/mongodb-server-8.0.gpg

# 3. Repositori
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | \
  sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

# 4. Instal·lació
sudo apt-get update
sudo apt-get install -y mongodb-org

# 5. Arrencar el servei i activar-lo a l'inici
sudo systemctl daemon-reload
sudo systemctl enable --now mongod

# 6. Comprovació
sudo systemctl status mongod --no-pager
mongosh --eval 'db.runCommand({ ping: 1 })'
