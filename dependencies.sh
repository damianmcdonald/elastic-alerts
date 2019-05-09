#!/bin/sh
# these dependencies were applied to the python:2 docker image
# and pushed to docker hub as damianmcdonald/elasticalert-dependencies:1.0.0
apt -y update
apt -y install python-pip python-dev libffi-dev libssl-dev
pip install 'urllib3<1.25,>=1.20' --force-reinstall
pip install "elastalert>=0.2.0b"
