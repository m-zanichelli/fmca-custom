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
	pytest pytest-cov pytest-runner black mypy flake8 


RUN apt-get install libgl1 libglu1 libxcursor1 libxft2 libxinerama1 cmake  libeigen3-dev  -y 

RUN  git clone https://github.com/pybind/pybind11.git  && \
     cd pybind11 && \
     python3 setup.py build && \
     python3 setup.py install --prefix=/usr  \
		--install-headers=/usr/include/pybind11 --skip-build && \
     mv build/lib/pybind11 /usr/local/lib  && \
     cp -r /usr/local/lib/pybind11/share/cmake  /usr/lib


RUN git clone https://github.com/daveb-dev/fmca-custom.git && \ 
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

