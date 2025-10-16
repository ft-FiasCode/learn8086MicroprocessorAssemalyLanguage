dosseg

.model small 			;if prog size is < 64KB then small model

.stack 100h

.data
arr1 db  'a','b','c'


.code
main proc
mov ax,@data			; to move the address of the data segment
mov ds,ax			; heap memory

mov si,offset arr1	; to move the address of the first element of the array in SI register which acts as a pointer to point the first element of the array.
mov dx,[si]			; To print the value in an array we have to put the si in bracket.
mov ah,2
int 21h

;mov dx,[si+1]			
inc si				; to increment the size of the an array by 1
mov dx,[si]			;To print the 2nd element
mov ah,2
int 21h

inc si
mov dx,[si]			;To print the 3rd element
mov ah,2
int 21h

inc si
mov dx,[si]			; To print the 4th element
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main
