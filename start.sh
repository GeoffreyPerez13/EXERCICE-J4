#!/bin/bash
service mysql start

mysql -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'bb1212';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"
service apache2 start
tail -f /var/log/apache2/access.log