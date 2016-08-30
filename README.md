# Docker setup for a local Druid cluster

## Usage

```shell
$ docker-compose up
```

This starts a Druid cluster, including ZooKeeper for coordination, MySQL for metadata storage, and five different Druid node types.

During startup there will be exceptions thrown by the overlord because it cannot connect to the metadata service. The reason is that the MySQL container will not have had time to start up MySQL and initialize the database yet. The overlord will retry so eventually it will connect.
