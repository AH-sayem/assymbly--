.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'ENTER NUMBER: $'
MSG2 DB 0DH,0AH, 'PRIME$'
MSG3 DB 0DH,0AH, 'NOT PRIME$'
MSG4 DB 0DH,0AH, 'UNDEFINED$'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    SUB AL,30H
    CMP AL,2H
    JE PRIME
    CMP AL,1H
    JE UNDEFINED
    CMP AL,0H
    JE UNDEFINED
    
    MOV BL,2
    MOV BH,AL
    
    LOOP1:
    
    MOV AH,0
    MOV AL,BH
    DIV BL
    CMP AH,0H
    JE NOTPRIME
    
    INC BL
    CMP BH,BL
    JE PRIME 
    
    LOOP LOOP1
    
    NOTPRIME:
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    JMP LABEL1
    
    PRIME:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    UNDEFINED:
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    
    LABEL1:
    
    MOV AH,4CH
    INT 21H  
    
    
    
    MAIN ENDP
END MAIN