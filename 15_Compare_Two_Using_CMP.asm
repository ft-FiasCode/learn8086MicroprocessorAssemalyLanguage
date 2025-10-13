.model small          ; Define the memory model as small
.stack 100h           ; Allocate a stack of 256 bytes (100h)

.data                 ; Start of the data segment
msg1 db 'numbers are equal$'      ; Message for equal numbers
msg2 db 'numbers are not equal$'  ; Message for not equal numbers

.code                ; Start of the code segment
main proc            ; Start of the main procedure

    mov ax, @data    ; Load the address of the data segment into AX
    mov ds, ax       ; Move the value in AX to DS to initialize data segment

    mov dl, '3'      ; Store ASCII code of '3' in DL

    mov ah, 1        ; Function 1: Read character from standard input
    int 21h          ; Call DOS interrupt to read input character

    ; Comparing input character (AL) with '3'
    cmp al, dl       ; Compare input character (AL) with '3'

    je equal_label    ; If equal, jump to equal_label

    mov dx, offset msg2  ; Load address of msg2 into DX
    mov ah, 9          ; Function 9: Display string until '$'
    int 21h            ; Call DOS interrupt to print msg2

    jmp exit_program   ; Jump to exit program

equal_label:          ; Label for equal case
    mov dx, offset msg1  ; Load address of msg1 into DX
    mov ah, 9            ; Function 9: Display string until '$'
    int 21h              ; Call DOS interrupt to print msg1

exit_program:         ; Exit point of the program
    mov ah, 4ch         ; Function 4Ch: Terminate program and return control to DOS
    int 21h             ; Call DOS interrupt to terminate program

main endp              ; End of main procedure
end main               ; End of the program