#!/bin/bash

# Log file
LOGFILE="./logs/io_mapping.log"

# Mapping configuration file
cat <<EOL > config/io_mapping.json
{
  "modbus_map": {
    "temperature_sensor": {
      "register": 300,
      "value_type": "analog_input"
    },
    "pressure_sensor": {
      "register": 301,
      "value_type": "analog_input"
    }
  },
  "dnp3_map": {
    "analog_input": [
      { "id": 0, "modbus_register": 300 },
      { "id": 1, "modbus_register": 301 }
    ]
  }
}
EOL

echo "I/O mapping completed and saved to config/io_mapping.json" | tee -a $LOGFILE

