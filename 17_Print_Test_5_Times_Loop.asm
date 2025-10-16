.model small
.stack 100h
.data
    message db 'TEST', 0  ; Declare a string "TEST" with a null terminator

.code
main proc

    mov cx, 5             ; Set loop counter to 5 (for printing "TEST" 5 times)

print_loop:
    mov dx, offset message ; Load address of the message into dx
    mov ah, 09h            ; Function to print string (DOS interrupt)
    int 21h                ; Call DOS interrupt to print the string

    ; Optionally add a newline for better readability
    mov ah, 02h            ; Function to print character
    mov dl, 0Dh            ; Carriage return (CR)
    int 21h                ; Print CR
    mov dl, 0Ah            ; Line feed (LF)
    int 21h                ; Print LF

    loop print_loop        ; Loop until cx reaches zero

    mov ah, 4ch            ; Terminate program
    int 21h

main endp
end main