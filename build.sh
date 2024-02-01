#!/bin/bash
docker rmi docker-cicd 2>/dev/null
docker-compose up --build
docker-compose down -v
