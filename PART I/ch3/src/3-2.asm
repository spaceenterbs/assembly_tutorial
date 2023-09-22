%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov ax,0x1234
    
    PRINT_HEX 2,ax
    NEWLINE
    
    shl ax,4
    
    PRINT_HEX 2,ax
    NEWLINE
    
    mov [a],word 0x1234
    PRINT_HEX 2,a
    NEWLINE
    
    shr word [a],4
    PRINT_HEX 2,a
    NEWLINE
    
    
    xor rax, rax
    ret
section .bss
    a resw 1