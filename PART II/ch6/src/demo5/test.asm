%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    push msg
    call _printf
    add esp,4
    
    xor eax, eax
    ret
    
section .data
    msg db 'haha',0