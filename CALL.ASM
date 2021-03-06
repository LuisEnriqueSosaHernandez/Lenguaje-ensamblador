;Aplicaci�n de Programaci�n en Lenguaje TURBO Emsamblador
;Copyright (c) Chris H. Pappas y William H. Murray, 1990

;programa que utiliza el 80486 o 80386 y registros de 32 bits
;para sumar varios n�meros que necesitan suma en
;m�ltiple precisi�n

	DOSSEG		;utiliza ordenaci�n de segmentos Intel

       .MODEL small	;establece el tama�o del modelo
       .386		;instrucciones del 80386

	STACK 300h	;habilita 768 bytes para la pila

	.DATA		;establece ubicaci�n de los datos
num1	dd	0FFABh
num2	dd	4CC0h
num3	dd	0C00Ah
num4	dd	0DD34h
resp	dd	0

        
        .CODE
	Turbo	PROC	FAR		;declaraci�n procedimiento principal
        mov	  ax,DGROUP	                ;apunta ds sobre .DATA
	mov	ds,ax
       
 ;adicion real de numeros utilizando registros de 32 bits
       
        mov eax,num1            ;carga num1
	call    sumar   	;declaraci�n procedimiento principal
	mov	resp,eax        ;guarda eax en la variable resp
	
	mov	ah,4Ch          ;devuelve el control al DOS
        
        int 21h
Turbo   ENDP

sumar   PROC
	add eax,num2	;suma num2 a eax
	add eax,num3	;suma num3 a eax
	add eax,num4	;suma num4 a eax
		
	ret
sumar 	ENDP	         ;fin del procedimiento principal

	END		;fin del programa completo