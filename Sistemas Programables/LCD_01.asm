;**************LCD_01.asm***********
;
;El modulo LCD visualiza el mensaje 'Hola'
;
;ZONA DE DATOS

		
		__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
		LIST	P=16F84A
		INCLUDE <P16F84A.INC>

		CBLOCK 0x0C
		ENDC

;ZONA DE CODIGOS********************

		ORG		0
inicio	call	LCD_Inicializa
		movlw	'H'
		call	LCD_Caracter
		movlw	'o'
		call	LCD_Caracter
		movlw	'l'
		call	LCD_Caracter
		movlw	'a'
		call	LCD_Caracter
		sleep				; Entra en modo de bajo consumo

		INCLUDE <LCD_4BIT.INC>	;Subrutina de control del modulo LCD
		INCLUDE <RETARDOS.INC>	;Subrutina de retardo
		END