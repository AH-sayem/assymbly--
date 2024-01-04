.MODEL SMALL
.STACK
.DATA
MSG1 DB 'ENTER THE NUMBER:$ '                
MSG2 DB 'NUMBER IS POSITIVE $'
MSG3 DB 'NUMBER IS NEGATIVE $'
.CODE

MACRO NEWLINE
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    ENDM 

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    MOV CX,0
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    INPUT:
    
    MOV AH,1
    INT 21H
    PUSH AX
    INC CX
    CMP AL,13D
    JE CHECK
    
    JMP INPUT
    
    CHECK:
    POP DX
    CMP DL, '-'
    JE NEG_MSG
    LOOP CHECK
    
    NEWLINE
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    HLT
    
    NEG_MSG:
    NEWLINE
    MOV AH,9
    LEA DX,MSG3
    INT 21H

    
    PROC ENDS 
END MAIN 
