;Aplicacion de Programacion en TURBO Assembler
;Copyright (c) Chris H. Pappas y William H.Hurray ,1990

;programa que realiza la resta hexadecimal con
;direccionamiento directo

DOSSEG ;utiliza ordencacion de segmentos Intel
.MODEL small ;establece el tamanio del modelo
.8086 ;instrucciones del 8086

.STACK 300h ;habilita 768 byte para la pila

.DATA ;establece ubicacion de los datos
num1 dw 7823 ;primer numero, 1E8Fh
num2 dw 45h ;segundo numero, 0045h
num3 dw 0BCh ;tercer numero , 00BCh
resp dw ?

.CODE
Turbo PROC FAR ;declaracion de procedimiento principal
mov ax,DGROUP ;hace que ds apunte a .DATA
mov ds,ax 
;Resta utilizando tres numeros de 16 bits

mob ax,num1 ;coloca num1 en el registro ax
sub ax,num2 ;resta num2 de ax
sub ax,num3 ;resta num3 de ax
mov resp,ax ;guarda ax en la variable

mov ah,4Ch ;devuelve el control al DOS
int 21h
TURBO ENDP ;fin del procedimiento principal
END ;fin del programa completo

