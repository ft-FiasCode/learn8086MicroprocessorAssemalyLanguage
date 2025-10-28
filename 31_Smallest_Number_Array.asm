.MODEL SMALL
.STACK 100h

.DATA
    array DB 10, 20, 5, 40, 30    ; Array of numbers
    array_length DB 5             ; Length of the array
    smallest DB ?                 ; Variable to store the smallest number

.CODE
main PROC
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Assume the first element is the smallest
    mov al, [array]              ; Load the first element into AL
    mov [smallest], al           ; Store it as the initial smallest

    ; Set up index for the loop
    mov cl, [array_length]       ; Load length of the array into CL (1-byte)
    mov si, 1                    ; Start from the second element (index 1)

find_smallest:
    cmp si, cx                   ; Compare index with length of array
    jge done                     ; If index >= length, we are done

    mov al, [array + si]         ; Load current element into AL
    cmp al, [smallest]           ; Compare current element with smallest found
    jl update_smallest           ; If current < smallest, update smallest

    jmp next_element             ; Otherwise, check next element

update_smallest:
    mov [smallest], al           ; Update smallest with current element

next_element:
    inc si                       ; Move to the next index
    jmp find_smallest            ; Repeat the process

done:
    ; At this point, the smallest number is stored in 'smallest'
    
    ; Exit program (MS-DOS interrupt)
    mov ax, 4C00h                ; Terminate program
    int 21h                      ; DOS interrupt to terminate program

main ENDP
END main
