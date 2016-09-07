# Docker setup for a local Druid cluster

## Usage

Create a Tranquility configuration in `conf/tranquility`, for example by copying `conf/tranquility/config.json.example`, then point the Tranquility command line arguments to that file in `docker-compose.yml` (if you call it `kafka.json` you will not have to do anything). The ZooKeeper configuration in the example configuration must be present in your configuration file.

Then you start everything with this command:

```shell
$ docker-compose up
```

This starts a Druid cluster, including ZooKeeper for coordination, MySQL for metadata storage, and one each of the five different Druid node types, and a Tranquility node that will run the configuration you created.

### Extensions

If you have Tranquility extensions you want to use you can put them in `extensions/tranquility` and add `-Ddruid.extensions.loadList=["my-extension"]` to Tranquility's command line parameters in `docker-compose.yml`. You may have to quote the parameter with singlequotes to please the YAML lords (see the corresponding parameter to the Druid processes).

### Don't worry about the errors

During startup there may be exceptions thrown by the Druid overlord because it cannot connect to the metadata service. The reason is that the MySQL container will not have had time to start up MySQL and initialize the database yet. The overlord will retry so eventually it will connect. On subsequent runs the MySQL server should start quicker and you should see fewer errors.

### Where's the data?

All containers will persist data to `data/$container`, e.g. `data/mysql`, `data/historical`. The indexer task logs are available in `data/middle_manager/task`.

If you want to start over and reset everything, just `rm -rf data`.

## Copyright

© 2016 Burt AB and contributors, use as much as as you like.
