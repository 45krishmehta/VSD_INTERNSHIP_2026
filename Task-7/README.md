#  Commercial-Grade PWM IP 

## Overview

This project provides a commercial-grade PWM (Pulse Width Modulation) IP designed for the VSDSquadron FPGA RISC-V SoC.

The PWM IP generates configurable PWM waveforms using software programmable registers.

Users can configure frequency and duty cycle without modifying RTL.

---

## Features

- Single channel PWM output
- 32-bit period configuration
- 32-bit duty cycle configuration
- Memory mapped register interface
- RISC-V software controlled
- Easy FPGA integration

---

## Folder Structure

```
Task-7

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

## Register Summary

| Offset | Register | Function |
|-|-|-|
|0x00|CTRL|Enable PWM|
|0x04|PERIOD|PWM Period|
|0x08|DUTY|Duty Cycle|
|0x0C|STATUS|Status|

---

## Usage Flow

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

## Duty Cycle

```
Duty Cycle = DUTY / PERIOD × 100

5 / 10 × 100 = 50%
```

---

## Testing

- Integrate RTL
- Build software
- Program VSDSquadron FPGA
- Observe PWM output

---

## Known Limitations & Notes

Commercial IP releases include design assumptions and current limitations.

### Limitations

- Supports single PWM output channel only

- No interrupt generation support

- No automatic duty cycle update mode

- Duty cycle and period values are configured through software registers

- PWM output frequency depends on the system clock frequency


### Design Assumptions

- Uses VSDSquadron FPGA system clock

- Register interface uses 32-bit memory mapped access

- Processor configures PWM before waveform generation

- PWM output pin should be mapped correctly using FPGA constraint file


### Future Improvements

Possible future enhancements:

- Multi-channel PWM support

- Interrupt based PWM events

- Dynamic frequency scaling support

- Advanced waveform generation modes

---

## Status

PWM IP successfully packaged as reusable FPGA IP.
