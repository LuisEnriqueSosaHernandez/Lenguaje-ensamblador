;************************************************************************************************
;   DESCRIPCIÓN DEL PROGRAMA: En un LCD 16X4 se debe de visualizar en que ángulo de encuentra 
;                             el servomotor.                                   
;************************************************************************************************
;                                                                     
;    NOMBRE DEL ARCHIVO:prac3bc.asm	                             
;    FECHA:    25-10-2017                                                       
;                                                                     
;                                                                     
;    AUTOR:Luis Enrique Sosa Hernández                                                         
;    CATEDRATICO: ING. CARLOS ROBERTO GONZALEZ ESCARPETA              
;    ASIGNATURA:Sistemas Programables  
;                                                                      
;                                                                     
;************************************************************************************************
;                                                            -        
;              INSTITUTO TECNOLOGICO DE VERACRUZ                      
;                                                                     
;***********************************************************************************************                                                                   
;OBJETIVO: Adquirir datos por los puertos A y B, compararlos y tomar acciones en función de 
;          su resultado para mover el servomotor                
;************************************************************************************************
        list      p=16F84A            ; define procesador
	include <p16F84A.inc>         ; define variables del procesador
 
	 __CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

;***************************DEFINICION DE VARIABLES********************
        #DEFINE   SALIDA     PORTB,1        
        #DEFINE   SENSA_Z    PORTA,4       
        #DEFINE   MR         PORTA,1
        #DEFINE   CLK        PORTA,3
        #DEFINE   SENSA_Ze   STATUS,Z
        #DEFINE   SENSA_C    STATUS,C
        CBLOCK    0x0C
        POSA     
        CounterA  
        CounterB 
        ENDC
;*********************************CÓDIGO******************************
INICIO
	BSF	STATUS,RP0	  ;BANCO 1
	MOVLW   b'00010000'       ;Ra4 ENTRADA                
        MOVWF   TRISA             
        MOVLW   b'00000000'       ;PORTB SALIDA
        MOVWF   TRISB             
        BCF     STATUS,RP0
;*********************************POSA*********************************         
MAIN	
        BSF     MR      ;Cambia a 1 el bit 1 de porta
        BCF	MR      ;Cambia a 0 el 
        BTFSC   SENSA_Z ;Salta si el bit 4 de porta es cero
        GOTO    S1      
        GOTO    S2
S1
        BSF     POSA,0
        BSF     CLK
        BCF     CLK
Z0      
        BTFSC   SENSA_Z
        GOTO    S3
        GOTO    S4
S2
        BCF     POSA,0
        BSF     CLK
        BCF     CLK
        GOTO    Z0
S3
        BSF     POSA,1
        BSF     CLK
        BCF     CLK
Z1
        BTFSC   SENSA_Z
        GOTO    S5
        GOTO    S6
S4  
        BCF     POSA,1
        BSF     CLK
        BCF     CLK
        GOTO    Z1
S5      
        BSF     POSA,2
        BSF     CLK
        BCF     CLK
Z2
        BTFSC   SENSA_Z
        GOTO    S7
        GOTO    S8
S6
        BCF     POSA,2
        BSF     CLK
        BCF     CLK
        GOTO    Z2
S7
        BSF     POSA,3
        BSF     CLK
        BCF     CLK
Z3
        BTFSC   SENSA_Z
        GOTO    S9
        GOTO    S10
S8
        BCF     POSA,3
        BSF     CLK
        BCF     CLK
        GOTO    Z3
S9
        BSF     POSA,4
        BSF     CLK
        BCF     CLK
Z4
        BTFSC   SENSA_Z
        GOTO    S11
        GOTO    S12
S10
        BCF     POSA,4
        BSF     CLK
        BCF     CLK
        GOTO    Z4
S11
        BSF     POSA,5
        BSF     CLK
        BCF     CLK
Z5
        BTFSC   SENSA_Z
        GOTO    S13
        GOTO    S14
S12
        BCF     POSA,5
        BSF     CLK
        BCF     CLK
        GOTO    Z5
S13
        BSF     POSA,6
        BSF     CLK
        BCF     CLK
Z6
        BTFSC   SENSA_Z
        GOTO    S15
        GOTO    S16
S14
        BCF     POSA,6
        BSF     CLK
        BCF     CLK
        GOTO    Z6
S15
        BSF     POSA,7
        BSF     CLK
        BCF     CLK
        MOVF	POSA,1
        GOTO    SERVO
S16
        BCF     POSA,7
        BSF     CLK
        BCF     CLK
        MOVF	POSA,1
        GOTO    SERVO

;*********************************SERVO*********************************
SERVO
        MOVLW   5
        BCF     STATUS,Z
        BCF     STATUS,C
        MOVF	POSA,1
        SUBWF   POSA,0
        BTFSC   SENSA_Ze
        GOTO    S35             ;F=K SE DESPLAZA A 0º
        GOTO    S34
S33     
        CALL    Mens0 
        ;PIC Time Delay = 0.00029800 s with Osc = 4000000 Hz
        BSF     SALIDA	
        MOVLW	D'2'
	MOVWF	CounterB
	MOVLW	D'142'
	MOVWF	CounterA
loop		
        DECFSZ	CounterA,1
 	GOTO	loop
	DECFSZ	CounterB,1
	GOTO	loop
        BCF     SALIDA
        ;PIC Time Delay = 0.01880000 s with Osc = 4000000 Hz ############3
	MOVLW	D'25'
	MOVWF	CounterB
	MOVLW	D'105'
	MOVWF	CounterA
loop1	
	DECFSZ	CounterA,1
	GOTO	loop1
	DECFSZ	CounterB,1
	GOTO	loop1
	GOTO    MAIN
S34              
        BCF     STATUS,Z
        BTFSC   SENSA_C
        GOTO    S35          ; POSA>K SE DESPLAZA A 180º
        GOTO    S36          ; POSA<K SE DESPLAZA A 90º
S36
        CALL    Mens90
        ;PIC Time Delay = 0.00210000 s with Osc = 4000000 Hz
        BSF     SALIDA          
        MOVLW   D'99'
        MOVWF   CounterA
loop2            
        DECFSZ  CounterA,1
        GOTO    loop2
        BCF     SALIDA                                             
        ;PIC Time Delay = 0.01970200 s with Osc = 4000000 Hz #############
        MOVLW   D'26'
        MOVWF   CounterB
        MOVLW   D'149'
        MOVWF   CounterA
loop3           
        DECFSZ  CounterA,1
        GOTO    loop3
        DECFSZ  CounterB,1
        GOTO    loop3
        GOTO    MAIN
S35
        CALL    Mens180
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
Mens0
        CALL    LCD_Inicializa
        MOVLW   'A'
        CALL    LCD_Caracter
        MOVLW   'n'
        CALL    LCD_Caracter        
        MOVLW   'g'
        CALL    LCD_Caracter
        MOVLW   'u'
        CALL    LCD_Caracter
        MOVLW   'l'
        CALL    LCD_Caracter
        MOVLW   'o'
        CALL    LCD_Caracter
        MOVLW   ' '
        CALL    LCD_Caracter
        MOVLW   'S'
        CALL    LCD_Caracter
        MOVLW   'e'
        CALL    LCD_Caracter
        MOVLW   'r'
        CALL    LCD_Caracter
        MOVLW   'v'
        CALL    LCD_Caracter
        MOVLW   'o'
        CALL    LCD_Caracter
        MOVLW   ':'
        CALL    LCD_Caracter
        CALL    LCD_Linea2
        MOVLW   '0'
        CALL    LCD_Caracter
        MOVLW   'º'
        CALL    LCD_Caracter
        CALL    Retardo_200ms         
        RETURN
        INCLUDE <LCD_4BIT.INC>
        INCLUDE <RETARDOS.INC>
Mens90
        CALL    LCD_Inicializa
        MOVLW   'A'
        CALL    LCD_Caracter
        MOVLW   'n'
        CALL    LCD_Caracter        
        MOVLW   'g'
        CALL    LCD_Caracter
        MOVLW   'u'
        CALL    LCD_Caracter
        MOVLW   'l'
        CALL    LCD_Caracter
        MOVLW   'o'
        CALL    LCD_Caracter
        MOVLW   ' '
        CALL    LCD_Caracter
        MOVLW   'S'
        CALL    LCD_Caracter
        MOVLW   'e'
        CALL    LCD_Caracter
        MOVLW   'r'
        CALL    LCD_Caracter
        MOVLW   'v'
        CALL    LCD_Caracter
        MOVLW   'o'
        CALL    LCD_Caracter
        MOVLW   ':'
        CALL    LCD_Caracter
        CALL    LCD_Linea2
        MOVLW   '9'
        CALL    LCD_Caracter 
        MOVLW   '0'
        CALL    LCD_Caracter
        MOVLW   'º'
        CALL    LCD_Caracter  
        CALL    Retardo_200ms       
        RETURN
Mens180
        CALL    LCD_Inicializa
        MOVLW   'A'
        CALL    LCD_Caracter
        MOVLW   'n'
        CALL    LCD_Caracter        
        MOVLW   'g'
        CALL    LCD_Caracter
        MOVLW   'u'
        CALL    LCD_Caracter
        MOVLW   'l'
        CALL    LCD_Caracter
        MOVLW   'o'
        CALL    LCD_Caracter
        MOVLW   ' '
        CALL    LCD_Caracter
        MOVLW   'S'
        CALL    LCD_Caracter
        MOVLW   'e'
        CALL    LCD_Caracter
        MOVLW   'r'
        CALL    LCD_Caracter
        MOVLW   'v'
        CALL    LCD_Caracter
        MOVLW   'o'
        CALL    LCD_Caracter
        MOVLW   ':'
        CALL    LCD_Caracter
        CALL    LCD_Linea2
        MOVLW   '1'
        CALL    LCD_Caracter
        MOVLW   '8'
        CALL    LCD_Caracter
        MOVLW   '0'
        CALL    LCD_Caracter
        MOVLW   'º'
        CALL    LCD_Caracter   
        CALL    Retardo_200ms      
        RETURN
END