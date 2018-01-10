curl -s https://packagecloud.io/install/repositories/varnishcache/varnish5/script.rpm.sh | sudo bash
sudo yum install -y --disablerepo='*' --enablerepo='varnishcache_varnish5' varnish varnish-devel
sudo service varnish start
sudo chkconfig varnish on

sudo service varnishncsa start
sudo chkconfig varnishncsa on
