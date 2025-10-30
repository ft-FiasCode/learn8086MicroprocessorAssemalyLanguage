.MODEL SMALL
.STACK 100h

.DATA
    num1 DB 0          ; First number
    num2 DB 0          ; Second number
    result DB 0        ; Result of subtraction
    msg1 DB 'Enter first number: $'
    msg2 DB 'Enter second number: $'
    msg3 DB 'Result of subtraction: $'

.CODE
main PROC
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Prompt for first number
    mov dx, OFFSET msg1
    mov ah, 09h         ; Function to display string
    int 21h             ; Call DOS interrupt

    ; Read first number
    call ReadNumber      ; Read number into num1

    ; Prompt for second number
    mov dx, OFFSET msg2
    mov ah, 09h         ; Function to display string
    int 21h             ; Call DOS interrupt

    ; Read second number
    call ReadNumber      ; Read number into num2

    ; Subtract numbers (num1 - num2)
    mov al, [num1]      ; Load first number into AL
    sub al, [num2]      ; Subtract second number from AL
    mov [result], al     ; Store result

    ; Display result message
    mov dx, OFFSET msg3
    mov ah, 09h         ; Function to display string
    int 21h             ; Call DOS interrupt

    ; Convert result to ASCII and display it
    call PrintResult     ; Print the result

    ; Exit program (MS-DOS interrupt)
    mov ax, 4C00h       ; Terminate program
    int 21h             ; DOS interrupt to terminate program

main ENDP

; Procedure to read a single digit number from keyboard input.
ReadNumber PROC
    mov ah, 01h         ; Function to read character from keyboard
    int 21h             ; Call DOS interrupt
    sub al, '0'         ; Convert ASCII to integer (subtract ASCII value of '0')
    
    mov [num1], al      ; Store the first number in num1 (can be modified for num2)
    
    ret                  ; Return from procedure
ReadNumber ENDP

; Procedure to print the result of subtraction.
PrintResult PROC
    mov al, [result]     ; Load result into AL
    
    add al, '0'          ; Convert integer back to ASCII
    
    mov dl, al           ; Move result character into DL for printing
    mov ah, 02h          ; Function to display character in DL
    int 21h              ; Call DOS interrupt
    
    ret                   ; Return from procedure
PrintResult ENDP

END main