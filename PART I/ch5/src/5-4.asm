%include "io64.inc"

section .text
global CMAIN
extern _printf

CMAIN:
    ;write your code here
    sub esp,4
    lea eax,[param1]
    mov [esp],eax
    
    sub esp,4
    mov eax,8
    add eax,1098
    mov [esp],eax
    
    sub esp,4
    lea eax,[fmtStr]
    mov [esp],eax
    
    call _printf
    add esp,12
    
    xor eax, eax
    ret

section .data
    fmtStr db 'printf: al - %i, a2 - %s',0xA,0
    param1 db 'Parameter String',0
    