#!/bin/bash

echo "🚀 Démarrage de l'environnement avec le fichier .env..."

# Vérifie que le fichier .env existe
if [ ! -f ".env" ]; then
    echo "❌ Le fichier .env est introuvable."
    exit 1
fi

# Build et démarre les conteneurs
docker compose --env-file .env up -d --build

# Vérifie si la commande a réussi
if [ $? -eq 0 ]; then
    echo "✅ Conteneur démarré avec succès !"
    echo "🌐 Accès à l'application : http://localhost:9000"
else
    echo "❌ Une erreur est survenue lors du démarrage du conteneur."
fi
