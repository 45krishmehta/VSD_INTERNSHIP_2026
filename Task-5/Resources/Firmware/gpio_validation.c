#include <stdint.h>


#define GPIO_BASE 0x30000000

#define GPIO_DATA (*(volatile uint32_t *)(GPIO_BASE + 0x00))
#define GPIO_DIR  (*(volatile uint32_t *)(GPIO_BASE + 0x04))


void main()
{

    // Configure GPIO as output

    GPIO_DIR = 0xFFFFFFFF;


    // Write GPIO data

    GPIO_DATA = 0x000000AA;


    while(1)
    {

    }


}
