# PWM IP for VSDSquadron FPGA


## Overview

This package contains a commercial-grade PWM (Pulse Width Modulation) IP designed for the VSDSquadron FPGA RISC-V SoC.

The PWM IP generates configurable PWM waveforms using software programmable registers.

Users can control PWM frequency and duty cycle without modifying the RTL design.


---

## Features

- Single channel PWM output
- Programmable duty cycle
- Programmable period configuration
- 32-bit register interface
- Memory mapped RISC-V control
- Simple FPGA integration


---

## Directory Structure


```
ip/pwm_ip/

├── rtl/
│   └── pwm_ip.v

├── software/
│   └── pwm_test.c

├── docs/
│   ├── IP_User_Guide.md
│   ├── Register_Map.md
│   ├── Integration_Guide.md
│   └── Example_Usage.md

└── README.md
```


---

## Documentation


### IP_User_Guide.md

Contains:

- IP overview
- Features
- Block diagram
- Known limitations


### Register_Map.md

Contains:

- Register offsets
- Bit fields
- Reset values
- Read/write behaviour


### Integration_Guide.md

Contains:

- RTL integration steps
- Address decoding
- FPGA signal connections


### Example_Usage.md

Contains:

- Software programming sequence
- Example configuration
- Expected output


---

## Quick Start


1. Add PWM RTL file into VSDSquadron SoC

2. Connect PWM registers through memory mapped interface

3. Configure PWM using software


Example:

```c
PWM_PERIOD = 10;

PWM_DUTY = 5;

PWM_CTRL = 1;
```


---

## Duty Cycle Calculation


```
Duty Cycle = (DUTY / PERIOD) × 100


Example:

PERIOD = 10

DUTY = 5


Duty Cycle = 50%
```


---

## Board Usage

The generated PWM output signal can be connected to:

- FPGA LED
- GPIO header
- External peripheral


---

## Testing

Expected behaviour:

- PWM waveform generated successfully
- Output follows programmed duty cycle
- LED brightness varies according to duty cycle


---

## Status

PWM IP packaged successfully as a reusable VSDSquadron FPGA IP.
