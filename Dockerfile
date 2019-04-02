# Docker with Python 3.6 and Spacy
FROM centos/python-36-centos7
MAINTAINER Yuntaz <docker@yuntaz.com>
LABEL VERSION="3.6"

ENV PYTHON_VERSION 3.6

USER root
WORKDIR /opt

# Repos
RUN yum -y install epel-release  
RUN yum -y install https://$(rpm -E '%{?centos:centos}%{!?centos:rhel}%{rhel}').iuscommunity.org/ius-release.rpm
# Update
RUN yum -y update

# Python installs
RUN yum -y install python36u-tkinter
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install cx_freeze
RUN pip install pyinstaller --no-use-pep517
RUN pip install https://github.com/pyinstaller/pyinstaller/archive/develop.zip --no-use-pep517
RUN pip install spacy
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
RUN ln -s /root/nltk_data/ /opt/app-root/src/nltk_data
RUN ln -s /root/nltk_data/ /opt/app-root/nltk_data
RUN ln -s /root/nltk_data/ /opt/app-root/share
RUN ln -s /root/nltk_data/ /opt/app-root/lib
