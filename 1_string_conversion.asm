INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA

INPUT DB 50 DUP (0)
LEN EQU $-INPUT
UPPER DB 50 DUP (0)
LEN_UPPER EQU $-UPPER
LOWER DB 50 DUP (0)
LEN_LOWER EQU $-LOWER

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DX,AX
    MOV BL,0 ;COUNTER
    
    LEA DI,UPPER
    LEA SI,LOWER
    
    MOV CX,LEN
    TOP:
 
    MOV AH,1
    INT 21H
    INC BL
    
    CMP AL,0DH    ; THIS COMPARE INTER BUTTON 
    JZ EXIT
    
    CMP AL,60H
    JL UP
    JG LO
    
    LOOP TOP
    JMP EXIT
    
    UP:       ; LOWER CASE CONVERSION 
    
    MOV [DI],AL
    ADD AL,20H
    MOV [SI],AL
    INC DI
    INC SI
    LOOP TOP
    
    LO:       ;THIS FOR UPPER CASE CONVERSION
    
    MOV [SI],AL
    SUB AL,20H
    MOV [DI],AL
    INC DI
    INC SI
    LOOP TOP
    
    EXIT:
    
    MOV SI,64H
    MOV DI,32H
    
    GOTOXY 0,1         ; FOR NEW LINE AND CARSORE RETURN 
    
    MOV CX,BX
    UP_OUTPUT:
    
    MOV DL, [DI]
    MOV AH,2
    INT 21H
    
    INC DI
    LOOP UP_OUTPUT
    
    GOTOXY 0,2     ; FOR NEW LINE AND CARSORE RETURN 
    
    MOV CX,BX
    LO_OUTPUT:
    
    MOV DL,[SI]
    MOV AH,2 
    INT 21H
    
    INC SI
    LOOP LO_OUTPUT
    
    
    MAIN ENDP

END MAIN
