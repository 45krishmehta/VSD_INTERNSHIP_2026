# PWM IP Integration Guide

## Overview

This document explains how to integrate the PWM (Pulse Width Modulation) IP with the VSDSquadron FPGA RISC-V SoC.

The PWM IP is designed as a reusable hardware block that connects with the processor using memory mapped registers.

The user can integrate and use this IP without modifying the internal RTL design.


---

# Required Files

The following RTL file is required:

```
rtl/pwm_ip.v
```

Software example:

```
software/pwm_test.c
```


---

# Step 1: Add PWM RTL File

Copy the PWM IP Verilog file into the VSDSquadron SoC RTL directory.

Example:

```bash
cp pwm_ip.v ~/vsdfpga_labs/basicRISCV/RTL/
```

Move to RTL directory:

```bash
cd ~/vsdfpga_labs/basicRISCV/RTL
```


---

# Step 2: Connect PWM IP with SoC

The PWM module must be instantiated inside the SoC top level RTL.

The IP communicates with the RISC-V processor using:

- Clock
- Reset
- Write Enable
- Address Bus
- Write Data Bus
- Read Data Bus


Example Instantiation:


```verilog
pwm_ip pwm0(

    .clk(clk),

    .reset(reset),

    .write_en(write_en),

    .addr(addr),

    .write_data(write_data),

    .read_data(read_data),

    .pwm_out(pwm_out)

);
```


---

# Step 3: Address Decoding

A dedicated memory mapped address region should be assigned for PWM registers.

Register mapping:


| Address Offset | Register | Function |
|---|---|---|
| PWM_BASE + 0x00 | CTRL | PWM enable/control |
| PWM_BASE + 0x04 | PERIOD | Configure PWM period |
| PWM_BASE + 0x08 | DUTY | Configure duty cycle |
| PWM_BASE + 0x0C | STATUS | Read PWM status |


The RISC-V processor writes and reads these registers to control the PWM hardware.


---

# Step 4: Software Integration

Use the provided example software:

```
software/pwm_test.c
```


Programming sequence:

1. Configure PERIOD register

2. Configure DUTY register

3. Enable PWM using CTRL register


Example:

```c
PWM_PERIOD = 10;

PWM_DUTY = 5;

PWM_CTRL = 1;
```


---

# Step 5: Build FPGA Design

After RTL integration, clean previous generated files:


```bash
make clean
```


Generate FPGA build:


```bash
make build
```


Successful completion verifies that the PWM IP is correctly integrated into the SoC.


---

# Step 6: Program VSDSquadron FPGA Board

Connect the VSDSquadron FPGA board through USB.


Check board connection:


```bash
ls /dev/ttyUSB*
```


Flash the FPGA:


```bash
sudo make flash
```


Expected output:


```
VERIFY OK
```


This confirms successful hardware programming.


---

# Step 7: Board-Level Usage

The PWM output signal:

```
pwm_out
```

can be connected to:

- On-board LED
- GPIO header pin
- External peripherals


Example:

A 50% duty cycle PWM signal changes the LED brightness according to the configured duty value.


---

# Constraint File Requirement

The pwm_out signal should be assigned to the required FPGA pin using the VSDSquadron FPGA constraint file.


---

# Integration Result

After successful integration:

- PWM IP becomes part of the VSDSquadron SoC
- RISC-V processor can access PWM registers
- Software can configure duty cycle and period
- PWM waveform is generated automatically
- Output can be observed on FPGA hardware
