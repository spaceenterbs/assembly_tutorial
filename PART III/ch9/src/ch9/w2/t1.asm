%include "io.inc"

section .text
global CMAIN
CMAIN:
    pop eax
    pop ebx
    pop ebx
    pop ecx
    pop edx
    
    mov eax,1
    mov ebx,0
    int 80h
    
    ret
