.MODEL SMALL 
.STACK 
.DATA
MSG DB "ENTRER THE NUMBER=  $"
PR DB "PRIME $"
NPR DB "NOT PRIME $" 
.CODE 

MAIN PROC 
    MOV AX , @DATA 
    MOV DS , AX   
    
    LEA DX , MSG   ; TO DISPLAY STRING  
    MOV AH , 9 
    INT 21H  
    
    MOV AH , 1   ; TO TAKE INPUT 
    INT 21H 
    
    
    SUB AL , 30H
    
    CMP AL , 2H
    JE PRIME 
    CMP AL , 1H 
    JE NOTPRIME
    
    MOV BL, 2
    MOV BH , AL 
    
    LOOP1:
    MOV AH , 0 
    MOV AL , BH 
    DIV BL 
    CMP AH , 0H 
    JE NOTPRIME 
    
    INC BL 
    CMP BH , BL 
    JE PRIME 
    LOOP LOOP1
    
    
    NOTPRIME: 
    LEA DX , NPR
    MOV AH , 9 
    INT 21H 
    JMP LABLE1
    
    
    PRIME:
    LEA DX , PR 
    MOV AH , 9 
    INT 21H 
    
    
    LABLE1: 
    MOV AH , 4CH 
    INT 21H 
    
    
    
     
    
    
    
    
    MAIN ENDP 
END MAIN 