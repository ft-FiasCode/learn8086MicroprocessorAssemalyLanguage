.model small           ; Define a small memory model
.stack 100h            ; Allocate 256 bytes for the stack

.data                  ; Start of data segment
msg db "Enter an uppercase letter: $"
result_msg db 13,10,"The lowercase letter is: $"
input_char db ?       ; Variable to store the input character
output_char db ?      ; Variable to store the output character

.code                  ; Start of code segment
main proc              ; Define the main procedure

    mov ax, @data     ; Initialize data segment
    mov ds, ax

    ; Prompt for uppercase letter
    lea dx, msg       ; Load address of msg into DX
    mov ah, 9         ; Function 9: Display string
    int 21h           ; Call DOS interrupt to display prompt

    ; Read character
    mov ah, 1         ; Function 1: Read character from standard input
    int 21h           ; Call DOS interrupt to read a character
    mov input_char, al; Store the input character in input_char

    ; Convert to lowercase
    mov al, input_char; Move the input character to AL register
    add al, 32        ; Convert uppercase to lowercase (ASCII difference is 32)
    mov output_char, al; Store the converted character in output_char

    ; Display result message
    lea dx, result_msg; Load address of result_msg into DX
    mov ah, 9         ; Function 9: Display string
    int 21h           ; Call DOS interrupt to display result message

    ; Output the lowercase character
    mov dl, output_char; Move the output character to DL for display
    mov ah, 2         ; Function 2: Write character to standard output
    int 21h           ; Call DOS interrupt to output character

    ; Terminate program
    mov ax, 4C00h     ; Function 4Ch: Terminate program and return control to DOS
    int 21h           ; Call DOS interrupt to terminate program

main endp              ; End of main procedure
end main               ; End of program and specify entry point