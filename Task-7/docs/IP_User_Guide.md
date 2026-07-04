# PWM IP User Guide

## 1. IP Overview

The PWM (Pulse Width Modulation) IP is a configurable hardware module designed for the VSDSquadron FPGA RISC-V SoC.

It generates PWM waveforms by controlling the ON and OFF duration of the output signal through software programmable registers.

The IP allows the RISC-V processor to configure PWM behaviour without modifying RTL.

## Purpose

The purpose of this IP is to provide a reusable hardware PWM generator for FPGA applications.

## Typical Use Cases

- LED brightness control
- Motor speed control
- Digital waveform generation
- Hardware timing applications


---

# 2. Feature Summary

Features:

- Single channel PWM output
- 32-bit period configuration
- 32-bit duty cycle configuration
- Software controlled enable
- Memory mapped register interface
- VSDSquadron FPGA compatible


## Clock Assumptions

- Uses system clock provided by VSDSquadron FPGA SoC


## Limitations

- Single channel PWM only
- No interrupt support
- No automatic duty cycle update


---

# 3. Block Diagram


        RISC-V CPU
             |
        Memory Bus
             |
     Register Interface
             |
      PWM Counter Logic
             |
        Comparator
             |
        PWM Output


# Known Limitations

- No interrupt generation
- Single PWM channel
- Software controlled configuration only
