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

   MOV AX ,0
   MOV AL ,BH 
   DIV BL  
   
   MOV CX , AX 
   
   MOV AH , 2 
   MOV DL , CL
   ADD DL , 30H 
   INT 21H 
   
   MOV AH , 2
   MOV DL , 0AH 
   INT 21H 
   MOV AH , 2 
   MOV DL , 0DH 
   INT 21H 
   
   MOV DL, CH
   ADD DL , 30H  
   MOV AH , 2
   INT 21H 
    
    PROC ENDS
END MAIN 

    
    