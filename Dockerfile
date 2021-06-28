FROM python:3.8

LABEL maintainer="Timo Neuhaus <timo@n.euhaus.net>"

ARG MLFLOW_VERSION
ENV MLFLOW_VERSION=$MLFLOW_VERSION

RUN pip install \
	mlflow==$MLFLOW_VERSION \
	boto3

COPY run.sh /

RUN chmod u+x /run.sh

ENTRYPOINT ["/run.sh"]

