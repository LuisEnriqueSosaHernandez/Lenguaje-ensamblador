.MODEL small 
.CODE 
org 100H 
begin: jmp main 
Msg DB 'Hola Mundo',10d,13d,'$' 
main proc near 
mov dx,OFFSET Msg 
mov ah,9 
int 21h 

mov ax,4C00h ;sale a DOS 
int 21h 
main endp 
end	begin