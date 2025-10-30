.MODEL SMALL
.STACK 100h

.DATA
    buffer DB 100                ; Buffer to store the input string
    length DB ?                  ; Length of the input string
    prompt DB 'Enter a string: $'
    result DB 0Dh, 0Ah, 'Reversed string: $'
    newline DB 0Dh, 0Ah, '$'     ; Newline for formatting output

.CODE
MAIN PROC
    ; Initialize the data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    LEA DX, prompt               ; Load address of the prompt
    MOV AH, 09h                  ; DOS function: Display string
    INT 21h

    ; Read the input string
    MOV AH, 0Ah                  ; DOS function: Buffered input
    LEA DX, buffer               ; Address of input buffer
    INT 21h

    ; Get the length of the string
    MOV SI, OFFSET buffer + 1    ; SI points to length byte
    MOV CL, [SI]                 ; CL = length of the string
    MOV [length], CL             ; Save length in 'length' variable

    ; Point to the start and end of the string
    LEA SI, buffer + 2           ; SI points to the first character of the string
    MOV DI, SI                   ; DI points to the start of the string
    ADD DI, CX                   ; Move DI to the end of the string
    DEC DI                       ; Adjust to point to the last character

    ; Reverse the string
reverse_loop:
    CMP SI, DI                   ; Compare start pointer and end pointer
    JAE reverse_done             ; If SI >= DI, we're done

    ; Swap characters
    MOV AL, [SI]                 ; Load character from the start into AL
    MOV BL, [DI]                 ; Load character from the end into BL
    MOV [SI], BL                 ; Move BL (end) to start
    MOV [DI], AL                 ; Move AL (start) to end

    ; Update pointers
    INC SI                       ; Move SI to the next character
    DEC DI                       ; Move DI to the previous character
    JMP reverse_loop             ; Repeat the process

reverse_done:
    ; Display result message
    LEA DX, result               ; Load address of the result message
    MOV AH, 09h                  ; DOS function: Display string
    INT 21h

    ; Display the reversed string
    LEA DX, buffer + 2           ; Load address of the string (skipping length byte)
    MOV AH, 09h                  ; DOS function: Display string
    INT 21h

    ; Print newline for formatting
    LEA DX, newline              ; Load address of newline
    MOV AH, 09h                  ; DOS function: Display string
    INT 21h

    ; Exit program
    MOV AH, 4Ch                  ; DOS function: Exit program
    INT 21h
MAIN ENDP
END MAIN
