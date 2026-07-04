#include <stdint.h>


#define PWM_BASE 0x40000000


#define PWM_CTRL    (*(volatile uint32_t *)(PWM_BASE + 0x00))
#define PWM_PERIOD  (*(volatile uint32_t *)(PWM_BASE + 0x04))
#define PWM_DUTY    (*(volatile uint32_t *)(PWM_BASE + 0x08))
#define PWM_STATUS  (*(volatile uint32_t *)(PWM_BASE + 0x0C))



int main()
{

    /*
        Configure PWM Period Register
    */

    PWM_PERIOD = 10;


    /*
        Configure PWM Duty Register

        Duty Cycle = DUTY / PERIOD × 100

        Duty = 5
        Period = 10

        Duty Cycle = 50%
    */

    PWM_DUTY = 5;



    /*
        Enable PWM

        CTRL[0] = 1
    */

    PWM_CTRL = 1;



    while(1)
    {

        /*
            PWM hardware continues generating
            waveform independently
        */

    }


    return 0;

}
