.MODEL SMALL              ; Define a small memory model
.STACK 100h               ; Allocate 256 bytes for the stack

.DATA                     ; Start of data segment
    buffer DB 100 DUP(0) ; Buffer to store up to 100 characters (initialized to 0)
    prompt DB 'Enter characters (press Enter to finish): $' ; Prompt message
    newline DB 0Dh, 0Ah, '$' ; Newline characters for formatting output
    msg DB 'You entered: $' ; Message to display before user input

.CODE                     ; Start of code segment
MAIN PROC                 ; Define the main procedure
    MOV AX, @DATA        ; Initialize data segment
    MOV DS, AX           ; Set DS register to point to the data segment

    MOV DX, OFFSET prompt; Load address of prompt message into DX
    MOV AH, 09h          ; Function 09h: Display string
    INT 21h              ; Call DOS interrupt to display the prompt

    MOV SI, 0            ; Initialize index SI to zero for buffer storage
get_input:               ; Label for input loop
    MOV AH, 01h          ; Function 01h: Read character from standard input
    INT 21h              ; Call DOS interrupt to read a character into AL
    CMP AL, 13           ; Compare the character with ASCII code for Enter (CR)
    JE display_output     ; If Enter is pressed, jump to display output
    MOV buffer[SI], AL   ; Store the character in the buffer at index SI
    INC SI               ; Increment SI to point to the next position in the buffer
    JMP get_input        ; Repeat the input loop

display_output:          ; Label for displaying output
    MOV DX, OFFSET newline; Load address of newline characters into DX
    MOV AH, 09h          ; Function 09h: Display string
    INT 21h              ; Call DOS interrupt to print a newline

    MOV DX, OFFSET msg   ; Load address of output message into DX
    MOV AH, 09h          ; Function 09h: Display string
    INT 21h              ; Call DOS interrupt to display the message

    MOV CX, SI           ; Move the length of input (number of characters) into CX
    MOV BX, OFFSET buffer; Load address of buffer into BX for printing characters

print_loop:              ; Label for printing loop
    MOV DL, [BX]         ; Load the current character from buffer into DL
    MOV AH, 02h          ; Function 02h: Write character to standard output
    INT 21h              ; Call DOS interrupt to output the character
    INC BX               ; Increment BX to point to the next character in buffer
    LOOP print_loop      ; Decrement CX and loop until CX is zero

    MOV AH, 4Ch          ; Function to terminate program and return control to DOS
    INT 21h              ; Call DOS interrupt to terminate program

MAIN ENDP                 ; End of main procedure
END MAIN                  ; End of program and specify entry point