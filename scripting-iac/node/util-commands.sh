#!/bin/bash

set -e

echo "🔧 Desinstalando npm y nodejs existentes..."

# Desinstalar versiones previas de node/npm si existen
sudo apt-get remove -y npm nodejs

# Limpiar posibles restos
sudo apt-get purge -y nodejs npm
sudo apt-get autoremove -y
sudo rm -rf /usr/local/bin/npm /usr/local/bin/node

echo "✅ Desinstalación completada."

echo "🌐 Instalando Node.js (incluye npm)..."

# Instalar Node.js desde NodeSource (última LTS)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "✅ Node.js y npm instalados."

# Verificar versiones
echo "📦 Versiones instaladas:"
node -v
npm -v
