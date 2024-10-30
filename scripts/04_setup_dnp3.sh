#!/bin/bash

# Log file
LOGFILE="./logs/dnp3_setup.log"

# Create DNP3 configuration for Master and Outstation
cat <<EOL > config/dnp3_config.json
{
  "dnp3_config": {
    "master": {
      "ip": "192.168.1.21",
      "port": 20000
    },
    "outstation": {
      "ip": "192.168.1.7",
      "port": 20000
    }
  }
}
EOL

echo "DNP3 configuration saved to config/dnp3_config.json" | tee -a $LOGFILE

