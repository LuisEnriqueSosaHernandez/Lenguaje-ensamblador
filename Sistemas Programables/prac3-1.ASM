

        list      p=16F84A            ; define procesador
	include <p16F84A.inc>         ; define variables del procesador
 
	 __CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

;***************************DEFINICION DE VARIABLES********************
      
        #DEFINE   SALIDA     PORTA,1        
        #DEFINE   SENSA_Ze   STATUS,Z
        #DEFINE   SENSA_C    STATUS,C
        CBLOCK    0x0C
        POSA     
        CounterA  
        CounterB 
        ENDC

        
;*********************************CÓDIGO******************************

INICIO
	    BSF		STATUS,RP0	     ;BANCO 1
	    MOVLW   b'00000000'                       
        MOVWF   TRISA
        MOVLW   b'11111111'
        MOVWF   TRISB
        BCF     STATUS,RP0

;*********************************POSA*********************************         

MAIN	
        MOVF    PORTB
        MOVWF   POSA
        MOVLW   .16
        BCF     STATUS,Z
        BCF     STATUS,C
        MOVF	POSA,1
        SUBWF   POSA,0
        BTFSC   SENSA_Ze
        GOTO    S33             ; POSA=K SE DESPLAZA A 0º
        GOTO    S34
S33     
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
        GOTO    MAIN
S34              
        BCF     STATUS,Z
        BTFSC   SENSA_C
        GOTO    S35          ; POSA>K SE DESPLAZA A 90º
        GOTO    S36          ; POSA<K SE DESPLAZA A 180º
S36
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
	GOTO    MAIN
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
END