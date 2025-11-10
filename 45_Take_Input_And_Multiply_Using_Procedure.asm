.MODEL SMALL
.STACK 100h

.DATA
    num1 DB 0                   ; Placeholder for the first number
    num2 DB 0                   ; Placeholder for the second number
    product DB 0                ; Placeholder for the product
    promptNum1 DB 'Enter first number: $'
    promptNum2 DB 'Enter second number: $'
    outputMsg DB 'Product is: $'
    newline DB 0Dh, 0Ah, '$'     ; New line for formatting

; Macro to display a string
DISPLAY MACRO message
    mov dx, OFFSET message       ; Load address of the message into DX
    mov ah, 09h                  ; DOS function to display string
    int 21h                      ; Call DOS interrupt
ENDM

; Macro to read a byte from user input
READBYTE MACRO buffer
    mov dx, OFFSET buffer        ; Load address of the buffer into DX
    mov ah, 01h                  ; DOS function to read character
    int 21h                      ; Call DOS interrupt to read character
ENDM

; Procedure to multiply two numbers and store the result in product
MultiplyNumbers PROC
    mov al, num1                 ; Load first number into AL
    mov bl, num2                 ; Load second number into BL

    mul bl                       ; Multiply AL by BL (result in AL)
    
    mov product, al              ; Store the product in variable 'product'
    
    ret                           ; Return from procedure

MultiplyNumbers ENDP

.CODE
main PROC
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Prompt for first number input
    DISPLAY promptNum1           ; Display prompt for first number
    READBYTE num1                ; Read first number from user input

    ; Prompt for second number input
    DISPLAY newline               ; Print newline for formatting
    DISPLAY promptNum2           ; Display prompt for second number
    READBYTE num2                ; Read second number from user input

    ; Call the MultiplyNumbers procedure to perform multiplication
    call MultiplyNumbers          ; Call the multiplication procedure

    ; Display Product message
    DISPLAY newline               ; Print newline for formatting
    DISPLAY outputMsg             ; Display "Product is: "
    
    mov al, product               ; Load product into AL for printing
    add al, '0'                   ; Convert to ASCII character
    mov dl, al                    ; Move character into DL for printing
    mov ah, 02h                   ; Function to print character in DL 
    int 21h                       ; Call DOS interrupt to print character
    
    DISPLAY newline               ; Print newline after product output
    
    ; Exit program (MS-DOS interrupt)
    mov ax, 4C00h                ; Terminate program 
    int 21h                       ; DOS interrupt to terminate program 

main ENDP

END main
