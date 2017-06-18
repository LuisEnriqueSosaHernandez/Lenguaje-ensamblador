;Aplicacion de Programacion en TURBO Assembler 
;Copyright (c) Chris H. Pappas y William H. Murray, 1990

;programa que muestra la suma hexadecimal simple con 
;direccionamiento inmediato 

          DOSSEG          ;utiliza ordenacion de segmentos Intel
         .MODEL small     ;establece el tamaño del modelo 
         .8086            ;instrucciones 8086

          INCLUDE  ugd.H   ;header file for ugd
         
          
          .STACK 300h      ;habilita 768 bytes para la pila 
          .CODE 
          
Turbo    PROC FAR         ;declaracion del procedimiento principal 
          
;suma de dos numeros utilizando Macros Internas
         mov bx,0111h ;pone el numero hexadecimal 111 en bx
         mov cx,0222h ;pone el numero hexadecimal 222 en cx
         Suma2 bx,cx  ;sum of two values

          mov ah,4Ch      ;devuelve el control al DOS 
          int 21h
TURBO     ENDP            ;fin del procedimiento principal
          END             ;fin del programa completo