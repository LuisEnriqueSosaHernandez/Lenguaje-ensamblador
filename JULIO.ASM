.model small
.stack 64
.data
n1 db 0
n2 db 0
suma db 0
resta db 0
multiplicacion db 0
division db 0
msgn1 db 10,13,"Dame el primer valor: ",'$'
msgn2 db 10,13, "Dame el segundo valor: ", '$'
msg1 db 10,13, "Suma= ",'$'
msg2 db 10,13, "Resta= ",'$'
msg3 db 10,13, "Multiplicacion= ",'$'
msg4 db 10,13, "Division= ",'$'

.code
	begin proc far
	mov ax,@data
	mov ds,ax

	mov ah,09
	lea dx,msgn1
	int 21h
	mov ah,01
	int 21h
	sub al,30h
	mov n1,al

	mov ah,09
	lea dx,msgn2
	int 21h
	mov ah,01
	int 21h
	sub al,30h
	mov n2,al

	mov al,n1
	add al,n2
	mov suma,al

	mov al,n1
	sub al,n2
	mov resta,al

	mov al,n1
	mul n2
	mov multiplicacion,al

	mov al,n1
	div n2
	mov division,al

	mov ah,09
	lea dx,msg1
	int 21h
	mov dl,suma
	add dl,30h
	mov ah,02
	int 21h

	mov ah,09
	lea dx,msg2
	int 21h
	mov dl,resta
	add dl,30h
	mov ah,02
	int 21h

	mov ah,09
	lea dx,msg3
	int 21h
	mov dl,multiplicacion
	add dl,30h
	mov ah,02
	int 21h

	mov ah,09
	lea dx,msg4
	int 21h
	mov dl,division
	add dl,30h
	mov ah,02
	int 21h

mov ah,4ch
int 21h

begin endp
end
	





	

