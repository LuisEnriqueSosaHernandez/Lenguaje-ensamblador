;*********************************************************************************************
;   DESCRIPCIÓN DEL PROGRAMA: Compara una entrada logica y proporciona una salida dependiendo
;							  del resultado
;*********************************************************************************************
;                                                                     
;    NOMBRE DEL ARCHIVO:	  prac2.asm                           
;    FECHA:6-octubre-2017                                                   
;                                                                                                                                       
;    AUTOR:       Luis Enrique Sosa Hernández                                                        
;    CATEDRATICO: ING. CARLOS ROBERTO GONZALEZ ESCARPETA              
;    ASIGNATURA:  SISTEMAS PROGRAMABLES                                   
;                                                                      
;**********************************************************************************************
;                                                                    
;              INSTITUTO TECNOLOGICO DE VERACRUZ                      
;                                                                     
;**********************************************************************************************
;                                                                     
;OBJETIVO: Sensar una entrada con una variable física del puerto A y en función del valor 
;          lógico de esta saltar para atender una subrutina                                
;**********************************************************************************************

	list      p=16F84A            ; define procesador
	#include <p16F84A.inc>       ; define variables del procesador
	
	__CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

;***************************DEFINICION DE VARIABLES********************

STATUS	EQU	0X03 ;SE ASIGNÓ LA ETIQUETA STATUS AL REGISTRO 0X03 DE LA MEMORIA DE DATOS
PORTA	EQU	0X05 ;SE ASIGNO LA ETIQUETA PORTA AL REGISTRO 0X05 DE LA MEMORIA DE DATOS
PORTB	EQU	0X06 ;SE ASIGNO LA ETIQUETA PORTB AL REGISTRO 0X06 DE LA MEMORIA DE DATOS
TRISA	EQU	0X85 ;SE ASIGNO LA ETIQUETA TRISA AL REGISTRO 0X85 DE LA MEMORIA DE DATOS
TRISB	EQU	0X86 ;SE ASIGNO LA ETIQUETA TRISB AL REGISTRO 0X86 DE LA MEMORIA DE DATOS

;**********************************************************************

;***************************CODIGO*************************************

	ORG	0X00	;SE INDICA QUE EL PROGRAMA INICIA EN LA DIRECCIÓN 0X00

INICIO  
	BSF	STATUS,5
	MOVLW	0X01
	MOVWF	TRISA
	MOVLW	0X00
	MOVWF	TRISB
	
	BCF	STATUS,5

MAIN 
	BTFSC  PORTA,0  ;SALTA SI EL BIT "b" 0 DE [PORTA] ES CERO
	GOTO   S1
	GOTO   S2
	
S1	
	MOVLW  0xAA
	MOVWF  PORTB
	GOTO   MAIN
S2	     
	MOVLW  0x55
	MOVWF  PORTB
 	GOTO   MAIN
	END