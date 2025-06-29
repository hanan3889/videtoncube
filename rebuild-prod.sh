#!/bin/bash

echo "Stopping production containers..."
docker compose -f docker-compose.prod.yml down

echo "Pulling the latest production image..."
docker compose -f docker-compose.prod.yml pull web

echo "Starting production containers..."
docker compose -f docker-compose.prod.yml up -d

echo "Production environment rebuilt successfully."