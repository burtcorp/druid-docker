# Docker setup for a local Druid cluster

## Usage

```shell
$ docker-compose up
```

This starts a Druid cluster, including ZooKeeper for coordination, MySQL for metadata storage, and one each of the five different Druid node types.

### Don't worry about the errors

During startup there will be exceptions thrown by the overlord because it cannot connect to the metadata service. The reason is that the MySQL container will not have had time to start up MySQL and initialize the database yet. The overlord will retry so eventually it will connect.

### Where's the data?

All containers will persist data to `data/$container`, e.g. `data/mysql`, `data/historical`.

## Copyright

© 2016 Burt AB and contributors, use as much as as you like.
