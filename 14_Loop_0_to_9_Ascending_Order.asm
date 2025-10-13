dosseg

.model small
.stack 100h
.data
.code
main proc

mov cx,10
mov dx,'0' ;ascii code for 0

test1:
mov ah,2   ;print
int 21h    ;interrupt to go out

add dx,1
loop test1

mov ah,4ch
int 21h

main endp
end main
