#!/bin/bash
# commands for running systemml

cd systemml

mvn clean package

# for running a specific script
spark-submit target/SystemML.jar -f scripts/nn/test/run_tests.dml
