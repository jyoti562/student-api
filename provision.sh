#!/bin/bash

install_docker() {
  echo "Installing Docker..."
  apt update
  apt install -y apt-transport-https ca-certificates curl software-properties-common

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

  add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

  apt update
  apt install -y docker-ce
}

install_docker_compose() {
  echo "Installing Docker Compose..."
  curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose

  chmod +x /usr/local/bin/docker-compose
}

start_docker() {
  systemctl start docker
  systemctl enable docker
}

# Execute functions
install_docker
install_docker_compose
start_docker