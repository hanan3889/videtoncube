#!/bin/bash

echo "🚀 Démarrage de l'environnement DEV..."

docker-compose --env-file .env.dev -f docker-compose.dev.yml up -d

echo "✅ Environnement DEV démarré sur http://localhost:9000"