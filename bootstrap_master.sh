#!/usr/bin/env bash
# 设置想要安装软件的shell命令
echo "开始初始化:"
timedatectl set-timezone Asia/Shanghai

sudo curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo 2>/dev/null 
cat  /etc/yum.repos.d/CentOS-Base.repo|grep "Base - mirrors.aliyun.com"
#sudo yum makecache

sudo yum install -y epel-release 
sudo yum install -y vim
sudo yum install -y ansible
sudo yum install -y htop
sudo yum install -y git
sudo yum install -y tmux

