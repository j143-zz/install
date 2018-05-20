#!/bin/bash
# install TensorFlow GPU version on CentOS 7 (25-march-2018)

# 1. enable epel repo
sudo yum -y install epel-release

# 2. install compilers, & lanuguage support
sudo yum -y install gcc gcc-c++ python-pip python-devel
sudo yum -y install atlas atlas-devel gcc-gfortran openssl-devel libffi-devel

# 3. setup the python virtual environment
sudo pip install --upgrade virtualenv
virtualenv --system-site-packages ~/venvs/tensorflow

# 4. get tensorflow
source ~/venvs/tensorflow/bin/activate
pip install --upgrade numpy scipy wheel cryptography
pip install --upgrade tensorflow-gpu
