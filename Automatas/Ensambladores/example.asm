.model small
.stack 64
.data
;Tipos de datos en ensamblador
;BYTE Entero de 8 bits sin signo
;SBYTE Entero de 8 bits con signo
;WORD Entero de 16 bits sin signo
;SWORD Entero de 16 bits con signo
;DWORD Entero de 32 bits sin signo
;SDWORD Entero de 32 bits con signo
;FWORD Entero de 48 bits
;QWORD Entero de 64 bits
;TBYTE Entero de 80 bits

;DB Entero de 8 bits sin signo
;DW Entero de 8 bits con signo
;DD Entero de 16 bits sin signo
;DQ Entero de 16 bits con signo
;DT Entero de 32 bits sin signo

;Enteros
a dw 10d;var1=255


;Flotantes
b dd 10.50;var6 65536.0


;Cadenas
c db "Hola mundo",'$';var9="Hola mundo"

;Boleanos
d db 1d;var12=true;
e db 0d;var12=false;

;Tambien se pueden declarar variables sin dato con ?
f dw ?;Esto no se puede en R

.code
Turbo PROC FAR;declaracion del procedimiento principal
;Suma de tres numeros utilizando direccionamiento inmediato
mov ax,a;pone el valor de la variable a en ax
add ax,15d;suma a ax el numero 15d
add ax,20d;suma a ax el numero 20d
mov a,ax;guarda el resultado en la variable a
mov ah,4Ch;Devuelve el control al DOS
int 21h
TURBO ENDP;fin deo procedimiento principal
END;fin del programa