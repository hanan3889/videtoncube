#!/bin/bash

echo "🛑 Arrêt du conteneur de PROD..."

docker-compose --env-file .env.prod -f docker-compose.prod.yml -p videtoncube stop

echo "✅ Conteneur de PROD arrêté."