#include <stdint.h>


#define GPIO_BASE 0x30000000

#define GPIO_REG (*(volatile uint32_t*)GPIO_BASE)



int main()
{


    GPIO_REG = 0x55AA55AA;


    while(1)
    {


    }


    return 0;


}
