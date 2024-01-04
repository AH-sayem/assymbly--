.MODEL SMALL
.STACK
.DATA 
MSG1 DB 'ENTER THE FIRST DIGIT =$'
MSG2 DB 'ENTER THE SECOOND DIGIT =$' 
MSG3 DB 'THE RESULT IS = $'
.CODE 

NEWL MACRO 
    MOV AH , 2
    MOV DL , 0AH
    INT 21H 
    MOV AH , 2
    MOV DL , 0DH
    INT 21H 
    
    NEWL ENDM


MAIN PROC 
    
    MOV AX , @DATA 
    MOV DS , AX 
    
    LEA DX , MSG1 
    MOV AH , 9 
    INT 21H
    
    MOV AH , 1 
    INT 21H
    AAA
    MOV BL , AL 
    
    MOV AH , 1
    INT 21H
    AAA
    MOV BH , AL
    
    MOV AH , 0  
    
    ADD BL , BH
    MOV AL , BL 
    AAA 
    
    MOV CX , AX 
    
       NEWL 
      
    
     LEA DX , MSG2 
    MOV AH , 9 
    INT 21H 
    
    
    MOV AH , 1 
    INT 21H 

 
    SUB AL , 30H  

    
    MOV BL , AL 
    
    MOV AH , 1
    INT 21H
    AAA
    MOV BH , AL
    
    MOV AH , 0  
    
    ADD BL , BH
    MOV AL , BL 
    AAA
    
    MOV BX , AX 
    
    NEWL 
    
     LEA DX , MSG3
    MOV AH , 9 
    INT 21H 
    
    ADD BL , CL
    MOV AL , BL 
    AAA 
    MOV BL , AL 
    ADC BH , CH
    MOV AL , BH 
    AAA
    MOV BH , AL 
    
    
  
   
   
  ; ADD CH , 30H 
  ; MOV DL , CH  
  ; MOV AH , 2
  ; INT 21H 
   

   
  ; ADD CL , 30H 
  ; MOV DL , CL 
  ; MOV AH , 2
  ; INT 21H 
    
     
    
    MAIN ENDP
END 
MAIN 