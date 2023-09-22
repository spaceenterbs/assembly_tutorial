%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    fld qword[val]
    fstp qword[res]
    
    push dword[val+4]
    push dword[val]
    push dword[res+4]
    push dword[res]
    push dword msg
    call printf
    
    add esp,20
    ;mov eax,0
        
    
    xor eax, eax
    ret
    
section .data
    msg db "Hello !! %f",0
    val dq 2.45
        
section .bss
    res resq 1
    