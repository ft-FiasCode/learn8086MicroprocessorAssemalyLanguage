.MODEL SMALL
.STACK 100h

.DATA
    prompt1 DB 'Enter the first number (0-9): $'
    prompt2 DB 0Dh, 0Ah, 'Enter the second number (0-9): $'
    equalMsg DB 0Dh, 0Ah, 'The numbers are EQUAL.$'
    notEqualMsg DB 0Dh, 0Ah, 'The numbers are NOT EQUAL.$'
    greaterMsg DB 0Dh, 0Ah, 'The first number is GREATER.$'
    lesserMsg DB 0Dh, 0Ah, 'The first number is LESSER.$'
    newline DB 0Dh, 0Ah, '$'

.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ; Prompt for the first number
    LEA DX, prompt1          ; Load prompt1 address
    MOV AH, 09h              ; DOS function: Display string
    INT 21h

    ; Input the first number
    MOV AH, 01h              ; DOS function: Read character
    INT 21h
    SUB AL, '0'              ; Convert ASCII to number
    MOV BL, AL               ; Store the first number in BL

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Prompt for the second number
    LEA DX, prompt2          ; Load prompt2 address
    MOV AH, 09h              ; DOS function: Display string
    INT 21h

    ; Input the second number
    MOV AH, 01h              ; DOS function: Read character
    INT 21h
    SUB AL, '0'              ; Convert ASCII to number
    MOV BH, AL               ; Store the second number in BH

    ; Compare the two numbers
    MOV AL, BL               ; Move first number to AL
    CMP AL, BH               ; Compare AL (first number) with BH (second number)
    JE NUMBERS_EQUAL         ; Jump if equal
    JG FIRST_GREATER         ; Jump if first > second
    JL FIRST_LESSER          ; Jump if first < second

NUMBERS_EQUAL:
    ; Display EQUAL message
    LEA DX, equalMsg
    MOV AH, 09h
    INT 21h
    JMP END_PROGRAM          ; Jump to program end

FIRST_GREATER:
    ; Display GREATER message
    LEA DX, greaterMsg
    MOV AH, 09h
    INT 21h
    JMP END_PROGRAM          ; Jump to program end

FIRST_LESSER:
    ; Display LESSER message
    LEA DX, lesserMsg
    MOV AH, 09h
    INT 21h
    JMP END_PROGRAM          ; Jump to program end

END_PROGRAM:
    ; Exit the program
    MOV AH, 4Ch              ; DOS function: Exit program
    INT 21h
MAIN ENDP
END MAIN
