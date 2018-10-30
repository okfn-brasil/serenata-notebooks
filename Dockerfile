FROM continuumio/miniconda3:4.5.11
MAINTAINER Serenata de Amor "datasciencebr@gmail.com"

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
    ${NB_USER}

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        unzip \
        libxml2-dev \
        libxslt-dev \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY data/ notebooks/ .git/ .gitignore .gitattributes \
  getting-started.md requirements.txt LICENSE README.md ${HOME}/

COPY jupyter_notebook_config.py ${HOME}/.jupyter/jupyter_notebook_config.py

RUN pip install --upgrade pip && \
      conda update setuptools && \
      conda install jupyter notebook scikit-learn && \
      conda install --yes --file ${HOME}/requirements.txt

RUN chown -R ${NB_UID} ${HOME}

USER ${NB_USER}

WORKDIR ${HOME}
