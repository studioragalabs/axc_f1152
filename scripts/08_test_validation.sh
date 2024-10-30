#!/bin/bash

# Log file
LOGFILE="./logs/test_validation.log"

# Test Modbus communication
echo "Testing Modbus communication..." | tee -a $LOGFILE
modbus_client -m rtu -b $MODBUS_BAUDRATE -p $MODBUS_PARITY -s $MODBUS_STOPBITS $MODBUS_SERIAL_PORT -a 1 -t 4 -r 300 | tee -a $LOGFILE

# Test DNP3 Master/Outstation communication
echo "Testing DNP3 Master communication..." | tee -a $LOGFILE
dnp3_client --test-connection --config config/dnp3_config.json | tee -a $LOGFILE

echo "Test validation completed. Review logs for any errors." | tee -a $LOGFILE

