sudo rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
sudo yum -y install nginx

sudo /etc/rc.d/init.d/nginx configtest
sudo /etc/rc.d/init.d/nginx start
sudo chkconfig nginx on
