%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    PRINT_DEC 2,ax
    NEWLINE
    
    ; 2 * 3 
    mov ax,0
    mov al,2
    mov bl,3
    mul bx
    ;mul byte a
    
    PRINT_DEC 1,ax
    NEWLINE
    
    
    xor rax, rax
    ret
section .bss
    a resb 1