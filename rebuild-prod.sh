#!/bin/bash

echo "Stopping production containers..."
docker compose -f docker-compose.prod.yml --env-file .env.prod down

echo "Pulling the latest production image..."
docker compose -f docker-compose.prod.yml --env-file .env.prod pull web

echo "Starting production containers..."
docker compose -f docker-compose.prod.yml --env-file .env.prod up -d

echo "Production environment rebuilt successfully."