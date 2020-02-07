#!/bin/bash

apt-get -y install software-properties-common
add-apt-repository -y universe
add-apt-repository -y ppa:fish-shell/release-3
apt-get update
apt-get -y install git build-essential curl wget gnupg2 xz-utils openssl net-tools fonts-powerline fonts-firacode fish
chsh -s /usr/bin/fish
