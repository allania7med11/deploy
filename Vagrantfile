Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.network "private_network", ip: "192.168.56.0"
  # scripts that will be run after creating the VM 
  # config.vm.provision :shell, path: "ngnix/setup.sh"
  # config.vm.provision :shell, path: "config/docker/setup.sh"
  # config.vm.provision :shell, path: "config/db/setup.sh"
  config.vm.hostname = "deploy"
  config.hostsupdater.aliases = ["portfolio"]
  config.vm.network "forwarded_port", guest: 5432, host: 5433, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 2000, host: 2000
  config.vm.network "forwarded_port", guest: 2010, host: 2010
  config.vm.network "forwarded_port", guest: 2020, host: 2020
  config.vm.network "forwarded_port", guest: 2030, host: 2030
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 6000
  end
end