dosseg ; use for the arrangment of the Instructions 

.model small ; to reserve the space for this program in the memory
.stack 100h ; used for Stack
.data ; data segment where we have to declare our own datatype

.code ; code segment where we have to write the Assembly Language code

main proc ; function or procedure

 mov dl, 'f' ; move the 'f' character in the data register
 mov ah, 2 ; Accumulator register to output the character 'f' 2 is the service routine
 int 21h ; system call or interrupt to show the output or to give instructions to the CPU
 mov ah, 4ch ; to get out of the Accumulator register
 int 21h ; system call

main endp ; end of the function or procedure
end main ; end of the code 