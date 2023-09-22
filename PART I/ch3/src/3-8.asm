%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov eax,0x12345678  
    mov bx,0x4567
    
    mov edx,eax
    shr edx,16
    and eax,0x0000ffff
    div bx
    
    mov [a],ax
    mov [b],dx
    
    PRINT_HEX 2,a
    NEWLINE  
    PRINT_HEX 2,b    
    NEWLINE
  
        
    xor rax, rax
    ret
    
section .bss
    a resw 1  ; ¸ò 
    b resw 1  ; ³ª¸ÓÁö 