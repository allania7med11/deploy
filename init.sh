# sudo chmod +x /vagrant/init.sh && /vagrant/init.sh
Run () {
   sudo chmod +x $1 && $1
}

Run /vagrant/ngnix/setup.sh
Run /vagrant/config/docker/setup.sh
Run /vagrant/config/db/setup.sh