#include "mss_uart.h"
#include "mss_ace.h"
#include "mss_gpio.h"
#include <stdio.h>
#define Microsemi_logo \
"\n\r \
** ** ******* ****** ***** **** ***** ****** ** ** ******* \n\r \
* * * * * * * * * * * * * * * * * \n\r \
* * * * * * ***** * * **** ****** * * * * * \n\r \
* * * * * * * * * * * * * * * \n\r \
* * ******* ****** * * **** ***** ****** * * ******* "
int main()
{
const uint8_t greeting[] = "\n\rWelcome to Microsemi's SmartFusion Voltage Monitor\n\n\r";
const uint8_t * channel_name;
/*Initialize and Configure GPIO*/
MSS_GPIO_init();
MSS_GPIO_config( MSS_GPIO_31 , MSS_GPIO_OUTPUT_MODE );
MSS_GPIO_config( MSS_GPIO_30 , MSS_GPIO_OUTPUT_MODE );
MSS_GPIO_config( MSS_GPIO_29 , MSS_GPIO_OUTPUT_MODE );
MSS_GPIO_config( MSS_GPIO_28 , MSS_GPIO_OUTPUT_MODE );
/*Initialize UART_0*/
MSS_UART_init(
&g_mss_uart0,
MSS_UART_57600_BAUD,
MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT );
/*Initialize ACE*/
ACE_init( );
MSS_UART_polled_tx_string( &g_mss_uart0, (const uint8_t*)Microsemi_logo );
MSS_UART_polled_tx( &g_mss_uart0, greeting, sizeof(greeting) );
channel_name = ACE_get_channel_name( TM0_Voltage );
for (;;)
{
uint8_t display_buffer[32];
uint16_t adc_result;
int32_t adc_value_mv;
adc_result = ACE_get_ppe_sample( TM0_Voltage );
adc_value_mv = ACE_convert_to_mV( TM0_Voltage, adc_result );
if ( adc_value_mv < 0 )
{
snprintf( (char *)display_buffer, sizeof(display_buffer),
"%s : -%.3fV\r\b", channel_name, ((float)(-adc_value_mv) / (float)(1000)));
}
else
{
snprintf( (char *)display_buffer, sizeof(display_buffer),
"%s : %.3fV\r\b", channel_name, ((float)(adc_value_mv) / (float)(1000)));
}
MSS_UART_polled_tx_string( &g_mss_uart0, display_buffer );
/* checking the status of Voltage flags */
int32_t flag_status_2p5v = ACE_get_flag_status(TM0_Voltage_over_2p5v);
int32_t flag_status_2p0v = ACE_get_flag_status(TM0_Voltage_over_2p0v);
int32_t flag_status_1p5v = ACE_get_flag_status(TM0_Voltage_over_1p5v);
int32_t flag_status_1p0v = ACE_get_flag_status(TM0_Voltage_over_1p0v);
/* Voltage flags are displayed on the LEDs through GPIO */
uint32_t gpio_output;
if ( flag_status_2p5v == FLAG_ASSERTED )
gpio_output = ~(
MSS_GPIO_28_MASK |
MSS_GPIO_29_MASK |
MSS_GPIO_30_MASK |
MSS_GPIO_31_MASK );
else
if ( flag_status_2p0v == FLAG_ASSERTED )
gpio_output = ~(
MSS_GPIO_28_MASK |
MSS_GPIO_29_MASK |
MSS_GPIO_30_MASK );
else
if ( flag_status_1p5v == FLAG_ASSERTED )
gpio_output = ~(
MSS_GPIO_28_MASK |
MSS_GPIO_29_MASK );
else
if ( flag_status_1p0v == FLAG_ASSERTED )
gpio_output = ~(
		MSS_GPIO_28_MASK );
		else
		gpio_output = (
		MSS_GPIO_28_MASK |
		MSS_GPIO_29_MASK |
		MSS_GPIO_30_MASK |
		MSS_GPIO_31_MASK );
		MSS_GPIO_set_outputs( gpio_output );
		}
		return 0;
		}
