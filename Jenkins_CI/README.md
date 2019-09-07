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
