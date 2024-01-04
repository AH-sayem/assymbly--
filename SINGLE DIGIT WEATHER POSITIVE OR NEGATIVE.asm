.MODEL SMALL
.STACK 100H
.DATA
MSG DB 13,10,"Enter a single-digit number: $"
VAR DB 13,10,"Positive$"
VAR1 DB 13,10,"Negative$"
.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ; Display message
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    ; Read a single-digit number
    MOV AH,1
    INT 21H
    SUB AL, '0' ; Convert ASCII to numeric
    
    ; Check if the number is positive or negative
    CMP AL, 0
    JL IS_NEGATIVE ; Jump if less than zero
    
    ; Display positive message
    MOV AH,9
    LEA DX,VAR
    INT 21H
    JMP END_PROGRAM
    
    IS_NEGATIVE:
    ; Display negative message
    MOV AH,9
    LEA DX,VAR1
    INT 21H
    
    END_PROGRAM:
    MOV AH,4CH        ;DOS EXIT
    INT 21H

    MAIN ENDP
END MAIN
