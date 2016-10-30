#!/bin/bash

# ensure mysql is running properly
# should not be necessary anymore
sleep 20 

# install pimcore if needed
if [ ! -d /var/www/pimcore ]; then
    echo "No pimcore Installation existing, installing new one."
    # download & extract
    cd /var/www
    # two versions - either the full demo experience or the minimal 'developer' version
    if [ "$PIMCORE_PROFESSIONAL_PACKAGE" -eq "1" ] ; then
        echo "Installing the pimcore professional package only."
        sudo -u www-data wget https://www.pimcore.org/download/pimcore-latest.zip -O /tmp/pimcore.zip 
        sudo -u www-data unzip /tmp/pimcore.zip -d /var/www/
        echo "pimcore professional package installed, open your browser and run the install using the following database credentials:"
        echo "  MySQL Host: $MYSQL_HOST"
        echo "  MySQL User: $MYSQL_USER"
        echo "  MySQL Password: $MYSQL_PASSWORD"
        echo "  MySQL Database: $MYSQL_DATABASE"
    else 
        echo "Installing the full pimcore demo."
        sudo -u www-data wget https://www.pimcore.org/download/pimcore-data.zip -O /tmp/pimcore.zip 
        sudo -u www-data unzip /tmp/pimcore.zip -d /var/www/
    
        # setup database 
        echo "Importing MySQL Data..."
        mysql --host $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/pimcore/modules/install/mysql/install.sql
        mysql --host $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/website/dump/data.sql
    
        # 'admin' password is 'demo' 
        mysql --host $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD -D $MYSQL_DATABASE -e "UPDATE users SET id = '0' WHERE name = 'system'"
        sudo -E -u www-data cp /tmp/system.php /var/www/website/var/config/system.php
        sudo -E -u www-data cp /tmp/cache.php /var/www/website/var/config/cache.php
        sudo -E -u www-data php /var/www/pimcore/cli/console.php reset-password -u $PIMCORE_ADMIN -p $PIMCORE_ADMIN_PASSWORD
    fi 
    rm /tmp/pimcore.zip 
fi

exec supervisord -n
