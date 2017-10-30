#!/bin/bash
# commands for running systemml

mvn clean package

# for running a specific script
spark-submit systemml/target/SystemML.jar -f systemml/scripts/nn/test/run_tests.dml
