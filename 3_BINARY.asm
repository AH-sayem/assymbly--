.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'ENTER DECIMAL NUMBER=  $'
MSG2 DB 0DH,0AH, 'BINARY FORM = $'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1      ; FOR INPUT 
    INT 21H
    SUB AL,48          ; CONVERT IN NUMBER 
    MOV AH,0 ;AX=05
    MOV BX,2
    MOV CX,0
    MOV DX,0
    
    AGAIN:
    DIV BX
    MOV AH,0
    PUSH DX
    INC CX
    CMP AX,0
    JNE AGAIN
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    DISP:
    POP DX
    ADD DX,48
    MOV AH,2
    INT 21H
    LOOP DISP
    
    
    MOV AH,4CH
    INT 21H      
    
    MAIN ENDP
END MAIN