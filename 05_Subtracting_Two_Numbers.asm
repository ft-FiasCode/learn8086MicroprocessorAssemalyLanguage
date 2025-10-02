dosseg                ; Directive to specify DOS segment
.model small          ; Define a small memory model
.stack 100h           ; Allocate 256 bytes for the stack
.data                 ; Start of data segment
; (You can define variables here if needed)

.code                 ; Start of code segment
main proc             ; Define the main procedure

    ; Initialize registers for computation
    mov bl, 10         ; Move the value 10 into register BL
    mov cl, 5         ; Move the value 5 into register CL
    
    sub bl, cl        ; Subtract CL from BL (BL = BL - CL), BL now contains 5

    add bl, 48        ; Add 48 to BL (ASCII offset for numbers), BL now contains 50 (ASCII '5')

    ; Prepare to output the character
    mov dl, bl        ; Move the value in BL (ASCII '5') to DL for output
    mov ah, 2         ; Function 2: Write a character to standard output
    int 21h           ; Call DOS interrupt to output character in DL

    ; Terminate program
    mov ah, 4ch      ; Function 4Ch: Terminate program and return control to DOS
    int 21h           ; Call DOS interrupt to terminate program

main endp             ; End of main procedure
end main              ; End of the program and specify entry point