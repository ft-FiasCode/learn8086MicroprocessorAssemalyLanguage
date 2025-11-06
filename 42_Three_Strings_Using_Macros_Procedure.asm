.MODEL SMALL
.STACK 100h

.DATA
    string1 DB 'Hello, World!', 0  ; First string (null-terminated)
    string2 DB 'Welcome to Assembly!', 0 ; Second string
    string3 DB 'Using Procedures and Macros.', 0 ; Third string
    newline DB 0Dh, 0Ah, '$'        ; New line for formatting

; Macro to display a string
DISPLAY MACRO message
    mov dx, OFFSET message          ; Load address of the message into DX
    mov ah, 09h                     ; DOS function to display string
    int 21h                         ; Call DOS interrupt
ENDM

.CODE
main PROC
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Display the first string using macro
    DISPLAY string1
    DISPLAY newline                 ; Print newline

    ; Display the second string using macro
    DISPLAY string2
    DISPLAY newline                 ; Print newline

    ; Display the third string using macro
    DISPLAY string3
    DISPLAY newline                 ; Print newline

    ; Exit program (MS-DOS interrupt)
    mov ax, 4C00h                  ; Terminate program
    int 21h                        ; DOS interrupt to terminate program

main ENDP

END main
