.MODEL SMALL
.STACK 
.DATA 
.CODE 

MAIN PROC
    MOV AX , @DATA 
    MOV DS , AX 
    
    MOV DL , 1H 
    MOV BL , 0H
    
    MOV CX , 6 
    
    ADDSQR:
    MOV AL ,DL  
    MUL AL 
    ADD BL , AL
    MOV AL , BL 
    INC DL  
    
    LOOP ADDSQR 
    
    MOV AH , 0H
    MOV AL , BL
    
    MOV DL , 10
    DIV DL 
    
    MOV CX , AX 
    
    MOV AH ,  2
    MOV DL , CL 
    ADD DL , 30H
    INT 21H 
    MOV AH , 2 
    MOV DL , CH 
    ADD DL, 30H
    INT 21H 
    
    MAIN ENDP
END MAIN 