dosseg

.model small
.stack 200
.data

crlf db 0Dh,0Ah,'$'
prompt1 db 'enter the first number$'
prompt2 db 'enter the second number$'
prompt3 db 'the sum of two numbers is: $'


.code
main proc
mov ax, @data
mov ds, ax

lea dx,prompt1
mov ah,09h
int 21h

mov ah,01h
int 21h

sub al,30h
mov cl,al
lea dx,crlf
mov ah,09h
int 21h

lea dx,prompt2
mov ah,09h
int 21h

mov ah,01h
int 21h
sub al,30h
add al,cl

mov cl,al
add cl,30h

lea dx,crlf
mov ah,09h
int 21h

lea dx,prompt3
mov ah,09h
int 21h

mov dl,cl
mov ah,02h
int 21h

mov ah,04ch
int 21h

main endp
end main
