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
