%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov [a],0x1234
    
    xor eax, eax
    ret
    
section .bss
    a resw  1  ; 2바이트 크기 a 라는 변수를 1개 선언 
    b resb  1  ; 1바이트 크기 b 라는  변수를 1개 선언