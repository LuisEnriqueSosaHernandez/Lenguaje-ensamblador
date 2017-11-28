;**********************************************************************************************
;   DESCRIPCIÓN DEL PROGRAMA: 
;**********************************************************************************************
;                                                                     
;    NOMBRE DEL ARCHIVO: Practica7.asm                           
;    FECHA: 
;                                                                     
;                                                                    
;    AUTOR: 
;    CATEDRATICO: ING. CARLOS ROBERTO GONZALEZ ESCARPETA
;    ASIGNATURA: SISTEMAS PROGRAMABLES                                   
;                                                                      
;*********************************************************************************************
;                                                                    
;              INSTITUTO TECNOLOGICO DE VERACRUZ                      
;                                                                     
;*********************************************************************************************
	
	INCLUDE <P16F877A.INC>
	__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_OFF & _XT_OSC & _LVP_OFF &_BODEN_OFF

;***************************DEFINICION DE VARIABLES********************
RESULTH		EQU 0X20
RESULTL		EQU 0X21
CountA		EQU 0X22

;*********************************CÓDIGO*******************************
	
;1. Configure the A/D module:
;• Configure analog pins/voltage reference and
;digital I/O (ADCON1)
;• Select A/D input channel (ADCON0)
;• Select A/D conversion clock (ADCON0)
;• Turn on A/D module (ADCON0)
	BSF STATUS,RP0; banco 1
	BCF STATUS,RP1
	MOVLW 	0X01
	MOVWF	TRISA
	CLRF	TRISB
	
	CLRF	TRISC
	
	MOVLW 	0X8E 	; PROGARMACION DE LOS BIT DEL ADCON1
	MOVWF	ADCON1
	BCF STATUS,RP1
	BCF STATUS,RP0

	MOVLW 	0X41	;  PROGARMACION DE LOS BIT DEL ADCON0
	MOVWF	ADCON0
LOOP	

;ADCS2ADCS1ADCS0   001 PARA 5 MHZ
;PCFG  1110 SERIA LA COMBINACION PARA PROPONER LA ENTRADA A0 ANALOGIC EN EL PUERTO A
;ADFM SI VALE UNO EL RESULTADO DEL CONVERTIDORJUSTICA A LA DERECHA Y CON CERO ;JUSTIFICA A LA IZQUIERDA
;CHS2 TO CHS0 DEFINE EL CANAL QUE TOMARA PARA HACER LA CONVERSION EN EL CASO DEL ;CANAL A0 SE DEBE DE ;PONER 000
;ADON CON 1 EL CONVERTIDOR ESTA ENCENDIDO Y 0 PARA APAGARLO
	
;2. Configure A/D interrupt (if desired):
;• Clear ADIF bit
;• Set ADIE bit
;• Set PEIE bit
;• Set GIE bit
;3. Wait the required acquisition time.
; ;PIC Time Delay = 0.00002500 s with Osc = 4000000 Hz
		movlw	D'8'
		movwf	CountA
loop25		decfsz	CountA,1
		goto	loop25
		


;4. Start conversion:
;• Set GO/DONE bit (ADCON0)

	BSF ADCON0, GO_DONE

;5. Wait for A/D conversion to complete by either:
; Polling for the GO/DONE bit to be cleared
;(interrupts disabled); OR
;• Waiting for the A/D interrupt
DONE	BTFSC	ADCON0,GO_DONE
	GOTO 	DONE
;6. Read A/D Result register pair
;(ADRESH:ADRESL), clear bit ADIF if required.

	
	MOVF ADRESH,W
	MOVWF PORTC
	BCF STATUS,RP1
	BSF STATUS,RP0
	MOVF	ADRESL,W
	BCF STATUS,RP1
	BCF STATUS,RP0
	MOVWF	PORTB

;7. For the next conversion, go to step 1 or step 2
;as required. The A/D conversion time per bit is defined as TAD.

	GOTO LOOP
	END
