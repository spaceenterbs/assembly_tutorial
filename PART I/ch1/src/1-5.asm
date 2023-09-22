%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov ax,0x12
    
    PRINT_HEX 1,al
    NEWLINE
    ;PRINT_HEX 1,ah
    NEWLINE
    PRINT_HEX 2,ax
    
    mov [a],word 0x12
    
    xor rax, rax
    ret
section .bss
    a resw 1