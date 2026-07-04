# PWM IP Example Usage


## Software Programming Model


PWM IP is controlled through memory mapped registers.


Programming sequence:


1. Configure PERIOD register

2. Configure DUTY register

3. Enable PWM using CTRL register



## Example Configuration


```
PERIOD = 10

DUTY = 5
```


Duty Cycle:


```
Duty Cycle = DUTY / PERIOD ×100


= 5 / 10 ×100


= 50%
```



## Example C Usage


```c
PWM_PERIOD = 10;

PWM_DUTY = 5;

PWM_CTRL = 1;
```



## Expected Output


After execution:


- PWM waveform generated
- Duty cycle follows programmed value
- LED brightness changes according to PWM duty



## Common Failure Symptoms


|Issue|Reason|
|-|-|
|No Output|PWM disabled|
|Always HIGH|Duty greater than period|
|No LED change|Wrong pin mapping|



## Validation Result


PWM IP successfully generates configurable PWM output on VSDSquadron FPGA.
