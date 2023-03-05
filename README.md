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