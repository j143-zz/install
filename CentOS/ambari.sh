#!/bin/bash
#installing ambari agents

## step 1:
# for root user
su -

# Download the Ambari repository file to a directory on your installation host.
wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.5.0.3/ambari.repo -O /etc/yum.repos.d/ambari.repo

# Confirm that the repository is configured by checking the repo list
yum repolist

## step 2:

# 1. Install the Ambari Agent on every host in your cluster.
yum install ambari-agent

# 2. configure the Ambari Agent by editing the ambari-agent.ini file
# ------------------------------------------------------------------
# Description:
# ------------------------------------------------------------------

vi /etc/ambari-agent/conf/ambari-agent.ini

# 3. Start the agent on every host in your cluster.
ambari-agent start 

# NOTE: The agent registers with the Server on start.
