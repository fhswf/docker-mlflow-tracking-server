#!/bin/sh

set -e

if [ -z "$HOST" ]; then
  export HOST="0.0.0.0"
  echo >&2 "No host binding IP specified (Environment variable HOST). Binding to ${HOST}"
fi

if [ -z "$PORT" ]; then
  export PORT=5000
  echo >&2 "No port defined (Environment variable PORT). Using ${PORT}."
fi

if [ -z "$BACKEND_STORE_URI" ]; then
  export BACKEND_STORE_URI="sqlite:///data/sqlite.db"
  echo >&2 "No backend store URI defined (Environment variable BACKEND_STORE_URI). Using ${BACKEND_STORE_URI}."
fi

if [ -z "$BUCKET_URI_OR_LOCAL_PATH" ]; then
  export BUCKET_URI_OR_LOCAL_PATH="/data/mlruns"
  echo >&2 "No backend store URI defined (Environment variable BUCKET_URI_OR_LOCAL_PATH). Using ${BUCKET_URI_OR_LOCAL_PATH}."
fi

echo "Starting MLflow server on port ${HOST}:${PORT}..."
echo "Artifact bucket or path: ${BUCKET_URI_OR_LOCAL_PATH}"
echo "Backend store: ${BACKEND_STORE_URI}"

mkdir -p /data

mlflow server \
    --backend-store-uri $BACKEND_STORE_URI \
    --default-artifact-root $BUCKET_URI_OR_LOCAL_PATH \
    --host $HOST \
    --port $PORT