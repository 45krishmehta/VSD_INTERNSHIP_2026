# PWM IP Example Usage


## Software Programming Model

PWM IP is controlled through memory mapped registers.


## Initialization Sequence


1. Configure PERIOD

2. Configure DUTY

3. Enable CTRL register

4. Observe PWM output


---

## Example


```
PERIOD = 10

DUTY = 5
```


Duty cycle:


```
Duty Cycle = DUTY / PERIOD ×100

= 5 / 10 ×100

= 50%
```


---

## C Example


```c
PWM_PERIOD = 10;

PWM_DUTY = 5;

PWM_CTRL = 1;
```


---

## Expected Output

- PWM waveform generated successfully
- Output follows configured duty cycle
- LED brightness changes with duty cycle


---

## Common Issues


|Issue|Reason|
|-|-|
|No Output|PWM disabled|
|Always HIGH|Duty greater than period|
|No LED response|Pin mapping issue|


---

## Validation

PWM IP successfully generates configurable PWM output on VSDSquadron FPGA.
