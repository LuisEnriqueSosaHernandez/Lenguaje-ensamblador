;Aplicacion de Programacion en TURBO Assembler
;Copyright (c) Chris H. Pappas y William H.Hurray ,1990

;programa que utiliza el 80486 o 80386 y registros de 32 bits
;para sumar varios numeros que necesitan suma en
;multiple precision

DOSSEG ;utiliza ordenacion de segementos intel
.MODEL small ;establece el tamanio del modelo
.386 ;instrucciones del 80386
.STACK 300h ;habilita 768 byte para la pila
.DATA ;establece ubicacion de los datos
num1 dd 0FFABh
num2 dd 4CC0h
num3 dd 0C00Ah
num4 dd 0DD34h
resp dd 0

.CODE
Turbo PROC FAR ;declaracion procedimiento principal
mov ax,DGROUP ;apunta s a .DATA
mov ds,ax

;adicion real de numeros utilizando registros de 32 bits
mov eax,num1 ;cara num1 en eax
add eax,num2 ;suma num2 a eax
add eax,num3 ;suma num3 a eax
add eax,num4 ;suma num4 en eax
mov resp,eax ;guarda eax en la variable resp

mov ah,4Ch ;devuelve el control al DOSSEG
int 21h
Turbo ENDP ;fin del procedimiento principal
END ;fin del programa completo