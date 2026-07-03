# Task-6: PWM Peripheral IP Development and SoC Integration

## Overview

In this task, a custom **PWM (Pulse Width Modulation) Peripheral IP** is designed and integrated with a RISC-V based SoC.

The objective of this task is to understand how real hardware peripherals are developed in semiconductor and FPGA design flow. The PWM module works as a memory-mapped peripheral where the processor controls the output waveform by configuring internal registers.

The complete development flow includes RTL design, register implementation, SoC integration, software control, simulation verification, and FPGA hardware validation.


## Objective

The main goal of this task is to build a configurable PWM IP which can generate output signals useful for applications such as:

- LED brightness control
- Servo control signals
- Digital waveform generation

The PWM peripheral allows software running on the RISC-V processor to configure the output waveform by changing period and duty cycle values.


## Task Flow

The implementation follows the complete IP development cycle:

1. **PWM RTL Design**
   - Developed a synchronous Verilog module.
   - Implemented control, period, duty cycle, and status registers.

2. **Register Interface**
   - Created a memory-mapped register structure.
   - Added CPU read/write access support.

3. **SoC Integration**
   - Connected the PWM peripheral with the processor bus.
   - Added address decoding logic.
   - Exposed PWM output signal.

4. **Software Validation**
   - Created a C program to configure PWM registers.
   - Verified CPU control over the peripheral.

5. **Simulation Verification**
   - Verified PWM functionality using testbench simulation.
   - Observed PWM waveform behavior.

6. **FPGA Hardware Validation**
   - Programmed the design on VSDSquadron FPGA board.
   - Connected PWM output to LED for brightness control.


## PWM IP Specification

The PWM peripheral contains four 32-bit memory mapped registers.

| Offset | Register | Access | Description |
|-------|----------|--------|-------------|
| 0x00 | CTRL | R/W | Enable and polarity control |
| 0x04 | PERIOD | R/W | PWM period configuration |
| 0x08 | DUTY | R/W | PWM duty cycle configuration |
| 0x0C | STATUS | R | Debug and running status |


### Control Register

- Bit 0 : PWM Enable  
  - 1 → Enable PWM output  
  - 0 → Disable PWM output

- Bit 1 : Output Polarity  
  - 0 → Active High PWM  
  - 1 → Active Low PWM


## PWM Working Principle

The PWM IP uses an internal counter which counts from 0 to the programmed period value.

The duty register decides for how many clock cycles the output remains HIGH.

PWM output generation:
By modifying the duty value, the ON time of the signal changes, which controls the effective output power delivered to the connected device.


---

