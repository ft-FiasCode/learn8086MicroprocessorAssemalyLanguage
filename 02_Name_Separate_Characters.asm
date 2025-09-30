dosseg                ; Use DOS segment for memory allocation

.model small          ; Define the small memory model
.stack 100h           ; Reserve 256 bytes for the stack
.data                 ; Start of the data segment
; (No data variables are declared in this program)

.code                 ; Start of the code segment

main proc             ; Begin the main procedure

    ; Output character 'M'
    mov dl, 'M'      ; Move character 'k' into DL register
    mov ah, 2        ; Set AH to 2 to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

    ; Output character 'U'
    mov dl, 'U'      ; Move character 'h' into DL register
    mov ah, 2        ; Set AH to 02h to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

    ; Output character 'S'
    mov dl, 'S'      ; Move character 'a' into DL register
    mov ah, 2        ; Set AH to 02h to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

    ; Output character 'A'
    mov dl, 'A'      ; Move character 'n' into DL register
    mov ah, 2        ; Set AH to 02h to specify the function to display a character
    int 21h          ; Call DOS interrupt to output the character in DL

    ; Terminate program
    mov ah, 4ch      ; Set AH to 4Ch for program termination
    int 21h          ; Call DOS interrupt to exit the program

main endp             ; End of main procedure
end main              ; End of code segment and indicate entry point for execution