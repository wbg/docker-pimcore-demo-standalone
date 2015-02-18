#!/bin/bash

exec supervisord -n

# install pimcore if needed
if [ ! -d /var/www/pimcore ]; then
  # download & extract
  cd /var/www
  wget https://www.pimcore.org/download/pimcore-latest.zip -O pimcore.zip 
  unzip pimcore.zip && rm pimcore.zip 
  
  # setup database 
  # ... 
fi
