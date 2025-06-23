#!/bin/bash

echo "🛑 Arrêt du conteneur de DEV..."

docker-compose --env-file .env.dev -f docker-compose.dev.yml -p videtoncube-dev stop

echo "✅ Conteneur de DEV arrêté."