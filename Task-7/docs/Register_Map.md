# PWM IP Register Map


## Register Summary


| Offset | Register | Access | Description |
|--------|----------|--------|-------------|
|0x00|CTRL|R/W|PWM control|
|0x04|PERIOD|R/W|PWM period value|
|0x08|DUTY|R/W|PWM duty cycle|
|0x0C|STATUS|R|PWM status|


---

## CTRL Register


Reset Value:

0x00000000


Bit Definition:


|Bits|Name|Description|
|-|-|-|
|0|ENABLE|Enable PWM output|
|1|POLARITY|Output polarity control|
|31:2|Reserved|Unused|


---

## PERIOD Register

Access: R/W

Defines PWM waveform period.

Bits:

[31:0] Period value


---

## DUTY Register

Access: R/W

Defines PWM ON duration.

Bits:

[31:0] Duty value


---

## STATUS Register

Access: Read Only

Provides PWM status information.
