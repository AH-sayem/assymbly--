.MODEL SMALL

.DATA  ; DECLAR THE DATA SEGMENT 
INP_1 DB 'ENTER THE FIRST NUMBER:$'
INP_2 DB 'ENTER THE SECOND NUMBER:$'
OP_STR DB 'SELCT THE OPERATION: $'
ADD_STR DB 'FOR ADDITION OPERATION SELECT 1 $'
SUB_STR DB 'FOR SUBTRACTION SELECT 2 $'
MUL_STR DB 'FOR MULTIPLICATION SELECT 3$'
DIV_STR DB 'FOR DIVITION SELECT 4$'
RES_STR DB 'RESULT= $'
DIV_Q DB 'YOUR QUATIENT IS= $'
DIV_R DB 'YOUR REMAINDER IS = $'
CHOICE DB 'INSERT THE NUMBER= $'

; END OF DATA SEGMENT 

.CODE 
MAIN PROC 
    
    MOV AX , @DATA 
    MOV DS , AX 
    MOV ES , AX 
    
    MOV AH , 9
    LEA DX , INP_1
    INT 21H  
    
    ; THIS IS FOR INPUT 
    
    MOV AH , 1
    INT 21H 
    AAA
    MOV CL , AL ; FIRST INPUT STORE IN CL  
    CALL NEWL  ; CALL NEW LINE PROCIDURE 
    
    MOV AH , 9
    LEA DX , INP_2 
    INT 21H 
    
    MOV AH , 1
    INT 21H 
    AAA
    MOV BL , AL  ; SECOND INPUT STORE IN BL 
    CALL NEWL
    
    MOV AH , 9
    LEA DX , ADD_STR
    INT 21H
    CALL NEWL 
    MOV AH , 9
    LEA DX , SUB_STR 
    INT 21H  
    CALL NEWL 
    MOV AH , 9
    LEA DX , MUL_STR
    INT 21H   
    CALL NEWL 
    MOV AH , 9
    LEA DX , DIV_STR 
    INT 21H   
    CALL NEWL  
    MOV AH , 9
    LEA DX , CHOICE 
    INT 21H
    ; END THE SECTION OF OPERATION 
  
    MOV AH , 1
    INT 21H  
    AAA  ; TAKE THE INPUT AND CONVERT IT DECIMAL 
    
    ; COMPARE 
    
    CMP AL , 1D
    JE ADD_OP
    CMP AL , 2D
    JE SUB_OP
    CMP AL , 3D 
   ; JE MUL_OP
    CMP AL , 4D
  ;  JE DIV_OP
    CALL NEWL
    
    ; END TO THE COMPARE SECTION 
    
    ADD_OP:
    MOV CH ,0
    ADD CL , BL 
    CMP CL , 10  ; CHEAKING THE CARRY 
    JB NO_CARRY     ; JUMP IF THERE IS NO CARRY
    SUB CL , 10 ; CHEAKING THE CARRY    
    INC CH ; CH IS INCREASE BY ONE TO SHOW EXACT OUTPUT
    NO_CARRY:
    MOV AL , CL 
    AAM ; CONVERT AL TO TWO BCD DIGIT  
    CALL NEWL
    
    MOV AX , @DATA 
    MOV DS , AX 
    MOV AH , 9
    LEA DX , RES_STR
    INT 21H 
    MOV DL , CH 
    ADD DL , '0' ; THE VLUE CONVERTED TO STRING
    MOV AH , 02H
    INT 21H 
    MOV DL , CL 
    ADD DL , '0'  ; CONVERT THE VALUE TO STRING 
    MOV AH , 02H
    INT 21H 
    
    ; ENDING THE DISPLAY SECTION
    HLT ; RETURN THE CONTROL TO PROCESSOR
    
    SUB_OP: 
    MOV CH , 0
    CMP CL , BL  ; COMPARE THIS LINE 
    JAE NO_BORROW  
    MOV DL , CL 
    MOV DH , BL 
    MOV CL , DH 
    MOV BL , DL 
    SUB CL , BL 
    
    JMP SUB_RES_NEG 
    
    
    
    
    NO_BORROW:
    SUB CL , BL 
    JMP SUB_RESULT:
    
    SUB_RESULT:
    MOV AL , CL
    AAM 
    CALL NEWL
    MOV AX , @DATA 
    MOV  DS, AX 
    MOV AH, 9 
    LEA DX , RES_STR
    INT 21H 
    
    MOV DL , CH 
    ADD DL , '0'
    MOV AH , 02
    INT 21H
    MOV DL , CL 
    ADD DL ,'0'
    MOV AH , 02H 
    INT 21H 
    HLT
     
    
    SUB_RES_NEG:
    
    MOV AL , CL 
    AAM
    CALL NEWL
    MOV AX , @DATA 
    MOV DS , AX 
    MOV AH , 9
    LEA DX , RES_STR
    INT 21H 
    MOV DL , 45D
    MOV AH , 2
    INT 21H 
    MOV DL , CL
    ADD DL , '0'
    MOV AH , 2 
    INT 21H 
     
     HLT
     
    
    
        
     
    
    
    
    MAIN ENDP  
    
    ; THIS IS NEW LINE CODE 
    
    NEWL PROC  
        MOV AH , 2
        MOV DL , 0AH 
        INT 21H
        MOV AH , 2  
        MOV DL , 0DH 
        INT 21H 
        RET 
        
        NEWL ENDP
    
        
    
END MAIN 