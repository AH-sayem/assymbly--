.MODEL SMALL 
.STACK 
.DATA 
PR DB ' PRINME $'
NPR DB 'NOT PRIME $'
.CODE 

MAIN PROC
    MOV AX , @DATA 
    MOV DS ,AX
    
    MOV AH , 1
    INT 21H
    AAA 
    
    CMP AL , 1
    JE NOT_PRIME
    CMP AL , 2 
    JE NOT_PRIME
    
    
    
    MOV BH , AL 
    MOV BL ,2
    CHECK:
    MOV AH , 0H
    DIV BL 
    CMP AH , 0
    JE NOT_PRIME
    
    INC BL 
    CMP BH , BL 
    JE PRIME
    MOV AL , BH 
    JMP CHECK
    
    LOOP CHECK  
    
    
    NOT_PRIME:
    MOV AH , 9
    LEA DX , NPR
    INT 21H
    HLT  
    
    PRIME:
    MOV AH , 9
    LEA DX , PR
    INT 21H 
    HLT
     
    
    
    
    
    MAIN ENDP
END MAIN 