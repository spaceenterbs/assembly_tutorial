%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here  
    mov al,[a]
    PRINT_DEC 1,al
    NEWLINE
    
    mov al,[a+1]  ; a+1*1  
    PRINT_DEC 1,al
    NEWLINE
    
    mov ax,[a1]
    PRINT_HEX 2,ax
    NEWLINE 
    
    mov ax,[a1+1] ; bug 
    PRINT_HEX 2,ax
    NEWLINE 
    
    mov ax,[a1+1*2] ; 1*2 ok 
    PRINT_HEX 2,ax
    NEWLINE
       
    xor rax, rax
    ret
    
section .data
    a  db  30,50,20,70,60
    b  times 5 dw  0
    a1 dw  0x1234,0x5678,10
    
section .bss
    c resb  3
    d resw  4