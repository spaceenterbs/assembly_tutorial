%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    PRINT_STRING msg1
    NEWLINE
    
    mov ax,3
    
    PRINT_DEC 2,ax
    NEWLINE
    
    xor rax, rax
    ret
    
section .data
    msg1 db 'hello',0x00
    