%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    ;PRINT_DEC 1, msg1_len
    mov ax,msg1_len
    PRINT_DEC 2,ax
    NEWLINE
    
    mov ax,msg2_len
    PRINT_DEC 2,ax
    NEWLINE
    
    PRINT_STRING msg1
    NEWLINE
    PRINT_STRING msg2
    
    
    xor rax, rax
    ret
    
section .data
    msg1 db 'haha',0x00
    msg1_len equ $ - msg1
    msg2 db '1234',0xA,0xD
    msg2_len equ $ - msg2
    msg3 db 'msg3',0x00