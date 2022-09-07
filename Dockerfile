FROM alpine:latest
RUN  apk update && \
     apk add build-base cmake eigen-dev  && \
     apk add --no-cache make gfortran openblas-dev  curl && \
     apk add git python3-dev        
RUN cd /tmp &&  \
     curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
     python3 get-pip.py && \
     pip3 install matplotlib numpy scipy 

RUN  cd /tmp && \
     git clone https://github.com/pybind/pybind11.git  && \
     cd pybind11 && \
     python3 setup.py build && \
     python3 setup.py install --prefix=/usr  \
		--install-headers=/usr/include/pybind11 --skip-build && \
     mv build/lib/pybind11 /usr/local/lib  && \
     cp -r /usr/local/lib/pybind11/share/cmake  /usr/lib

RUN  cd /home &&
     git clone https://github.com/daveb-dev/fmca-custom.git fmca-src && \
     cd  fmca-src && \
     git checkout -b dave/binder && \
     mkdir build && \
     cd build &&\
     cmake -DPYBIND11_DIR=/usr/local/lib/pybind11 .. &&\
     make 

RUN  mkdir /home/shared && \
     cp /home/fmca-src/build/py* .  

WORKDIR /home/shared

VOLUME /home/shared

