FROM intelpython/intelpython3_core

# Add conda-forge to dependencies
# 1. intel, 2. conda-forge, 3. defaults
RUN conda install jupyter -c intel

# Add conda-forge to dependencies
# 1. intel, 2. conda-forge, 3. defaults
RUN conda config --append channels conda-forge
RUN conda config --append channels defaults


# Install porepy dependencies
# Second line is testing dependencies. Can be removed.
RUN conda install meshio networkx sympy matplotlib cython future shapely \
	pytest pytest-cov pytest-runner black mypy flake8  eigen pybind11 

RUN conda config --append channels anaconda

RUN conda install -c anaconda cmake
RUN git clone https://github.com/daveb-dev/fmca-custom.git && \ 
    cd fmca-custom && \
    mkdir build && \
    cd build &&\
    cmake .. &&\
    make 

ARG NB_USER=fmca
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

