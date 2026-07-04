# PWM IP Integration Guide


## Overview

This document explains how to integrate PWM IP with VSDSquadron FPGA RISC-V SoC.


## Required RTL Files


```
rtl/pwm_ip.v
```


## Integration Steps


### 1. Add RTL

Include pwm_ip.v in the SoC RTL directory.


### 2. Instantiate IP


Example:


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


## Address Mapping


|Address|Register|
|-|-|
|PWM_BASE + 0x00|CTRL|
|PWM_BASE + 0x04|PERIOD|
|PWM_BASE + 0x08|DUTY|
|PWM_BASE + 0x0C|STATUS|



## Board-Level Usage


The pwm_out signal can be connected to:


- FPGA LED
- GPIO Header
- External peripherals


## Constraint Requirement


Map pwm_out signal to required VSDSquadron FPGA pin.
