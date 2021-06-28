# Docker Image for MLflow

## Environment Variables

### Required
- `$HOST`: The IP the server will be bound to listen to. 
  - *Default: 0.0.0.0*
- `$PORT`: The port the server will listen to. 
  - *Default: 5000*.
- `$BUCKET_URI_OR_LOCAL_PATH`: The S3-bucket- or local path where artifacts will be stored. 
  - *Default: /data/mlruns*.
  - See also: https://www.mlflow.org/docs/latest/tracking.html#artifact-stores
- `$BACKEND_STORE_URI`: The URI to a store where run metadata, params and tags will be stored. 
  - *Default: sqlite:///data/sqlite.db*.
  - See also: https://www.mlflow.org/docs/latest/tracking.html#backend-stores

### MLflow specific
- Further more MLflow requires additional variables, e.g. a S3 Endpoint URI and credentials.
  Look for MLflow-specific variables at https://www.mlflow.org/docs/latest/tracking.html#mlflow-tracking-servers.