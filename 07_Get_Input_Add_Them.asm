.model small            ; Define a small memory model
.stack 100h             ; Allocate 256 bytes for the stack

.data                   ; Start of data segment
prompt db "Enter a string: $"
vowelMsg db 13, 10, "Vowels in the string are: $"
buffer db 100 dup(0)   ; Buffer to store the input string
vowelCount db 0        ; Counter for vowels

.code                   ; Start of code segment
main proc               ; Define the main procedure

    mov ax, @data      ; Load the address of the data segment into AX
    mov ds, ax         ; Initialize the data segment register DS

    ; Prompt for input
    lea dx, prompt     ; Load address of prompt into DX for display
    mov ah, 9          ; Function 9: Display string
    int 21h            ; Call DOS interrupt to display the prompt

    ; Read input string
    lea dx, buffer     ; Load address of buffer into DX for input
    mov ah, 0Ah        ; Function 0Ah: Buffered input
    int 21h            ; Call DOS interrupt to read the string

    ; Initialize index and vowel counter
    mov si, offset buffer + 2 ; SI points to the first character in the buffer
    mov cx, [buffer]   ; CX contains the length of the input string (first byte of buffer)
    
    lea dx, vowelMsg   ; Load address of vowel message into DX for display
    mov ah, 9          ; Function 9: Display string
    int 21h            ; Call DOS interrupt to display the message

next_char:
    cmp cx, 0          ; Check if we have processed all characters
    je done            ; If CX is zero, we are done

    mov al, [si]       ; Load current character into AL
    call is_vowel      ; Check if AL is a vowel

    cmp al, 1          ; Check if it was a vowel (returned value is in AL)
    jne not_vowel      ; If not a vowel, skip to next character

    ; Print the vowel character
    mov dl, [si]       ; Move vowel character to DL for output
    mov ah, 2          ; Function 2: Write character to standard output
    int 21h            ; Call DOS interrupt to output the character

not_vowel:
    inc si             ; Move to next character in buffer
    dec cx             ; Decrease count of remaining characters
    jmp next_char      ; Repeat for next character

done:
    ; Terminate program
    mov ax, 4C00h      ; Function 4Ch: Terminate program and return control to DOS
    int 21h            ; Call DOS interrupt to terminate program

; Function to check if a character is a vowel (returns in AL)
is_vowel proc          ; Input: AL = character to check
    cmp al, 'A'
    je is_vowel_found  
    cmp al, 'E'
    je is_vowel_found  
    cmp al, 'I'
    je is_vowel_found  
    cmp al, 'O'
    je is_vowel_found  
    cmp al, 'U'
    je is_vowel_found  
   
    xor al, al         ; Not a vowel: return 0 in AL
    ret

is_vowel_found:
    mov al, 1          ; Is a vowel: return 1 in AL
    ret
is_vowel endp         ; End of the is_vowel procedure

main endp              ; End of main procedure
end main               ; End of program and specify entry point
