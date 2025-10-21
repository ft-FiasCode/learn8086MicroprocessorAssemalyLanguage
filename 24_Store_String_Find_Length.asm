dosseg
.model small
.stack 100h

.data
    myString db "Hello, DOS!", 0  ; Null-terminated string
    msg db "Length of the string: $"
    length db "00", '$'           ; Length as ASCII, with a terminator

.code
main proc
    mov ax, @data        ; Load data segment into AX
    mov ds, ax           ; Set DS to the data segment

    ; Calculate string length
    lea si, myString     ; Load the address of the string into SI
    xor cx, cx           ; Clear CX to use as a counter

length_calc:
    mov al, [si]         ; Load the current byte of the string
    cmp al, 0            ; Check for null terminator
    je display_length    ; If null, end loop
    inc si               ; Move to the next character
    inc cx               ; Increment the counter
    jmp length_calc      ; Repeat the loop

display_length:
    ; Convert length (in CX) to ASCII
    mov ax, cx           ; Move length into AX
    add ax, '0'          ; Convert to ASCII
    mov [length], al     ; Store the converted value
    mov ah, 2            ; DOS print character
    mov dl, [length]     ; Print the first digit
    int 21h

    ; Display message
    lea dx, msg          ; Load address of the message
    mov ah, 9            ; DOS print string
    int 21h

    ; Exit program
    mov ah, 4Ch          ; DOS terminate program
    int 21h

main endp
end main
