To fully automate the setup for AXC F 1152 Controller with AXIO I/O modules, Modbus RTU (Serial/Ethernet), and DNP3 Master/Outstation, 
here’s a comprehensive script set that will guide you through:

1. Installing necessary software and dependencies,
2. Configuring network settings and communication protocols,
3. Setting up DNP3 and Modbus RTU/TCP, and
4. Testing and validating data flow.

Prerequisites
1. Ubuntu 20.04 LTS environment.
2. Ensure physical connections between the AXC F 1152, AXIO I/O modules, and Modbus RTU/Ethernet adapters.
3. Install PLCnext Engineer for configuring and flashing the firmware on AXC F 1152.

To incorporate the custom firmware build process for generating axc_f1152_firmware.bin using the AXC F 1152 SDK, 
we’ll add the following steps:

1. Clone the SDK repository: Obtain and build the firmware from Phoenix Contact’s official SDK GitHub repository.
2. Customize firmware code: Add necessary DNP3 and Modbus components.
3. Build firmware: Compile the custom firmware and generate the binary file.
4. Include firmware build in automation: Integrate the build process into the automated scripts.

srrmk@mars:~/MyWorkspace/3rdparty/middleware/axc_f1152_setup$ tree
.
├── README.md
├── config
│   ├── dnp3_config.json
│   ├── io_mapping.json
│   └── modbus_map.json
├── logs
│   ├── dnp3_setup.log
│   ├── firmware_build.log
│   ├── firmware_flash.log
│   ├── install.log
│   ├── io_mapping.log
│   ├── modbus_setup.log
│   ├── network_config.log
│   └── test_validation.log
├── scripts
│   ├── 01_install_dependencies.sh
│   ├── 02_configure_network.sh
│   ├── 03_setup_modbus.sh
│   ├── 04_setup_dnp3.sh
│   ├── 05_map_io.sh
│   ├── 06_build_firmware.sh
│   ├── 07_flash_firmware.sh
│   └── 08_test_validation.sh
└── sdk                              # Cloned SDK repository for AXC F 1152
    ├── build                        # Directory where the firmware binary will be generated
    │   └── axc_f1152_firmware.bin   
    └── firmware                     # Firmware source code and build scripts
        └── ../scripts/..
