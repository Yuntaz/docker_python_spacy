# Docker with Python 3.6 and Spacy
FROM centos/python-36-centos7
MAINTAINER Yuntaz <docker@yuntaz.com>
LABEL VERSION="3.1"

ENV PYTHON_VERSION 3.6

USER root
WORKDIR /opt

# Linux updates
RUN yum update -y

# Python installs
RUN yum install -y python3-tkinter
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install cx_freeze
RUN pip install pyinstaller --no-use-pep517
RUN pip install https://github.com/pyinstaller/pyinstaller/archive/develop.zip --no-use-pep517
RUN pip install spacy==2.0.10
RUN python3 -m spacy download es_core_news_md
RUN python3 -m spacy link es_core_news_md es --force
RUN pip install nltk
RUN python3 -m nltk.downloader -d /root/nltk_data stopwords
RUN ln -s /root/nltk_data/ /usr/local/nltk_data
RUN ln -s /root/nltk_data/ /usr/local/share/nltk_data
RUN ln -s /root/nltk_data/ /usr/local/lib/nltk_data
RUN ln -s /root/nltk_data/ /usr/share/nltk_data
RUN ln -s /root/nltk_data/ /usr/local/share/nltk_data
RUN ln -s /root/nltk_data/ /usr/lib/nltk_data
