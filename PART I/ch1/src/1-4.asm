%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov ax,[a]     ; 변수 a의 값을 2byte 단위로 ax 레지스터로 이동 
    mov [b],ax     ; 변수 b에 2byte 단위로 ax 레지스터의 값을 이동 
    
    PRINT_HEX 2,ax ; ax 레지스터의 값을 2byte 단위로 16진수로 출력
    NEWLINE        ; 줄변경 
    PRINT_HEX 2,a  ; 변수 a의 값을 2byte 단위로 16진수로 출력 
    NEWLINE        
    PRINT_HEX 2,b  ; 변수 b의 값을 2byte 단위로 16진수로 출력 
    NEWLINE
    PRINT_DEC 2,ax ; ax 레지스터 값을 2byte 단위로 10진수로 출력 
    
    xor rax, rax
    ret
section .data    
    a dw 0x12
section .bss
    b resw 1 
