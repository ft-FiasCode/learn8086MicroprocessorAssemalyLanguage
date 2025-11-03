.MODEL SMALL
.STACK 100h

.DATA
    newline DB 0Dh, 0Ah, '$'   ; Carriage return and line feed for new line
    max_num DB 5                ; Maximum number of rows to print

.CODE
main PROC
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Set up outer loop counter (starting from max_num)
    mov bl, max_num              ; Load maximum number into BL

outer_loop:
    ; Set up inner loop counter (current number in BL)
    mov cl, bl                   ; Copy current number to CL (loop counter)

inner_loop:
    ; Print the asterisk character '*'
    mov ah, 02h                  ; Function to print character in DL
    mov dl, '*'                   ; Load '*' character into DL
    int 21h                      ; Call DOS interrupt to print character

    dec cl                       ; Decrement inner loop counter (CL)
    jnz inner_loop               ; Repeat until CL is zero

    ; Print a new line after each row
    mov dx, OFFSET newline       ; Load address of newline string
    mov ah, 09h                  ; Function to display string
    int 21h                      ; Call DOS interrupt

    dec bl                       ; Decrement BL to move to the next row
    cmp bl, 0                    ; Compare BL with 0
    jg outer_loop                ; If BL > 0, repeat outer loop

    ; Exit program (MS-DOS interrupt)
    mov ax, 4C00h                ; Terminate program
    int 21h                       ; DOS interrupt to terminate program

main ENDP
END main