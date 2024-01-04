.MODEL SMALL
.STACK 
.DATA 
.CODE 

MAIN PROC 
    
    MOV AX , @DATA 
    MOV DS , AX 
    MOV ES , AX 
    
    MOV AX , 33D
    MOV BX , 12D
    MOV CL , 10D
    ADD AX , BX 
    
    DIV CL 
    MOV BL , AH 
    MOV AH , 0H
    
    ; AGAIN DIV BY CL 
    
    DIV CL 
    
    MOV BH , AH
     
    ADD BH , 30H
    MOV DL , BH 
    MOV AH , 2 
    INT 21H 
    
    ADD BL , 30H  
    MOV DL , BL 
    MOV AH , 2 
    INT 21H
    
    
    MOV AH , 4CH
    INT 21H 
    
    
    MAIN ENDP
END MAIN