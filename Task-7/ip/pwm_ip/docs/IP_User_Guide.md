# PWM IP User Guide


## 1. IP Overview


The PWM (Pulse Width Modulation) IP is a configurable hardware module developed for the VSDSquadron FPGA RISC-V SoC platform.

It generates PWM output signals by controlling the ON time and OFF time of a digital waveform.

The IP is controlled through software programmable memory mapped registers.


## Purpose


The purpose of this IP is to provide a reusable hardware PWM generator that allows software control of waveform characteristics without modifying RTL logic.


## Typical Use Cases


- LED brightness control
- Motor speed control
- Digital signal generation
- Hardware timing applications


## Why Use This IP?


The PWM IP reduces processor workload by generating continuous PWM signals in hardware after initial software configuration.


---


## 2. Feature Summary


Supported features:

- Single PWM output channel
- 32-bit period register
- 32-bit duty cycle register
- Software controlled enable
- Memory mapped register interface
- RISC-V processor compatibility


## Clock Assumptions


- Uses VSDSquadron FPGA system clock
- PWM frequency depends on configured period value


## Limitations


- Single channel PWM only
- No interrupt support
- No automatic duty cycle update mode


---


## 3. Block Diagram

