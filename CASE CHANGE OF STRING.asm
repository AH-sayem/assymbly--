.MODEL SMALL 
.STACK 
.DATA 
.CODE 

MAIN PROC 
    MOV AH , 1 ; THIS IS FUNCTION FOR TAKE INPUT 
    INT 21H  
    
    MOV CL ,AL  ; MOVE AL DATA TO CL 
    
    MOV AH , 2     ; NEW LINE 
    MOV DL , 0AH 
    INT 21H 
    
    MOV AH , 2      ; RETURN CARSOR 
    MOV DL , 0DH 
    INT 21H  
    
    MOV DL ,CL   ; MOVE CL DATA 
    ADD DL , 20H  ; COVERT STRING UPPER CASE TO LOWER CASE 
    
    
    MOV AH , 2 
    INT 21H 
    
    
    MOV AH , 4CH 
    INT 21H 
    
    
    MAIN ENDP
END MAIN 