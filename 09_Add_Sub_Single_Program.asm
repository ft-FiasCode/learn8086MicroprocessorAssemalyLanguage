.model small           ; Define a small memory model
.stack 100h            ; Allocate 256 bytes for the stack

.data                  ; Start of data segment
msg1 db "Enter first number (0-9): $"
msg2 db 13,10,"Enter second number (0-9): $"
msg3 db 13,10,"The sum is: $"
msg4 db 13,10,"The difference is: $"
num1 db ?             ; Variable to store the first number
num2 db ?             ; Variable to store the second number
sum db ?              ; Variable to store the sum
diff db ?             ; Variable to store the difference

.code                  ; Start of code segment
main proc              ; Define the main procedure

    mov ax, @data     ; Initialize data segment
    mov ds, ax

    ; Prompt for first number
    lea dx, msg1      ; Load address of msg1 into DX
    mov ah, 9         ; Function 9: Display string
    int 21h           ; Call DOS interrupt to display prompt

    ; Read first number
    mov ah, 1         ; Function 1: Read character from standard input
    int 21h           ; Call DOS interrupt to read a character
    sub al, '0'       ; Convert ASCII to integer (subtract ASCII value of '0')
    mov num1, al      ; Store the first number in num1

    ; Prompt for second number
    lea dx, msg2      ; Load address of msg2 into DX
    mov ah, 9         ; Function 9: Display string
    int 21h           ; Call DOS interrupt to display prompt

    ; Read second number
    mov ah, 1         ; Function 1: Read character from standard input
    int 21h           ; Call DOS interrupt to read a character
    sub al, '0'       ; Convert ASCII to integer (subtract ASCII value of '0')
    mov num2, al      ; Store the second number in num2

    ; Calculate sum
    mov al, num1      ; Move first number into AL register
    add al, num2      ; Add second number to AL (AL now contains the sum)
    mov sum, al       ; Store the sum in sum variable

    ; Calculate difference (num1 - num2)
    mov al, num1      ; Move first number into AL register again
    sub al, num2      ; Subtract second number from AL (AL now contains the difference)
    mov diff, al      ; Store the difference in diff variable

    ; Display the sum message
    lea dx, msg3      ; Load address of msg3 into DX
    mov ah, 9         ; Function 9: Display string
    int 21h           ; Call DOS interrupt to display message

    add sum, '0'      ; Convert sum back to ASCII for display
    mov dl, sum       ; Move sum to DL for output
    mov ah, 2         ; Function 2: Write character to standard output
    int 21h           ; Call DOS interrupt to output character

    ; Display the difference message
    lea dx, msg4      ; Load address of msg4 into DX
    mov ah, 9         ; Function 9: Display string
    int 21h           ; Call DOS interrupt to display message

    add diff, '0'     ; Convert difference back to ASCII for display
    mov dl, diff      ; Move difference to DL for output
    mov ah, 2         ; Function 2: Write character to standard output
    int 21h           ; Call DOS interrupt to output character

    ; Terminate program
    mov ax, 4C00h     ; Function to terminate program and return control to DOS
    int 21h           ; Call DOS interrupt to terminate program

main endp              ; End of main procedure
end main               ; End of program and specify entry point