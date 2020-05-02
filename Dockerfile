FROM continuumio/miniconda3

MAINTAINER AIwaffle <lunw1024@gmail.com>
ARG JUPYTERHUB_VERSION=1.1
ARG UID=1000

RUN useradd -m -u $UID jovyan
RUN chown -R jovyan /opt/conda
WORKDIR /home/jovyan
COPY .condarc .
RUN chown jovyan .condarc
USER jovyan

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install --no-cache \
    jupyterhub==$JUPYTERHUB_VERSION \
    notebook

RUN conda install numpy matplotlib seaborn -y
RUN conda install pytorch torchvision cpuonly -c pytorch -y

CMD ["jupyterhub-singleuser"]
