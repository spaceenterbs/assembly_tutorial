section .text
global main
main:
    ;write your code here
    mov eax,4
    mov ebx,1 
    mov ecx,msg
    mov edx,msg_len
    int 80h
    
    
    ret
section .data
    msg db 'haha',10
    msg_len equ $-msg
