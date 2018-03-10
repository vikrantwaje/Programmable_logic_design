#include <sys/alt_stdio.h>
#include <stdio.h>
#include "altera_avalon_pio_regs.h"
#include "system.h"

int main()
{ 
int switch_datain, flag=0, key_datain;
alt_putstr("Hello from Nios II! \nPress Push buttons to display names. \n");
/* Event loop never exits. Read the PB, display on the LED */
while (1)
{
switch_datain = IORD_ALTERA_AVALON_PIO_DATA(SWITCH_BASE);
key_datain = IORD_ALTERA_AVALON_PIO_DATA(KEY_BASE);
if (key_datain == 2 && flag != 2)
{
	alt_putstr("Anay Gondhalekar\n");
    flag = 2;
}

else if (key_datain == 1 && flag != 1)
{
	alt_putstr("Vikrant Waje\n");
    flag = 1;
}

else if (key_datain == 0 && flag != 0 )
{
	alt_putstr("Anay Gondhalekar\n");
	alt_putstr("Vikrant Waje\n");
    flag = 0;
}

else if (key_datain == 3)
{
	flag = 3;
}

IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE,!switch_datain);
}
return 0;
}
