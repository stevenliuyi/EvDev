#!/bin/bash

apt-get update && apt-get install -y python3 python3-pip
pip3 install --no-cache-dir python-language-server jupyter numpy scipy matplotlib pandas
