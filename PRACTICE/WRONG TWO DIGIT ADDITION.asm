.MODEL SMALL
.STACK 
.DATA 

.CODE
MAIN PROC
    MOV AX , @DATA 
    MOV DS ,AX 
    
    MOV AH , 1   ; THIS IS FOR FIRST DIGIT  
    INT 21H
    AAA 
    MOV BH , AL ; HIGHER DIGIT 
    
    MOV AH , 1  ; THIS IS FOR SECOND DIGIT 
    INT 21H
    AAA 
    MOV BL , AL ; THIS IS OWER DIGIT 
    
    ; START SECND NUMBER 
    
    MOV AH , 1   ; THIS IS FIRST DIGIT 
    INT 21H 
    AAA 
    MOV CH , AL   ; HIGHER DIGIT 
    
    MOV AH , 1    ; THIS IS SECOND DIGIT 
    INT 21H 
    AAA 
    MOV CL , AL  ; THIS IS LOWER DIGIT 
    
    MOV AL , BL 
    ADD AL , CL 
    DAA
    MOV DL , AL ; STORE IN DL 
    
    ; NOW THIS IS HIGHER DIGIT ADDITION 
    
    MOV DH , 10
    MOV AL , BH 
    MUL DH
   ; AAA   
    
    
     
       
    
    
    MAIN ENDP
END MAIN 