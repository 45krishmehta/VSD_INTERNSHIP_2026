#include <stdint.h>


#define PWM_BASE    0x40000000

#define PWM_CTRL    (*(volatile uint32_t *)(PWM_BASE + 0x00))
#define PWM_PERIOD  (*(volatile uint32_t *)(PWM_BASE + 0x04))
#define PWM_DUTY    (*(volatile uint32_t *)(PWM_BASE + 0x08))
#define PWM_STATUS  (*(volatile uint32_t *)(PWM_BASE + 0x0C))


void main()
{

    // Set PWM period
    PWM_PERIOD = 100;


    // 50% Duty Cycle
    PWM_DUTY = 50;


    // Enable PWM
    PWM_CTRL = 1;


    while(1)
    {

    }

}
