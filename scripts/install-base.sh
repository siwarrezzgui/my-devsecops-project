#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt upgrade -y
sudo timedatectl set-timezone Africa/Tunis
sudo apt install -y \
  curl wget git unzip tar ca-certificates gnupg lsb-release \
  software-properties-common jq net-tools apt-transport-https \
  python3 python3-pip
