#!/bin/bash

# temp. start mysql to do all the install stuff
/usr/bin/mysqld_safe > /dev/null 2>&1 &

# install pimcore if needed
if [ ! -d /var/www/pimcore ]; then
  # download & extract
  cd /var/www
  sudo -u www-data wget https://www.pimcore.org/download/pimcore-latest.zip -O pimcore.zip 
  sudo -u www-data unzip pimcore.zip && rm pimcore.zip 
  
  # create demo mysql user
  mysql -u root -e "CREATE USER 'pimcore_demo'@'%' IDENTIFIED BY 'secretpassword';"
  mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'pimcore_demo'@'%' WITH GRANT OPTION;"
  
  # setup database 
  mysql -u pimcore_demo -e "CREATE DATABASE pimcore_demo_pimcore charset=utf8;"; 
  mysql -u pimcore_demo pimcore_demo_pimcore < ./website/dump/data.sql
  
  # 'admin' password is 'demo' 
  mysql -u pimcore_demo -D pimcore_demo_pimcore -e "UPDATE users SET password = '\$2y\$10\$3dykbihqPig8UseacT1AgucP2IdRPcmA56wVyFVgIw1RSjCOvmfhm' WHERE name = 'admin'"  
  mysql -u pimcore_demo -D pimcore_demo_pimcore -e "UPDATE users SET id = '0' WHERE name = 'system'"
  
  sudo -u www-data mv ./website/var/config/system.xml.template ./website/var/config/system.xml
fi

# stop temp. mysql service
mysqladmin -uroot shutdown

exec supervisord -n
