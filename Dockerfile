FROM jupyter/base-notebook

MAINTAINER AIwaffle <lunw1024@gmail.com>

ARG JUPYTERHUB_VERSION=1.1
ARG UID=1001

USER root

RUN usermod -u $UID jovyan

USER jovyan

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install --no-cache \
    jupyterhub==$JUPYTERHUB_VERSION \
    notebook
