%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov [a],byte 0x1234
    
    PRINT_HEX 2,a
 
    
    xor rax, rax
    ret
section .bss ;�ֱ�ȭ ���� ���� ���� 
    a resb 1
    b resw 1
    c resd 1
    d resq 1