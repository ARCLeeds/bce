#!/bin/bash
# install fast linear algebra package and MPI functionality
apt-get update
apt-get install -y libopenblas-base libopenmpi-dev openmpi-bin

# install parallelization packages for Python
pip install multiprocessing

ppVersion=1.6.4
cd /tmp
wget http://www.parallelpython.com/downloads/pp/pp-${ppVersion}.tar.gz
tar -xvzf pp-${ppVersion}.tar.gz
cd pp-${ppVersion}
python setup.py install

# install parallelization packages for R
cat <<EOF > /tmp/R-packages.txt
doMPI
rlecuyer
pbdDEMO
pbdSLAP
pbdBASE
pbdDMAT
pbdMPI
EOF

Rscript -e "pkgs <- scan('/tmp/R-packages.txt', what = 'char'); install.packages(pkgs, repos = 'http://cran.cnr.berkeley.edu')"
