.MODEL SMALL
.STACK
.DATA 
MSG1 DB " ENTER THE FIRST DIGIT = $"
MSG2 DB "ENTER THE SECOND DIGIT = $"
MSG3 DB "THE SUM IS =$"
.CODE

MAIN PROC
    
    MOV AX , @DATA 
    MOV DS , AX 
    MOV ES , AX
    
    
    LEA DX, MSG1
    MOV AH , 9
    INT 21H 
    
    MOV AH , 1
    INT 21H
    AAA 
    
    MOV BL , AL
    
    LEA DX , MSG2
    MOV AH , 9 
    INT 21H 
    
    MOV AH , 1 
    INT 21H 
    AAA
    
    MOV BH , AL 
    ADD BH , BL 
    AAA
    
    ADD BH , 30H
    
    MOV AH , 2 
    MOV DL , 0AH 
    INT 21H 
    MOV AH , 2 
    MOV DL , 0DH 
    INT 21H  
    
    LEA DX , MSG3
    MOV AH , 9 
    INT 21H 
    
    MOV DL , BH  
    MOV AH , 2 
    INT 21H 
    
    MOV AH , 4CH 
    INT 21H 
    
    
    
    

    MAIN ENDP
END MAIN
