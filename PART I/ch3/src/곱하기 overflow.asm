%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here ; 2(16)=65,536
    mov ax,60000
    mov bx,2
    mul bx    
    shl edx,16
    and eax,0x0000ffff
    or eax,edx    
    
    PRINT_DEC 4,eax
    NEWLINE
    PRINT_DEC 2,ax
    NEWLINE
    
    mov ax,0b00000101
    mov bl,2
    div bl
    mov cl,ah
    PRINT_DEC 1,cl
       
    and ax,0x0000ffff
    div bl
    mov cl,ah
    PRINT_DEC 1,cl
    
    and ax,0x0000ffff
    div bl
    mov cl,ah
    PRINT_DEC 1,cl
    

        
    ;PRINT_DEC 1,al
    ;NEWLINE
    
    xor rax, rax
    ret