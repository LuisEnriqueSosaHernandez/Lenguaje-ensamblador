//**********************************************************************************************
//   DESCRIPCIÓN DEL PROGRAMA: Mostrar en el LCD la señala analógica en interfase humana
//   (que observe unidades y medida de la señal analógica)                                
//**********************************************************************************************
//                                                                     
//    NOMBRE DEL ARCHIVO: Practica5C.C
//    FECHA: 27 de noviembre del 2017                                                           
//                                                                     
//    AUTOR:                                                           
//    CATEDRATICO: ING. CARLOS ROBERTO GONZALEZ ESCARPETA              
//    ASIGNATURA: SISTEMAS PROGRAMABLES                                   
//                                                                     
//************************************************************************************************       
//              INSTITUTO TECNOLOGICO DE VERACRUZ                      
//***********************************************************************************************
//OBJETIVO:Analizar el módulo ADC de un microcontrolador para convertir al menos una 
//señal analógica a digital
//************************************************************************************************

//*********************************CÓDIGO*******************************
#include <16F877A.h>
#fuses XT,NOWDT,NOPUT,NOBROWNOUT,NOLVP,NOPROTECT
#device adc=10
#use delay(crystal=4,000,000)
#include <lcd.c>

int16 ADC;
float voltaje,temp;
char r=223;

void main()
{
   lcd_init();
   setup_adc_ports(AN0);
   setup_adc(ADC_CLOCK_INTERNAL);            
   set_adc_channel(0);
   
   while(TRUE)
   {
     ADC=read_adc();
     voltaje=(ADC*5.0)/1023.0;
     temp= voltaje*100.0;
     printf(lcd_putc, "\fTemp= %2.2f%cC",temp,r);
     delay_ms(500);
   }
}