.MODEL SMALL 
.DATA 
.STACK 
.CODE


NEWL MACRO 
    MOV AH , 2
    MOV DL , 0AH
    INT 21H 
    MOV AH , 2
    MOV DL , 0DH 
    INT 21H
    ;RET 
    
    NEWL ENDM

MAIN PROC
    MOV AX , @DATA 
    MOV DS , AX 
    
    MOV AH , 1 
    INT 21H 
    AAA 
    ; NEWL 
    MOV CX , 0H
    
    INP:
    MOV BL , 2 
    DIV BL
    AAA 
    PUSH AX
    INC CX  
    CMP AL , 0H
   ; CALL NEWL
    JE OUTP
    JMP INP
    
    
    OUTP:
    
    NEWL 
    
    RES: 
    
    POP DX
    MOV DL, DH
    ADD DL , 30H  
    MOV AH , 2
    INT 21H
    
    LOOP RES
    HLT  
    
    
    MAIN ENDP





END MAIN 