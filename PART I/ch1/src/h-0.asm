%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov al,[a]
    mov [mya],al
    
    mov ax,[b]
    mov [myb],ax
    
    mov eax,[c]
    mov [myc],eax
    
    mov rax,[d]
    mov [myd],rax
    
    PRINT_HEX 1,mya
    NEWLINE
    PRINT_HEX 2,myb
    NEWLINE
    PRINT_HEX 4,myc
    NEWLINE
    PRINT_HEX 8,myd
    
    xor rax, rax
    ret
section .data
    a db 0x12
    b dw 0x1234
    c dd 0x12345678
    d dq 0x1234567812345678
    
section .bss
    mya resb 1
    myb resw 1
    myc resd 1
    myd resq 1