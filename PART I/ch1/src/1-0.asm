%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov [a],0x1234
    
    xor eax, eax
    ret
    
section .bss
    a resw  1  ; 2����Ʈ ũ�� a ��� ������ 1�� ���� 
    b resb  1  ; 1����Ʈ ũ�� b ���  ������ 1�� ����