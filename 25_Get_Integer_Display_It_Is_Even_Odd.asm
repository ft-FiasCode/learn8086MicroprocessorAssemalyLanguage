dosseg
.model small
.stack 100h

.data
    inputMsg db "Enter an integer (0-65535): $"
    primeMsg db "The number is PRIME.$"
    notPrimeMsg db "The number is NOT PRIME.$"
    inputBuffer db 6, 0, 5 dup('$')  ; Buffer for user input

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Display input message
    lea dx, inputMsg
    mov ah, 9
    int 21h

    ; Read integer input
    lea dx, inputBuffer
    mov ah, 0Ah
    int 21h

    ; Convert input to integer
    lea si, inputBuffer + 2     ; Skip input buffer size bytes
    xor ax, ax                  ; Clear AX (to store the number)
    xor bx, bx                  ; Clear BX (multiplier)
    mov cx, 10                  ; Base 10

convert_to_int:
    lodsb                       ; Load next character into AL
    cmp al, 0Dh                 ; Check for Enter key (carriage return)
    je check_prime              ; If Enter, go to prime check
    sub al, '0'                 ; Convert ASCII to integer
    mul cx                      ; Multiply AX by 10
    add ax, bx                  ; Add the integer to AX
    mov bx, ax                  ; Store current result in BX
    jmp convert_to_int          ; Repeat the loop

check_prime:
    mov cx, bx                  ; Copy the number to CX
    mov dx, bx                  ; Copy the number to DX for output

    ; Handle edge cases
    cmp bx, 1
    jbe not_prime               ; Numbers <= 1 are not prime

    ; Prime check
    mov si, 2                   ; Start divisor at 2
prime_loop:
    mov ax, bx                  ; Copy number to AX
    xor dx, dx                  ; Clear DX for division
    div si                      ; Divide BX by SI (AX/SI, remainder in DX)
    cmp dx, 0                   ; Check if remainder is 0
    je not_prime                ; If divisible, it's not prime
    inc si                      ; Increment divisor
    mov dx, 0                   ; Reset DX
    cmp si, cx                  ; Check if SI < CX
    jl prime_loop               ; Repeat if not finished

    ; If prime
    lea dx, primeMsg
    jmp display_result

not_prime:
    lea dx, notPrimeMsg

display_result:
    ; Display result message
    mov ah, 9
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main
