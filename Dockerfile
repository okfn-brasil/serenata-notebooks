FROM continuumio/miniconda3
MAINTAINER Serenata de Amor "datasciencebr@gmail.com"

USER root
ARG AMAZON_BUCKET=serenata-de-amor-data
ARG AMAZON_ENDPOINT=https://nyc3.digitaloceanspaces.com
ARG AMAZON_REGION=nyc3

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        unzip \
        libxml2-dev \
        libxslt-dev \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN conda update setuptools

RUN mkdir /.jupyter
RUN mkdir /notebooks

COPY ./jupyter_notebook_config.py .jupyter/jupyter_notebook_config.py
COPY ./requirements.txt ./requirements.txt
ADD ./notebooks /notebooks

RUN conda install jupyter notebook scikit-learn
RUN pip install -r requirements.txt

WORKDIR /notebooks
