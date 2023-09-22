%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging   
    ;write your code here
    mov ax,0
    mov al,2
    mov bl,3
    mul bx
    
    PRINT_DEC 1,ax
    NEWLINE
    
    mov ax,7
    mov bl,2
    div bl
    mov bl,ah
    
    PRINT_DEC 1,al
    NEWLINE
    PRINT_DEC 1,bl
    NEWLINE
    
    xor rax, rax
    ret