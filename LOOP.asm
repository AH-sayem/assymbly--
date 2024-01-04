.MODEL SMALL 
.STACK 
.DATA
MSG DB "SAYEM  $" 
.CODE 

MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5
    SAYEM:
    LEA DX, MSG
    MOV AH, 9
    INT 21H

    MOV AH, 2
    MOV DL, 0DH ; Carriage return
    INT 21H

    MOV AH, 2
    MOV DL, 0AH ; Line feed
    INT 21H

    LOOP SAYEM

CLD

   
    
    
    
    
    
    
    
    MAIN ENDP
END MAIN 