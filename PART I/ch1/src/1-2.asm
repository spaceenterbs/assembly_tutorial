%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    
    xor rax, rax
    ret

section .bss
    a resb 1  ; 1byte 크기 a 변수 1개 선언 
    b resw 2  ; 2byte 크기 b 변수 2개 선언 
    c resd 1  ; 4byte 크기 c 변수 1개 선언 
    d resq 3  ; 8byte 크기 d 변수 3개 선언 