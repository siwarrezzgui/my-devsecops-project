#!/usr/bin/env bash
set -euo pipefail

sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible

python3 -m pip install --user pywinrm requests-credssp
