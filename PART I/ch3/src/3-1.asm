%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    ; 100 * 200 (2byte)
    mov ax,100
    mov ebx,200
    mul ebx ; dx:ax = ax * ebx
    and eax,0x0000ffff
    shr edx,16
    or eax,edx
        
    PRINT_DEC 2,eax
    
    xor rax, rax
    ret