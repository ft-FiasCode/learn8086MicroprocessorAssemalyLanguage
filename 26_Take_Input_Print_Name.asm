dosseg
.model small
.stack 100h

.data
    inputMsg db "Enter your name: $"
    outputMsg db "Your name is: $"
    inputBuffer db 50, 0, 49 dup('$')  ; Input buffer: max 50 chars

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Display input message
    lea dx, inputMsg
    mov ah, 9
    int 21h

    ; Read name from the user
    lea dx, inputBuffer
    mov ah, 0Ah
    int 21h

    ; Display output message
    lea dx, outputMsg
    mov ah, 9
    int 21h

    ; Display the name entered by the user
    lea dx, inputBuffer + 2    ; Skip buffer metadata (size and length bytes)
    mov ah, 9
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

main endp
end main
