.model small
.stack 100h
.data
    charArray db 'A', 'B', 'C', 'D', 'E'  ; Character array
    intArray dw 10, 20, 30, 40, 50        ; Integer array (word size = 2 bytes)
    charIndex db 2                        ; Index for character array (index 2 corresponds to 'C')
    intIndex db 2                         ; Index for integer array (index 2 corresponds to 30)

.code
main proc

    mov ax, @data                        ; Initialize data segment
    mov ds, ax

    ; Print character from charArray at index 2
    mov si, offset charArray             ; Load the offset of charArray into SI
    mov al, [si + charIndex]             ; Load the character at index 2 into AL
    mov ah, 02h                          ; DOS function to print character
    mov dl, al                           ; Move character from AL to DL
    int 21h                               ; Call DOS interrupt to print character

    ; Print newline (CR + LF)
    mov ah, 02h                          ; DOS function to print character
    mov dl, 0Dh                          ; Carriage return
    int 21h                               ; Print CR
    mov dl, 0Ah                          ; Line feed
    int 21h                               ; Print LF

    ; Print integer from intArray at index 2
    mov si, offset intArray              ; Load the offset of intArray into SI
    mov al, intIndex                     ; Load intIndex into AL
    cbw                                  ; Convert byte to word (AL -> AX)
    shl ax, 1                            ; Multiply AX by 2 (since each word is 2 bytes)
    add si, ax                           ; Add the offset to SI

    mov ax, [si]                         ; Load the integer at index 2 into AX
    call PrintInteger                    ; Call subroutine to print integer

    ; Terminate program
    mov ax, 4C00h                        ; Terminate program
    int 21h

; Subroutine to print an integer in AX
PrintInteger proc
    push ax                              ; Save AX on stack
    push bx                              ; Save BX on stack
    push cx                              ; Save CX on stack

    mov bx, 10                           ; Divisor for decimal conversion
    xor cx, cx                           ; Clear CX (digit count)

print_loop:
    xor dx, dx                           ; Clear DX before division
    div bx                               ; Divide AX by 10 (result in AX, remainder in DX)
    
    push dx                              ; Push remainder (digit) onto stack
    inc cx                               ; Increment digit count
    
    test ax, ax                          ; Check if AX is zero
    jnz print_loop                       ; If not zero, continue dividing

print_digits:
    pop dx                               ; Pop digit from stack
    add dl, '0'                          ; Convert digit to ASCII
    mov ah, 02h                          ; DOS function to print character
    int 21h                              ; Print character
    
    loop print_digits                    ; Repeat until all digits are printed

    pop cx                               ; Restore CX
    pop bx                               ; Restore BX
    pop ax                               ; Restore AX
    ret                                  ; Return from subroutine

PrintInteger endp

main endp
end main
