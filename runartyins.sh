#!/bin/bash
mkdir ./mysql-data
mkdir ./shareddata
mkdir ./shareddata/new
mkdir ./shareddata/processing
mkdir ./shareddata/success
mkdir ./sharedata/fail
docker-compose up --force-recreate --remove-orphans