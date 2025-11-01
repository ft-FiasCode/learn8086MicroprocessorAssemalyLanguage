.MODEL SMALL
.STACK 100h

.DATA
    newline DB 0Dh, 0Ah, '$'   ; Carriage return and line feed for new line
    max_num DB 5                ; Maximum number to print

.CODE
main PROC
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Set up outer loop counter (starting from 1 to max_num)
    mov bl, 1                    ; Start with number 1 in BL

outer_loop:
    ; Set up inner loop counter (current number in BL)
    mov cl, bl                   ; Copy current number to CL (loop counter)

inner_loop:
    ; Print the current number (in BL)
    mov ah, 02h                  ; Function to print character in DL
    mov dl, bl                   ; Move current number into DL
    add dl, '0'                  ; Convert to ASCII character
    int 21h                      ; Call DOS interrupt to print character

    dec cl                       ; Decrement inner loop counter (CL)
    jnz inner_loop               ; Repeat until CL is zero

    ; Print a new line after each row
    mov dx, OFFSET newline       ; Load address of newline string
    mov ah, 09h                  ; Function to display string
    int 21h                      ; Call DOS interrupt

    inc bl                       ; Increment BL to move to the next number
    cmp bl, max_num             ; Compare BL with max_num
    jbe outer_loop               ; If BL <= max_num, repeat outer loop

    ; Exit program (MS-DOS interrupt)
    mov ax, 4C00h                ; Terminate program
    int 21h                       ; DOS interrupt to terminate program

main ENDP
END main