;Aplicacion de Programacion en TURBO Assembler
;Copyright (c) Chris H. Pappas y William H.Hurray ,1990

;programa que muestra las instrucciones de multiplicacion y 
;division

DOSSEG ;utiliza ordenacion de segementos intel
.MODEL small ;establece el tamanio del modelo
.8086 ;instrucciones del 8086
.STACK 300h ;habilita 768 byte para la pila
.DATA ;establece ubicacion de los datos
num1 dw 3E78h
num2 dw 3Ah
num3 dw 3Eh
coci dw ?
rest dw ?

.CODE
Turbo PROC FAR ;declaracion procedimiento principal
mov ax,DGROUP ;apunta s a .DATA
mov ds,ax

;codigo para ejecutar: (num1 * num2 ) / num3
mov ax,num1 ;coloca el primero numero en ax
mul num2 ;x num2 responde en dx:ax
div num3 ;divide dx:ax entre num3
			;cociente en ax, resto en dx
mov coci,ax ;guarda el cociente
mov rest,dx ;guarda el resto

mov ah,4Ch ;devuelve el control al DOSSEG
int 21h 
Turbo ENDP ;fin del procedimiento principal
END ;fin del programa completo
