#!/bin/bash
docker-compose up --build
docker-compose down -v
docker rmi docker-cicd:0.0.1 2>/dev/null
