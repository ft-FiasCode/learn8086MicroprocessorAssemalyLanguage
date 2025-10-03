dosseg                ; Directive to specify DOS segment
.model small          ; Define a small memory model
.stack 100h           ; Allocate 256 bytes for the stack
.data                 ; Start of data segment
; (You can define variables here if needed)

.code                 ; Start of code segment
main proc             ; Define the main procedure

    ; Initialize registers for computation
    mov bl, 2         ; Move the value 2 into register BL
    mov cl, 1         ; Move the value 1 into register CL
    
    add bl, cl        ; Add CL to BL (BL = BL + CL), BL now contains 3

    add bl, 48        ; Convert the numeric value in BL to its ASCII equivalent
                      ; (ASCII '0' starts at decimal value 48), BL now contains 51 (ASCII '3')

    ; Prepare to output the character
    mov dl, bl        ; Move the value in BL (ASCII '3') to DL for output
    mov ah, 2         ; Function 2: Write a character to standard output
    int 21h           ; Call DOS interrupt to output character in DL

    ; Terminate program
    mov ah, 4ch       ; Function 4Ch: Terminate program and return control to DOS
    int 21h           ; Call DOS interrupt to terminate program

main endp             ; End of main procedure
end main              ; End of the program and specify entry point