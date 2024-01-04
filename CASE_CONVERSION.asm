INCLUDE 'emu8086.inc'
.MODEL SMALL 
.STACK  
.DATA
INPUT DB 50 DUP(0)
LEN EQU $-INPUT 
UPPER DB 50 DUP (0)
LEN_UPPER EQU $-UPPER
LOWER DB 50 DUP(0)
LEN_LOWER EQU $-LOWER   
.CODE  

MAIN PROC 
    MOV AX , @DATA 
    MOV DS , AX       
    MOV BL , 0 
    LEA SI , LOWER 
    LEA DI , UPPER
    
    MOV CX , LEN 
    TOP:
    MOV AH , 1 
    INT 21H 
    INC BL 
    CMP AL , 0DH   ; THIS IS FOR ENTER BUTTION 
    JZ EXIT       ; THIS WILL TEST USING JE 
    
    CMP AL , 60H   ; THIS IS CONDITION 
    JL UP        ; JUMP IF AL LOWER 
    JG LO        ; JUMP IF AL IS GREATER
    
    LOOP TOP 
    JMP EXIT  
    
    
    
    UP:    ; LOWER CASE CONVERSION
    MOV [DI], AL 
    ADD AL , 20H 
    MOV [SI] , AL 
    INC DI 
    INC SI 
    LOOP TOP 
    
    
    LO:  ; UPPER CASE CONVERSION 
    MOV [SI] , AL 
    SUB AL , 20H 
    MOV [DI] , AL 
    INC SI 
    INC DI
    LOOP TOP   
             
    
    
    EXIT: 
    MOV SI , 64H 
    MOV DI , 32H
    GOTOXY 0,1
    MOV CX , BX 
    
    UP_OUTPUT:
    MOV DL , [DI]
    MOV AH , 2
    INT 21H
    INC DI 
    
    
    LOOP UP_OUTPUT
    
    GOTOXY 0,2
    
    MOV CX , BX 
    
    LO_OUTPUT:
    MOV DL, [SI]
    MOV AH , 2
    INT 21H
    INC SI 
    
    LOOP LO_OUTPUT
    
    HLT 
    
             
    
    
    
    
    MAIN ENDP
END MAIN 