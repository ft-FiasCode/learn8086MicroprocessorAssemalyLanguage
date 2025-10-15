.model small
.stack 100h
.data
.code
main proc

    mov cx, 10          ; Set loop counter to 10 (for numbers 9 to 0)
    mov dx, '9'         ; Start with ASCII code for '9'

test1:
    mov ah, 2           ; Function to print character
    int 21h             ; Call DOS interrupt to print character

    sub dx, 1           ; Decrease dx to get the next character (from '9' to '0')
    loop test1          ; Loop until cx reaches zero

    mov ah, 4ch         ; Terminate program
    int 21h

main endp
end main