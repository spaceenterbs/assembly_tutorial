%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov ax,[a]     ; ���� a�� ���� 2byte ������ ax �������ͷ� �̵� 
    mov [b],ax     ; ���� b�� 2byte ������ ax ���������� ���� �̵� 
    
    PRINT_HEX 2,ax ; ax ���������� ���� 2byte ������ 16������ ���
    NEWLINE        ; �ٺ��� 
    PRINT_HEX 2,a  ; ���� a�� ���� 2byte ������ 16������ ��� 
    NEWLINE        
    PRINT_HEX 2,b  ; ���� b�� ���� 2byte ������ 16������ ��� 
    NEWLINE
    PRINT_DEC 2,ax ; ax �������� ���� 2byte ������ 10������ ��� 
    
    xor rax, rax
    ret
section .data    
    a dw 0x12
section .bss
    b resw 1 
