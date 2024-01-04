.MODEL SMALL
.STACK
.DATA
INP DB 50 DUP('$')
.CODE 

MAIN PROC
       
       MOV AX , @DATA 
       MOV DS , AX
       
       LEA SI , INP
       MOV BL , 0
       MOV CX ,0 
       
       INPUT:
       MOV AH , 1 
       INT 21H
       CMP AL , 0DH 
       JE TESTL  
       MOV INP[SI] , AL 
       INC SI  
       INC CX
       JMP INPUT
       
       LOOP INPUT
       
       TESTL:
       
       LEA SI , INP 
       COUNT:
       MOV AL, INP[SI]  
       INC SI
       CMP AL ,'$'
       JE EXIT 
       CMP AL , 'A'
       JE VL
       CMP AL , 'E'
       JE  VL
       CMP AL , 'I'
       JE VL
       CMP AL , 'O'
       JE  VL
       CMP AL , 'U'
       JE VL 
       
       LOOP COUNT
       
       VL:
       INC BL 
      ; DEC CX 
       JMP COUNT
       
       EXIT:
       MOV AH , 2
       MOV DL , 0AH 
       INT 21H 
       MOV AH , 2
       MOV DL , 0DH 
       INT 21H
       MOV AH , 0
       MOV AL , BL 
       MOV CL , 10
       DIV CL
      ; MOV DL ,BL 
      MOV BL , AH 
      MOV DL , AL
       ADD DL , 30H
       MOV AH , 2 
       INT 21H  
       
        MOV DL , BL
       ADD DL , 30H
       MOV AH , 2 
       INT 21H 
               
       HLT
        
       
       

     


    
    
     
    
    
    MAIN ENDP
END MAIN