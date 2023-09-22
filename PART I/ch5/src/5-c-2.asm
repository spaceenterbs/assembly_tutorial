%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    fld  qword[val]
    fstp qword[res]
    
    ;push dword[val+4]
    ;push dword[val]
    ;push dword[res+4]
    ;push dword[res]
    ;push dword msg
    ;call printf
    ;add  rsp,20
    
    push dword my
    call printf
    add rsp,8
    
    
    xor rax, rax
    ret
section .data
    my db 'haha',0x0
    msg db "Hello !! %f",0
    val dq 2.45
        
section .bss
    res resq 1