%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov al,[a]   ; 1byte a�� ���尪�� al �������Ϳ� ����
    mov eax,a    ; a�� �ּҰ��� eax(4byte) �������Ϳ� ����
         
    mov [a],0x34      ; [error] 0x34 �� ũ�⸦ ���ȭ ���� �ʾƼ� �߻� 
    mov [a],byte 0x34 ; 0x34�� byte ������ ������. (byte 0x34�� a �ּҿ� ������)
    
    xor rax, rax
    ret
    
section .data
    a db 0x12