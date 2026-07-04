# PWM IP Integration Guide

## Overview

This document explains integration of PWM IP with VSDSquadron FPGA SoC.


## Required RTL

```
rtl/pwm_ip.v
```


---

## Integration Steps


### 1. Add RTL File

Include pwm_ip.v in the SoC RTL source.


### 2. Instantiate PWM IP


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

## Address Mapping


|Address|Register|
|-|-|
|PWM_BASE + 0x00|CTRL|
|PWM_BASE + 0x04|PERIOD|
|PWM_BASE + 0x08|DUTY|
|PWM_BASE + 0x0C|STATUS|


---

## Board-Level Usage

PWM output signal:

```
pwm_out
```

can connect to:

- FPGA LED
- GPIO Header
- External peripherals


---

## Constraint File

Map pwm_out to required VSDSquadron FPGA pin.
