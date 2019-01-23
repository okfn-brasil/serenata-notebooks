FROM continuumio/miniconda3:4.5.11
LABEL maintainer="Serenata de Amor <contato@serenata.ai>"

USER root
ARG AMAZON_BUCKET=serenata-de-amor-data
ARG AMAZON_ENDPOINT=https://nyc3.digitaloceanspaces.com
ARG AMAZON_REGION=nyc3

ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
      --gecos "Default user" \
      --uid ${NB_UID} \
      --shell /bin/bash \
      ${NB_USER}

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
      unzip \
      libxml2-dev \
      libxslt-dev \
      git \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ${HOME}/

COPY jupyter_notebook_config.py ${HOME}/.jupyter/

COPY notebooks ${HOME}/notebooks

RUN chown -R ${NB_UID}:${NB_UID} ${HOME} /opt/conda

USER ${NB_USER}

RUN pip install --upgrade pip && \
      pip install -r ${HOME}/requirements.txt

EXPOSE 8888

WORKDIR ${HOME}

CMD jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser
