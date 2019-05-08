#!/bin/sh
apt -y update
apt -y install python-pip python-dev libffi-dev libssl-dev
pip install 'urllib3<1.25,>=1.20' --force-reinstall
pip install "elastalert>=0.2.0b"
elastalert-create-index --host $ELASTICSEARCH_HOST --port $ELASTICSEARCH_PORT --no-auth --index elastalert_status --no-ssl --no-verify-certs --send_get_body_as GET --config /app/config/config.yaml
python -m elastalert.elastalert --verbose --config /app/config/config.yaml
