Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.network "public_network"
  # scripts that will be run after creating the VM 
  config.vm.provision :shell, path: "ngnix/setup.sh"
  config.vm.provision :shell, path: "docker/setup.sh"
  config.vm.provision :shell, path: "db/setup.sh"
end