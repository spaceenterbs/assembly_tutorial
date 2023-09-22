%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov eax,0x12345678
    PRINT_HEX 4,eax
    NEWLINE
    
    mov edx,eax
    shr edx,16
    and eax,0x0000ffff
    
    PRINT_HEX 2,dx
    NEWLINE
    PRINT_HEX 2,ax
    
    xor rax, rax
    ret