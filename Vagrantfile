Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  
  # VM hostname
  config.vm.hostname = "deploy"

  # Forwarded ports
  config.vm.network "forwarded_port", guest: 22, host: 2222, host_ip: "0.0.0.0"  # Allow external SSH access
  config.vm.network "forwarded_port", guest: 1234, host: 5434
  config.vm.network "forwarded_port", guest: 2000, host: 2000 # portfolio
  config.vm.network "forwarded_port", guest: 2010, host: 2010 # structure
  config.vm.network "forwarded_port", guest: 2020, host: 2020 # travelplanner
  config.vm.network "forwarded_port", guest: 2030, host: 2030 # shop

  # VM resources
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 16000
  end

  # Public network for LAN access
  config.vm.network "public_network", bridge: "wlp0s20f3"
end
