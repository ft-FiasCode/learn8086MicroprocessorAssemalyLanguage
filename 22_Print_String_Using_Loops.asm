dosseg

.model small
.stack 100h

.data
var1 db 20 dup('$')

.code
main proc
mov ax,@data
mov ds,ax

mov si,offset var1

l1:
;taking input from user
mov ah,1
int 21h

cmp al,13  ; 13 is ascii code for enter key
je progend

mov [si],al
inc si
jmp l1

progend:
mov dx,offset var1
mov ah,9
int 21h


mov ah,4ch
int 21h

main endp
end main
