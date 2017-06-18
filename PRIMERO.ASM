;Aplicacion de Programacion en TURBO Assembler
;Copyright (c) Chris H. Pappas y William H.Hurray ,1990

;Programa que muestra la sumahexadecimal simple con
;direccionamiento inmediato

DOSSEG;utiliza ordenacion de segmentos Intel
.MODEL small;establece el tamanio del modelo
.8086;instrucciones 8086

.STACK 300h;habilita 768 bytes para la pila

.CODE
Turbo PROC FAR;declaracion del procedimiento principal
;Suma de tres numeros utilizando direccionamiento inmediato
mov ax,01BCH;pone el numero hexadecimal 1BC en ax
add ax,78h;suma a ax el numero 78h
add ax,78;suma a ax el numero 4Eh

mov ah,4Ch;Devuelve el control al DOS
int 21h
TURBO ENDP;fin deo procedimiento principal
END;fin del programa



