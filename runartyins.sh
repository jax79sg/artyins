#!/bin/bash
mkdir ./logs
mkdir ./mysql-data
mkdir ./shareddata
mkdir ./shareddata/new
mkdir ./shareddata/processing
mkdir ./shareddata/success
mkdir ./shareddata/fail
docker-compose up -d --force-recreate --remove-orphans
