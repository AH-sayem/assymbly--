.MODEL SMALL
.STACK
.DATA
STR1 DB 'S', 'A','Y' , 'E' , 'M' , '$'
STR2 DB  DUP(0) ; Make sure STR2 has enough space for the copied string  
STR3 DB 
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES , AX 

    LEA SI, STR1
    LEA DI, STR2

   ; MOV CX, 3 ; Set the loop counter to the length of STR1 (including the null terminator)

    ;REP MOVSB ; Copy CX bytes from DS:SI to ES:DI 
   
    REP MOVSB
     
    ; Display STR1
    MOV AH, 9
    LEA DX, STR1
    INT 21H 
    
    MOV AH , 2
    MOV DL , 0AH
    INT 21H 
    
    MOV AH ,2
    MOV DL , 0DH
    INT 21H 

    ; Display STR2
    LEA DX, STR2
   ; INT 21H 
    
    
    ADD STR2, 20H
   
    MOV DL , STR2
    MOV AH , 2
    INT 21H

    MOV AH, 4CH  ; Exit program
    INT 21H
    
    MOV STR2 , BX 
    
   
    ADD STR2, 20H
   
    MOV DL , STR2
    MOV AH , 2
    INT 21H

    MOV AH, 4CH  ; Exit program
    INT 21H

MAIN ENDP
END MAIN
