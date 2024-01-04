.MODEL SMALL
.STACK
.DATA 
INPUT DB 50 DUP ('$')
.CODE 

MAIN PROC  
    MOV AX , @DATA 
    MOV DS , AX 
    
    MOV CX , 0
    
    LEA SI , INPUT
    MOV BX , SI  
    
    INP_LOOP:
    MOV AH , 1 
    INT 21H 
    CMP AL , 0DH
    JE NEWL 
    MOV AH , 0
    MOV INPUT[SI], AL 
     INC SI
     INC CX 
    JMP INP_LOOP
    
    
    NEWL:
    
    MOV AH ,  2 
    MOV DL , 0AH 
    INT 21H 
    MOV AH , 2
    MOV DL , 0DH 
    INT 21H
       
     
    MOV SI , BX 
    
   ; NEXT: 

   ; MOV DL , INPUT[SI]
    
   ; ADD DL , 20H 
    
   ; MOV AH , 2 
   ; INT 21H 
   ; INC SI

    
   ; LOOP NEXT
    
    LEA SI , INPUT    
    
    NEXT2:
    MOV DL , INPUT[SI]
    SUB DL , 20H
    MOV AH , 2 
    INT 21H 
    INC SI
    
    LOOP NEXT2
    
   
    
    HLT
    
        
        
     
    
    MAIN ENDP
END MAIN 