echo "开始初始化:"
# php7.2 安装
  # 移除早前版本的 php
  yum -y remove php*

  # 更新 yum 源
  rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm   
  rpm -Uvh http://mirror.webtatic.com/yum/el7/webtatic-release.rpm

  # php 版本安装以及常用扩展安装
  yum -y install php72w php72w-cli php72w-common php72w-devel php72w-pear php72w-embeded php72w-fpm
  
# Apeach 的安装
  yum -y install httpd

# 切换管理员权限
  sudo su

# Composer 的全局安装
  curl -sS https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer
 
# 重新启动 Apeach
  service httpd restart

# vim 安装
  yum -y install vim

# tmux 安装
  yum -y install tmux

# 更新 yum 源
  yum update

# 安装 docker
  yum -y install docker
