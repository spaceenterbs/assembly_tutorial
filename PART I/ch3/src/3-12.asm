%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov ax,3
    mov bx,2
L_my:
    mov cx,1
L_ok: mov dx,2
    mov ax,3
        
    xor rax, rax
    ret