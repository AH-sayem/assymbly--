.MODEL SMALL 
.STACK
.DATA 
MSG DB "ANAMUL HAQUE SAYEM $" 
.CODE 
MAIN PROC 
    
    MOV AX , @DATA    ; THIS IS FOR TO LOAD DATA 
    MOV DS , AX 
    
    LEA DX , MSG
    MOV AH , 9        ; THIS IS FOR DISPLAT STRING  
    INT 21H
    
    
    
    EXIT:
    MOV AH , 4CH 
    INT 21H 
    
    
    MAIN ENDP 
END MAIN 