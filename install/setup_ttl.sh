#!/bin/bash

echo "net.ipv4.ip_default_ttl=65" | sudo tee /etc/sysctl.d/99_default_ttl_65.conf
sudo sysctl --system
