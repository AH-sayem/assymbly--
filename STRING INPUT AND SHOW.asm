.MODEL SMALL 
.STACK
.DATA
BUFFER DB (0) 
.CODE 

MAIN PROC   
    MOV AX , @DATA 
    MOV DS , AX 
    
    TAKEINPUT:
    MOV AH , 1
    INT 21H 
    CMP AL , 24H
    JE DISPLAY1
    
    LOOP TAKEINPUT  
    
    DISPLAY1:
    
    EXIT:
    MOV AH , 4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN 