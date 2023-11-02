.MODEL SMALL 
.STACK 
.DATA 
.CODE 

MAIN PROC 
    MOV AX ,@DATA 
    MOV DX , AX 
    
    
    MOV CX , 10 
    
    INPUT_LOOP:     ; INPUT LOOP 
    
    MOV AH , 1 
    INT 21H 
    PUSH AX  
    
    LOOP INPUT_LOOP 
    
    MOV AH , 2 
    MOV DL , 0AH 
    INT 21H 
    
    MOV AH , 2 
    MOV DL , 0DH 
    INT 21H 
    
                 
    MOV CX , 10
                 
    DISPLAY_LOOP:
    
    POP AX
    MOV DL , AL
   
   
    MOV AH , 2 
    INT 21H   
    
    LOOP DISPLAY_LOOP
    
    MAIN ENDP 
END MAIN 

