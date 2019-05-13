# Overview
`Elasticalert` is a containerized version of [Yelp's elastalert](https://github.com/Yelp/elastalert).

Elastalert is a simple framework for alerting on anomalies, spikes, or other patterns of interest from data in Elasticsearch.

Elastalert is well documented so please be sure to take a look at the [Elastalert Official Documentation](https://elastalert.readthedocs.io/en/latest/elastalert.html).

Elastalert defines a [config.yaml](config/config.yaml) file which contains the basic details required to setup the rules engine.

```yaml
rules_folder: /app/config/rules
run_every:
  seconds: 15
buffer_time:
  minutes: 15
es_host: localhost
es_port: 9200
writeback_index: elastalert_status
alert_time_limit:
  days: 2
```

See the [Configuration reference](https://elastalert.readthedocs.io/en/latest/elastalert.html#configuration) for additional details.

In addition to the [config.yaml](config/config.yaml), Elastalert requires the creation of *rule* files which define the alert conditions that Elastalert will monitor.

`Elasticalert` defines two simple frequency based rules; [error_checks.yaml](config/rules/error_checks.yaml) and [exception_checks.yaml](config/rules/exceptions_checks.yaml).

Exentensive documentation is available describing the [Rule Types and Configuration Options](https://elastalert.readthedocs.io/en/latest/ruletypes.html).

Furthermore, you can take a look at the [example rules](https://github.com/Yelp/elastalert/tree/master/example_rules) that are provided within the Elastalert project.

You can see `Elasticalert` being used in-context within the [elastic-central-logging](https://github.com/damianmcdonald/elastic-central-logging) project.

## Prerequisites
`Elasticalert` has the following dependencies:

* [Docker](https://www.docker.com/)
* [fakeSMTP](http://nilhcem.com/FakeSMTP/)

`Elasticalert` assumes that an Elasticsearch server exists that contains data in order for alerts to be generated.

Additionally, [fakeSMTP](http://nilhcem.com/FakeSMTP/) is required to act as an SMTP server in order to receive the alert emails.

```bash
java jar fakeSMTP -s -p 2525 -o /opt/devel/tools/fakesmtp/fakeSMTP-2.0.jar
```

## Getting Started

1) Git-clone this repository.

```
git clone https://github.com/damianmcdonald/elastic-alerts.git elastic-alerts
```

2) Change directory into your clone:

```
cd elastic-alerts
```

3) Use Maven to compile everything:

```
mvn clean install
```

4) Build the Docker image:

```
docker build -t elasticalert .
```

4) Run the Docker image:

```
docker run -i \
  -v $PWD/config:/app/config \
  -e ELASTICSEARCH_HOST="localhost" \     
  -e ELASTICSEARCH_PORT="9200" \
  --network=host elasticalert
```
