# #!/bin/bash

echo "🚀 Démarrage de l'environnement PROD..."

docker-compose --env-file .env.prod -f docker-compose.prod.yml -p videtoncube up -d --build

echo "✅ Environnement PROD démarré sur http://localhost:8000"