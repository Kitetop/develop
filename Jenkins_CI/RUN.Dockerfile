FROM kitetop/mysql:1.1.0
COPY ./setup.sh /usr/sbin/
COPY mysql.sql /
RUN chmod 777 /usr/sbin/setup.sh && chmod 777 /mysql.sql
EXPOSE 3306
CMD [ "setup.sh" ]
