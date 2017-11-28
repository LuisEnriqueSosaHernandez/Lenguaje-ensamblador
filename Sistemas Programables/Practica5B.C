//**********************************************************************************************
//   DESCRIPCIÓN DEL PROGRAMA: Lectura del puerto analógico y mostrar en el  primer renglón el 
//valor en decimal de la conversión (0 a 1023)  y en el segundo renglón el valor del voltaje 
//analógico medido.                                     
//**********************************************************************************************
//                                                                     
//    NOMBRE DEL ARCHIVO: Practica5B.C
//    FECHA: 27 de noviembre del 2017                                                           
//                                                                     
//    AUTOR:                                                           
//    CATEDRATICO: ING. CARLOS ROBERTO GONZALEZ ESCARPETA              
//    ASIGNATURA: SISTEMAS PROGRAMABLES                                   
//                                                                     
//************************************************************************************************       //              INSTITUTO TECNOLOGICO DE VERACRUZ                      
//***********************************************************************************************
//OBJETIVO:Analizar el módulo ADC de un microcontrolador para convertir al menos una 
//señal analógica a digital
//************************************************************************************************

//*********************************CÓDIGO*******************************
#include <16f877a.h>
#device adc=10
#fuses xt,nowdt,noput,nobrownout
//#fuses
#use delay (clock=4000000)
#include <lcd.c>

void main()
{
int16 adc;
float voltaje;

setup_adc_ports (AN0);
setup_adc (ADC_CLOCK_div_2);

lcd_init();
for (;;)
{
set_adc_channel (0);
delay_us (20);
adc = read_adc ();
voltaje = 5.0*adc/1023.0;
printf(lcd_putc, "\fADC = %4Lu", adc);
printf(lcd_putc, "\nVoltaje=%2.4fV",voltaje);
delay_ms(500);
}
}

		