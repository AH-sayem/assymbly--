NEWL MACRO 
    MOV AH , 2 
    MOV DL , 0AH
    INT 21H 
    MOV AH , 2
    MOV DL , 0DH 
    INT 21H 
    
    NEWL ENDM



.MODEL SMALL
.DATA
INP_MSG DB 'GIVE INPUT DATA= $'
ODD_MSG DB 'ODD $'
EVEN_MSG DB 'EVEN $' 
.STACK 
.CODE 

MAIN PROC
    MOV AX , @DATA 
    MOV DS , AX
    
    LEA DX , INP_MSG
    MOV AH , 9
    INT 21H 
    
    MOV AH , 1
    INT 21H 
    
    
    MOV BL , 2H
    DIV BL 
    
    MOV AL ,AH 
    CMP AL , 0H
    JZ EVEN
    
    NEWL
    
    
    MOV AH , 9 
    LEA DX , ODD_MSG 
    INT 21H
    
    HLT  
    
    
    
    
    EVEN:
    NEWL
    MOV AH , 9
    LEA DX ,EVEN_MSG
    INT 21H   
    
    
    
    MAIN ENDP

END MAIN 