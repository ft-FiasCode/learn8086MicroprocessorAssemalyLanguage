.model small
.stack 100h

.data
msg db "Enter a number: $"
result db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Prompt for number
    lea dx, msg
    mov ah, 9
    int 21h

    ; Read character
    mov ah, 1
    int 21h
    mov result, al     ; Store input character

    ; Output the result (echo)
    mov dl, result     ; Move result to DL for output
    mov ah, 2          ; Function 2: Write character to standard output
    int 21h            ; Call DOS interrupt

    ; Terminate program
    mov ax, 4C00h        ; Function to terminate program and return control to DOS
    int 21h            ; Call DOS interrupt

main endp
end main