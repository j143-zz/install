#!/bin/bash
# commands for running systemml

cd systemml

mvn clean package

# set spark path
export SPARK_HOME=$HOME/spark-2.2.0-bin-hadoop2.7
export PATH=$PATH:$SPARK_HOME/bin

# for running a specific script
spark-submit target/SystemML.jar -f scripts/nn/test/run_tests.dml

# for running mnist example
scripts/nn/examples/get_mnist_data.sh

spark-submit target/SystemML.jar -f scripts/nn/examples/mnist_softmax-train.dml -nvargs train=scripts/nn/examples/data/mnist/mnist_train.csv test=scripts/nn/ex
amples/data/mnist/mnist_test.csv epochs=1 
