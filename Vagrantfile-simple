# 可以设定多个虚拟机的服务样例(此处只创建了一台名为kitetop的虚拟主机)
Vagrant.configure("2") do |config|
  # 指定使用的box
  config.vm.define :kitetop do |kitetop|
  kitetop.vm.box = "centos/7"
  
  # 指定主机的名字
  kitetop.vm.hostname = "kitetop"
  # 关闭自动更新
   config.vm.box_check_update = false
   
  # accessing "localhost:8080" will access port 80 on the guest machine.
   config.vm.network "forwarded_port", guest: 80, host: 8080

  # via 127.0.0.1 to disable public access
  # kitetop.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # 创造一个私有网络，使用一个指定的IP
   kitetop.vm.network "private_network", ip: "192.168.27.200"

  # 创造一个共有网络，使用一个物理机所在的局域网的IP
  # kitetop.vm.network "public_network", ip: "10.0.20.198"

  # 设置一个共享目录
  # kitetop.vm.synced_folder "../data", "/vagrant_data"

  # 设置提供者
   kitetop.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # 设置虚拟机的配置:
     vb.memory = "1024"
     vb.cpus = 4
   end
  # 使用指定位置的脚本文件
   config.vm.provision "shell",path:"environment_dev.sh"
  end
end
