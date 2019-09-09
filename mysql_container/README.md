## How to use
---
- 你可以在【mysql.sql】文件内书写你想要创建的数据库与数据表，如果你想更改这个文件的名字，你需要同时修改【RUN.Dockerfile】文件内的 COPY && chmod 命令
- 如果你的数据库文件已经能够满足你的需要了，直接运行：docker build -f RUN.Dockerfile -t test:latest . 那么你将会得到一个名字为【test:latest】的镜像
- 镜像名字你可以随意指定
- 运行创建的镜像：docker run -p 3306:3306 -d --name test test . 你会得到一个名字为【test】的容器，其内部已经帮你创建好了数据表
- 删除容器与创建的镜像：docker rm test -f && docker rmi test
---
## Notic
---
- 如果你直接使用【mysql.sql】文件，那么它将会创建一个【test】数据库，【manage_depart】的数据表，并且【root 用户】的密码为： root
- mysqld --user=mysql &: 此命令是将运行【mysqld】放入后台去执行（位于「./setup.sh」）
- sleep 5: 是为了【mysqld】完全启动后在执行后续的语句
- ps -wef | grep mysql | grep -v grep | awk '{print $2}' | xargs kill -9: 杀死后台运行的【mysqld】进程
- 在Dockerfile中每一个【RUN】指令之后都等于是在一个新的镜像之后执行下一个命令，因此建议在安装运用的时候，都使用一个【RUN】指令
## 组成
---
- 【MYSQL.Dockerfile】是安装mysql服务的基础镜像，它允许你使用这个镜像去扩展，它被托管在Docker Hub之中，搜索【kitetop/mysql】就可以找到此镜像
- 如果你在一个局域网之中，下载任何应用包都需要配置代理的时候，你可以在Dockerfile内传入代理地址，就像如下这样
````
FROM centos/systemd:latest
ARG HTTP_PROXY
ARG HTTPS_PROXY
RUN export http_proxy=${HTTP_PROXY} \
    && export https_proxy=${HTTPS_PROXY} \
    && yum update -y \
    && yum install wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y \
    && yum localinstall mysql80-community-release-el7-3.noarch.rpm -y \
    && yum-config-manager --disable mysql80-community \
    && yum-config-manager --enable mysql57-community \
    && yum install mysql-community-server -y \ 
RUN chown -R mysql:mysql /var/lib/mysql 
RUN cd /var/lib/mysql && rm -rf *
RUN mysqld --initialize-insecure --user=mysql
RUN yum clean all && rm -rf mysql80-community*
CMD [ "mysqld", "--user=mysql"]
````
- 在构建此镜像的时候，运行【docker build】的时候，你可以使用 【--build-arg】传递过去你需要的值
- eg：docker build -f Dockerfile --build-arg HTTP_PROXY=http://xxxxx --build-arg HTTPS_PROXY=https://xxx
---
