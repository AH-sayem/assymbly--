.MODEL SMALL
.DATA 
MSG DB 'EEE RUT$'
.STACK 
.CODE

MAIN PROC
    
    MOV AX , @DATA 
    MOV DS , AX 
    
    LEA SI, MSG
    MOV CX , 9 
    LOOP_STR:
    MOV AL , MSG[SI]
    CMP AL ,'U'
    JE CORRECT
    MOV DL , AL 
    MOV AH , 2
    INT 21H 
    INC SI
    
    LOOP LOOP_STR
    
    CORRECT: 
    MOV DL ,'U'
    MOV AH , 2
    INT 21H 
    MOV DL , 'E'
    MOV AH , 2 
    INT 21H 
    MOV DL ,'T'
    MOV AH , 2
    INT 21H 
    
     
    
    
    MAIN ENDP
END MAIN 