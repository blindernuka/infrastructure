#!/bin/bash
set -eux

# https://docs.docker.com/compose/install/#install-compose
# https://github.com/docker/compose/releases

version=1.22.0
dest=/opt/bin/docker-compose

sudo mkdir -p "$(dirname "$dest")"
# sudo rm "$dest"
sudo curl -L https://github.com/docker/compose/releases/download/$version/docker-compose-$(uname -s)-$(uname -m) -o "$dest"
sudo chmod +x "$dest"
