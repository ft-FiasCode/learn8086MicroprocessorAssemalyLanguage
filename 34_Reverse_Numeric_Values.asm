.MODEL SMALL
.STACK 100h

.DATA
    buffer DB 100                ; Buffer to store the input string
    length DB ?                  ; Variable to store the length of the input
    prompt DB 'Enter numbers: $' ; Prompt message
    result DB 0Dh, 0Ah, 'Reversed numbers: $' ; Result message
    newline DB 0Dh, 0Ah, '$'     ; Newline for formatting

.CODE
MAIN PROC
    ; Initialize the data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    LEA DX, prompt               ; Load address of prompt
    MOV AH, 09h                  ; DOS function: Display string
    INT 21h

    ; Read the input numerical values
    MOV AH, 0Ah                  ; DOS function: Buffered input
    LEA DX, buffer               ; Address of input buffer
    INT 21h

    ; Get the length of the input
    MOV SI, OFFSET buffer + 1    ; SI points to length byte
    MOV CL, [SI]                 ; CL = length of the string
    MOV [length], CL             ; Save length in 'length' variable

    ; Set up pointers for reversing
    LEA SI, buffer + 2           ; SI points to the first character of the input
    MOV DI, SI                   ; DI points to the first character
    ADD DI, CX                   ; Move DI to the end of the string
    DEC DI                       ; Adjust DI to point to the last character

    ; Reverse the input string
reverse_loop:
    CMP SI, DI                   ; Compare SI with DI
    JAE reverse_done             ; If SI >= DI, reversing is done

    ; Swap characters
    MOV AL, [SI]                 ; Load character at SI
    MOV BL, [DI]                 ; Load character at DI
    MOV [SI], BL                 ; Move character from DI to SI
    MOV [DI], AL                 ; Move character from SI to DI

    ; Update pointers
    INC SI                       ; Move SI forward
    DEC DI                       ; Move DI backward
    JMP reverse_loop             ; Repeat the process

reverse_done:
    ; Display the result message
    LEA DX, result               ; Load address of result message
    MOV AH, 09h                  ; DOS function: Display string
    INT 21h

    ; Display the reversed numbers
    LEA DX, buffer + 2           ; Address of the reversed string
    MOV AH, 09h                  ; DOS function: Display string
    INT 21h

    ; Print a newline
    LEA DX, newline              ; Load address of newline
    MOV AH, 09h                  ; DOS function: Display string
    INT 21h

    ; Exit program
    MOV AH, 4Ch                  ; DOS function: Exit program
    INT 21h
MAIN ENDP
END MAIN
