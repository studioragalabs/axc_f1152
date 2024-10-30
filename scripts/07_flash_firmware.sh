#!/bin/bash

# Log file
LOGFILE="./logs/firmware_flash.log"

# Firmware binary path
FIRMWARE_PATH="./sdk/build/axc_f1152_firmware.bin"

# Flash the firmware to the AXC F 1152
echo "Flashing firmware to AXC F 1152..." | tee -a $LOGFILE

if [ -f "$FIRMWARE_PATH" ]; then
    plcnext-cli --flash $FIRMWARE_PATH | tee -a $LOGFILE
    echo "Firmware flashed successfully." | tee -a $LOGFILE
else
    echo "Firmware binary not found. Ensure build process completed successfully." | tee -a $LOGFILE
    exit 1
fi

