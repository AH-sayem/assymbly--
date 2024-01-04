.MODEL SMALL
.STACK
.DATA 
.CODE 

MAIN PROC 
    MOV AX , @DATA 
    MOV DS , AX
    
    MOV AH , 1      ; THIS IS FOR TAKE INPUT 
    INT 21H 
    
    MOV BH ,  AL      
    
    ; CASE CONVERSION 
    
    ADD BH , 20H 
    
                    
    MOV AH , 2        ; DISPLAY INPUT 
    MOV DL , BH 
    INT 21H  
    
    
    
    
    
    EXIT:
    MOV AH , 4CH
    INT 21H 
    
    MAIN ENDP
END MAIN