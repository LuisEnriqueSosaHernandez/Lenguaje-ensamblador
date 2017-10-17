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
var1 db 255;var1=255
var2 dw -255;var2=-255
var3 dd 65536;var3=65535
var4 dq -65536;var4=-65535
var5 dt 122345667;var5=122345667;

;Flotantes
var6 dd 65536.0;var6 65536.0
var7 dq -65536.0;var7 -65536.0
var8 dt 8737373737373373773;var8 8737373737373373773

;Cadenas
var9 db "Hola mundo",'$';var9="Hola mundo"
var10 dq "Hola",'$';var10="Hola"
var11 dt "Hola",'$';var11="Hola"

;Boleanos
var12 db 1;var12=true;
var13 db 0;var12=false;

;Tambien se pueden declarar variables sin dato con ?
var14 db ?;Esto no se puede en R



.code
Turbo PROC FAR;declaracion del procedimiento principal
;Suma de tres numeros utilizando direccionamiento inmediato
mov ax,01BCH;pone el numero hexadecimal 1BC en ax
add ax,78h;suma a ax el numero 78h
add ax,78;suma a ax el numero 4Eh

mov ah,4Ch;Devuelve el control al DOS
int 21h
TURBO ENDP;fin deo procedimiento principal
END;fin del programa