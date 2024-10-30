#!/bin/bash

# Log file
LOGFILE="./logs/firmware_build.log"

# Directory setup
SDK_DIR="./sdk"
BUILD_DIR="${SDK_DIR}/build"
FIRMWARE_OUTPUT="${BUILD_DIR}/axc_f1152_firmware.bin"

echo "Starting firmware build process..." | tee -a $LOGFILE

# Clone the SDK repository if not already cloned
if [ ! -d "$SDK_DIR" ]; then
    echo "Cloning AXC F 1152 SDK repository..." | tee -a $LOGFILE
    git clone https://github.com/phoenixcontact/axc_f1152_sdk.git $SDK_DIR | tee -a $LOGFILE
fi

# Navigate to SDK firmware directory
cd $SDK_DIR/firmware

# Customize the firmware code (Modbus and DNP3 integration)

# Example Modbus/DNP3 addition code block (this would be customized as needed)
echo "Adding DNP3 and Modbus components to firmware source code..." | tee -a $LOGFILE
echo "// Include DNP3 and Modbus support" >> main.c
echo "#include <dnp3.h>" >> main.c
echo "#include <modbus.h>" >> main.c
# Additional configuration can be added here

# Build the firmware
echo "Building firmware..." | tee -a $LOGFILE
make clean && make all | tee -a $LOGFILE

# Verify firmware output
if [ -f "$FIRMWARE_OUTPUT" ]; then
    echo "Firmware build successful. Output: $FIRMWARE_OUTPUT" | tee -a $LOGFILE
else
    echo "Firmware build failed. Check logs for errors." | tee -a $LOGFILE
    exit 1
fi

# Return to the original directory
cd -

echo "Firmware build process completed." | tee -a $LOGFILE

