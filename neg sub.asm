.MODEL SMALL 
.DATA 
.STACK 
.CODE

MAIN PROC
    MOV AX , @DATA 
    MOV DS , AX 
    
    MOV AH , 1
    INT 21H 
    SUB AL, 30H 
    MOV BH , AL 
    
    MOV AH , 2
    MOV DL, 0AH
    INT 21H 
    MOV  AH , 2 
    MOV DL , 0DH 
    INT 21H 
    
    MOV AH ,1
    INT 21H 
    SUB AL , 30H 
    MOV BL , AL 
    
    CMP BH , BL 
    JG POS
    JL NG
    
    POS:
    
    MOV AH , 2 
    MOV DL , 0AH 
    INT 21H 
    MOV AH , 2 
    MOV DL , 0DH 
    INT 21H 
    
    SUB BH , BL 
    MOV DL , BH 
    ADD DL , 30H
    MOV AH , 2
    INT 21H  
    HLT
    
    
    NG: 
    
      MOV AH , 2 
    MOV DL , 0AH 
    INT 21H 
    MOV AH , 2 
    MOV DL , 0DH 
    INT 21H 
    
    
    SUB BL , BH 
     MOV DL , '-'
     MOV AH , 2 
     INT 21H 
     
     MOV DL , BL 
     ADD DL , 30H
     MOV AH , 2
     INT 21H 
    
    MAIN ENDP
END MAIN 