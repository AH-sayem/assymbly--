.MODEL SMALL
.STACK 100h
.DATA
EVN DB " NUMBER IS EVEN$"
OD DB " NUMBER IS ODD$"
message DB 10, 13, "Enter an integer: $"
;inputBuffer DB 6  ; Buffer to store the input (up to 5 characters plus null terminator)

.CODE

; Custom procedure to check if a number is even or odd using division
CheckEvenOddByDivision PROC
    ; Input: AL contains the number to check

    PUSH AX      ; Save the original value of AL

    ; Check if the number is even or odd
    MOV AH, 0     ; Clear AH before division
    MOV DX, 0     ; Clear DX
    MOV CX, 2     ; Divisor
    DIV CX        ; Divide AL by CX

    ; Check if the remainder is 0 (even) or 1 (odd)
    CMP DX, 0     ; If AH is 0, it's even
    JE EVEN       ; Jump to EVEN if the remainder is 0
    JNE ODD       ; Jump to ODD if the remainder is not 0

EVEN:
    MOV DX, OFFSET EVN
    MOV AH, 9
    INT 21h
    JMP EXIT

ODD:
    MOV DX, OFFSET OD
    MOV AH, 9
    INT 21h

EXIT:
    POP AX       ; Restore the original value of AL
    RET

CheckEvenOddByDivision ENDP

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display a message
    MOV AH, 9
    MOV DX, OFFSET message
    INT 21h

    ; Read an integer from the user
    MOV AH, 1
    INT 21h
    SUB AL, '0'  ; Convert ASCII character to numeric value

    ; Call the custom procedure to check if the number is even or odd using division
    CALL CheckEvenOddByDivision

    ; Terminate the program
    MOV AH, 4Ch
    INT 21h

MAIN ENDP


END MAIN
