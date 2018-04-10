
# 1. update and upgrade the system
sudo apt-get update
sudo apt-get upgrade

# 2. verify the cuda capable GPU
lspci | grep -i nvidia

# 3. verify the supported version of linux
uname -m && cat /etc/*release

# 4. install dependencies
sudo apt-get install build-essential
sudo apt-get install cmake git unzip zip
sudo apt-get install python2.7-dev python3.5-dev python3.6-dev pylint

# 5. install linux kernel header
uname -r # 4.10.0-42-generic

sudo apt-get install linux-headers-$(uname -r)

# 6. download the NVIDIA CUDA toolkit
# for direct Downloading, get the link here : nvidia.com/getcuda

# installation instructions
sudo dpkg -i cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64.deb
sudo apt-key add /var/cuda-repo-version<version>/7fa2af80.pub
sudo apt-get update
sudo apt-get install install cuda-9.1

# 7. Reboot the system to load the NVIDIA drivers

# 8. add to path to bash profile
nano ~/.bashrc

export PATH=/usr/local/cuda-0.1/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# done. open shell and ..
source ~/.bashrc
sudo ldconfig
nvidia-smi

# if the above step says, nvidia-smi not found means unsupported linux kernel installed.

# 9. Install cuDNN
# accept develper program terms
# 9.1. download the following files
# 1.cuDNN v7.1.2 Runtime Library for Ubuntu 16.04 (Deb)
# 2.cuDNN v7.1.2 Developer Library for Ubuntu 16.04 (Deb)
# 3.cuDNN v7.1.2 Code Samples and User Guide for Ubuntu 16.04 (Deb)

# 9.2. installation
sudo dpkg -i libcudnn7_7.1.2.21-1+cuda9.1_amd64.deb
sudo dpkg -i libcudnn7-dev_7.1.2.21-1+cuda9.1_amd64.deb
sudo dpkg -i libcudnn7-doc_7.1.2.21-1+cuda9.1_amd64.deb

# 9.3. check the installation
cp -r /usr/src/cudnn_samples_v7/ $HOME
cd $HOME/cudnn_samples_v7/mnistCUDNN
make clean && make
./mnistCUDNN

# ----------------
# stay cool
# ----------------

# 10. install dependencies
sudo apt-get install libcupti-dev
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc

# 10.2. Bazel
wget https://github.com/bazelbuild/bazel/releases/download/0.11.1/bazel_0.11.1-linux-x86_64.deb
sudo dpkg -i bazel_0.11.1-linux-x86_64.deb

# 10.3. Python 2.7
sudo apt-get install python-numpy python-dev python-pip python-wheel

# 10.4. Python 3.7
sudo apt-get install python3-numpy python3-dev python3-pip python3-wheel

# 11. Configure TensorFlow from source
# instructions available at tensorflow.org
