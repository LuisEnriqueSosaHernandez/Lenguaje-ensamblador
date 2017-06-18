;Aplicacion de Programacion en TURBO Assembler
;Copyright (c) Chris H. Pappas y William H.Hurray ,1990

;Programa que encuentra la raiz cuadrada de un numero
;utilizando la tecnica de restas sucesivas , el programa utilizando
;registros de 32 bits

DOSSEG ;utiliza ordenacion de segementos intel
.MODEL small ;establece el tamanio del modelo
.386 ;instrucciones del 8086
.STACK 300h ;habilita 768 byte para la pila
.DATA ;establece ubicacion de los datos
;num dd 0ACDEA452h
num dd 0000000E1h
raiz dd ?

.CODE
Turbo PROC FAR ;declaracion procedimiento principal
mov ax,DGROUP ;apunta ds a .DATA
mov ds,ax

;programa para encontrar la raiz cuadrada de numero
mov edx,0h ;pone a cero la posicion de almacenamiento
;temporal
mov ecx,1h ;numero inicial para restas
mov eax,num ;obtiene numero original
cont: sub eax,num ;realiza la resta
jb hecho ;si el resultado es menor que cero, se acaba
inc edx ;incrementa el valor de la raiz cuadrada
add ecx,02h ;aumenta ecx a siguiente numero impar
jmp cont ;continua el bucle
hecho: mov raiz,edx ;guarda el resultado en raiz
mov ah,4Ch ;devuelve el control al DOS
int 21h
Turbo ENDP ;fin del procedimiento principal
END ;fin del programa completo