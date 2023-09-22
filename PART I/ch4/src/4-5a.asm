%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here  
    
    xor rax, rax
    ret
    
section .data
    a  db  30,50,20,70,60
    b  times 5 dw  0
    a1 dw  0x1234,0x5678,10
    
section .bss
    c resb  3
    d resw  4