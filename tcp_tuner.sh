#!/bin/bash

sysctl net.ipv4.tcp_keepalive_time > sysctl_orig.txt
sysctl net.ipv4.ip_local_port_range >> sysctl_orig.txt
sysctl net.core.netdev_max_backlog >> sysctl_orig.txt
sysctl net.ipv4.tcp_retries1 >> sysctl_orig.txt
sysctl net.ipv4.tcp_retries2 >> sysctl_orig.txt
sysctl net.core.rmem_max >> sysctl_orig.txt
sysctl net.core.rmem_default >> sysctl_orig.txt
sysctl net.core.wmem_max >> sysctl_orig.txt
sysctl net.core.wmem_default >> sysctl_orig.txt
sysctl net.ipv4.tcp_window_scaling >> sysctl_orig.txt
sysctl net.ipv4.tcp_orphan_retries >> sysctl_orig.txt
sysctl net.ipv4.tcp_sack >> sysctl_orig.txt
sysctl net.ipv4.tcp_fin_timeout >> sysctl_orig.txt

echo "
net.ipv4.tcp_keepalive_time=30
net.ipv4.ip_local_port_range=1024 65000
net.ipv4.tcp_tw_reuse=1
net.core.netdev_max_backlog=10000
net.ipv4.tcp_retries1=3
net.ipv4.tcp_retries2=3
net.core.rmem_max=56777216
net.core.rmem_default=16777216
net.core.wmem_max=56777216
net.core.wmem_default=16777216
net.ipv4.tcp_window_scaling=1
net.ipv4.tcp_orphan_retries=0
net.ipv4.tcp_sack=0
net.ipv4.tcp_fin_timeout=10" >> /etc/sysctl.conf

sysctl -f
