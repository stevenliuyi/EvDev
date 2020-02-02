#!/bin/bash

add-apt-repository universe
apt-get update
apt-get -y install git build-essential curl wget gnupg2 xz-utils openssl net-tools fonts-powerline fonts-firacode
