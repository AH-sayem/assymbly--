.MODEL SMALL 
.STACK 100H
.DATA 

.CODE 

MAIN PROC
    MOV AX , @DATA 
    MOV DS , AX 
    MOV ES , AX 
    
    MOV AH , 1 
    INT 21H 
    MOV AH , 0H  
    MOV CL , 10H 
    MUL CL 
    
    MOV BH , AL
    
    ; FOR SECOND DIGIT 
    
    MOV AH , 1 
    INT 21H 
    MOV AH , 0H
    SUB AL , 30H   
    ADD BH , AL 
    
    
    ; THIS IS FOR SECOND NUMBER 
    
    MOV AH , 1 
    INT 21H 
    MOV AH , 0H  
    MOV CL , 10H 
    MUL CL 
    
    MOV BL , AL
    
    ; FOR SECOND DIGIT 
    
    MOV AH , 1 
    INT 21H 
    MOV AH , 0H
    SUB AL , 30H   
    ADD BL , AL 
    
    ; ADDITION 
    
    MOV AL , BH 
    MOV BH , 0H 
    
    MUL CL 
    
    MOV DX , AX 
    
    MOV AL , BL 
    
    MUL CL
    
    MOV BX , AX  
    
    MOV CL , 4
    
    SHR DL , CL
    SHR AL , CL
     
    MOV AH , 0H
    ADD AL , DL 
    AAA
    
    ;ADD AH , BH 
    
    MOV CL , AL    ; THIS IS FIRST DIGIT 
    
    MOV AL , AH 
    MOV AH , 0H
    
    ADD AL , BH 
    AAA
   ; ADC AL , DH 
   ADD AL , DH 
   AAA
   
   MOV BL , AL   ; AL VALUE TRANSFAR 
   
   
   ADD AH , 30H
   MOV DL , AH 
   MOV AH , 2
   INT 21H 
   
   MOV AL , BL 
   ADD AL , 30H 
   MOV DL , AL 
   MOV AH , 2 
   INT 21H 
   
   ADD CL ,30H
   MOV DL , CL 
   MOV AH , 2
   INT 21H 
    
    
    MAIN ENDP
END MAIN