;Aplicacion de Programacion en TURBO Assembler
;Copyright (c) Chris H. Pappas y William H.Hurray ,1990

;programa que realiza la suma en multiple precision con 
;direccionamiento directo

DOSSEG ;utiliza ordenacion de segementos intel
.MODEL small ;establece el tamanio del modelo
.8086 ;instrucciones del 8086
.STACK 300h ;habilita 768 byte para la pila
.DATA ;establece ubicacion de ls datos
num1 dw 0FFABh
num2 dw 4CC0h
num3 dw 0C00Ah
num4 dw 0DD34h
lsbres dw 0
msbres dw 0

.CODE
Turbo PROC FAR ;declaracion procedimiento principal
mov ax,DGROUP ;apunta s a .DATA
mov ds,ax

;codigo real para suma de precision multiple
mov bx,0h ;Limpia el registro bx
mov ax,num1 ;primer numero movido a ax
add ax,num2 ;suma el segundo numero
adc bx,00h ;acarreo acumulado en bx
add ax,num3 ;suma el tercer numero
adc bx,00h ;acarreo acumulado en bx
add ax,num4 ;suma el cuarto numero
adc bx,00h ;acarreo acumulado en bx
mov lsbres,ax ;pone ax en el almacenamiento lsbres
mov msbres,bx ;pone bx en el almacenamiento msbres

mov ah,4Ch ;devuelve el control al DOSSEG
int 21h
Turbo ENDP ;fin del procedimiento principal
END ;fin del programa completo