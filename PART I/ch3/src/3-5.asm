%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov dx,0x1234
    mov ax,0x5678
    PRINT_HEX 2,dx
    NEWLINE
    PRINT_HEX 2,ax
    NEWLINE
    
    shl edx,16
    PRINT_HEX 4,edx
    NEWLINE
    
    and eax,0x0000ffff
    PRINT_HEX 4,eax
    NEWLINE
    
    or eax,edx    
    PRINT_HEX 4,eax
    NEWLINE
       
    
    xor rax, rax
    ret