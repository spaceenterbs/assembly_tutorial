%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here    
    mov ebx,0
L1: 
    mov ecx,kor1   
    mov ax,[ecx + ebx*2]          
    PRINT_DEC 2, ax
    NEWLINE       
    inc ebx    
    cmp ebx,5
    jne  L1

    mov ecx,5
    mov ebx,0
L2:    
    mov al,[kor1 + ebx*2]
    mov [kor2 + ebx*2],al
    inc ebx             
    loop L2 
       
    mov ebx,0
L3:
    mov ax,[kor2 + ebx*2]         
    PRINT_DEC 2, ax
    NEWLINE   
    inc ebx
    
    cmp ebx,5
    jne  L3
        
    xor rax, rax
    ret
section .data
    kor1 dw 100,80,30,40,50 
    
section .bss
    kor2 resw 5