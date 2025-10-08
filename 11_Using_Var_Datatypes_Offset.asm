dosseg                   ; Allow the program to use segmented memory
.model small             ; Define a small memory model
.stack 100h              ; Allocate 256 bytes for the stack

.data                    ; Start of data segment
var1 db '5'             ; Define var1 as a character '5'
var2 db ?                ; Define var2 as an uninitialized byte
var3 db '54321$'        ; Define var3 as a string '54321' followed by a dollar sign

.code                    ; Start of code segment
main proc                ; Define the main procedure

    mov ax, @data       ; Initialize the data segment
    mov ds, ax          ; Set DS register to point to the data segment

    mov dl, var1        ; Load the character in var1 ('5') into DL for output
    mov ah, 2           ; Function 02h: Write character to standard output
    int 21h             ; Call DOS interrupt to output the character in DL

    mov ah, 1           ; Function 01h: Read character from standard input
    int 21h             ; Call DOS interrupt to read a character into AL

    mov dl, var2        ; Load the value of var2 into DL (note: var2 is uninitialized)
    mov ah, 2           ; Function 02h: Write character to standard output
    int 21h             ; Call DOS interrupt to output the character in DL

    mov dx, offset var3 ; Load address of var3 into DX for output
    lea dx, var3        ; Load effective address of var3 into DX (redundant here)

    mov ah, 9           ; Function 09h: Display string
    int 21h             ; Call DOS interrupt to display the string at address in DX

    mov ah, 4Ch         ; Function to terminate program and return control to DOS
    int 21h             ; Call DOS interrupt to terminate program

main endp                ; End of main procedure
end main                 ; End of program and specify entry point