;**********************************************************************************************
;   DESCRIPCIÓN DEL PROGRAMA:                         
;**********************************************************************************************
;                                                                     
;    NOMBRE DEL ARCHIVO:	  prac2.asm                           
;    FECHA:                                                           
;                                                                     
;                                                                     
;    AUTOR:                                                           
;    CATEDRATICO: ING. CARLOS ROBERTO GONZALEZ ESCARPETA              
;    ASIGNATURA:  SISTEMAS PROGRAMABLES                                   
;                                                                      
;                                                                     
;************************************************************************************************
;                                                                    
;              INSTITUTO TECNOLOGICO DE VERACRUZ                      
;                                                                     
;***********************************************************************************************
;                                                                     
;OBJETIVO:                                      
;************************************************************************************************


	list      p=16F84A            ; define procesador
	#include <p16F84A.inc>       ; define variables del procesador
	
	__CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

;***************************DEFINICION DE VARIABLES********************

STATUS	EQU	0X03	;SE ASIGNÓ LA ETIQUETA STATUS AL REGISTRO 0X03 DE LA MEMORIA DE DATOS
PORTA	EQU	0X05	;SE ASIGNO LA ETIQUETA PORTA AL REGISTRO 0X05 DE LA MEMORIA DE DATOS
PORTB	EQU	0X06	;SE ASIGNO LA ETIQUETA PORTB AL REGISTRO 0X06 DE LA MEMORIA DE DATOS
TRISA	EQU	0X85	;SE ASIGNO LA ETIQUETA TRISA AL REGISTRO 0X85 DE LA MEMORIA DE DATOS
TRISB	EQU	0X86	;SE ASIGNO LA ETIQUETA TRISB AL REGISTRO 0X86 DE LA MEMORIA DE DATOS
CounterA EQU 0x0C
CounterB EQU 0x0D
CounterC EQU 0X0E
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
	BSF PORTB,1
	;PIC Time Delay = 0,00120020 s with Osc = 40000000 Hz
		movlw	D'16'
		movwf	CounterB
		movlw	D'149'
		movwf	CounterA
loop		decfsz	CounterA,1
		goto	loop
		decfsz	CounterB,1
		goto	loop
		BCF PORTB,1 
;PIC Time Delay = 0,01880020 s with Osc = 40000000 Hz
		movlw	D'245'
		movwf	CounterB
		movlw	D'39'
		movwf	CounterA
loop1		decfsz	CounterA,1
		goto	loop1
		decfsz	CounterB,1
		goto	loop1		
	GOTO   MAIN
S2	  
	BSF PORTB,1 
	;PIC Time Delay = 0,00210020 s with Osc = 40000000 Hz
		movlw	D'28'
		movwf	CounterB
		movlw	D'69'
		movwf	CounterA
loop2		decfsz	CounterA,1
		goto	loop2
		decfsz	CounterB,1
		goto	loop2
	BCF PORTB,1 
	;PIC Time Delay = 0,01790020 s with Osc = 40000000 Hz
		movlw	D'233'
		movwf	CounterB
		movlw	D'119'
		movwf	CounterA
loop3		decfsz	CounterA,1
		goto	loop3
		decfsz	CounterB,1
		goto	loop3
 	GOTO   MAIN
	END

	;1 = 0101 0101 = 0X55
	;0 = 1010 1010 = 0XAA