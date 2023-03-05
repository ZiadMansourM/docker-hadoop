# Hadoop [Dashboard](http://localhost:9870/dfshealth.html#tab-overview) - [reference](https://github.com/big-data-europe/docker-hadoop)

## 🔧 hadoop setup with docker compose
- [ ] make sure you have docker and docker compose installed
```console
ziadh@Ziads-MacBook-Air docker-hadoop % docker --version
Docker version 20.10.16, build aa7e414
ziadh@Ziads-MacBook-Air docker-hadoop % docker compose version  
Docker Compose version v2.6.0
```
- [ ] clone the repo
```console
$ cd Desktop
$ git clone https://github.com/ZiadMansourM/docker-hadoop.git
$ cd docker-hadoop
```

```console
ziadh@Ziads-MacBook-Air docker-hadoop % docker compose up --build -d
*** Wait for around 3 minutes ***
ziadh@Ziads-MacBook-Air docker-hadoop % docker compose ps                
NAME                COMMAND                  SERVICE             STATUS              PORTS
datanode            "/entrypoint.sh /run…"   datanode            running (healthy)   9864/tcp
historyserver       "/entrypoint.sh /run…"   historyserver       running (healthy)   8188/tcp
namenode            "/entrypoint.sh /run…"   namenode            running (healthy)   0.0.0.0:9000->9000/tcp, 0.0.0.0:9870->9870/tcp
nodemanager         "/entrypoint.sh /run…"   nodemanager1        running (healthy)   8042/tcp
resourcemanager     "/entrypoint.sh /run…"   resourcemanager     running (healthy)   8088/tcp
```

## ⚡️ Run a simple word count example
1. put you jar file inside ./Data folder and make sure data name is `input.txt` or change it inside run-in-namenode.sh to your file name.
2. command `docker compose exec namenode bash /Data/run-in-namenode.sh <jar-file-name> <class-name>`

```console
$ docker compose exec namenode bash /Data/run-in-namenode.sh WordCount.jar WordCount
*** So many logs ***
Ahmed	3
Ali	5
Amgad	1
Hussein	3
Mohamed	4
Rami	1
Salah	1
Zaki	2
Deleted /input
Deleted /output
```

Maintained by: Ziad Hassanin - SWE Doing SRE
-----------------------------
phone: (10)217-999-50 <br/>
ziadmansour.4.9.2000@gmail.com <br/>
San José State University, California <br/>
Cairo University Faculty of Engineering (CCEC) <br/>
[SREboy.com](https://www.sreboy.com/) | [twitter](https://twitter.com/ziad_m_404) | [linkedin](https://www.linkedin.com/in/ziad-mansour/) | [instagram](https://www.instagram.com/ziad_m_404/) | [WhatsApp](https://wa.me/201021799950) <br/>
