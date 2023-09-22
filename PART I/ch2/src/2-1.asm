%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 1,al ; 1byte input
    GET_DEC 2,a  ; 2byte input
    GET_STRING b
    
    PRINT_DEC 1,al
    NEWLINE
    PRINT_DEC 2, a
    NEWLINE
    PRINT_STRING b
    
    xor rax, rax
    ret
    
section .bss
    a resw 1
    b resb 80
    