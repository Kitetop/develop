FROM centos/systemd:latest
RUN wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
RUN yum localinstall mysql80-community-release-el7-3.noarch.rpm 
RUN yum-config-manager --disable mysql80-community
RUN yum-config-manager --enable mysql57-community
RUN yum install mysql-community-server -y
RUN chown -R mysql:mysql /var/lib/mysql
RUN cd /var/lib/mysql && rm -rf *
RUN mysqld --initialize-insecure --user=mysql
RUN yum clean all
CMD [ "mysqld --user=mysql"]