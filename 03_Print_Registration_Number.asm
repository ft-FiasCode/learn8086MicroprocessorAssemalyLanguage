dosseg                ; Use DOS segment for memory allocation

.model small          ; Define the small memory model
.stack 100h           ; Reserve 256 bytes for the stack
.data                 ; Start of the data segment
; (No data variables are declared in this program)

.code                 ; Start of the code segment

main proc             ; Begin the main procedure

    ; Output character '2'
    mov dl, '2'      ; Move character '2' into DL register
    mov ah, 2        ; Set AH to 2 to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

    ; Output character '3'
    mov dl, '3'      ; Move character '3' into DL register
    mov ah, 2        ; Set AH to 02h to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

    ; Output character 'M'
    mov dl, 'M'      ; Move character 'M' into DL register
    mov ah, 2        ; Set AH to 02h to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

    ; Output character 'D'
    mov dl, 'D'      ; Move character 'D' into DL register
    mov ah, 2        ; Set AH to 02h to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

        ; Output character 'B'
    mov dl, 'B'      ; Move character 'B' into DL register
    mov ah, 2        ; Set AH to 02h to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

        ; Output character 'C'
    mov dl, 'C'      ; Move character 'C' into DL register
    mov ah, 2        ; Set AH to 02h to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

        ; Output character 'S'
    mov dl, 'S'      ; Move character 'S' into DL register
    mov ah, 2        ; Set AH to 02h to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

        ; Output character '4'
    mov dl, '4'      ; Move character '4' into DL register
    mov ah, 2        ; Set AH to 02h to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

        ; Output character '1'
    mov dl, '1'      ; Move character '1' into DL register
    mov ah, 2        ; Set AH to 02h to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

        ; Output character '1'
    mov dl, '1'      ; Move character '1' into DL register
    mov ah, 2        ; Set AH to 02h to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

    ; Terminate program
    mov ah, 4ch      ; Set AH to 4Ch for program termination
    int 21h          ; Call DOS interrupt to exit the program

main endp             ; End of main procedure
end main              ; End of code segment and indicate entry point for execution