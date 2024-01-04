.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB "ENTER FIRST DIGIT:$ "
MSG2 DB "ENTER SECOND DIGIT:$ "
MSG3 DB "RESULT:$ "

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
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,'0'
    
    NEWLINE
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,'0'
    
    NEWLINE 
          
    MOV AX,0
    MOV AL,BH      
    MUL BL
    MOV BL,AL
    MOV CL,10
    MOV AX,0
    MOV AL,BL
    DIV CL
    
    MOV BH,AH
    MOV BL,AL
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,2
    ADD BL,'0'
    MOV DL,BL
    INT 21H
    MOV AH,2
    ADD BH,'0'
    MOV DL,BH
    INT 21H
    
    PROC ENDS
END MAIN 

    
    