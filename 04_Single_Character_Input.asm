dosseg                ; Directive to specify DOS segment
.model small          ; Define a small memory model
.stack 100h           ; Allocate 256 bytes for the stack
.data                 ; Start of data segment
; (You can define variables here if needed)

.code                 ; Start of code segment
main proc             ; Define the main procedure

    mov ah, 1         ; Function 1: Read a character from standard input
    int 21h           ; Call DOS interrupt to read character

    mov dl, al        ; Move the read character (in AL) to DL for output
    mov ah, 2         ; Function 2: Write a character to standard output
    int 21h           ; Call DOS interrupt to output character

    mov ah, 4ch       ; Function 4Ch: Terminate program and return control to DOS
    int 21h           ; Call DOS interrupt to terminate program

main endp             ; End of main procedure
end main              ; End of the program and specify entry point