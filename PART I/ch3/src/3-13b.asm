%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov ax,20
    mov bx,20
    
    cmp ax,bx  
    jne L_not_equal
    mov cx,100
    jmp  L_not_equal_end
L_not_equal:
    mov cx,0
L_not_equal_end:
        
    PRINT_DEC 2,cx
    NEWLINE
        
    xor rax, rax
    ret