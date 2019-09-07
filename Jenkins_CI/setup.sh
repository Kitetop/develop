#!/bin/sh
chown -R mysql:mysql /var/lib/mysql
# Running in the background
mysqld --user=mysql &
sleep 5
cd / && mysql < mysql.sql
# Use this command to kill the mysqld process
ps -wef | grep mysql | grep -v grep | awk '{print $2}' | xargs kill -9
mysqld --user=mysql