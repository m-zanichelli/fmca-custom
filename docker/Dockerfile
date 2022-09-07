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


RUN apt-get install libgl1 libglu1 libxcursor1 libxft2 libxinerama1 cmake eigen3-dev pybind11-dev -y 

RUN git clone https://github.com/daveb-dev/fmca-custom.git && \ 
    mkdir build && \
    cd build &&\
    cmake .. &&\
    make 


