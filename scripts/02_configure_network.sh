#!/bin/bash

# Log file
LOGFILE="./logs/network_config.log"

echo "Configuring network settings for DNP3 servers and enabling firewall rules..." | tee -a $LOGFILE

# Enable IPv4 and IPv6 forwarding
echo "Enabling IPv4 and IPv6 forwarding..." | tee -a $LOGFILE
sudo sysctl -w net.ipv4.ip_forward=1 | tee -a $LOGFILE
sudo sysctl -w net.ipv6.conf.all.forwarding=1 | tee -a $LOGFILE

# Add UFW rules for IPv4 and IPv6 for DNP3 and Modbus
echo "Setting up UFW rules for IPv4 and IPv6..." | tee -a $LOGFILE

# Enable UFW
sudo ufw enable | tee -a $LOGFILE

# Allow Modbus TCP (Port 502) on both IPv4 and IPv6
sudo ufw allow 502/tcp | tee -a $LOGFILE

# Allow DNP3 (Port 20000) on both IPv4 and IPv6
sudo ufw allow 20000/tcp | tee -a $LOGFILE

# Allow SSH for remote management
sudo ufw allow ssh | tee -a $LOGFILE

# Configure IPv4 addresses for DNP3 servers
sudo ip addr add 192.168.1.21/24 dev eth0 | tee -a $LOGFILE
sudo ip addr add 192.168.1.7/24 dev eth1 | tee -a $LOGFILE

# Configure IPv6 addresses if needed (replace with actual IPv6 addresses if available)
# For example:
sudo ip -6 addr add 2001:db8:1::21/64 dev eth0 | tee -a $LOGFILE
sudo ip -6 addr add 2001:db8:1::7/64 dev eth1 | tee -a $LOGFILE

# Verify UFW status
sudo ufw status verbose | tee -a $LOGFILE

echo "Network and firewall configuration completed." | tee -a $LOGFILE

