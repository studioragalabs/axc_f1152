#!/bin/bash

# Log file
LOGFILE="./logs/install.log"

# Update packages and install dependencies
echo "Updating packages and installing dependencies..." | tee -a $LOGFILE
sudo apt update && sudo apt upgrade -y | tee -a $LOGFILE
sudo apt install -y plcnext-tools libmodbus-dev opendnp3 git | tee -a $LOGFILE

# Clone OpenDNP3 library from GitHub for DNP3 stack support
echo "Cloning OpenDNP3 repository..." | tee -a $LOGFILE
git clone https://github.com/automatak/dnp3.git ./opendnp3 | tee -a $LOGFILE

echo "Dependencies installation completed." | tee -a $LOGFILE

