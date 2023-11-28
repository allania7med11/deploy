Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.network "public_network"
  # scripts that will be run after creating the VM 
  config.vm.provision :shell, path: "ngnix/setup.sh"
  config.vm.provision :shell, path: "config/docker/setup.sh"
  config.vm.provision :shell, path: "config/db/setup.sh"
  config.vm.network "forwarded_port", guest: 5432, host: 5433, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 2000, host: 2000
  config.vm.network "forwarded_port", guest: 2010, host: 2010
  config.vm.network "forwarded_port", guest: 2200, host: 2200
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 3
    vb.memory = 16000
  end
end