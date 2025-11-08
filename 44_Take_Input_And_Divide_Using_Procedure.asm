.MODEL SMALL
.STACK 100h

.DATA
    numerator DB 0               ; Placeholder for numerator
    denominator DB 0             ; Placeholder for denominator
    quotient DB 0                ; Placeholder for quotient
    remainder DB 0               ; Placeholder for remainder
    promptNumerator DB 'Enter Numerator: $'
    promptDenominator DB 'Enter Denominator: $'
    outputQuotient DB 'Quotient: $'
    outputRemainder DB 'Remainder: $'
    newline DB 0Dh, 0Ah, '$'     ; New line for formatting

; Macro to display a string
DISPLAY MACRO message
    mov dx, OFFSET message        ; Load address of the message into DX
    mov ah, 09h                   ; DOS function to display string
    int 21h                       ; Call DOS interrupt
ENDM

; Macro to read a byte from user input
READBYTE MACRO buffer
    mov dx, OFFSET buffer         ; Load address of the buffer into DX
    mov ah, 01h                   ; DOS function to read character
    int 21h                       ; Call DOS interrupt to read character
ENDM

; Procedure to divide two numbers and store the result in quotient and remainder
DivideNumbers PROC
    mov al, numerator              ; Load numerator into AL
    xor ah, ah                    ; Clear AH for division (AX = numerator)
    mov bl, denominator            ; Load denominator into BL

    ; Check if denominator is zero
    cmp bl, 0                     ; Compare denominator with zero
    je DivisionByZero             ; Jump if denominator is zero

    div bl                        ; Divide AX by BL (AL = quotient, AH = remainder)
    
    mov quotient, al              ; Store quotient in variable 'quotient'
    mov remainder, ah             ; Store remainder in variable 'remainder'
    
    ret                           ; Return from procedure

DivisionByZero:
    mov quotient, 0               ; Set quotient to 0 if division by zero occurs
    mov remainder, 0              ; Set remainder to 0 if division by zero occurs
    ret                           ; Return from procedure

DivideNumbers ENDP

.CODE
main PROC
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Prompt for numerator input
    DISPLAY promptNumerator       ; Display prompt for numerator
    READBYTE numerator            ; Read numerator from user input

    ; Prompt for denominator input
    DISPLAY newline               ; Print newline for formatting
    DISPLAY promptDenominator     ; Display prompt for denominator
    READBYTE denominator          ; Read denominator from user input

    ; Call the DivideNumbers procedure to perform division
    call DivideNumbers            ; Call the division procedure

    ; Display Quotient
    DISPLAY newline               ; Print newline for formatting
    DISPLAY outputQuotient        ; Display "Quotient:"
    
    mov al, quotient              ; Load quotient into AL for printing
    add al, '0'                  ; Convert to ASCII character
    mov dl, al                   ; Move character into DL for printing
    mov ah, 02h                  ; Function to print character in DL 
    int 21h                      ; Call DOS interrupt to print character
    
    DISPLAY newline               ; Print newline after quotient output

    ; Display Remainder
    DISPLAY outputRemainder       ; Display "Remainder:"
    
    mov al, remainder             ; Load remainder into AL for printing 
    add al, '0'                  ; Convert to ASCII character 
    mov dl, al                   ; Move character into DL for printing 
    mov ah, 02h                  ; Function to print character in DL 
    int 21h                      ; Call DOS interrupt to print character
    
    DISPLAY newline               ; Print newline after remainder output
    
    ; Exit program (MS-DOS interrupt)
    mov ax, 4C00h                ; Terminate program 
    int 21h                       ; DOS interrupt to terminate program 

main ENDP

END main
