Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  # scripts that will be run after creating the VM 
  # config.vm.provision :shell, path: "ngnix/setup.sh"
  # config.vm.provision :shell, path: "config/docker/setup.sh"
  # config.vm.provision :shell, path: "config/db/setup.sh"
  config.vm.hostname = "deploy"
  config.vm.network "forwarded_port", guest: 5432, host: 5434
  config.vm.network "forwarded_port", guest: 2000, host: 2000 # portfolio
  config.vm.network "forwarded_port", guest: 2010, host: 2010 # structure
  config.vm.network "forwarded_port", guest: 2020, host: 2020 # travelplanner
  config.vm.network "forwarded_port", guest: 2030, host: 2030 # shop
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 6000
  end
  config.vm.network "public_network", ip: "192.168.1.100"
end