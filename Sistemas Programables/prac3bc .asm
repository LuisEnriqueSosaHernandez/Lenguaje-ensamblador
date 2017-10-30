;************************************************************************************************

;   DESCRIPCIÓN DEL PROGRAMA: En un LCD 16X4 se debe de visulaizar en que ángulo de encuentra 
;                             el servomotor.       
                            
;************************************************************************************************
;                                                                     
;    NOMBRE DEL ARCHIVO: prac4BC                             
;    FECHA: 25-octubre-2017                                                       
;                                                                     
;                                                                     
;    AUTOR:Luis Enrique Sosa Hernández                                           
;    CATEDRATICO: ING. CARLOS ROBERTO GONZALEZ ESCARPETA              
;    ASIGNATURA:  Sistemas Programables
;                                                                      
;                                                                     
;************************************************************************************************
;                                                            -        
;              INSTITUTO TECNOLOGICO DE VERACRUZ                      
;                                                                     
;***********************************************************************************************
;                                                                     
;OBJETIVO: En un LCD 16X4 se debe de visualizar en que ángulo se encuentra el servomotor Y
;	       Controlar el desplazamiento angular de un servomotor a partir de condiciones de entradas analógicas

;************************************************************************************************

        LIST      p=16F84A            ; define procesador
        INCLUDE <p16F84A.inc>         ; define variables del procesador
        INCLUDE <LCD_4BIT.INC>
        INCLUDE <RETARDOS.INC>
 
	 __CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

;***************************DEFINICION DE VARIABLES********************
        #DEFINE   SALIDA     PORTB,1        
        #DEFINE   SENSA_Z    PORTA,4       
        #DEFINE   SENSA_Ze   STATUS,Z
        #DEFINE   SENSA_C    STATUS,C
        CBLOCK    0x0C
        POSA     
        CounterA  
        CounterB 
        ENDC
;*********************************CÓDIGO******************************

INICIO  
        BSF		STATUS,5	     ;BANCO 1
	    MOVLW   b'00000000'                       
        MOVWF   TRISA
        MOVLW   b'11111111'
        MOVWF   TRISB
        BCF     STATUS,5

;**********************************************************************
         
MAIN

BTFSC   PORTB,1
        GOTO    SERVO0 
        GOTO    SERVO180
;***********************************************************************

SERVO0   
        
    ;PIC Time Delay = 0.00029800 s with Osc = 4000000 Hz
    BSF     SALIDA		
    MOVLW	D'99'
	MOVWF	CounterA
	loop		
        DECFSZ	CounterA,1
	GOTO	loop
    BCF     SALIDA	                                           
    
    ;PIC Time Delay = 0.01970200 s with Osc = 4000000 Hz
	MOVLW	D'26'
	MOVWF	CounterB
	MOVLW	D'149'
	MOVWF	CounterA
	loop1		
        DECFSZ	CounterA,1
            GOTO	loop1
			DECFSZ	CounterB,1
			GOTO	loop1

    GOTO  MENS0
;*********************************************************************************

SERVO180
	
    ;PIC Time Delay = 0.00210000 s with Osc = 4000000 Hz
    BSF     SALIDA	
    MOVLW	D'3'
	MOVWF	CounterB
	MOVLW	D'185'
	MOVWF	CounterA
loop2	
	DECFSZ	CounterA,1
	GOTO	loop2
	DECFSZ	CounterB,1
	GOTO	loop2
    BCF     SALIDA
    ;PIC Time Delay = 0.01790100 s with Osc = 4000000 Hz
	MOVLW	D'24'
	MOVWF	CounterB
	MOVLW	D'62'
	MOVWF	CounterA
loop3	
	DECFSZ	CounterA,1
	GOTO	loop3
	DECFSZ	CounterB,1
	GOTO	loop3


	GOTO    MENS180
;**********************************************************************

S35
     ;PIC Time Delay = 0.00120100 s with Osc = 4000000 Hz
	BSF     SALIDA	
    MOVLW	D'2'
	MOVWF	CounterB
	MOVLW	D'142'
	MOVWF	CounterA
loop4		
    DECFSZ	CounterA,1
	GOTO	loop4
	DECFSZ	CounterB,1
	GOTO	loop4
    BCF     SALIDA
        ;PIC Time Delay = 0.01880000 s with Osc = 4000000 Hz
	MOVLW	D'25'
	MOVWF	CounterB
	MOVLW	D'105'
	MOVWF	CounterA
loop5	
	DECFSZ	CounterA,1
	GOTO	loop5
	DECFSZ	CounterB,1
	GOTO	loop5
	
	GOTO    MAIN
;************************** MENSAJES LCD **************************

MENS0
        CALL    LCD_Inicializa
        MOVLW   'C'
        CALL    LCD_Caracter
        MOVLW   'E'
        CALL    LCD_Caracter        
        MOVLW   'R'
        CALL    LCD_Caracter
        MOVLW   'O'
        CALL    LCD_Caracter
        MOVLW   ' '
        CALL    LCD_Caracter
        MOVLW   'G'
        CALL    LCD_Caracter
        MOVLW   'R'
        CALL    LCD_Caracter
        MOVLW   'A'
        CALL    LCD_Caracter
        MOVLW   'D'
        CALL    LCD_Caracter
        MOVLW   'O'
        CALL    LCD_Caracter
        MOVLW   'S'
        CALL    LCD_Caracter
        MOVLW   ''
        CALL    LCD_Caracter        
        RETURN
        
        
MEN180
        CALL    LCD_Inicializa
        MOVLW   'C'
        CALL    LCD_Caracter
        MOVLW   'I'
        CALL    LCD_Caracter        
        MOVLW   'E'
        CALL    LCD_Caracter
        MOVLW   'N'
        CALL    LCD_Caracter
        MOVLW   'T'
        CALL    LCD_Caracter
        MOVLW   'O'
        CALL    LCD_Caracter
        MOVLW   ' '
        CALL    LCD_Caracter
        MOVLW   'O'
        CALL    LCD_Caracter
        MOVLW   'C'
        CALL    LCD_Caracter
        MOVLW   'H'
        CALL    LCD_Caracter
        MOVLW   'E'
        CALL    LCD_Caracter
        MOVLW   'N'
        CALL    LCD_Caracter
        MOVLW   'T'
        CALL    LCD_Caracter
        MOVLW   'A'
        CALL    LCD_Caracter
        CALL    LCD_Linea2
        MOVLW   'G'
        CALL    LCD_Caracter
        MOVLW   'R'
        CALL    LCD_Caracter
        MOVLW   'A'
        CALL    LCD_Caracter
        MOVLW   'D'
        CALL    LCD_Caracter         
        MOVLW   'O'
        CALL    LCD_Caracter         
        MOVLW   'S'
        CALL    LCD_Caracter         
        RETURN
        
END
