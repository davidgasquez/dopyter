FROM debian
MAINTAINER David Gasquez <davidgasquez@gmail.com>

# Update and install system packages
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y -q \
        curl build-essential wget bzip2 sudo ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV NB_USER local
ENV NB_UID 1000

# Create local user with UID=1000 and in the 'users' group
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    mkdir -p $CONDA_DIR && \
    chown $NB_USER $CONDA_DIR

USER $NB_USER

# Setup local home directory
RUN mkdir /home/$NB_USER/work && \
    mkdir /home/$NB_USER/.jupyter

# Install and update Miniconda
# RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
RUN wget --quiet http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -f -b -p $CONDA_DIR && \
    rm ~/miniconda.sh

# Install Anaconda
RUN conda install --quiet --yes conda conda-env && \
    conda clean -tipsy

# Copy requirements file
COPY requirements.yml /tmp/requirements.yml

# Install requirements into current environment .
RUN conda env update -f /tmp/requirements.yml && \
    conda remove _nb_ext_conf && \
    rm -rf /home/$NB_USER/.cache/pip/*

# Enable Jupyter Notebook extensions
RUN jupyter contrib nbextension install --user

# Enable some expecific extensions
RUN jupyter nbextension enable collapsible_headings/main && \
    jupyter nbextension enable spellchecker/main && \
    jupyter nbextension enable datestamper/main && \
    jupyter nbextension enable execute_time/ExecuteTime && \
    jupyter nbextension enable runtools/main && \
    jupyter nbextension install https://github.com/jfbercher/yapf_ext/archive/master.zip --user && \
    jupyter nbextension enable yapf_ext-master/yapf_ext && \
    jupyter nbextensions_configurator enable

# Add custom configuration
COPY config/jupyter_notebook_config.py config/jupyter_notebook_config.json /home/$NB_USER/.jupyter/

# Create folder
WORKDIR "/work"

COPY start.sh /tmp/start.sh

# Start Notebook
CMD jupyter notebook
