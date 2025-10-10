dosseg            ; Allow for the use of segmented memory model
.model large      ; Define the memory model as large
.stack 100h       ; Allocate a stack of 256 bytes (100h)

.data             ; Begin the data segment
msg1 db 'Musa$'   ; Define the first message string with a terminating '$'
msg2 db 'Muhammad$' ; Define the second message string with a terminating '$'

.code             ; Begin the code segment
main proc         ; Start of the main procedure

    mov ax,@data  ; Load the address of the data segment into AX
    mov ds,ax     ; Move the value in AX to DS to initialize data segment

    mov dx,offset msg1 ; Load the offset address of msg1 into DX
    mov ah,9      ; Function 9: Display string until '$'
    int 21h       ; Call DOS interrupt to display msg1

    mov dx,10     ; Load ASCII value for line feed (newline) into DX
    mov ah,2      ; Function 2: Display character in DL
    int 21h       ; Call DOS interrupt to print newline

    mov dx,13     ; Load ASCII value for carriage return into DX
    mov ah,2      ; Function 2: Display character in DL
    int 21h       ; Call DOS interrupt to print carriage return

    ; Now we are on the second line
    mov dx,offset msg2 ; Load the offset address of msg2 into DX
    mov ah,9      ; Function 9: Display string until '$'
    int 21h       ; Call DOS interrupt to display msg2

    ; Prepare to exit the program
    mov ah,4ch    ; Function 4Ch: Terminate program and return control to DOS
    int 21h       ; Call DOS interrupt to terminate program

main endp         ; End of main procedure
end main          ; End of the program