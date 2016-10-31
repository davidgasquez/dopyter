FROM debian
MAINTAINER David Gasquez <davidgasquez@gmail.com>

# Update and install system packages
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y -q \
        curl build-essential wget bzip2 ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install and update Miniconda
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -f -b -p /opt/conda && \
    rm ~/miniconda.sh

# Add Conda to path
ENV PATH /opt/conda/bin:$PATH

# RUN conda config --system --add channels conda-forge

# Install Anaconda
RUN conda install --quiet --yes conda anaconda conda-env && \
    conda clean -tipsy

# Copy requirements file
COPY requirements.yml /tmp/requirements.yml

# Install requirements into current environment
RUN conda env update -f /tmp/requirements.yml && \
    conda remove _nb_ext_conf && \
    rm -rf /root/.cache/pip/*

# Enable Jupyter Notebook extensions
RUN jupyter contrib nbextension install

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
COPY config/jupyter_notebook_config.py config/jupyter_notebook_config.json /root/.jupyter/

# Create folder
WORKDIR "/work"

# Start Notebook
CMD jupyter-notebook
