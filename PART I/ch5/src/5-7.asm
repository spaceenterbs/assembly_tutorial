%include "io64.inc"
LEFT  equ 1
RIGHT equ 2

%assign MY_UP 3

%define MY_DOWN 4

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov ax,LEFT
    PRINT_DEC 2,ax
    NEWLINE
    
    mov bx,MY_UP
    PRINT_DEC 2,bx
    NEWLINE
    
    mov cx,MY_DOWN
    PRINT_DEC 2,cx
    NEWLINE
    
    %assign MY_UP 5
    
    mov bx,MY_UP
    PRINT_DEC 2,bx
    NEWLINE
    
    xor rax, rax
    ret