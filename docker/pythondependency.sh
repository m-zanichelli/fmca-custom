apk add curl gfortran openblas && \
cd /tmp && \
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
python3 get-pip.py && \
pip3 install matplotlib numpy scipy 
