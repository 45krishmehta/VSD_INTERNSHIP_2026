# PWM IP Register Map


## Register Summary


| Offset | Register | Access | Description |
|--------|----------|--------|-------------|
|0x00|CTRL|R/W|PWM control register|
|0x04|PERIOD|R/W|PWM period value|
|0x08|DUTY|R/W|PWM duty cycle value|
|0x0C|STATUS|R|PWM status register|


---


# CTRL Register (0x00)


Reset Value:

0x00000000


Bit Fields:


|Bit|Name|Description|
|-|-|-|
|0|ENABLE|Enable PWM output|
|1|POLARITY|PWM polarity selection|
|31:2|Reserved|Unused|


---


# PERIOD Register (0x04)


Access:

Read/Write


Description:

Defines the total PWM waveform period.


Bits:

[31:0] PERIOD value


---


# DUTY Register (0x08)


Access:

Read/Write


Description:

Controls PWM ON duration.


Bits:

[31:0] DUTY value


---


# STATUS Register (0x0C)


Access:

Read Only


Description:

Provides PWM status information.
