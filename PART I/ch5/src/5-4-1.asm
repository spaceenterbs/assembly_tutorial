%include "io.inc"

section .text
global CMAIN
;CEXTERN printf
extern _printf

CMAIN:
    ;write your code here
    push param1
    call _printf
    add esp,4
    
    ret

section .data
    fmtStr db 'printf: al - %i, a2 - %s',0xA,0
    param1 db 'Parameter String',0
    