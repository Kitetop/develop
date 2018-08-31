# develop
个人开发环境以及项目部署环境的配置文件

> 文件说明

````
1.bootstrap_master.sh => 虚拟机创建时所要执行的脚本命令
2.Vagrantfile => 虚拟机的配置文件，带有初始的英文注释(仅仅只是做展示作用，实际开发请使用Vagrantfile-simple)
3.Vagrantfile-simple => 去除了初始的英文注释，添加中文注释，保留了一些可能要用到的配置项
````

> 几点说明
#### vagrant 的网络配置说明
````
1.config.vm.network "forwarded_port", guest:80, host:8080 网络端口转发映射，将宿主机的80端口转发映射到虚拟机的8080端口
2.config.vm.network "forwarded_port", guest:80,host:8080, host_ip: "127.0.0.1" 设置虚拟主机网络为Host-Only,此时虚拟机和宿主机网络互相独立，需要手动设置虚拟机的网络IP地址，网段不能冲突
3.config.vm.network "private_network", ip: "192.168.33.10" 设置一个私有的网络
4.config.vm.network "public_network", ip: "10.0.20.198" 设置一个共有网络
````

#### vagrant 的网络配置区别
````
1. forwarded_port：
   把宿主机的端口映射到虚拟机的某个端口上，访问宿主计算机端口时请求实际就是被转发到虚拟机上的指定端口，默认只转发TCP包，UDP需要额外添加语句：
   config.vm.network "forwarded_port", guest:80, host:8080, protocol: "udp"
   优点：简单易理解，容易实现外网访问虚拟机
   缺点：多端口转发的时候比较麻烦，不支持宿主机上使用小于1024的端口进行转发
2. private_network：
   只有主机可以访问到虚拟机，如果多个虚拟机设定在一个网段可以互相访问，虚拟机也可以访问外部网络
   优点：安全，只能自己访问
   缺点：因为私有的缘故，团队的其他成员不能和你协作
3. public_network：
   虚拟机享受实体机器一样的待遇
   优点：方便团队协作，别人可以访问你的虚拟机
   缺点：需要有网络，有路由分配的IP
````
