%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here
    mov al,0b10101110
    mov bl,0b01100101    
    PRINT_HEX 1,al
    NEWLINE
    PRINT_HEX 1,bl
    NEWLINE
    
    
    mov al,0b10101110
    mov bl,0b01100101    
    and al,bl    
    PRINT_HEX 1,al
    NEWLINE
    
    mov al,0b10101110
    mov bl,0b11100101    
    test al,bl    
    PRINT_HEX 1,al
    NEWLINE
    
    mov al,0b10101110
    shl al,1
    PRINT_HEX 1,al
    NEWLINE
    
    
    xor rax, rax
    ret