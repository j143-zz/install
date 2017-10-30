#!/bin/bash
# Install Spark on CentOS 7

java -version

wget https://downloads.lightbend.com/scala/2.12.4/scala-2.12.4.tgz
tar xvf scala-2.12.4.tgz
sudo mv scala-2.12.4 /usr/lib
sudo ln -s /usr/lib/scala-2.12.4 /usr/lib/scala
export PATH=$PATH:/usr/lib/scala/bin
scala -version

wget wget https://www.apache.org/dyn/closer.lua/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
tar xvf spark-2.2.0-bin-hadoop2.7.tgz

export SPARK_HOME=$HOME/spark-2.2.0-bin-hadoop2.7
export PATH=$PATH:$SPARK_HOME/bin

# run below command for open spark-shell
#spark-shell

firewall-cmd --permanent --zone=public --add-port=6066/tcp
firewall-cmd --permanent --zone=public --add-port=7077/tcp
firewall-cmd --permanent --zone=public --add-port=8080-8081/tcp
firewall-cmd --reload

echo 'export PATH=$PATH:/usr/lib/scala/bin' >> .bash_profile
echo 'export SPARK_HOME=$HOME/spark-2.2.0-bin-hadoop2.7' >> .bash_profile
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> .bash_profile
