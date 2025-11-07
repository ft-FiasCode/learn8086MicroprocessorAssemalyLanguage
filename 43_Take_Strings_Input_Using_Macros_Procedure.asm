.MODEL SMALL
.STACK 100h

.DATA
    inputString DB 50 DUP(0)      ; Buffer to store the input string (50 bytes)
    outputMsg DB 'You entered: $'  ; Message before displaying the string
    newline DB 0Dh, 0Ah, '$'       ; New line for formatting

; Macro to display a string
DISPLAY MACRO message
    mov dx, OFFSET message         ; Load address of the message into DX
    mov ah, 09h                    ; DOS function to display string
    int 21h                        ; Call DOS interrupt
ENDM

; Macro to read a string from user input
READSTRING MACRO buffer, maxLength
    mov dx, OFFSET buffer          ; Load address of the buffer into DX
    mov ah, 0Ah                    ; DOS function to read string (buffered)
    int 21h                        ; Call DOS interrupt
ENDM

.CODE
main PROC
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Display prompt message for input (you can add a prompt if needed)
    DISPLAY outputMsg              ; Display the message before input

    ; Read string from user input
    READSTRING inputString, 50     ; Read up to 50 characters into inputString

    ; Display new line after reading input
    DISPLAY newline                 ; Print newline for formatting

    ; Display the entered string using DISPLAY macro
    DISPLAY outputMsg              ; Display the message before showing the entered string
    
    ; Display the actual entered string (it starts at offset 2 in the buffer)
    lea dx, [inputString + 2]      ; Load address of the actual string (skip first two bytes)
    mov ah, 09h                    ; DOS function to display string
    int 21h                        ; Call DOS interrupt to print the entered string

    ; Print newline after displaying the result
    DISPLAY newline                 ; Print newline for formatting

    ; Exit program (MS-DOS interrupt)
    mov ax, 4C00h                  ; Terminate program
    int 21h                        ; DOS interrupt to terminate program

main ENDP

END main
