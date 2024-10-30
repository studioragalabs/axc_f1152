#!/bin/bash

# Log file
LOGFILE="./logs/modbus_setup.log"

# Define Modbus serial configuration
MODBUS_SERIAL_PORT="/dev/ttyUSB0"
MODBUS_BAUDRATE=9600
MODBUS_PARITY="N"
MODBUS_STOPBITS=1

# Configure Modbus RTU for Serial
echo "Configuring Modbus RTU over Serial..." | tee -a $LOGFILE
stty -F $MODBUS_SERIAL_PORT $MODBUS_BAUDRATE cs8 -cstopb -parenb | tee -a $LOGFILE

# Configure Modbus TCP if Ethernet is used
echo "Configuring Modbus TCP..." | tee -a $LOGFILE
sudo ip link set eth0 up | tee -a $LOGFILE
sudo ifconfig eth0 192.168.1.22 netmask 255.255.255.0 | tee -a $LOGFILE

echo "Modbus setup completed." | tee -a $LOGFILE

