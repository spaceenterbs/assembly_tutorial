%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov al,0b10110110
    mov bl,0b01010101    
    PRINT_HEX 1,al
    NEWLINE
    PRINT_HEX 1,bl
    NEWLINE
    
    and al,bl    
    PRINT_HEX 1,al
    NEWLINE    
    
    mov al,0b10110110
    mov bl,0b01010101    
    or al,bl    
    PRINT_HEX 1,al
    NEWLINE    
    
    mov al,0b10110110
    mov bl,0b01010101    
    xor al,bl    
    PRINT_HEX 1,al
    NEWLINE    

    mov al,0b10110110    
    not al
    PRINT_HEX 1,al
    NEWLINE    
    
    xor rax, rax
    ret