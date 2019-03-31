# Docker with Python 3.7.3 and Spacy 
FROM python:3.7.3-alpine
MAINTAINER Yuntaz <docker@yuntaz.com>

# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

# install ca-certificates so that HTTPS works consistently
# other runtime dependencies for Python are installed later
RUN apk add --no-cache ca-certificates

ENV PYTHON_VERSION 3.7.3

USER root
WORKDIR /opt

# Update
RUN apk update
RUN apk add --no-cache openssl-dev \
	gcc \
	g++ \
	build-base \
	wget \
	git \
	bash \
	sudo \
	tar \
	unzip \
	less \
	curl \
	gzip \
	libffi-dev \
	libjpeg-turbo \
	libjpeg-turbo-utils \
	libjpeg-turbo-dev \
	libxslt \
	libxslt-dev \
	libxml2-dev \
	zlib-devel \
	libpng-dev \
	libffi-devel \
	nss 
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install spacy==2.0.10
RUN pip install pyinstaller --no-use-pep517
RUN pip install cx_freeze  
RUN python3 -m spacy download es_core_news_md
RUN python3 -m spacy link es_core_news_md es --force




