.MODEL SMALL
.STACK 100H
.DATA 
MSG DB 'EEE RUT$'
.CODE

MAIN PROC

    MOV AX,@DATA 
    MOV DS,AX
    
    LEA SI,MSG
    LOOP_STRING:
        MOV AL,MSG[SI]
        CMP AL,'U'
        JE CORRECT
        MOV AH,2
        MOV DL,AL
        INT 21H
        INC SI
        LOOP LOOP_STRING
        
    CORRECT:
    MOV AH,2
    MOV DL,'U'
    INT 21H
    MOV DL,'E'
    INT 21H
    MOV DL,'T'
    INT 21H

         
    MAIN ENDP
END MAIN
