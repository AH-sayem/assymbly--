.MODEL SMALL
.STACK
.DATA
MSG_INP DB ' ENTER THE NUMBER =  $'                
MSG_PST DB ' NUMBER IS POSITIVE $'
MSG_NEG DB ' NUMBER IS NEGATIVE $'
.CODE 

MAIN PROC 
    
    MOV AX , @DATA 
    MOV DS , AX
    
    
    
    MOV CX , 0H
    MOV AH , 9
    LEA DX , MSG_INP
    INT 21H 
    
    INPUT_SEC:

    MOV AH , 1 
    INT 21H 
   ; MOV AH , 0
    PUSH AX
    INC CX  
    CMP AL , 13D
    JE CHECK 
    
    JMP INPUT_SEC
    
    
    CHECK: 
    POP DX 
    CMP DL , '-'
    JE NEG_MSG
    
    LOOP CHECK
    
    
    ; THIS SECTON IS FOR
    CALL NEWL 
    MOV AH ,9
    LEA DX , MSG_PST
    INT 21H
    
    HLT
    
    NEG_MSG: 
    CALL NEWL 
    MOV AH , 9 
    LEA DX , MSG_NEG 
    INT 21H
    
    HLT   
    
     
    
    
    
    MAIN ENDP
    
    NEWL PROC 
        MOV AH , 2 
        MOV DL , 0AH
        INT 21H 
        MOV AH , 2 
        MOV DL , 0DH
        INT 21H 
        
        RET 
        
        NEWL ENDP

END MAIN 
