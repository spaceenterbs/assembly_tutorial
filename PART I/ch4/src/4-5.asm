%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    ; display kor1
    mov ebx,0
L1:
    mov ecx,kor1   
    add ecx , ebx
    mov al,[ecx]          
    PRINT_DEC 1, al
    NEWLINE       
    inc ebx
    
    cmp ebx,5
    jne  L1
    
    ; copy 
    mov ecx,5
    mov ebx,0
L2:    
    mov al,[kor1 + ebx]
    mov [kor2 + ebx],al
    inc ebx             
    loop L2 
    
    
    ; display kor2 
    mov ebx,0
L3:
    mov al,[kor2 + ebx]         
    PRINT_DEC 1, al
    NEWLINE   
    inc ebx
    
    cmp ebx,5
    jne  L3
        

    xor rax, rax
    ret
section .data
    kor1 db 100,80,30,40,50 
    kor3 db dup(5) 0
    
section .bss
    kor2 resb 5