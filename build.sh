#!/bin/bash
docker build --build-arg MLFLOW_VERSION_ARG=$1 -t tnte/mlflow-tracking-server:$1 -f Dockerfile .

