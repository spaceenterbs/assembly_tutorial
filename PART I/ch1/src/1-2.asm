%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    
    xor rax, rax
    ret

section .bss
    a resb 1  ; 1byte ũ�� a ���� 1�� ���� 
    b resw 2  ; 2byte ũ�� b ���� 2�� ���� 
    c resd 1  ; 4byte ũ�� c ���� 1�� ���� 
    d resq 3  ; 8byte ũ�� d ���� 3�� ���� 