#!/bin/bash
# commands for running systemml
su -

# 1. clone systemml git repo of your fork
git clone https://github.com/username/systemml.git

# 2. path of working repository
cd systemml

# 3. run maven build, for installing maven -> run `yum install maven`,  for installing java -> run `yum install java`
mvn clean package

# 4. assuming you've installed spark as shown in `spark.sh` file in this folder, 
# please set spark path
export SPARK_HOME=$HOME/spark-2.2.0-bin-hadoop2.7
export PATH=$PATH:$SPARK_HOME/bin

# 5. for now, please run a sample test
spark-submit target/SystemML.jar -f scripts/nn/test/run_tests.dml

<<<<<<< HEAD
# for running mnist example
=======
# 6. Now, we can run a sample test
# get the data by this script 
>>>>>>> 9a872b9cca284397764a0ae9d8ebd100473042e4
scripts/nn/examples/get_mnist_data.sh

## 6.1. mnist softmax testing
spark-submit target/SystemML.jar -f scripts/nn/examples/mnist_softmax-train.dml -nvargs train=scripts/nn/examples/data/mnist/mnist_train.csv test=scripts/nn/examples/data/mnist/mnist_test.csv epochs=1 out_dir=scripts/nn/examples/model/mnist_softmax

## 6.2. mnist lenet
spark-submit target/SystemML.jar -f scripts/nn/examples/mnist_lenet-train.dml -nvargs train=scripts/nn/examples/data/mnist/mnist_train.csv test=scripts/nn/examples/data/mnist/mnist_test.csv C=1 Hin=28 Win=28 epochs=10 out_dir=scripts/nn/examples/model/mnist_lenet
<<<<<<< HEAD

## python related
spark-submit --master local[*] --driver-class-path target/SystemML.jar src/main/python/tests/test_matrix_agg_fn.py
=======
>>>>>>> 9a872b9cca284397764a0ae9d8ebd100473042e4
