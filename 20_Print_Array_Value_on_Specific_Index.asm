.model small
.stack 100h
.data
    array db 'A', 'B', 'C', 'D', 'E'  ; Declare an array of characters
    index db 2                         ; Index of the value to print (index 2 corresponds to 'C')

.code
main proc

    mov ax, @data                     ; Initialize data segment
    mov ds, ax

    ; Load the index into a register
    mov si, offset array              ; Load the offset of the array into SI
    mov al, [si + index]              ; Load the character at index 2 into AL

    ; Prepare to print the character using DOS interrupt
    mov ah, 02h                       ; DOS interrupt to display a character
    mov dl, al                        ; Move character to DL for output
    int 21h                           ; Call DOS interrupt to print character

    ; Terminate program
    mov ax, 4C00h                     ; Terminate program
    int 21h

main endp
end main