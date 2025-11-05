.MODEL SMALL
.STACK 100h

.DATA
    num1 DB 15                  ; First number (byte)
    num2 DB 5                   ; Second number (byte)
    result DB ?                 ; Variable to store the result
    outputMsg DB 'The result of subtraction is: $'
    newline DB 0Dh, 0Ah, '$'    ; New line for formatting

.CODE
main PROC
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Call the SubtractNumbers procedure
    call SubtractNumbers

    ; Display the result
    mov dx, OFFSET outputMsg     ; Load address of output message
    mov ah, 09h                  ; Function to display string
    int 21h                       ; Call DOS interrupt to print message

    ; Convert result to ASCII and print it
    mov al, result                ; Load result into AL
    add al, '0'                   ; Convert to ASCII character
    mov dl, al                    ; Move character into DL for printing
    mov ah, 02h                   ; Function to print character in DL
    int 21h                       ; Call DOS interrupt to print character

    ; Print newline after the result
    mov dx, OFFSET newline        ; Load address of newline string
    mov ah, 09h                  ; Function to display string
    int 21h                       ; Call DOS interrupt to print string

    ; Exit program (MS-DOS interrupt)
    mov ax, 4C00h                ; Terminate program
    int 21h                       ; DOS interrupt to terminate program

main ENDP

; Procedure to subtract two numbers and store the result
SubtractNumbers PROC
    mov al, num1                 ; Load first number into AL (minuend)
    sub al, num2                 ; Subtract second number from AL (subtrahend)
    mov result, al               ; Store the result in variable 'result'
    ret                           ; Return from procedure
SubtractNumbers ENDP

END main
