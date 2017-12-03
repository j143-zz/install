#!/bin/bash

# 1. install Oracle jdk
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

# 2. Find the latest stable version. Now, it is Oracle JDK 9
sudo apt-get install oracle-java9-installer

# 3. Managing Java
## There can be multiple java installations on one server. You can configure which version
## the default for use in the command line by using `update-alternatives`, which manages 
## symbolic links are used for different commands.
sudo update-alternatives --config java

## We can now choose the number to use as a default. This can also be done for other java 
## commands, such as the compiler (`javac`), the documentation generator (`javadoc`), the
## JAR signing tool (`jarsigner`), and more. 
## The following command, fills in the command we want to customize.
sudo update-alternatives --config command

# 4. Setting the JAVA_HOME Environment Variable

## Many programs, such as Java servers, use the `JAVA_HOME` environment variable to 
## determine the Java installation location. To set this environment variable, we need to 
## find out where Java is installed. 
sudo update-alternatives --config java

# 5. Copy the path from your preferred installation and then open `/etc/environment`.
sudo vim /etc/environment

# 6. At the end of this file, add the following line, making sure to replace the highlighted
## path with our own copied path.
JAVA_HOME="/usr/lib/jvm/java-9-oracle"

# Save and exit the file, and reload it.
source /etc/environment

# 7. Test the environmental variable set.
echo $JAVA_HOME







