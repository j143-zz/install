#!/bin/sh

# 1. download eclipse tar.gz file

# 2. extract the file to (/opt directory)
sudo tar -xvzf eclipse-java-.tar.gz -C /opt

# 3. Add read permissions to all files
sudo chmod -R +r /opt/eclipse

# 4. Creation of Eclipse executable on `/usr/bin` path
sudo touch /usr/bin/eclipse
sudo chmod 755 /usr/bin/eclipse

# 5. edit configurations

# open the file
sudo vi /usr/bin/eclipse

# paste the following 
#!/bin/sh
export ECLIPSE_HOME="/opt/eclipse"

$ECLIPSE_HOME/eclipse $*

# 6. Let's creat Gnome desktop launcher

# 6.1. create the following file
# /usr/share/applications/eclipse.desktop
sudo vi /usr/share/applications/eclipse.desktop

# paste the following
[Desktop Entry]
Encoding=UTF-8
Name=Eclipse
Comment=Eclipse Java
Exec=eclipse
Icon=/opt/eclipse/icon.xpm
Terminal=false
Type=Application
Categories=GNOME;Application;Development;
StartupNotify=true


# 7. we are all set
# open eclipse by running
eclipse
