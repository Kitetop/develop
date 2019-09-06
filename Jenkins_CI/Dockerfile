FROM mysql:latest
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes
ENV MYSQL_ROOT_PASSWORD root
COPY setup.sh /usr/local/bin
COPY mysql.sql /mysql/mysql.sql
COPY my.cnf /etc/mysql
RUN chmod 777 /usr/local/bin/setup.sh && chmod 777 /mysql/mysql.sql
RUN ln -s /usr/local/bin/setup.sh /setup.sh
ENTRYPOINT ["setup.sh"]
CMD ["mysqld"]

