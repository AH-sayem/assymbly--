.MODEL SMALL
.STACK
.DATA 
.CODE 

MAIN PROC
    
    MOV AX , @DATA 
    MOV DS , AX 
    
    MOV AH , 1 
    INT 21H 
    
    SUB AL , 30H
    MOV BL , AL 
    MOV DL,  2
    MOV AX,0H
    MOV AL, BL
    
    MOV CX ,0H 
    
    BINCV:
    DIV DL
    MOV BX , AX
    MOV AL ,AH 
    MOV AH , 0
    PUSH AX
    INC CX   
    CMP BL , 0
    JE EXIT 
    MOV AL , BL 
    MOV AH , 0H
    JMP BINCV
    
    EXIT:
    POP AX 
    MOV DL , AL 
    ADD DL , 30H
    MOV AH , 2
    INT 21H
    
    LOOP EXIT
    
    
     
    
    
    MAIN ENDP
END MAIN