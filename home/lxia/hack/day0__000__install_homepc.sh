#!/bin/bash

### Download latest LTS version of Ubuntu, and install
# https://ubuntu.com/download/desktop

### Generate SSH key
# ssh-keygen -b 4096 -t rsa -f ~/.ssh/lxia-ssh-2026 -C "SSH key for lxia on homepc, generated in 2026"

### Tools
# Solaar is a Linux manager for Logitech keyboards, mice and trackpads
apt install solaar
apt install git \
            tree
