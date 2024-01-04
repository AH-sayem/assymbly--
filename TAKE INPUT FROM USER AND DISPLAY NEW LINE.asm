.MODEL SMALL 
.STACK 100H
.DATA 
MAIN PROC
    MOV AH , 1 
    INT 21H 
    MOV BL , AL 
    
    MOV AH , 2
    MOV DL , 0AH   ; THIS IS FOR NEW LINE  
    INT 21H  
    
    MOV AH , 2 
    MOV DL , 0DH    ; THIS IS CURSOR RETURN FUNCTION
    INT 21H  
    
    MOV DL , BL
    MOV AH , 2 
    INT 21H
    
    
    MOV AH , 4CH 
    INT 21H
    
    MAIN ENDP
END MAIN 
    
    