FROM continuumio/miniconda3

RUN conda create -n py3-mink python=3.7
ENV CONDA_DEFAULT_ENV py3-mink
SHELL ["conda", "run", "-n", "py3-mink", "/bin/bash", "-c"]
RUN apt update && apt install -y git
RUN conda install numpy mkl-include pytorch cudatoolkit=10.2 -y -c pytorch
RUN conda install -y -c conda-forge jupyterlab
RUN mkdir -p /opt/jupyterconfig
RUN mkdir -p /opt/jupyternotebooks
ENV JUPYTER_CONFIG_DIR /opt/jupyterconfig
COPY jupyter_application_config.py /opt/jupyterconfig
RUN apt install -y build-essential

EXPOSE 5003

WORKDIR /opt/jupyternotebooks
RUN cd /opt/jupyternotebooks && git clone https://github.com/NVIDIA/MinkowskiEngine.git
RUN cd /opt/jupyternotebooks/MinkowskiEngine && python setup.py install

ENTRYPOINT ["conda", "run", "-n", "py3-mink"]
CMD ["jupyter", "notebook", "--config=/opt/jupyterconfig/jupyter_application_config.py"]