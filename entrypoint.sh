#!/bin/sh
until curl -s -o /dev/null -w "%{http_code}" "http://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT/_cat/indices?v&pretty" | grep 200 > /dev/null; do
	  echo "Waiting for Elasticsearch..."
	  sleep 5
done

elastalert-create-index --host $ELASTICSEARCH_HOST --port $ELASTICSEARCH_PORT --no-auth --index elastalert_status --no-ssl --no-verify-certs --send_get_body_as GET --config /app/config/config.yaml
python -m elastalert.elastalert --verbose --config /app/config/config.yaml
