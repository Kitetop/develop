FROM centos/systemd:latest
RUN yum update -y \
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
