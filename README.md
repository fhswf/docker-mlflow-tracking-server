# Docker Image for MLflow tracking server

## Environment Variables

### Required
- `HOST`: The IP the server will be bound to listen to. 
  - *Default: 0.0.0.0*
- `PORT`: The port the server will listen to. 
  - *Default: 5000*.
- `BUCKET_URI_OR_LOCAL_PATH`: The S3-bucket- or local path where artifacts will be stored. 
  - *Default: /data/mlruns*.
  - See also: https://www.mlflow.org/docs/latest/tracking.html#artifact-stores
- `BACKEND_STORE_URI`: The URI to a store where run metadata, params and tags will be stored. 
  - *Default: sqlite:///data/sqlite.db*.
  - See also: https://www.mlflow.org/docs/latest/tracking.html#backend-stores

### MLflow specific
- Further more MLflow requires additional variables, e.g. a S3 Endpoint URI and credentials.
  Look for MLflow-specific variables at https://www.mlflow.org/docs/latest/tracking.html#mlflow-tracking-servers.
  
  See also the example below, which contains MLflow-specific variables.
  
## Example: Docker compose
```yaml
version: "3.6"
services:
  some-mlflow-tracking:
    image: "tnte/mlflow-tracking-server"
    container_name: "some-mlflow-tracking"
    volumes:
      - "~/mlflow:/data"
    ports:
      - 127.0.0.1:8080:5000
    environment:
      - BACKEND_STORE_URI=${BACKEND_STORE_URI:-sqlite:///data/sqlite.db}
      - BUCKET_URI_OR_LOCAL_PATH=${BUCKET_URI_OR_LOCAL_PATH:-/data/mlruns}
      - MLFLOW_S3_ENDPOINT_URL=$MLFLOW_S3_ENDPOINT_URL
      - AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
      - AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
```
