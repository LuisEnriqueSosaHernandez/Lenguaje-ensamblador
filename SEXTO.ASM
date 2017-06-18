;Aplicacion de Programacion en TURBO Assembler
;Copyright (c) Chris H. Pappas y William H.Hurray ,1990

;programa que eleva un numero pequenio a una potencia entera
DOSSEG ;utiliza ordenacion de segementos intel
.MODEL small ;establece el tamanio del modelo
.8086 ;instrucciones del 8086
.STACK 300h ;habilita 768 byte para la pila
.DATA ;establece ubicacion de los datos
pot dw 05h
num dw 04h
resp dw ?

.CODE
Turbo PROC FAR ;declaracion procedimiento principal
mov ax,DGROUP ;apunta s a .DATA
mov ds,ax

mov ax,num ;coloca el numero en registro ax
mov cx,pot ;coloca la potencia en cx
dec cx ;decrementa en uno
mas: mul num ;obtiene otra potencia del numero
loop mas ;cx vale cero es pregunta hace un ciclo de 0 a mas-1 y
          ; multiplica el numero
mov resp,ax ;guarda el resultado en la variable resp

mov ah,4Ch ;devuelve el control al DOSSEG
int 21h 
Turbo ENDP ;fin del procedimiento principal
END ;fin del programa completo