#!/bin/bash
# Install Spark on CentOS 7

# 1. get java
java -version

# 2. get scala
wget https://downloads.lightbend.com/scala/2.12.4/scala-2.12.4.tgz
tar xvf scala-2.12.4.tgz
sudo mv scala-2.12.4 /usr/lib
sudo ln -s /usr/lib/scala-2.12.4 /usr/lib/scala
export PATH=$PATH:/usr/lib/scala/bin
scala -version

# 3. get spark-hadoop build
wget http://www-us.apache.org/dist/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
tar xvf spark-2.2.0-bin-hadoop2.7.tgz

# 4. set the spark home
export SPARK_HOME=$HOME/spark-2.2.0-bin-hadoop2.7
export PATH=$PATH:$SPARK_HOME/bin

# 5. add to the bash profile
echo 'export PATH=$PATH:/usr/lib/scala/bin' >> .bash_profile
echo 'export SPARK_HOME=$HOME/spark-2.2.0-bin-hadoop2.7' >> .bash_profile
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> .bash_profile

# 6. run below command to test that spark is working fine.
spark-shell
