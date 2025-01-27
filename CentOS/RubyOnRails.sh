#!/bin/bash
# Install ruby on rails server

## 1. Install rbenv
# we will use rbenv to install and manage our Ruby installation.

# Let's install ruby and rbenv dependencies with yum

sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel

# Now we are ready to install rbenv. The easiest way to 
# do that is to run these commands, as the user that will be using Ruby:

cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
exec $SHELL

# The above commands installs rbenv into your home directory, 
# and sets the appropriate environment variables that will allow rbenv to the active version of Ruby.

## 2. Install Ruby
# As the user that will be using Ruby, try install it with these commands:

rbenv install -v 2.2.1
rbenv global 2.2.1

# The global sub-command sets the default version of Ruby that all of your shells will use. If you want to install
# and use a different version, simply run the rbenv commands with a different version number.

# Verify that Ruby was installed properly with this command:

ruby -v

# It is likely that you will not want Rubygems to generate local documentation for each 
# gem that you install, as this process can be lengthy. To disable this, run this command:

echo "gem: --no-document" > ~/.gemrc

# You will also want to install the bundler gem, to manage your application dependencies:

gem install bundler

# Now, that ruby is installed!

## 3. Install Rails

# As the same user, install Rails 4.2.0 with this command:
gem install rails -v 4.2.0

# Whenever you install a new version of Ruby or a gem that provides commands, you should run the rehash sub-command.
# This will install shims for all Ruby executables known to rbenv, which will allow you to use the executables:
rbenv rehash

# Verify that Rails has been installed properly by printing its version, with this command:
rails -v

# If it installed properly, you will see this output: Rails 4.2.0.

## 4. Install Javascript Runtime

# A few Rails features, such as the Asset Pipeline, depend on a 
# Javascript runtime. We will install Node.js to provide this functionality.

# Add the EPEL yum repository:
sudo yum -y install epel-release

# Then install the Node.js package:
sudo yum install nodejs

# Ruby on Rails is now installed on the system!

# -----------------------------------------------------------------------------------------------------------------------

# Improvements

## 1. Install a Database

# Rails uses sqlite3 as its default database, which may not meet the requirements of your application. 
# You may want to install an RDBMS, such as MySQL or PostgreSQL, for this purpose.

# For example, if you want to use MariaDB as your database, install it with yum:
sudo yum install mariadb-server mariadb-devel

# Then install the mysql2 gem, like this:
gem install mysql2

# Now you can use MariaDB with your Rails application. Be sure to configure MariaDB 
# and your Rails application properly.

## 2. Create a test application

# If you want to make sure that your Ruby on Rails installation went smoothly, you can 
# quickly create a test application to test it out. For simplicity, our test application will use sqlite3 for its database.

# Create a new Rails application in your home directory:
cd ~
rails new testapp

# Then move into the application's directory:
cd testapp

# Create the sqlite3 database:
rake db:create

# If you don't already know the public IP address of your server, look it up with this command:
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

# Copy the IPv4 address to your clipboard, then use it with this command to start your Rails 
# application (substitute the highlighted part with the IP address):
rails server --binding=server_public_IP

# If it is working properly, your Rails application should be running on port 3000 of the public
# IP address of your server. Visit your Rails application by going there in a web browser:
http://server_public_IP:3000

# you see the Rails "Welcome aboard" page!

