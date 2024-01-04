.MODEL SMALL 
.STACK
.DATA 

MSG1 DB "ENTER THE NUMBER TO CHECK=  $"
EVN DB "EVEN$"
ODD DB "ODD$"

.CODE  

MAIN PROC 
    MOV AX , @DATA 
    MOV DS , AX 
    
    LEA DX , MSG1     ; TO SHOW MASSAGE 
    MOV AH , 9
    INT 21H 
    
    MOV AH , 1        ; TO TAKE INPUT FROM USER 
    INT 21H  
    
    MOV BL , 2      ; THIS IS DIVISOR 
    
    DIV BL  
    
    CMP AH , 0   ; THIS COMPARE THE REMAINDER 
    JE EVEN      ; JUMP TO EVEN 
    
    MOV AH , 2 
    MOV DL , 0AH
    INT 21H 
    MOV AH , 2 
    MOV DL , 0DH  
    INT 21H 
    LEA DX , ODD      ;  TO DISPLAY ODD 
    MOV AH , 9 
    INT 21H 
    
    MOV AH , 4CH 
    INT 21H 
    
    EVEN:           ; THIS IS FOR EVEN FUNCTION
    MOV AH , 2
    MOV DL , 0AH
    INT 21H  
    MOV AH , 2 
    MOV DL , 0DH  
    INT 21H 
    LEA DX , EVN        ; TO DISPLAT EVEN 
    MOV AH , 9 
    INT 21H 
    
    
    
    
    
    MAIN ENDP
END MAIN
