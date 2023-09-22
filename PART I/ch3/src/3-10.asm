%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here
    mov ax,0x1234
    and ax,0x0000    ; ZF set
    PRINT_HEX 2,ax
    NEWLINE
    
    add ax,0x1234
    mov ax,0x1234
    test ax,0x0000    ; ZF set 
    PRINT_HEX 2,ax
    NEWLINE
    
    xor rax, rax
    ret