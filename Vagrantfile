Vagrant.configure("2") do |config|
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "Centos7.2"

  # Disable automatic box update checking. 
   config.vm.box_check_update = false
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
   config.vm.network "private_network", ip: "10.0.27.200"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
   config.vm.network "public_network", ip: "10.0.20.198" 

  # Share an additional folder to the guest VM. 
  # config.vm.synced_folder "../data", "/vagrant_data"
   config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "2048"
     vb.cpus = 4
   end
   config.vm.provision "shell", path: "bootstrap_master.sh"
end
