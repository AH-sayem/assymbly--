.MODEL SMALL 
.STACK 
.DATA 

MSG DB "SAYEM$"
MSG1 DB "RAJSHAHI UNIVERSITY OF ENGINEERING AND TECHNOLOGY$"  


MAIN PROC 
    MOV AX , @DATA 
    MOV DS , AX    ; DATA SEGMENT MOVE TO THE AX TO DATA SEGMENT 
    
    MOV AH, 9       ; STRING DISPLAY FUNCTION 
    LEA DX , MSG     ; MSG STRING OFFSET LOAD IN DX REGISTER 
    INT 21H     ; INTERUPT FUNCTION 
    
    
    MOV AH , 2      ; NEW LINE FUNCTION 
    MOV DL , 0AH 
    INT 21H 
    
    MOV AH , 2     ; CURSOR RETURN FUNCTION 
    MOV DL , 0DH 
    INT 21H   
    
    ; DISPLAY STRING 2 
    
    MOV AH , 9       ; STRING DISPLAY FUNCTION
    LEA DX , MSG1    ; LOAD MASSAGE1 OFFSET TO THE DX REGISTER 
    INT 21H 
     
    
    
    MOV AH , 4CH    ; DOS EXIT FUNCTION  
    INT 21H                           
    
    MAIN ENDP
END MAIN 
    
    
     

 