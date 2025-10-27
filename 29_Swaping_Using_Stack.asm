dosseg

.model small
.stack 100h

.data
.code
main proc

mov ax,'4'
push ax   ;copies 4 to stack

mov bx, '7'
push bx   ;copies 7 to stack

pop ax    ;moves 7 from stack to ax
pop bx    ;moves 4 from stack to bx

mov dx,ax
mov ah,2
int 21h

mov dx,bx
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main
