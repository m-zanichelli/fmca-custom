apk add git  cmake eigen-dev   && \
cd /tmp && \
git clone https://github.com/pybind/pybind11.git  && \
     cd pybind11 && \
     python3 setup.py build && \
     python3 setup.py install --prefix=/usr  \
		--install-headers=/usr/include/pybind11 --skip-build && \
     mv build/lib/pybind11 /usr/local/lib  && \
     cp -r /usr/local/lib/pybind11/share/cmake  /usr/lib && \
     
cd /home/shared 
