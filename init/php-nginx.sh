sudo yum install -y php70\
                    php70-fpm\
                    php70-gd\
                    php70-mbstring\
                    php70-mysql

sudo cp -p /etc/php.ini /etc/php.ini.org
sudo sed -i -e 's/;date.timezone =/date.timezone = Asia/Tokyo/' /etc/php.ini

sudo cp -p /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf.org
sudo sed -i -e 's/user = apache/user = ec2-user/' /etc/php-fpm.d/www.conf
sudo sed -i -e 's/group = apache/group = ec2-user/' /etc/php-fpm.d/www.conf
sudo sed -i -e 's/;listen.owner = nobody/listen.owner = ec2-user/' /etc/php-fpm.d/www.conf
sudo sed -i -e 's/;listen.group = nobody/listen.group = ec2-user/' /etc/php-fpm.d/www.conf

sudo /etc/rc.d/init.d/php-fpm start
sudo chkconfig php-fpm on
