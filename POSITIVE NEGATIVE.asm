.MODEL SMALL 
.STACK 
.DATA 
.CODE 

MAIN PROC
    MOV AX , @DATA 
    MOV DS , AX  
    
    ; TAKE INPUT FROM USER 
   ; MOV AH , 1
   ; INT 21H 
   ; AAA 
   
    MOV AL , -10
    
    MOV AH , 0
    
    ADD AL , 0      ; TO CHANGE CARRY FLAG 
    AAA 
    MOV BX , AX  
    
    
    ADD BH , 30H
    MOV DL , BH 
    MOV AH , 2
    INT 21H 
    
    ADD BL , 30H
    MOV DL , BL 
    MOV AH , 2 
    INT 21H 
    
    
    MAIN ENDP
END MAIN 