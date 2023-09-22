%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov ax,0xff12
    mov bx,0xff23
    
    mul bx   ; dx:ax = ax * bx 
    shl edx,16
    and eax,0x0000ffff
    or eax,edx    ;  eax = dx:ax 
    
    mov [ok] , eax
    PRINT_HEX 4,ok
    NEWLINE
        
    xor rax, rax
    ret
section .bss
    ok  resd 1