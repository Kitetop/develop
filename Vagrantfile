Vagrant.configure("2") do |config|
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "Centos7.2"

  # 关闭box的自动检测更新，保持环境的一致 
   config.vm.box_check_update = false
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # 将本地的8080端口映射到虚拟机的80端口
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # 指定一个IP,设置一个静态IP地址
  # config.vm.network "private_network", ip: "10.0.27.200"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # 指定一个IP,此IP在物理机所在的局域网上必须存在(会占有一个运营商分配的IP)
  # config.vm.network "public_network", ip: "10.0.20.198" 

  # 设置共享目录 
  # config.vm.synced_folder "../data", "/vagrant_data"
  # 设置提供者
   config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # 设置虚拟机的配置:
     vb.memory = "2048"
     vb.cpus = 4
   end
  #  设置虚拟机创建时要执行的脚本文件
   config.vm.provision "shell", path: "bootstrap_master.sh"
end
